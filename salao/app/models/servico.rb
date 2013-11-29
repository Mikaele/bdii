class Servico < ActiveRecord::Base
  belongs_to :category
  attr_accessible :descricao, :nome, :preco ,:category_id
end
