class PagamentosController < ApplicationController
  # GET /pagamentos
  # GET /pagamentos.json
  def index
    @pagamentos = Pagamento.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pagamentos }
    end
  end

  # GET /pagamentos/1
  # GET /pagamentos/1.json
  def show
    @pagamento = Pagamento.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pagamento }
    end
  end

  # GET /pagamentos/new
  # GET /pagamentos/new.json
  def new
    @pagamento = Pagamento.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pagamento }
    end
  end

  # GET /pagamentos/1/edit
  def edit
    @pagamento = Pagamento.find(params[:id])
  end

  # POST /pagamentos
  # POST /pagamentos.json
  def create
    @pagamento = Pagamento.new(params[:pagamento])

    respond_to do |format|
      if @pagamento.save
        format.html { redirect_to @pagamento, notice: 'Pagamento was successfully created.' }
        format.json { render json: @pagamento, status: :created, location: @pagamento }
      else
        format.html { render action: "new" }
        format.json { render json: @pagamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pagamentos/1
  # PUT /pagamentos/1.json
  def update
    @pagamento = Pagamento.find(params[:id])

    respond_to do |format|
      if @pagamento.update_attributes(params[:pagamento])
        format.html { redirect_to @pagamento, notice: 'Pagamento was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @pagamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pagamentos/1
  # DELETE /pagamentos/1.json
  def destroy
    @pagamento = Pagamento.find(params[:id])
    @pagamento.destroy

    respond_to do |format|
      format.html { redirect_to pagamentos_url }
      format.json { head :no_content }
    end
  end
  def confirmar_pg
    @pagamento=Pagamento.find(params[:id])
    @pagamento.update_attributes(:hora=>Time.now,:data=>Date.today)
    respond_to do |format|
      format.html { redirect_to "/" }
      format.json { head :no_content }
    end
  end
end
