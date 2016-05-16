class MatchingsController < ApplicationController
  before_action :set_matching, only: [:show, :edit, :update, :destroy, :join]

  # GET /matchings
  # GET /matchings.json
  def index
    @matchings = Matching.all
  end

  # GET /matchings/1
  # GET /matchings/1.json
  def show
  end

  # GET /matchings/new
  def new
    @matching = Matching.new
  end

  # GET /matchings/1/edit
  def edit
  end

  # POST /matchings
  # POST /matchings.json
  def create
    @matching = Matching.new(matching_params)

    respond_to do |format|
      if @matching.save
        @matching.matching_queues.create user: current_user, primary_role: :fill_primary, secondary_role: :fill_secondary
        format.html { redirect_to @matching, notice: 'Matching was successfully created.' }
        format.json { render :show, status: :created, location: @matching }
      else
        format.html { render :new }
        format.json { render json: @matching.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /matchings/1
  # PATCH/PUT /matchings/1.json
  def update
    respond_to do |format|
      # join matching
      if params[:join]
        if @matching.matching_queues.create user: current_user, primary_role: params[:matching_queue][:primary_role], secondary_role: params[:matching_queue][:secondary_role]
          format.html { redirect_to @matching, notice: 'joined to matching.' }
          format.json { render :show, status: :ok, location: @matching }
        else
          format.html { render :join }
          format.json { render json: @matching.errors, status: :unprocessable_entity }
        end
      # edit matching
      else
        if @matching.update(matching_params)
          format.html { redirect_to @matching, notice: 'Matching was successfully updated.' }
          format.json { render :show, status: :ok, location: @matching }
        else
          format.html { render :edit }
          format.json { render json: @matching.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /matchings/1
  # DELETE /matchings/1.json
  def destroy
    @matching.destroy
    respond_to do |format|
      format.html { redirect_to matchings_url, notice: 'Matching was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def join
    @matching_queue = MatchingQueue.new
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_matching
      @matching = Matching.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def matching_params
      params.require(:matching).permit(:queue_type, :under30, :unranked, :bronze, :silver, :gold, :plutinum, :diamond, :master, :challenger, :deadline)
    end
end
