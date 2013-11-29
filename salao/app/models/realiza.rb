class Realiza < ActiveRecord::Base
  belongs_to :cliente
  belongs_to :usuario
  belongs_to :servico
  attr_accessible :data, :hora, :obs, :satatus ,:cliente_id,:usuario_id,:servico_id
end
