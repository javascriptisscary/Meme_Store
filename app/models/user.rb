class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :timeoutable

has_many :orders

 #length of session for user
  def timeout_in
    if self.admin? 
      1.year
    else
      1.hour
    end
  end


 


end
