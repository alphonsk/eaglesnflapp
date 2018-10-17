class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :edit, :update, :destroy]
  # before_action :authenticate_user!

  # GET /teams
  # GET /teams.json
  def index
    @teams = Team.all
    @team = Team.new 
    @admin = 1
    if current_user
      @user_id = current_user.id
    end

    # MYTEAMS
    if current_user
      @user_id = current_user.id
    end 
    @all_teams = Team.all
    @my_teams = Userteam.where(user_id: @user_id)
    
 
    @all_api = Team.get_api 
    puts @all_api
  end




  # GET /teams/1
  # GET /teams/1.json
  def show
    @team_name = params[:id]
    @team_id =  (Team.where(name: params[:id]).first).id
    @team =  Team.where(name: params[:id]).first
    if current_user
      @user_id = current_user.id
    end
    
    

    # 
    @post = Post.new
    @posts =Post.where(team_id: @team.id).reverse

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
    if current_user
      @user_id = current_user.id
    end 
    @all_teams = Team.all
    @my_teams = Userteam.where(user_id: @user_id)
    # @my_teams = Team.where(user_id: @user_id)


    #  INDEX
    @teams = Team.all
    @team = Team.new 
    @admin = 1
    if current_user
      @user_id = current_user.id
    end


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
    puts 22222
    @team = Team.find(params[:id])
    puts @team
    puts 9999 
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



# <%= link_to image_tag(nflteam.team.avatar ) , team_path(nflteam.team.name) %> 


# <% @my_teams.each do |item| %>
#   <div>
#     <%= image_tag(Team.find(item.team_id) )  %> <%= Team.find(item.team_id).name %>   <%= User.find(item.user_id).email %>
#     </div>
#     <br/>
#   <% end %>