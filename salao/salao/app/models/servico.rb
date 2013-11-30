class Servico < ActiveRecord::Base
  validates_presence_of :nome
  validates_presence_of :preco
  belongs_to :categoria
  attr_accessible :descricao, :nome, :preco
end
