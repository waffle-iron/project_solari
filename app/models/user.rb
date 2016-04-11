class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_and_belongs_to_many :roles
  has_and_belongs_to_many :teams
  has_and_belongs_to_many :achievements
  has_and_belongs_to_many :games
  
  enum champion_role: { fill: 0, bot: 1, support: 2, mid: 3, top: 4, jungle: 5}

  def has_role?(name)
    self.roles.where(name: name).length > 0
  end
end
