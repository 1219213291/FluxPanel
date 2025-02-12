# -*- coding:utf-8 -*-

from typing import List
from sqlalchemy.ext.asyncio import AsyncSession
from utils.common_util import CamelCaseUtil, export_list2excel
from utils.page_util import PageResponseModel
from module_auto.dao.auto_script_dao import AutoScriptDao
from module_auto.entity.do.auto_script_do import AutoScript
from module_auto.entity.vo.auto_script_vo import AutoScriptPageModel, AutoScriptModel


class AutoScriptService:
    """
    用户管理模块服务层
    """

    @classmethod
    async def get_auto_script_list(cls, query_db: AsyncSession, query_object: AutoScriptPageModel, data_scope_sql: str) -> [list | PageResponseModel]:
        auto_script_list = await AutoScriptDao.get_auto_script_list(query_db, query_object, data_scope_sql, is_page=True)
        return auto_script_list

    @classmethod
    async def get_auto_script_by_id(cls, query_db: AsyncSession, auto_script_id: int) -> AutoScriptModel:
        auto_script = await  AutoScriptDao.get_by_id(query_db, auto_script_id)
        auto_script_model = AutoScriptModel(**CamelCaseUtil.transform_result(auto_script))
        return auto_script_model

    @classmethod
    async def get_auto_script_by_script_code(cls, query_db: AsyncSession, script_code: str,script_id: int=None):
        auto_script = await AutoScriptDao.get_by_script_code(query_db, script_code, script_id)
        return auto_script


    @classmethod
    async def add_auto_script(cls, query_db: AsyncSession, query_object: AutoScriptModel) -> AutoScriptModel:
        auto_script = await AutoScriptDao.add_auto_script(query_db, query_object)
        auto_script_model = AutoScriptModel(**CamelCaseUtil.transform_result(auto_script))
        return auto_script_model


    @classmethod
    async def update_auto_script(cls, query_db: AsyncSession, query_object: AutoScriptModel) -> AutoScriptModel:
        auto_script = await AutoScriptDao.edit_auto_script(query_db, query_object)
        auto_script_model = AutoScriptModel(**CamelCaseUtil.transform_result(auto_script))
        return auto_script_model


    @classmethod
    async def del_auto_script(cls, query_db: AsyncSession, auto_script_ids: List[str]):
        await AutoScriptDao.del_auto_script(query_db, auto_script_ids)


    @classmethod
    async def export_auto_script_list(cls, query_db: AsyncSession, query_object: AutoScriptPageModel, data_scope_sql) -> bytes:
        auto_script_list = await AutoScriptDao.get_auto_script_list(query_db, query_object, data_scope_sql, is_page=False)
        mapping_dict = {
            'scriptCode': '脚本编码 ',
            'scriptContent': '脚本内容 ',
            'scriptName': '脚本名称 ',
            'scriptParameters': '脚本入参 ',
            'scriptType': '脚本类型（Python,SQL,Text,Java,JavaScript） ',
            'updateTime': '更新时间 ',
        }
        new_data = [
            {mapping_dict.get(key): value for key, value in item.items() if mapping_dict.get(key)} for item in auto_script_list
        ]
        binary_data = export_list2excel(new_data)
        return binary_data