class Servico < ActiveRecord::Base
  belongs_to :categoria
  attr_accessible :descricao, :nome, :preco ,:categoria_id
end
