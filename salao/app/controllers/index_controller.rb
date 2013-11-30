class IndexController < ApplicationController
  def cadastrar_cliente
    @pessoa = Pessoa.new
  end
end
