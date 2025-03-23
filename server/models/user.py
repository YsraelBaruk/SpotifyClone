from sqlalchemy import TEXT, VARCHAR, Column, LargeBinary
from models.base import Base

class User(Base):
    pass
    __tablename__ = 'users'
    id = Column(TEXT)
    name = Column(VARCHAR(100), primary_key=True)
    email = Column(VARCHAR(100))
    password = Column(LargeBinary)