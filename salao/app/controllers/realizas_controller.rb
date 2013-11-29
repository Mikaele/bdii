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

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @realiza }
    end
  end

  # GET /realizas/1/edit
  def edit
    @realiza = Realiza.find(params[:id])
  end

  # POST /realizas
  # POST /realizas.json
  def create
    @realiza = Realiza.new(params[:realiza])

    respond_to do |format|
      if @realiza.save
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

    respond_to do |format|
      if @realiza.update_attributes(params[:realiza])
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
end
