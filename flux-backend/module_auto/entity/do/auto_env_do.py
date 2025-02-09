# -*- coding:utf-8 -*-

from sqlalchemy import Column, ForeignKey, String, DateTime, Integer, BigInteger
from config.database import BaseMixin, Base


class AutoEnv(Base, BaseMixin):
    __tablename__ = "auto_env"

    create_by = Column(String(64), comment='创建人')

    env_name = Column(String(128), comment='环境名称')

    key = Column(String(256), comment='键')

    parent_id = Column(BigInteger, comment='父节点')

    remark = Column(String(256), comment='备注')

    update_by = Column(String(64), comment='更新人')

    value = Column(String(256), comment='值')

