# -*- coding:utf-8 -*-

from typing import List
from sqlalchemy.ext.asyncio import AsyncSession
from utils.common_util import CamelCaseUtil, export_list2excel
from utils.page_util import PageResponseModel
from module_auto.dao.auto_file_manage_dao import AutoFileManageDao
from module_auto.entity.do.auto_file_manage_do import AutoFileManage
from module_auto.entity.vo.auto_file_manage_vo import AutoFileManagePageModel, AutoFileManageModel


class AutoFileManageService:
    """
    用户管理模块服务层
    """

    @classmethod
    async def get_auto_file_manage_list(cls, query_db: AsyncSession, query_object: AutoFileManagePageModel, data_scope_sql: str) -> [list | PageResponseModel]:
        auto_file_manage_list = await AutoFileManageDao.get_auto_file_manage_list(query_db, query_object, data_scope_sql, is_page=True)
        return auto_file_manage_list

    @classmethod
    async def get_auto_file_manage_by_id(cls, query_db: AsyncSession, auto_file_manage_id: int) -> AutoFileManageModel:
        auto_file_manage = await  AutoFileManageDao.get_by_id(query_db, auto_file_manage_id)
        auto_file_manage_model = AutoFileManageModel(**CamelCaseUtil.transform_result(auto_file_manage))
        return auto_file_manage_model


    @classmethod
    async def add_auto_file_manage(cls, query_db: AsyncSession, query_object: AutoFileManageModel) -> AutoFileManageModel:
        auto_file_manage = await AutoFileManageDao.add_auto_file_manage(query_db, query_object)
        auto_file_manage_model = AutoFileManageModel(**CamelCaseUtil.transform_result(auto_file_manage))
        return auto_file_manage_model


    @classmethod
    async def update_auto_file_manage(cls, query_db: AsyncSession, query_object: AutoFileManageModel) -> AutoFileManageModel:
        auto_file_manage = await AutoFileManageDao.edit_auto_file_manage(query_db, query_object)
        auto_file_manage_model = AutoFileManageModel(**CamelCaseUtil.transform_result(auto_file_manage))
        return auto_file_manage_model


    @classmethod
    async def del_auto_file_manage(cls, query_db: AsyncSession, auto_file_manage_ids: List[str]):
        await AutoFileManageDao.del_auto_file_manage(query_db, auto_file_manage_ids)


    @classmethod
    async def export_auto_file_manage_list(cls, query_db: AsyncSession, query_object: AutoFileManagePageModel, data_scope_sql) -> bytes:
        auto_file_manage_list = await AutoFileManageDao.get_auto_file_manage_list(query_db, query_object, data_scope_sql, is_page=False)
        mapping_dict = {
            'filePath': '文件路径 ',
            'fimeName': '文件名 ',
            'remark': '备注 ',
            'updateTime': '更新时间 ',
        }
        new_data = [
            {mapping_dict.get(key): value for key, value in item.items() if mapping_dict.get(key)} for item in auto_file_manage_list
        ]
        binary_data = export_list2excel(new_data)
        return binary_data