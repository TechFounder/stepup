class MenteesController < ApplicationController
	before_filter :authenticate_user!

  def index
    @mentees = Mentee.all
  end

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

  # GET /mentees/1
  def show
    @mentee = Mentee.find(params[:id])
  end

  # GET /mentees/1/edit
  def edit
    if current_user.profile_type == 'Mentee'
      @mentee = current_user.profile
    else
      @mentee = Mentee.new
    end
  end

  # POST /mentees
  def create
    @mentee = Mentee.new(mentee_params)
    if @mentee.save
      current_user.profile.destroy! if current_user.profile
      current_user.profile = @mentee
      current_user.save!
      redirect_to root_path, notice: 'Your profile was successfully created.'
    else
      render action: 'edit'
    end
  end

  # PATCH/PUT /mentees/1
  def update
    @mentee = Mentee.find(params[:id])
    if @mentee.update_attributes(mentee_params)
      redirect_to root_path, notice: 'Your profile was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /mentees/1
  def destroy
    @mentee.destroy
    redirect_to mentees_url, notice: 'Your profile was successfully deleted.'
  end

    private
      # Returns the correct article to mentee
      def find_article
        @article = Article.find(params[:id])
      end  

      # Only allow a trusted parameter "white list" through.
      def mentee_params
        params.require(:mentee).permit(:school_name, 
                                       :grade, 
                                       :career_interests, 
                                       :bio, 
                                       :events_attended, 
                                       :extracurriculars, 
                                       :image)
      end
end
