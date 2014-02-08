module DeviseHelper
	def devise_error_messages!
		resource.errors.full_messages.map { |msg| msg }.join 
	end
end