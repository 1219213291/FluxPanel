# -*- coding:utf-8 -*-

from sqlalchemy import Column, ForeignKey, String, DateTime, Integer, BigInteger
from sqlalchemy.orm import relationship
from config.database import BaseMixin, Base


class AutoEnv(Base, BaseMixin):
    __tablename__ = "auto_env"

    id = Column(BigInteger, primary_key=True, autoincrement=True, comment='id')  # 确保主键字段存在
    create_by = Column(String(64), comment='创建人')
    env_name = Column(String(128), comment='环境名称')
    key = Column(String(256), comment='键')
    parent_id = Column(BigInteger, ForeignKey('auto_env.id'), comment='父节点')  # 自引用外键
    remark = Column(String(256), comment='备注')
    update_by = Column(String(64), comment='更新人')
    value = Column(String(256), comment='值')

    # 定义子节点关系
    children = relationship(
        "AutoEnv",
        backref="parent",
        lazy="joined",
        cascade="all",
        remote_side=[id]  # 明确指定远程字段
    )