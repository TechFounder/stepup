<<<<<<< HEAD
class MentorsController < InheritedResources::Base
=======
class MentorsController < ApplicationController
	before_filter :authenticate_user!

  def search
  	if params[:query]
  		query = "%" + params[:query] + "%"
  		@mentors = User.where(['name LIKE ? OR mentor_company_name LIKE ? OR mentor_job_title LIKE ? OR mentor_sector LIKE ?' , query, query, query, query])
  		@is_search_results = true
  	else
  		@mentors = User.mentor
  	end
  end
>>>>>>> b38bdda409368f885c20a155405578bfb69fdf97
end
