class RoundsController < ApplicationController
  before_action :set_round, only: [:show, :edit, :update, :destroy]
  before_action :load_championships, only: [:new, :edit, :create, :update]

  # GET /rounds
  # GET /rounds.json
  def index
    @rounds = Round.all.order(:name)
  end

  # GET /rounds/1
  # GET /rounds/1.json
  def show
  end

  # GET /rounds/new
  def new
    @round = Round.new
  end

  # GET /rounds/1/edit
  def edit
  end

  # POST /rounds
  # POST /rounds.json
  def create
    @round = Round.new(round_params)

    respond_to do |format|
      if @round.save
        format.html { redirect_to @round, notice: t(:message_created) }
        format.json { render :show, status: :created, location: @round }
      else
        format.html { render :new }
        format.json { render json: @round.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rounds/1
  # PATCH/PUT /rounds/1.json
  def update
    respond_to do |format|
      if @round.update(round_params)
        format.html { redirect_to @round, notice: t(:message_updated) }
        format.json { render :show, status: :ok, location: @round }
      else
        format.html { render :edit }
        format.json { render json: @round.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rounds/1
  # DELETE /rounds/1.json
  def destroy
    @round.destroy
    respond_to do |format|
      format.html { redirect_to rounds_url, notice: t(:message_destroyed) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_round
      @round = Round.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def round_params
      params.require(:round).permit(:name, :championship_id)
    end

    def load_championships
      @championships = Championship.all.order(:name)
    end
end
