class StatuspagamentoesController < ApplicationController
  # GET /statuspagamentoes
  # GET /statuspagamentoes.json
  def index
    @statuspagamentoes = Statuspagamentoe.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @statuspagamentoes }
    end
  end

  # GET /statuspagamentoes/1
  # GET /statuspagamentoes/1.json
  def show
    @statuspagamento = Statuspagamentoe.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @statuspagamento }
    end
  end

  # GET /statuspagamentoes/new
  # GET /statuspagamentoes/new.json
  def new
    @statuspagamento = Statuspagamentoe.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @statuspagamento }
    end
  end

  # GET /statuspagamentoes/1/edit
  def edit
    @statuspagamento = Statuspagamentoe.find(params[:id])
  end

  # POST /statuspagamentoes
  # POST /statuspagamentoes.json
  def create
    @statuspagamento = Statuspagamentoe.new(params[:statuspagamentoe])

    respond_to do |format|
      if @statuspagamento.save
        format.html { redirect_to @statuspagamento, notice: 'Statuspagamentoe was successfully created.' }
        format.json { render json: @statuspagamento, status: :created, location: @statuspagamento }
      else
        format.html { render action: "new" }
        format.json { render json: @statuspagamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /statuspagamentoes/1
  # PUT /statuspagamentoes/1.json
  def update
    @statuspagamento = Statuspagamentoe.find(params[:id])

    respond_to do |format|
      if @statuspagamento.update_attributes(params[:statuspagamentoe])
        format.html { redirect_to @statuspagamento, notice: 'Statuspagamentoe was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @statuspagamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /statuspagamentoes/1
  # DELETE /statuspagamentoes/1.json
  def destroy
    @statuspagamento = Statuspagamentoe.find(params[:id])
    @statuspagamento.destroy

    respond_to do |format|
      format.html { redirect_to statuspagamentoes_url }
      format.json { head :no_content }
    end
  end
end
