class UsersController < ApplicationController

  def index
    @users = User.all
     
  end


  def show
    
    @user = User.find(params[:id])
    puts @user.id
    @posts = Post.where(user_id: @user)
   
    # @team_id =  (Team.where(name: params[:id]).first).id
    # @team =  Team.where(name: params[:id]).first
    # if current_user
    #   @user_id = current_user.id
  end

end


#   <% if current_user  %>
# <%= form_with(model: @userteam, scope: "userteam" ) do |form|  %>
#      <%= form.hidden_field :team_id, :value => nflteam.id  %>
#      <%= form.hidden_field :user_id, :value => current_user.id %> 
#      <%= form.submit "+" ,id: 'addBttn'%>
#  <% end %>
# <% else %>
#  <%= link_to "+", new_user_session_path , id: 'addBttn'%>
# <% end %>  
