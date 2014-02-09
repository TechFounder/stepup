ActiveAdmin.register Mentor do

  controller do
    def permitted_params
      params.permit(:mentor => [:company_name, :job_title, :sector, :college, 
      	:skill_set, :additional_info, :internship_available, :internship_job_title, 
      	:internship_skill_set, :internship_additional_info, :user_id])
    end
  end
  
end
