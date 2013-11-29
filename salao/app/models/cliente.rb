class Cliente < ActiveRecord::Base
  belongs_to :pessoa
  has_many :servicos, :through => :realizas
  has_many :usuarios,:through => :realizas
  attr_accessible :aniversario, :obs, :references, :sexo ,:pessoa_id
end
