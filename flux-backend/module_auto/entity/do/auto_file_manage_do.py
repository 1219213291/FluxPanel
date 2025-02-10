# -*- coding:utf-8 -*-

from sqlalchemy import Column, ForeignKey, String, DateTime, Integer, BigInteger
from config.database import BaseMixin, Base


class AutoFileManage(Base, BaseMixin):
    __tablename__ = "auto_file_manage"

    create_by = Column(String(64), comment='创建人')

    file_path = Column(String(256), nullable=False, comment='文件路径')

    fime_name = Column(String(128), nullable=False, comment='文件名')

    remark = Column(String(256), comment='备注')

    update_by = Column(String(64), comment='更新人')

