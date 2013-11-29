class Categorium < ActiveRecord::Base
  validates_presence_of :nome
  attr_accessible :descricao, :nome
end
