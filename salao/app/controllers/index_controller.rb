class IndexController < ApplicationController
  def cadastrar_cliente
    @pessoa = Pessoa.new
  end
  def cadastrar_cliente2
    @cliente = Cliente.new
  end
  def index

  end
end
