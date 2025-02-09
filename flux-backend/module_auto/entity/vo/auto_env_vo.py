# -*- coding:utf-8 -*-
from datetime import datetime
from pydantic import BaseModel, ConfigDict, Field
from pydantic.alias_generators import to_camel
from typing import List, Literal, Optional, Union
from module_admin.annotation.pydantic_annotation import as_query


class AutoEnvModel(BaseModel):
    """
    表对应pydantic模型
    """
    model_config = ConfigDict(alias_generator=to_camel, from_attributes=True)
    create_by: Optional[str] =  Field(default=None, description='创建人')
    create_time: Optional[datetime] =  Field(default=None, description='创建时间')
    begin_create_time: Optional[datetime] =  Field(default=None, description='创建时间最小值')
    end_create_time: Optional[datetime] =  Field(default=None, description='创建时间最大值')
    del_flag: Optional[int] =  Field(default=None, description='逻辑删除（1：未删除，2：删除）')
    env_name: Optional[str] =  Field(default=None, description='环境名称')
    id: Optional[int] =  Field(default=None, description='id')
    key: Optional[str] =  Field(default=None, description='键')
    parent_id: Optional[int] =  Field(default=None, description='父节点')
    remark: Optional[str] =  Field(default=None, description='备注')
    update_by: Optional[str] =  Field(default=None, description='更新人')
    update_time: Optional[datetime] =  Field(default=None, description='更新时间')
    begin_update_time: Optional[datetime] =  Field(default=None, description='更新时间最小值')
    end_update_time: Optional[datetime] =  Field(default=None, description='更新时间最大值')
    value: Optional[str] =  Field(default=None, description='值')


@as_query
class AutoEnvPageModel(AutoEnvModel):
    """
    分页查询模型
    """
    page_num: int = Field(default=1, description='当前页码')
    page_size: int = Field(default=10, description='每页记录数')