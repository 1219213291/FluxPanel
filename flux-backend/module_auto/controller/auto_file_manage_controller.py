# -*- coding:utf-8 -*-

from fastapi import APIRouter, Depends, Form
from sqlalchemy.ext.asyncio import AsyncSession
from starlette.requests import Request
from typing import List
from config.enums import BusinessType
from config.get_db import get_db
from module_admin.service.login_service import LoginService
from module_admin.aspect.data_scope import GetDataScope
from module_admin.aspect.interface_auth import CheckUserInterfaceAuth
from module_admin.entity.vo.user_vo import CurrentUserModel
from module_admin.annotation.log_annotation import Log
from utils.response_util import ResponseUtil
from utils.common_util import bytes2file_response

from module_auto.entity.vo.auto_file_manage_vo import AutoFileManagePageModel, AutoFileManageModel
from module_auto.service.auto_file_manage_service import AutoFileManageService

autoFileManageController = APIRouter(prefix='/auto/file', dependencies=[Depends(LoginService.get_current_user)])


@autoFileManageController.get('/list', dependencies=[Depends(CheckUserInterfaceAuth('auto:file:list'))])
async def get_auto_file_manage_list(
        request: Request,
        query_db: AsyncSession = Depends(get_db),
        page_query: AutoFileManagePageModel = Depends( AutoFileManagePageModel.as_query),
        data_scope_sql: str = Depends(GetDataScope('SysDept'))
):
    auto_file_manage_result = await AutoFileManageService.get_auto_file_manage_list(query_db, page_query, data_scope_sql)

    return ResponseUtil.success(model_content=auto_file_manage_result)

@autoFileManageController.get('/getById/{autoFileManageId}', dependencies=[Depends(CheckUserInterfaceAuth('auto:file:list'))])
async def get_auto_file_manage_by_id(
        request: Request,
        autoFileManageId: int,
        query_db: AsyncSession = Depends(get_db),
        data_scope_sql: str = Depends(GetDataScope('SysDept'))
):
    auto_file_manage = await AutoFileManageService.get_auto_file_manage_by_id(query_db, autoFileManageId)
    return ResponseUtil.success(data=auto_file_manage)


@autoFileManageController.post('/add', dependencies=[Depends(CheckUserInterfaceAuth('auto:file:add'))])
@Log(title='auto_file_manage', business_type=BusinessType.INSERT)
async def add_auto_file_manage (
    request: Request,
    add_model: AutoFileManageModel,
    query_db: AsyncSession = Depends(get_db),
    current_user: CurrentUserModel = Depends(LoginService.get_current_user),
):
    add_dict_type_result = await AutoFileManageService.add_auto_file_manage(query_db, add_model)
    return ResponseUtil.success(data=add_dict_type_result)

@autoFileManageController.put('/update', dependencies=[Depends(CheckUserInterfaceAuth('auto:file:update'))])
@Log(title='auto_file_manage', business_type=BusinessType.UPDATE)
async def update_auto_file_manage(
    request: Request,
    edit_model: AutoFileManageModel,
    query_db: AsyncSession = Depends(get_db),
    current_user: CurrentUserModel = Depends(LoginService.get_current_user),
):
    add_dict_type_result = await AutoFileManageService.update_auto_file_manage(query_db, edit_model)
    return ResponseUtil.success(data=add_dict_type_result)


@autoFileManageController.delete('/delete/{autoFileManageIds}', dependencies=[Depends(CheckUserInterfaceAuth('auto:file:del'))])
@Log(title='auto_file_manage', business_type=BusinessType.DELETE)
async def del_auto_file_manage(
    request: Request,
    autoFileManageIds: str,
    query_db: AsyncSession = Depends(get_db),
    current_user: CurrentUserModel = Depends(LoginService.get_current_user),
):
    ids = autoFileManageIds.split(',')
    del_result = await AutoFileManageService.del_auto_file_manage(query_db, ids)
    return ResponseUtil.success(data=del_result)

@autoFileManageController.post('/export', dependencies=[Depends(CheckUserInterfaceAuth('auto:file:export'))])
@Log(title='auto_file_manage', business_type=BusinessType.EXPORT)
async def export_auto_file_manage(
    request: Request,
    auto_file_manage_form: AutoFileManagePageModel = Form(),
    query_db: AsyncSession = Depends(get_db),
    data_scope_sql: str = Depends(GetDataScope('SysDept')),
):
    # 获取全量数据
    export_result = await AutoFileManageService.export_auto_file_manage_list(
        query_db, auto_file_manage_form, data_scope_sql
    )
    return ResponseUtil.streaming(data=bytes2file_response(export_result))