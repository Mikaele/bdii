class Pessoa < ActiveRecord::Base
  attr_accessible :apelido, :celular, :email, :endereco, :nome, :telefone
end
