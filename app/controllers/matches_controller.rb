class MatchesController < ApplicationController
  before_action :set_match, only: [:show, :edit, :update, :destroy]
  before_action :load_championships, only: [:new, :edit, :create, :update]
  before_action :load_rounds, only: [:new, :edit, :create, :update]
  before_action :load_teams, only: [:new, :edit, :create, :update]

  # GET /matches
  # GET /matches.json
  def index
    @matches = Match.joins(:championship).joins(:round).joins(:home_team).joins(:away_team).order(:day_of_match).paginate(:page => params[:page], :per_page => 10)
  end

  # GET /matches/1
  # GET /matches/1.json
  def show
  end

  # GET /matches/new
  def new
    @match = Match.new
  end

  # GET /matches/1/edit
  def edit
  end

  # POST /matches
  # POST /matches.json
  def create
    @match = Match.new(match_params)

    respond_to do |format|
      if @match.save
        format.html { redirect_to @match, notice: t(:message_created) }
        format.json { render :show, status: :created, location: @match }
      else
        format.html { render :new }
        format.json { render json: @match.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /matches/1
  # PATCH/PUT /matches/1.json
  def update
    respond_to do |format|
      if @match.update(match_params)
        format.html { redirect_to @match, notice: t(:message_updated) }
        format.json { render :show, status: :ok, location: @match }
      else
        format.html { render :edit }
        format.json { render json: @match.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /matches/1
  # DELETE /matches/1.json
  def destroy
    @match.destroy
    respond_to do |format|
      format.html { redirect_to matches_url, notice: t(:message_destroyed) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_match
      @match = Match.joins(:championship).joins(:round).joins(:home_team).joins(:away_team).find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def match_params
      params.require(:match).permit(:championship_id, :round_id, :goals_home_team, :goals_away_team, :home_team_id, :away_team_id, :day_of_match)
    end

    def load_championships
      @championships = Championship.all.order(:name)
    end

    def load_rounds
      @rounds = Round.all.order(:name)
    end

    def load_teams
      @teams = Team.all.order(:description)
    end
end
