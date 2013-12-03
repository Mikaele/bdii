class Servico < ActiveRecord::Base
  belongs_to :category
  has_one :pagamento
  attr_accessible :descricao, :nome, :preco ,:category_id
end
