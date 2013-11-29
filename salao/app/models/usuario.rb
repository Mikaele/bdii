class Usuario < ActiveRecord::Base
  belongs_to :pessoa
  has_many :servicos, :through => :realizas
  has_many :clientes, :through => :realizas
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me , :pessoa_id , :nome
  # attr_accessible :title, :body
end
