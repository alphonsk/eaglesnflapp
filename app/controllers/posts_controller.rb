class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all.reverse
  end

#   # GET /posts/1
#   # GET /posts/1.json
#   def show
#   end

#   # GET /posts/new
#   def new
#     @post = Post.new
#   end

#   # GET /posts/1/edit
#   def edit
#   end


  # POST /posts
  # POST /posts.json
  # @current_user = current_user
   
  # puts @current_user
  # @post = @team.new(post_params)

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new( :post => @post )
  end
  
  def create  
    @user = (current_user).id  
    puts params.inspect  
     
    @post = Post.new(post_params)

  respond_to do |format|
    if @post.save
      format.html { redirect_to root_path, notice: 'Team was successfully created.' }
      format.json { render :show, status: :created, location: @post }
      format.js {render inline: "location.reload();" }
    else
      format.html { render :new }
      format.json { render json: @post.errors, status: :unprocessable_entity }
    end
  end
end

private
  def post_params
    params.require(:post).permit(:post, :team_id, :user_id, :image ) 
  end
end

#   # PATCH/PUT /posts/1
#   # PATCH/PUT /posts/1.json
#   def update
#     respond_to do |format|
#       if @post.update(post_params)
#         format.html { redirect_to @post, notice: 'Post was successfully updated.' }
#         format.json { render :show, status: :ok, location: @post }
#       else
#         format.html { render :edit }
#         format.json { render json: @post.errors, status: :unprocessable_entity }
#       end
#     end
#   end

#   # DELETE /posts/1
#   # DELETE /posts/1.json
#   def destroy
#     @post.destroy
#     respond_to do |format|
#       format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
#       format.json { head :no_content }
#     end
#   end

#   private
#     # Use callbacks to share common setup or constraints between actions.
#     def set_post
#       @post = Post.find(params[:id])
#     end

#     # Never trust parameters from the scary internet, only allow the white list through.
#     def post_params
#       @team_id

#       params.require(:post).permit(:post, :team_id, :user_id)
#     end
# end

# <%= image_tag(post.image, style:" width:40px" )%>




#    POST PAGE START

# <p id="notice"><%= notice %></p>

# <h1>Posts</h1>

# <table>
#   <thead>
#     <tr>
#       <th>Post</th>
#       <th>Team</th>
#       <th>User</th>
#       <th colspan="3"></th>
#     </tr>
#   </thead>

#   <tbody>
#     <% @posts.each do |post| %>
#       <tr>
#         <td><%= post.post %></td> 
#         <td><%= link_to 'Show', post %></td>
#         <td><%= link_to 'Edit', edit_post_path(post) %></td>
#         <td><%= link_to 'Destroy', post, method: :delete, data: { confirm: 'Are you sure?' } %></td>
#       </tr>
#     <% end %>
#   </tbody>
# </table>

# <br>

# <%= link_to 'New Post', new_post_path %>

#    POST PAGE END