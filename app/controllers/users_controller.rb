class UsersController < ApplicationController
<<<<<<< HEAD
	
  private

    def user_params
      params.require(:user).permit(:name, :email, :mentor_company_name,
        :mentor_job_title, :mentor_sector, :mentor_college, :mentor_skill_set,
        :mentor_additional_info, :mentor_internship_available,
        :mentor_internship_job_title, :mentor_internship_skill_set, 
        :mentor_internship_additional_info,  :mentee_school_name, :mentee_grade,
        :mentee_career_interests, :mentee_bio, :mentee_events_attended,
        :mentee_extracurriculars)
    end
end
=======
  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])
 
    respond_to do |format|
      if @user.save
        # Tell the UserMailer to send a welcome Email after save
        UserMailer.welcome_email(@user).deliver
 
        format.html { redirect_to(@user, notice: 'User was successfully created.') }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
end
>>>>>>> kb_branch
