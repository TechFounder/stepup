class MentorsController < ApplicationController
	before_filter :authenticate_user!

  def search
  	@mentors = User.mentor
  end
end
