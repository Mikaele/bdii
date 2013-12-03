class FormapagamentoesController < ApplicationController
  # GET /formapagamentoes
  # GET /formapagamentoes.json
  def index
    @formapagamentoes = Formapagamentoe.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @formapagamentoes }
    end
  end

  # GET /formapagamentoes/1
  # GET /formapagamentoes/1.json
  def show
    @formapagamento = Formapagamentoe.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @formapagamento }
    end
  end

  # GET /formapagamentoes/new
  # GET /formapagamentoes/new.json
  def new
    @formapagamento = Formapagamentoe.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @formapagamento }
    end
  end

  # GET /formapagamentoes/1/edit
  def edit
    @formapagamento = Formapagamentoe.find(params[:id])
  end

  # POST /formapagamentoes
  # POST /formapagamentoes.json
  def create
    @formapagamento = Formapagamentoe.new(params[:formapagamentoe])

    respond_to do |format|
      if @formapagamento.save
        format.html { redirect_to @formapagamento, notice: 'Formapagamentoe was successfully created.' }
        format.json { render json: @formapagamento, status: :created, location: @formapagamento }
      else
        format.html { render action: "new" }
        format.json { render json: @formapagamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /formapagamentoes/1
  # PUT /formapagamentoes/1.json
  def update
    @formapagamento = Formapagamentoe.find(params[:id])

    respond_to do |format|
      if @formapagamento.update_attributes(params[:formapagamentoe])
        format.html { redirect_to @formapagamento, notice: 'Formapagamentoe was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @formapagamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /formapagamentoes/1
  # DELETE /formapagamentoes/1.json
  def destroy
    @formapagamento = Formapagamentoe.find(params[:id])
    @formapagamento.destroy

    respond_to do |format|
      format.html { redirect_to formapagamentoes_url }
      format.json { head :no_content }
    end
  end
end
