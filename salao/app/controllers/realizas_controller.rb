class RealizasController < ApplicationController
  # GET /realizas
  # GET /realizas.json
  def index
    @realizas = Realiza.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @realizas }
    end
  end

  # GET /realizas/1
  # GET /realizas/1.json
  def show
    @realiza = Realiza.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @realiza }
    end
  end

  # GET /realizas/new
  # GET /realizas/new.json
  def new
    @realiza = Realiza.new
    @pessoas=Pessoa.select("clientes.id,pessoas.nome").joins(:cliente)
    @funcionarios=Pessoa.select("usuarios.id,pessoas.nome").joins(:usuario)
    #@pessoas=Pessoa.select("clientes.id,pessoas.nome").joins(:clientes)
    #@funcionarios=Pessoa.where("id in (?)",Usuario.select("pessoa_id as id").map(&:id))
    @servicos=Servico.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @realiza  and @pessoas  and @funcionarios and @servicos}
    end
  end

  # GET /realizas/1/edit
  def edit
    @realiza = Realiza.find(params[:id])
    @pessoas=Pessoa.select("clientes.id,pessoas.nome").joins(:cliente)
    @funcionarios=Pessoa.select("usuarios.id,pessoas.nome").joins(:usuario)
    @servicos=Servico.all

  end

  # POST /realizas
  # POST /realizas.json
  def create
    @realiza = Realiza.new(params[:realiza])
    @pagamento=Pagamento.new(:servico_id=>@realiza.servico_id,:cliente_id=>@realiza.cliente_id,:valor=>@realiza.servico.preco,
                             :formapagamentoe_id=>params[:pagamento])
    respond_to do |format|
      if @realiza.save and @pagamento.save
        format.html { redirect_to @realiza, notice: 'Realiza was successfully created.' }
        format.json { render json: @realiza, status: :created, location: @realiza }
      else
        format.html { render action: "new" }
        format.json { render json: @realiza.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /realizas/1
  # PUT /realizas/1.json
  def update
    @realiza = Realiza.find(params[:id])
    @pagamento=Pagamento.new(:servico_id=>@realiza.servico_id,:cliente_id=>@realiza.cliente_id,:valor=>@realiza.servico.preco,
                             :formapagamentoe_id=>params[:pagamento])
    respond_to do |format|
      if @realiza.update_attributes(params[:realiza]) and @pagamento.save
        format.html { redirect_to @realiza, notice: 'Realiza was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @realiza.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /realizas/1
  # DELETE /realizas/1.json
  def destroy
    @realiza = Realiza.find(params[:id])
    @realiza.destroy

    respond_to do |format|
      format.html { redirect_to realizas_url }
      format.json { head :no_content }
    end
  end

  def agenda_hoje
    @realizas = Realiza.where(:data=>Date.today).where(:satatus=>nil)
  end

  def confirmar
    @realiza = Realiza.find(params[:id])
    @realiza.update_attribute(:satatus,true)
    redirect_to :agenda_hoje
  end

  def cancelar
    @realiza = Realiza.find(params[:id])
    @realiza.update_attribute(:created_at,nil)
    redirect_to :agenda_hoje
  end

  def servicos_data
    @realizas = Realiza.where(" data  between ? and ?",params[:data1]["(1i)"]+"-"+params[:data1]["(2i)"]+"-"+params[:data1]["(3i)"],params[:data2]["(1i)"]+"-"+params[:data2]["(2i)"]+"-"+params[:data2]["(3i)"]).where("created_at != 'NULL'").where(:satatus=>true)
    respond_to do |format|
      format.html {render "index"}
      format.json { render json: @realizas }
    end
  end

  def atendimento
    @reallizou=Realiza.where(:satatus=>true)
    @funcionarios=Pessoa.select("usuarios.id,pessoas.nome").joins(:usuario)
  end
   def funcionario_atendeu
     @reallizou=Realiza.where(:satatus=>true).where(:usuario_id=>params[:funcionario][:usuario_id]).where(" data  between ? and ?",params[:data1]["(1i)"]+"-"+params[:data1]["(2i)"]+"-"+params[:data1]["(3i)"],params[:data2]["(1i)"]+"-"+params[:data2]["(2i)"]+"-"+params[:data2]["(3i)"]).where("created_at != 'NULL'")

     @funcionarios=Pessoa.select("usuarios.id,pessoas.nome").joins(:usuario)
   end
end
