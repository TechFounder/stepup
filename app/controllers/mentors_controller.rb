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
  end

  # GET /mentors/1/edit
  def edit
  end

  # POST /mentors
  def create
    @mentor = current_user.mentors(mentor_params)
    @mentor.user = current_user

    if @mentor.save
      redirect_to @mentor, notice: 'Your profile was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /mentors/1
  def update
    if @mentor.update(mentor_params)
      redirect_to @mentor, notice: 'Your profile was successfully updated.'
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
                                       :image_file_name, 
                                       :image_content_type, 
                                       :image_file_size, 
                                       :image_updated_at)
      end
end
