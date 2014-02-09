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
  
end
