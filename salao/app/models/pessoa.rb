class Pessoa < ActiveRecord::Base
  has_one :cliente
  has_one :usuario
  validates_presence_of :nome
  attr_accessible :apelido, :celular, :email, :endereco, :nome, :telefone
end
