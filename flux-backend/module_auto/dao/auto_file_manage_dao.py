# -*- coding:utf-8 -*-

from typing import List
from datetime import datetime, time
from sqlalchemy import and_, delete, desc, func, or_, select, update
from sqlalchemy.ext.asyncio import AsyncSession
from module_auto.entity.do.auto_file_manage_do import AutoFileManage
from module_auto.entity.vo.auto_file_manage_vo import AutoFileManagePageModel, AutoFileManageModel
from utils.page_util import PageUtil, PageResponseModel


class AutoFileManageDao:

    @classmethod
    async def get_by_id(cls, db: AsyncSession, auto_file_manage_id: int) -> AutoFileManage:
        """根据主键获取单条记录"""
        auto_file_manage = (((await db.execute(
                            select(AutoFileManage)
                            .where(AutoFileManage.id == auto_file_manage_id)))
                       .scalars())
                       .first())
        return auto_file_manage

    """
    查询
    """
    @classmethod
    async def get_auto_file_manage_list(cls, db: AsyncSession,
                             query_object: AutoFileManagePageModel,
                             data_scope_sql: str = None,
                             is_page: bool = False) -> [list | PageResponseModel]:

        query = (
            select(AutoFileManage)
            .where(
                AutoFileManage.create_time.between(query_object.begin_create_time, query_object.end_create_time) if query_object.create_time else True,
                AutoFileManage.fime_name.like(f"%{query_object.fime_name}%") if query_object.fime_name else True,
                AutoFileManage.del_flag == '0',
                eval(data_scope_sql) if data_scope_sql else True,
            )
            .order_by(desc(AutoFileManage.create_time))
            .distinct()
        )
        auto_file_manage_list = await PageUtil.paginate(db, query, query_object.page_num, query_object.page_size, is_page)
        return auto_file_manage_list


    @classmethod
    async def add_auto_file_manage(cls, db: AsyncSession, add_model: AutoFileManageModel, auto_commit: bool = True) -> AutoFileManage:
        """
        增加
        """
        auto_file_manage =  AutoFileManage(**add_model.model_dump(exclude_unset=True))
        db.add(auto_file_manage)
        await db.flush()
        if auto_commit:
            await db.commit()
        return auto_file_manage

    @classmethod
    async def edit_auto_file_manage(cls, db: AsyncSession, edit_model: AutoFileManageModel, auto_commit: bool = True) -> AutoFileManage:
        """
        修改
        """
        edit_dict_data = edit_model.model_dump(exclude_unset=True)
        await db.execute(update(AutoFileManage), [edit_dict_data])
        await db.flush()
        if auto_commit:
            await db.commit()
        return await cls.get_by_id(db, edit_model.id)

    @classmethod
    async def del_auto_file_manage(cls, db: AsyncSession, auto_file_manage_ids: List[str], soft_del: bool = True, auto_commit: bool = True):
        """
        删除
        """
        if soft_del:
            await db.execute(update(AutoFileManage).where(AutoFileManage.id.in_(auto_file_manage_ids)).values(del_flag='2'))
        else:
            await db.execute(delete(AutoFileManage).where(AutoFileManage.id.in_(auto_file_manage_ids)))
        await db.flush()
        if auto_commit:
            await db.commit()