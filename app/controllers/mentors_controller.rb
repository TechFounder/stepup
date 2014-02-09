class MentorsController < ApplicationController
	before_filter :authenticate_user!

  def search
  	if params[:query]
  		query = "%" + params[:query] + "%"
  		@mentors = Mentor.where(['company_name LIKE ? OR job_title LIKE ? OR sector LIKE ?' , query, query, query])
  		@is_search_results = true
  	else
  		@mentors = Mentor.all
  	end
  end
  
  # GET /mentors/1
  def show
    @mentor = Mentor.find(params[:id])
  end

  # GET /mentors/1/edit
  def edit
    if current_user.profile_type == 'Mentor'
      @mentor = current_user.profile
    else
      @mentor = Mentor.new
    end
  end

  # POST /mentors
  def create
    @mentor = Mentor.new(mentor_params)
    if @mentor.save
      current_user.profile.destroy! if current_user.profile
      current_user.profile = @mentor
      current_user.save!
      redirect_to root_path, notice: 'Your profile was successfully created.'
    else
      render action: 'edit'
    end
  end

  # PATCH/PUT /mentors/1
  def update
    @mentor = Mentor.find(params[:id])
    if @mentor.update_attributes(mentor_params)
      redirect_to root_path, notice: 'Your profile was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /mentors/1
  def destroy
    @mentor.destroy
    redirect_to mentors_url, notice: 'Your profile was successfully deleted.'
  end

  private
    # Returns the correct article to mentor
    def find_article
      @mentor = Mentor.find(params[:id])
    end  

    # Only allow a trusted parameter "white list" through.
    def mentor_params
      params.require(:mentor).permit(:company_name, 
                                     :job_title, 
                                     :sector, 
                                     :college, 
                                     :skill_set, 
                                     :additional_info, 
                                     :internship_available, 
                                     :internship_job_title, 
                                     :internship_skill_set, 
                                     :internship_additional_info, 
                                     :image)
    end

end
