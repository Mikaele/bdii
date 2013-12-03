class Pagamento < ActiveRecord::Base
  belongs_to :formapagamentoe
  belongs_to :cliente
  belongs_to :servico
  attr_accessible :data, :hora, :valor ,:servico_id, :cliente_id, :formapagamentoe_id
end
