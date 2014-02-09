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

  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end

  
end
