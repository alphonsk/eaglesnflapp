class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /teams
  # GET /teams.json
  def index
    @teams = Team.all
    @team = Team.new
    @user_id = current_user.id
    @admin = 1
  end

  # GET /teams/1
  # GET /teams/1.json
  def show
    @team_name = params[:id]
    @team_id =  (Team.where(name: params[:id]).first).id
    @team =  Team.where(name: params[:id]).first
    @user_id = current_user.id
    
    # 
    @post = Post.new
    @posts =Post.where(team_id: @team.id)

    #
    # @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = Comment.all
    
    #
    @teams = Team.all
    @team_obj =  (Team.where(name: params[:id]).first) 

  end

  # GET /teams/new
  def new
    @team = Team.new 
  end

  # GET /teams/1/edit
  def edit 
    @team = Team.find(  params[:id])  
  end

  def myteams
    @my_teams = Team.all
  end

  # POST /teams
  # POST /teams.json
  def create
    @current_user_id = current_user.id
    @team = Team.new(team_params)
  
    respond_to do |format|
      if @team.save
        format.html { redirect_to root_path, notice: 'Team was successfully created.' }
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
    @team = Team.find(params[:id]) 
    respond_to do |format|
      if @team.update(team_params)
        format.html { redirect_to root_path, notice: 'Team was successfully updated.' }
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
    @team = Team.find(params[:id] )
    puts 9999
    puts @team 
    @team.destroy
    respond_to do |format|
      format.html { redirect_to teams_url, notice: 'Team was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team 
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def team_params
      params.require(:team).permit(:name, :avatar )
    end

    def post_params
      params.require(:post).permit(:post, :user_id, :team_id)
      
    end

    private
    def comment_params
      params.require(:comment).permit(:comment, :post_id, :user_id) 
    end
end


# <%= form_for @post, url: {action: "create"} do |f| %> 
#   <%= f.label "comment" %>
#   <%= f.text_area :post, size: "40x5" %>
#   <%= f.submit "post" %>
# <% end %>