class MenteesController < InheritedResources::Base
	before_filter :authenticate_user!

  def search
  	if params[:query]
  		query = "%" + params[:query] + "%"
  		@mentees = Mentee.where(['school_name LIKE ? OR 
  			                        career_interests LIKE ? OR 
  			                        bio LIKE ? OR
  			                        extracurriculars LIKE ?',
  			                        query, query, query, query])
  		@is_search_results = true
  	else
  		@mentees = Mentee.all
  	end
  end

  private

  def message_params
    params.require(:message).permit(:message)
  end
end
