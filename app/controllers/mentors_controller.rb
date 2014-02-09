<<<<<<< HEAD
class MentorsController < InheritedResources::Base
=======
class MentorsController < ApplicationController
>>>>>>> 40f9b1de46c79f253dddee0de96cfb2539b8080f
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
<<<<<<< HEAD
=======
  
>>>>>>> 40f9b1de46c79f253dddee0de96cfb2539b8080f
end
