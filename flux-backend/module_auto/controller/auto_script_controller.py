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

from module_auto.entity.vo.auto_script_vo import AutoScriptPageModel, AutoScriptModel
from module_auto.service.auto_script_service import AutoScriptService

autoScriptController = APIRouter(prefix='/auto/script', dependencies=[Depends(LoginService.get_current_user)])


@autoScriptController.get('/list', dependencies=[Depends(CheckUserInterfaceAuth('auto:script:list'))])
async def get_auto_script_list(
        request: Request,
        query_db: AsyncSession = Depends(get_db),
        page_query: AutoScriptPageModel = Depends( AutoScriptPageModel.as_query),
        data_scope_sql: str = Depends(GetDataScope('SysDept'))
):
    auto_script_result = await AutoScriptService.get_auto_script_list(query_db, page_query, data_scope_sql)

    return ResponseUtil.success(model_content=auto_script_result)

@autoScriptController.get('/getById/{autoScriptId}', dependencies=[Depends(CheckUserInterfaceAuth('auto:script:list'))])
async def get_auto_script_by_id(
        request: Request,
        autoScriptId: int,
        query_db: AsyncSession = Depends(get_db),
        data_scope_sql: str = Depends(GetDataScope('SysDept'))
):
    auto_script = await AutoScriptService.get_auto_script_by_id(query_db, autoScriptId)
    return ResponseUtil.success(data=auto_script)


@autoScriptController.post('/add', dependencies=[Depends(CheckUserInterfaceAuth('auto:script:add'))])
@Log(title='auto_script', business_type=BusinessType.INSERT)
async def add_auto_script (
    request: Request,
    add_model: AutoScriptModel,
    query_db: AsyncSession = Depends(get_db),
    current_user: CurrentUserModel = Depends(LoginService.get_current_user),
):
    script_code = await AutoScriptService.get_auto_script_by_script_code(query_db, add_model.script_code)
    if script_code:
        return ResponseUtil.error(msg='脚本编码已存在')
    add_dict_type_result = await AutoScriptService.add_auto_script(query_db, add_model)
    return ResponseUtil.success(data=add_dict_type_result)

@autoScriptController.put('/update', dependencies=[Depends(CheckUserInterfaceAuth('auto:script:update'))])
@Log(title='auto_script', business_type=BusinessType.UPDATE)
async def update_auto_script(
    request: Request,
    edit_model: AutoScriptModel,
    query_db: AsyncSession = Depends(get_db),
    current_user: CurrentUserModel = Depends(LoginService.get_current_user),
):
    script_code = await AutoScriptService.get_auto_script_by_script_code(query_db, edit_model.script_code,edit_model.id)
    if script_code:
        return ResponseUtil.error(msg='脚本编码已存在')
    add_dict_type_result = await AutoScriptService.update_auto_script(query_db, edit_model)
    return ResponseUtil.success(data=add_dict_type_result)


@autoScriptController.delete('/delete/{autoScriptIds}', dependencies=[Depends(CheckUserInterfaceAuth('auto:script:del'))])
@Log(title='auto_script', business_type=BusinessType.DELETE)
async def del_auto_script(
    request: Request,
    autoScriptIds: str,
    query_db: AsyncSession = Depends(get_db),
    current_user: CurrentUserModel = Depends(LoginService.get_current_user),
):
    ids = autoScriptIds.split(',')
    del_result = await AutoScriptService.del_auto_script(query_db, ids)
    return ResponseUtil.success(data=del_result)

@autoScriptController.post('/export', dependencies=[Depends(CheckUserInterfaceAuth('auto:script:export'))])
@Log(title='auto_script', business_type=BusinessType.EXPORT)
async def export_auto_script(
    request: Request,
    auto_script_form: AutoScriptPageModel = Form(),
    query_db: AsyncSession = Depends(get_db),
    data_scope_sql: str = Depends(GetDataScope('SysDept')),
):
    # 获取全量数据
    export_result = await AutoScriptService.export_auto_script_list(
        query_db, auto_script_form, data_scope_sql
    )
    return ResponseUtil.streaming(data=bytes2file_response(export_result))