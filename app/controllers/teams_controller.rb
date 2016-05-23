class TeamsController < LoginController
  before_action :set_team, only: [:show, :edit, :update, :destroy, :join]

  # GET /teams
  # GET /teams.json
  def index
    @teams = Team.all
  end

  # GET /teams/1
  # GET /teams/1.json
  def show
    page_size = 10
    page_num = 0 # read N from URL http*.html?log=N
    @is_member = @team.users.include?(current_user)
    @team_chat_log = @team.teamchats.order(updated_at: :desc).limit(page_size).offset(page_size * page_num) # read from DB
    @team_chat_count = @team.teamchats.size
    if @is_member
      @teamonly_chat_log = @team.teamonlychats.order(updated_at: :desc).limit(page_size).offset(page_size * page_num)
      @teamonly_chat_count = @team.teamonlychats.size
    end
    session[:user_id] = current_user.id
    session[:team_id] = params[:id]
  end

  # GET /teams/new
  def new
    @team = Team.new
  end

  # GET /teams/1/edit
  def edit
  end

  # POST /teams
  # POST /teams.json
  def create
    @team = Team.new(team_params)

    respond_to do |format|
      if @team.save
        format.html { redirect_to @team, notice: 'Team was successfully created.' }
        format.json { render :show, status: :created, location: @team }
      else
        format.html { render :new }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teams/1
  # PATCH/PUT /teams/1.json
  def update
    respond_to do |format|
      if @team.update(team_params)
        format.html { redirect_to @team, notice: 'Team was successfully updated.' }
        format.json { render :show, status: :ok, location: @team }
      else
        format.html { render :edit }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teams/1
  # DELETE /teams/1.json
  def destroy
    @team.destroy
    respond_to do |format|
      format.html { redirect_to teams_url, notice: 'Team was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def join
    if @team.users.include?(current_user)
      respond_to do |format|
        format.html { redirect_to @team, alert: 'You Already in the team.' }
        format.json { render :show, status: :unprocessable_entity, location: @team }
      end
    else
      @team.users << current_user
      respond_to do |format|
        format.html { redirect_to @team, notice: 'You joined the team.' }
        format.json { render :show, status: :ok, location: @team }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team
      @team = Team.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def team_params
      params.require(:team).permit(:name)
    end

end
