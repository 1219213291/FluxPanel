# -*- coding:utf-8 -*-

from typing import List
from datetime import datetime, time
from sqlalchemy import and_, delete, desc, func, or_, select, update
from sqlalchemy.ext.asyncio import AsyncSession
from module_auto.entity.do.auto_env_do import AutoEnv
from module_auto.entity.vo.auto_env_vo import AutoEnvPageModel, AutoEnvModel
from utils.page_util import PageUtil, PageResponseModel


class AutoEnvDao:

    @classmethod
    async def get_by_id(cls, db: AsyncSession, auto_env_id: int) -> AutoEnv:
        """根据主键获取单条记录"""
        auto_env = (((await db.execute(
                            select(AutoEnv)
                            .where(AutoEnv.id == auto_env_id)))
                       .scalars())
                       .first())
        return auto_env

    """
    查询
    """
    @classmethod
    async def get_auto_env_list(cls, db: AsyncSession,
                             query_object: AutoEnvPageModel,
                             data_scope_sql: str = None,
                             is_page: bool = False) -> [list | PageResponseModel]:

        query = (
            select(AutoEnv)
            .where(
                AutoEnv.env_name.like(f"%{query_object.env_name}%") if query_object.env_name else True,
                AutoEnv.key == query_object.key if query_object.key else True,
                AutoEnv.value == query_object.value if query_object.value else True,
                AutoEnv.del_flag == '0',
                eval(data_scope_sql) if data_scope_sql else True,
            )
            .order_by(desc(AutoEnv.create_time))
            .distinct()
        )
        auto_env_list = await PageUtil.paginate(db, query, query_object.page_num, query_object.page_size, is_page)
        return auto_env_list


    @classmethod
    async def add_auto_env(cls, db: AsyncSession, add_model: AutoEnvModel, auto_commit: bool = True) -> AutoEnv:
        """
        增加
        """
        auto_env =  AutoEnv(**add_model.model_dump(exclude_unset=True))
        db.add(auto_env)
        await db.flush()
        if auto_commit:
            await db.commit()
        return auto_env

    @classmethod
    async def edit_auto_env(cls, db: AsyncSession, edit_model: AutoEnvModel, auto_commit: bool = True) -> AutoEnv:
        """
        修改
        """
        edit_dict_data = edit_model.model_dump(exclude_unset=True)
        await db.execute(update(AutoEnv), [edit_dict_data])
        await db.flush()
        if auto_commit:
            await db.commit()
        return await cls.get_by_id(db, edit_model.id)

    @classmethod
    async def del_auto_env(cls, db: AsyncSession, auto_env_ids: List[str], soft_del: bool = True, auto_commit: bool = True):
        """
        删除
        """
        if soft_del:
            await db.execute(update(AutoEnv).where(AutoEnv.id.in_(auto_env_ids)).values(del_flag='2'))
        else:
            await db.execute(delete(AutoEnv).where(AutoEnv.id.in_(auto_env_ids)))
        await db.flush()
        if auto_commit:
            await db.commit()