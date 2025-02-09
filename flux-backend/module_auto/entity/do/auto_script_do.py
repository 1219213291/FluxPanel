# -*- coding:utf-8 -*-

from sqlalchemy import Column, ForeignKey, String, DateTime, Integer, BigInteger, Text
from config.database import BaseMixin, Base


class AutoScript(Base, BaseMixin):
    __tablename__ = "auto_script"

    create_by = Column(String(64), comment='创建人')

    script_code = Column(String(64), comment='脚本编码')

    script_content = Column(Text, comment='脚本内容')

    script_name = Column(String(128), comment='脚本名称')

    script_parameters = Column(Text, comment='脚本入参')

    script_type = Column(String(64), comment='脚本类型（Python,SQL,Text,Java,JavaScript）')

    update_by = Column(String(64), comment='更新人')

