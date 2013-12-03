class Realiza < ActiveRecord::Base
  belongs_to :cliente
  belongs_to :usuario
  belongs_to :servico
  belongs_to :statuspagamento
  has_one :pagamento
  attr_accessible :data, :hora, :obs, :satatus ,:cliente_id,:usuario_id,:servico_id,:formapagamentoe_id,:statuspagamento_id
end
