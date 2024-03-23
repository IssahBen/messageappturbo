class MessagesController < ApplicationController
  def create
   
    @message = Message.new(message_params)
    if @message.save 
        

    else 
        flash[:alert] = "Couldn't Save"
        render turbo_stream: turbo_stream.replace(@message,partial: "chatroom/form",locals: {message: @message})
    end
  end

  private 
  def message_params 
    params.require(:message).permit(:content,:user_id)
  end
end
