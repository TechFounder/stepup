ActiveAdmin.register User do

  controller do
    def permitted_params
      params.permit(:user => [:name, :email, :mentor_company_name,
        :mentor_job_title, :mentor_sector, :mentor_college, :mentor_skill_set,
        :mentor_additional_info, :mentor_internship_available,
        :mentor_internship_job_title, :mentor_internship_skill_set, 
        :mentor_internship_additional_info,  :mentee_school_name, :mentee_grade,
        :mentee_career_interests, :mentee_bio, :mentee_events_attended,
        :mentee_extracurriculars, :is_mentor])
    end
  end
  
end
