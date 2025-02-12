# -*- coding:utf-8 -*-

from typing import List
from datetime import datetime, time
from sqlalchemy import and_, delete, desc, func, or_, select, update
from sqlalchemy.ext.asyncio import AsyncSession
from module_auto.entity.do.auto_script_do import AutoScript
from module_auto.entity.vo.auto_script_vo import AutoScriptPageModel, AutoScriptModel
from utils.page_util import PageUtil, PageResponseModel


class AutoScriptDao:

    @classmethod
    async def get_by_id(cls, db: AsyncSession, auto_script_id: int) -> AutoScript:
        """根据主键获取单条记录"""
        auto_script = (((await db.execute(
            select(AutoScript)
            .where(AutoScript.id == auto_script_id)))
                        .scalars())
                       .first())
        return auto_script

    @classmethod
    async def get_by_script_code(cls, db: AsyncSession, script_code: str, script_id) -> AutoScript:
        """根据主键获取单条记录"""
        auto_script = (((await db.execute(
            select(AutoScript)
            .where(AutoScript.script_code == script_code, AutoScript.id != script_id if script_id else True,AutoScript.del_flag==1)))
                        .scalars())
                       .first())
        return auto_script

    """
    查询
    """

    @classmethod
    async def get_auto_script_list(cls, db: AsyncSession,
                                   query_object: AutoScriptPageModel,
                                   data_scope_sql: str = None,
                                   is_page: bool = False) -> [list | PageResponseModel]:

        query = (
            select(AutoScript)
            .where(
                AutoScript.script_code == query_object.script_code if query_object.script_code else True,
                AutoScript.script_content == query_object.script_content if query_object.script_content else True,
                AutoScript.script_name == query_object.script_name if query_object.script_name else True,
                AutoScript.script_parameters == query_object.script_parameters if query_object.script_parameters else True,
                AutoScript.script_type == query_object.script_type if query_object.script_type else True,
                AutoScript.del_flag == '0',
                eval(data_scope_sql) if data_scope_sql else True,
            )
            .order_by(desc(AutoScript.create_time))
            .distinct()
        )
        auto_script_list = await PageUtil.paginate(db, query, query_object.page_num, query_object.page_size, is_page)
        return auto_script_list

    @classmethod
    async def add_auto_script(cls, db: AsyncSession, add_model: AutoScriptModel,
                              auto_commit: bool = True) -> AutoScript:
        """
        增加
        """
        auto_script = AutoScript(**add_model.model_dump(exclude_unset=True))
        db.add(auto_script)
        await db.flush()
        if auto_commit:
            await db.commit()
        return auto_script

    @classmethod
    async def edit_auto_script(cls, db: AsyncSession, edit_model: AutoScriptModel,
                               auto_commit: bool = True) -> AutoScript:
        """
        修改
        """
        edit_dict_data = edit_model.model_dump(exclude_unset=True)
        await db.execute(update(AutoScript), [edit_dict_data])
        await db.flush()
        if auto_commit:
            await db.commit()
        return await cls.get_by_id(db, edit_model.id)

    @classmethod
    async def del_auto_script(cls, db: AsyncSession, auto_script_ids: List[str], soft_del: bool = True,
                              auto_commit: bool = True):
        """
        删除
        """
        if soft_del:
            await db.execute(update(AutoScript).where(AutoScript.id.in_(auto_script_ids)).values(del_flag='2'))
        else:
            await db.execute(delete(AutoScript).where(AutoScript.id.in_(auto_script_ids)))
        await db.flush()
        if auto_commit:
            await db.commit()
