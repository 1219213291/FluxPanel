# -*- coding:utf-8 -*-
from datetime import datetime
from pydantic import BaseModel, ConfigDict, Field
from pydantic.alias_generators import to_camel
from typing import List, Literal, Optional, Union
from module_admin.annotation.pydantic_annotation import as_query


class AutoScriptModel(BaseModel):
    """
    表对应pydantic模型
    """
    model_config = ConfigDict(alias_generator=to_camel, from_attributes=True)
    create_by: Optional[str] =  Field(default=None, description='创建人')
    create_time: Optional[datetime] =  Field(default=None, description='创建时间')
    del_flag: Optional[int] =  Field(default=None, description='逻辑删除（1：未删除，2：删除）')
    id: Optional[int] =  Field(default=None, description='脚本ID')
    script_code: Optional[str] =  Field(default=None, description='脚本编码')
    script_content: Optional[str] =  Field(default=None, description='脚本内容')
    script_name: Optional[str] =  Field(default=None, description='脚本名称')
    script_parameters: Optional[str] =  Field(default=None, description='脚本入参')
    script_type: Optional[str] =  Field(default=None, description='脚本类型（Python,SQL,Text,Java,JavaScript）')
    update_by: Optional[str] =  Field(default=None, description='更新人')
    update_time: Optional[datetime] =  Field(default=None, description='更新时间')


@as_query
class AutoScriptPageModel(AutoScriptModel):
    """
    分页查询模型
    """
    page_num: int = Field(default=1, description='当前页码')
    page_size: int = Field(default=10, description='每页记录数')