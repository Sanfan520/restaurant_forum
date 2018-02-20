class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def admin?
    self.role == "admin"
  end
  #用 self 呼叫物件自己，而 self.role == "admin" 是一行陳述，如果 role 屬性等於 "admin"，該陳述就會回傳 True，否則將回傳 False。  

end
