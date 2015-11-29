class DisputesController < ApplicationController
  before_filter :has_permission_admin
  before_action :set_dispute, only: [:show, :edit, :update, :destroy]
  before_action :load_championships, only: [:new, :edit, :create, :update]

  # GET /disputes
  # GET /disputes.json
  def index
    @disputes = Dispute.joins(:championship).order(:description).paginate(:page => params[:page], :per_page => 10)
  end

  # GET /disputes/1
  # GET /disputes/1.json
  def show
  end

  # GET /disputes/new
  def new
    @dispute = Dispute.new
  end

  # GET /disputes/1/edit
  def edit
  end

  # POST /disputes
  # POST /disputes.json
  def create
    @dispute = Dispute.new(dispute_params)

    respond_to do |format|
      if @dispute.save
        format.html { redirect_to @dispute, notice: t(:message_created) }
        format.json { render :show, status: :created, location: @dispute }
      else
        format.html { render :new }
        format.json { render json: @dispute.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /disputes/1
  # PATCH/PUT /disputes/1.json
  def update
    respond_to do |format|
      if @dispute.update(dispute_params)
        format.html { redirect_to @dispute, notice: t(:message_updated) }
        format.json { render :show, status: :ok, location: @dispute }
      else
        format.html { render :edit }
        format.json { render json: @dispute.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /disputes/1
  # DELETE /disputes/1.json
  def destroy
    @dispute.destroy
    respond_to do |format|
      format.html { redirect_to disputes_url, notice: t(:message_destroyed) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dispute
      @dispute = Dispute.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dispute_params
      params.require(:dispute).permit(:description, :status, :championship_id)
    end

    def load_championships
      @championships = Championship.all.order(:name)
    end
end
