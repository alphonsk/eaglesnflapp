class CommentsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!


#   def create 
#     # @post_id =  
#     @user = (current_user).id  
#     puts params.inspect  
     
#     @comment = Comment.new(comment_params)

#   respond_to do |format|
#     if @comment.save
#       format.html { redirect_to root_path, notice: 'Team was successfully created.' }
#       format.json { render :show, status: :created, location: @comment }
#       format.js {render inline: "location.reload();" }
#     else
#       format.html { render :new }
#       format.json { render json: @comment.errors, status: :unprocessable_entity }
#     end
#   end
# end

# private
#   def comment_params
#     params.require(:comment).permit(:comment, :post_id, :user_id) 
#   end
# end


  def create
    @comment = Comment.new(comment_params)


     respond_to do |format|
    if @comment.save
      format.html { redirect_to root_path, notice: 'Team was successfully created.' }
      format.json { render :show, status: :created, location: @comment }
      format.js {render inline: "location.reload();" }
    else
      format.html { render :new }
      format.json { render json: @comment.errors, status: :unprocessable_entity }
    end
  end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    redirect_to(@comment.post)
  end

  private
  def comment_params
    params.require(:comment).permit(:comment, :post_id, :user_id) 
  end

end

 