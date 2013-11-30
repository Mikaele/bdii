class Cliente < ActiveRecord::Base
  validates_presence_of :nome
  attr_accessible :aniversario, :obs, :references, :sexo
end
