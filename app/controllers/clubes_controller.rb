class ClubesController < ApplicationController
  before_action :set_clube, only: [:show, :edit, :update, :destroy]

  # GET /clubes
  # GET /clubes.json
  def index
    @clubes = Clube.all
  end

  # GET /clubes/1
  # GET /clubes/1.json
  def show
  end

  # GET /clubes/new
  def new
    @clube = Clube.new
  end

  # GET /clubes/1/edit
  def edit
  end

  # POST /clubes
  # POST /clubes.json
  def create
    @clube = Clube.new(clube_params)

    respond_to do |format|
      if @clube.save
        format.html { redirect_to @clube, notice: 'Clube foi criado com sucesso!' }
        format.json { render :show, status: :created, location: @clube }
      else
        format.html { render :new }
        format.json { render json: @clube.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clubes/1
  # PATCH/PUT /clubes/1.json
  def update
    respond_to do |format|
      if @clube.update(clube_params)
        format.html { redirect_to @clube, notice: 'Clube foi editado com sucesso!' }
        format.json { render :show, status: :ok, location: @clube }
      else
        format.html { render :edit }
        format.json { render json: @clube.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clubes/1
  # DELETE /clubes/1.json
  def destroy
    @clube.destroy
    respond_to do |format|
      format.html { redirect_to clubes_url, notice: 'Clube excluído com sucesso!' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_clube
      @clube = Clube.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def clube_params
      params.require(:clube).permit(:nome)
    end
end
