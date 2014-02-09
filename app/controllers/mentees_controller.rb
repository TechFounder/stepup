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

  # GET /mentees/1
  def show
  end

  # GET /mentees/1/edit
  def edit
  end

  # POST /mentees
  def create
    @mentee = @article.mentees.build(mentee_params)
    @mentee.user = current_user

    if @mentee.save
      redirect_to @mentee, notice: 'Your profile was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /mentees/1
  def update
    if @mentee.update(mentee_params)
      redirect_to @mentee, notice: 'Your profile was successfully updated.'
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
                                       :image_file_name, 
                                       :image_content_type, 
                                       :image_file_size, 
                                       :image_updated_at)
      end
end
