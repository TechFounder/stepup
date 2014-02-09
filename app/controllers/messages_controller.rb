class MessagesController < InheritedResources::Base

 def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    @message.user = current_user

    if @message.save
      UserMailer.contact_seller_email(@message).deliver
      redirect_to :back, notice: 'Your email is sent! Thank You!'
    else
      render :new
    end
  end

  private

  def message_params
    params.require(:message).permit(:subject, :text)
  end

end
