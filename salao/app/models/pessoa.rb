class Pessoa < ActiveRecord::Base
  validates_presence_of :nome
  attr_accessible :apelido, :celular, :email, :endereco, :nome, :telefone
end
