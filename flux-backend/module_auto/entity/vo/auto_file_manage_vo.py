# -*- coding:utf-8 -*-
from datetime import datetime
from pydantic import BaseModel, ConfigDict, Field
from pydantic.alias_generators import to_camel
from typing import List, Literal, Optional, Union
from module_admin.annotation.pydantic_annotation import as_query


class AutoFileManageModel(BaseModel):
    """
    表对应pydantic模型
    """
    model_config = ConfigDict(alias_generator=to_camel, from_attributes=True)
    create_by: Optional[str] =  Field(default=None, description='创建人')
    create_time: Optional[datetime] =  Field(default=None, description='创建时间')
    begin_create_time: Optional[datetime] =  Field(default=None, description='创建时间最小值')
    end_create_time: Optional[datetime] =  Field(default=None, description='创建时间最大值')
    del_flag: Optional[int] =  Field(default=None, description='逻辑删除（1：未删除，2：删除）')
    file_path: Optional[str] =  Field(default=None, description='文件路径')
    fime_name: Optional[str] =  Field(default=None, description='文件名')
    id: Optional[int] =  Field(default=None, description='id')
    remark: Optional[str] =  Field(default=None, description='备注')
    update_by: Optional[str] =  Field(default=None, description='更新人')
    update_time: Optional[datetime] =  Field(default=None, description='更新时间')


@as_query
class AutoFileManagePageModel(AutoFileManageModel):
    """
    分页查询模型
    """
    page_num: int = Field(default=1, description='当前页码')
    page_size: int = Field(default=10, description='每页记录数')