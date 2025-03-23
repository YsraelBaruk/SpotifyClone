from pydantic_schemas.user_create import UserCreate
from fastapi import Depends, HTTPException
from sqlalchemy.orm import Session
from fastapi import APIRouter
from models.user import User
from database import get_db
import bcrypt
import uuid

router = APIRouter()
@router.post('/signup')
def signup_user(user: UserCreate, db: Session=Depends(get_db)):
    user_db = db.query(User).filter(User.email == user.email).first()
    if user_db:
        raise HTTPException(400, 'User com o mesmo email já existe!')    
    hashed_pw = bcrypt.hashpw(user.password.encode(), bcrypt.gensalt())
    user_db = User(id=str(uuid.uuid4()), email=user.email, password=hashed_pw, name=user.name)
    db.add(user_db)
    db.commit()
    db.refresh(user_db)
    return user_db