ActiveAdmin.register Mentee do

  controller do
    def permitted_params
      params.permit(:mentee => [:school_name, 
	                               :grade, 
	                               :career_interests, 
	                               :bio, 
	                               :events_attended, 
	                               :extracurriculars, 
	                               :image])
    end
  end
  
end
