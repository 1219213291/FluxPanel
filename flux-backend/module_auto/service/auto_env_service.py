# -*- coding:utf-8 -*-

from typing import List
from sqlalchemy.ext.asyncio import AsyncSession
from utils.common_util import CamelCaseUtil, export_list2excel
from utils.page_util import PageResponseModel
from module_auto.dao.auto_env_dao import AutoEnvDao
from module_auto.entity.do.auto_env_do import AutoEnv
from module_auto.entity.vo.auto_env_vo import AutoEnvPageModel, AutoEnvModel


class AutoEnvService:
    """
    用户管理模块服务层
    """

    @classmethod
    async def get_auto_env_list(cls, query_db: AsyncSession, query_object: AutoEnvPageModel, data_scope_sql: str) -> [
        list | PageResponseModel]:
        auto_env_list = await AutoEnvDao.get_auto_env_list(query_db, query_object, data_scope_sql, is_page=True)
        return auto_env_list

    @classmethod
    async def get_auto_env_by_id(cls, query_db: AsyncSession, auto_env_id: int) -> AutoEnvModel:
        auto_env = await  AutoEnvDao.get_by_id(query_db, auto_env_id)
        auto_env_model = AutoEnvModel(**CamelCaseUtil.transform_result(auto_env))
        return auto_env_model

    @classmethod
    async def add_auto_env(cls, query_db: AsyncSession, query_object: AutoEnvModel) -> AutoEnvModel:
        auto_env = await AutoEnvDao.add_auto_env(query_db, query_object)
        auto_env_model = AutoEnvModel(**CamelCaseUtil.transform_result(auto_env))
        return auto_env_model

    @classmethod
    async def copy_auto_env(cls, query_db: AsyncSession, parent_id) -> AutoEnvModel:
        env_data = await AutoEnvDao.copy_env_by_id(query_db, parent_id)
        auto_env_model = AutoEnvModel(**CamelCaseUtil.transform_result(env_data))
        return auto_env_model

    @classmethod
    async def update_auto_env(cls, query_db: AsyncSession, query_object: AutoEnvModel) -> AutoEnvModel:
        auto_env = await AutoEnvDao.edit_auto_env(query_db, query_object)
        auto_env_model = AutoEnvModel(**CamelCaseUtil.transform_result(auto_env))
        return auto_env_model

    @classmethod
    async def del_auto_env(cls, query_db: AsyncSession, auto_env_ids: List[str]):
        await AutoEnvDao.del_auto_env(query_db, auto_env_ids)

    @classmethod
    async def export_auto_env_list(cls, query_db: AsyncSession, query_object: AutoEnvPageModel,
                                   data_scope_sql) -> bytes:
        auto_env_list = await AutoEnvDao.get_auto_env_list(query_db, query_object, data_scope_sql, is_page=False)
        mapping_dict = {
            'createBy': '创建人 ',
            'createTime': '创建时间 ',
            'envName': '环境名称 ',
            'key': '键 ',
            'remark': '备注 ',
            'updateBy': '更新人 ',
            'updateTime': '更新时间 ',
            'value': '值 ',
        }
        new_data = [
            {mapping_dict.get(key): value for key, value in item.items() if mapping_dict.get(key)} for item in
            auto_env_list
        ]
        binary_data = export_list2excel(new_data)
        return binary_data
