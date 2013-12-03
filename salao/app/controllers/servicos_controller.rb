class ServicosController < ApplicationController
  # GET /servicos
  # GET /servicos.json
  def index
    @servicos = Servico.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @servicos }
    end
  end

  # GET /servicos/1
  # GET /servicos/1.json
  def show
    @servico = Servico.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @servico }
    end
  end

  # GET /servicos/new
  # GET /servicos/new.json
  def new
    @servico = Servico.new
    @categorias = Category.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @servico }
    end
  end

  # GET /servicos/1/edit
  def edit
    @servico = Servico.find(params[:id])
    @categorias = Category.all
  end

  # POST /servicos
  # POST /servicos.json
  def create
    @servico = Servico.new(params[:servico])

    respond_to do |format|
      if @servico.save
        format.html { redirect_to @servico, notice: 'Servico was successfully created.' }
        format.json { render json: @servico, status: :created, location: @servico }
      else
        format.html { render action: "new" }
        format.json { render json: @servico.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /servicos/1
  # PUT /servicos/1.json
  def update
    @servico = Servico.find(params[:id])

    respond_to do |format|
      if @servico.update_attributes(params[:servico])
        format.html { redirect_to @servico, notice: 'Servico was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @servico.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /servicos/1
  # DELETE /servicos/1.json
  def destroy
    @servico = Servico.find(params[:id])
    @servico.destroy

    respond_to do |format|
      format.html { redirect_to servicos_url }
      format.json { head :no_content }
    end
  end

  def relatorio
    @relatorio=Realiza.select("sum(preco) as valor,servicos.*,realizas.*").joins(:servico).group(:nome).order("nome asc")
    @categorias= Category.select("nome").order("nome asc")
    @relatorio1=Realiza.select("sum(preco) as valor,servicos.*,realizas.*").joins("right outer join servicos on servicos.id = servico_id").group(:nome).order("nome asc").where(" data like '%_-#{Date.today.month}-_%'")
    @relatorio2=Realiza.select("sum(preco) as valor,servicos.*,realizas.*").joins("right outer join servicos on servicos.id = servico_id").group(:nome).order("nome asc").where(:data=>Date.today)
  end
end
