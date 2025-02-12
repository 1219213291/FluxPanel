# -*- coding:utf-8 -*-

from typing import List
from datetime import datetime, time
from sqlalchemy import and_, delete, desc, func, or_, select, update
from sqlalchemy.ext.asyncio import AsyncSession
from module_auto.entity.do.auto_env_do import AutoEnv
from module_auto.entity.vo.auto_env_vo import AutoEnvPageModel, AutoEnvModel
from utils.common_util import CamelCaseUtil
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

    @classmethod
    async def get_by_parent_id(cls, db: AsyncSession, auto_env_parent_id: int):
        """获取所有子节点"""
        auto_env = (((await db.execute(
            select(AutoEnv)
            .where(AutoEnv.parent_id == auto_env_parent_id)))
                     .scalars().all())
        )
        return auto_env

    @classmethod
    async def copy_env_by_id(cls, db: AsyncSession, auto_env_id: int) -> AutoEnv:
        """根据主键获取单条记录"""
        # 获取原始对象
        auto_env = (((await db.execute(
            select(AutoEnv)
            .where(AutoEnv.id == auto_env_id)))
                     .scalars())
                    .first())

        # 创建新的对象
        new_env = AutoEnv(
            create_time=datetime.now(),
            remark=auto_env.remark,
            env_name=auto_env.env_name+"_copy",
        )
        db.add(new_env)
        await db.flush()  # 获取新对象的 id

        # 获取子节点
        child_envs = (((await db.execute(
            select(AutoEnv)
            .where(AutoEnv.parent_id == auto_env_id, AutoEnv.del_flag != 2)))
                       .scalars())
                      .all())

        # 复制子节点
        for item in child_envs:
            new_child = AutoEnv(
                create_time=datetime.now(),
                parent_id=new_env.id,  # 设置新的父节点 ID
                key=item.key,
                value=item.value,
                remark=auto_env.remark,
            )
            db.add(new_child)

        await db.flush()
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
                AutoEnv.del_flag == '0',
                AutoEnv.parent_id == None,
                eval(data_scope_sql) if data_scope_sql else True,
            )
            .order_by(desc(AutoEnv.create_time))
            .distinct()
        )

        auto_env_list = await PageUtil.paginate(db, query, query_object.page_num, query_object.page_size, is_page)
        for item in auto_env_list.rows:
            query = (
                select(AutoEnv)
                .where(
                    AutoEnv.parent_id == item['id'],
                    AutoEnv.key == query_object.key if query_object.key else True,
                    AutoEnv.value == query_object.value if query_object.value else True,
                    AutoEnv.del_flag == '0',
                    eval(data_scope_sql) if data_scope_sql else True,
                )
                .order_by(desc(AutoEnv.create_time))
                .distinct()
            )

            item['children'] = await PageUtil.paginate(db, query, query_object.page_num, query_object.page_size)

        return auto_env_list

    @classmethod
    async def add_auto_env(cls, db: AsyncSession, add_model: AutoEnvModel, auto_commit: bool = True) -> AutoEnv:
        """
        增加
        """
        auto_env = AutoEnv(**add_model.model_dump(exclude_unset=True))
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
    async def del_auto_env(cls, db: AsyncSession, auto_env_ids: List[str], soft_del: bool = True,
                           auto_commit: bool = True):
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
