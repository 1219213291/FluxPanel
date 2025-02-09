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

from module_auto.entity.vo.auto_env_vo import AutoEnvPageModel, AutoEnvModel
from module_auto.service.auto_env_service import AutoEnvService

autoEnvController = APIRouter(prefix='/auto/env', dependencies=[Depends(LoginService.get_current_user)])


@autoEnvController.get('/list', dependencies=[Depends(CheckUserInterfaceAuth('auto:env:list'))])
async def get_auto_env_list(
        request: Request,
        query_db: AsyncSession = Depends(get_db),
        page_query: AutoEnvPageModel = Depends( AutoEnvPageModel.as_query),
        data_scope_sql: str = Depends(GetDataScope('SysDept'))
):
    auto_env_result = await AutoEnvService.get_auto_env_list(query_db, page_query, data_scope_sql)

    return ResponseUtil.success(model_content=auto_env_result)

@autoEnvController.get('/getById/{autoEnvId}', dependencies=[Depends(CheckUserInterfaceAuth('auto:env:list'))])
async def get_auto_env_by_id(
        request: Request,
        autoEnvId: int,
        query_db: AsyncSession = Depends(get_db),
        data_scope_sql: str = Depends(GetDataScope('SysDept'))
):
    auto_env = await AutoEnvService.get_auto_env_by_id(query_db, autoEnvId)
    return ResponseUtil.success(data=auto_env)


@autoEnvController.post('/add', dependencies=[Depends(CheckUserInterfaceAuth('auto:env:add'))])
@Log(title='auto_env', business_type=BusinessType.INSERT)
async def add_auto_env (
    request: Request,
    add_model: AutoEnvModel,
    query_db: AsyncSession = Depends(get_db),
    current_user: CurrentUserModel = Depends(LoginService.get_current_user),
):
    add_dict_type_result = await AutoEnvService.add_auto_env(query_db, add_model)
    return ResponseUtil.success(data=add_dict_type_result)

@autoEnvController.put('/update', dependencies=[Depends(CheckUserInterfaceAuth('auto:env:update'))])
@Log(title='auto_env', business_type=BusinessType.UPDATE)
async def update_auto_env(
    request: Request,
    edit_model: AutoEnvModel,
    query_db: AsyncSession = Depends(get_db),
    current_user: CurrentUserModel = Depends(LoginService.get_current_user),
):
    add_dict_type_result = await AutoEnvService.update_auto_env(query_db, edit_model)
    return ResponseUtil.success(data=add_dict_type_result)


@autoEnvController.delete('/delete/{autoEnvIds}', dependencies=[Depends(CheckUserInterfaceAuth('auto:env:del'))])
@Log(title='auto_env', business_type=BusinessType.DELETE)
async def del_auto_env(
    request: Request,
    autoEnvIds: str,
    query_db: AsyncSession = Depends(get_db),
    current_user: CurrentUserModel = Depends(LoginService.get_current_user),
):
    ids = autoEnvIds.split(',')
    del_result = await AutoEnvService.del_auto_env(query_db, ids)
    return ResponseUtil.success(data=del_result)

@autoEnvController.post('/export', dependencies=[Depends(CheckUserInterfaceAuth('auto:env:export'))])
@Log(title='auto_env', business_type=BusinessType.EXPORT)
async def export_auto_env(
    request: Request,
    auto_env_form: AutoEnvPageModel = Form(),
    query_db: AsyncSession = Depends(get_db),
    data_scope_sql: str = Depends(GetDataScope('SysDept')),
):
    # 获取全量数据
    export_result = await AutoEnvService.export_auto_env_list(
        query_db, auto_env_form, data_scope_sql
    )
    return ResponseUtil.streaming(data=bytes2file_response(export_result))