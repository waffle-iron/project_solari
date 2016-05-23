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

    #TODO add first man role
    @matching.top_point = 0
    @matching.bot_point = 0
    @matching.mid_point = 0
    @matching.sup_point = 0
    @matching.jg_point = 0

    respond_to do |format|
      if current_user.matching_queue
        format.html { redirect_to matchings_path, alert: "すでに部屋に参加しています！" }
        format.json { render json: matching_queue.errors, status: :unprocessable_entity }
        next
      end
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
        #TODO マッチング自体に人数を持たせないとSQLが重くなりそう
        matching_queue = MatchingQueue.new(:matching => @matching, :user => current_user, :primary_role => params[:matching_queue][:primary_role], :secondary_role => params[:matching_queue][:secondary_role])
        if matching_queue.save
          #matchingにroleの追加を通知
          @matching.add_role_point(matching_queue)
          format.html { redirect_to @matching, notice: 'joined to matching.' }
          format.json { render :show, status: :ok, location: @matching }
        else
          flash.now[:error] = matching_queue.errors
          format.html { render :show }
          format.json { render json: matching_queue.errors, status: :unprocessable_entity }
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

  def search
    @is_login = false
    if params.include? :summoner_name
      search_summoner(params[:summoner_name])
    end

    @matching_search = Search::Matching.new
    if(params[:search_matching])
      @matchings = Search::Matching.new(search_params)
      @matchings = @matchings.matches
    else
      @matchings = Matching.all
    end
  end

  private
    def search_params
      params.require(:search_matching).permit(Search::Matching::ATTRIBUTES)
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_matching
      @matching = Matching.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def matching_params
      params.require(:matching).permit(:queue_type, :under30, :unranked, :bronze, :silver, :gold, :plutinum, :diamond, :master, :challenger, :deadline)
    end

    def search_summoner(summoner_name)
      client = Taric.client(region: :jp)
      data = client.summoners_by_names(summoner_names: summoner_name)
      p data.body
      if data.body.include?(summoner_name)
        @is_login = true
        @summonerInfo = data.body[summoner_name]
      end
    end

end
