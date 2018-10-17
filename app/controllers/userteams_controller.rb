class UserteamsController < ApplicationController
  

  def new
    @userteam = Userteam.new
  end

  def create 
    @userteam = Userteam.new 
    @user = current_user    
    @myteams= current_user.userteams 
    
    
  #  stocks already in my list
     @all_ready_added = @myteams.where(team_id: params[:userteam][:team_id] )


    respond_to do |format| 
      if @all_ready_added.count > 0
      else 
      @userteam = Userteam.create(userteam_params ) 
      puts 555
          if @userteam.save
            puts 66666
            format.html { redirect_to @userteam, notice: 'Your team was successfully added' }
            format.json { render :show, status: :created, location: @userteam }
            format.js
          else
            puts 777777
            format.html { render :new }
            format.json { render json: @userteam.errors, status: :unprocessable_entity }
            format.js
          end
      end
    end
  end



  def destroy
    @user_id = current_user.id 
    @myteam= current_user.userteams.find(params[:id]) 
    puts 44444  
    @myteam.destroy 
    puts 55555
    respond_to do |format|
      format.html { redirect_to myteams_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
      format.js {render inline: "location.reload();" }
    end
  end

   

  private
  # def search_params
  #   params.require(:search).permit(:store )
  # end

  def userteam_params
    params.require(:userteam).permit(:team_id, :user_id )
  end
end
