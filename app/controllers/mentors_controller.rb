class MentorsController < InheritedResources::Base
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
end
