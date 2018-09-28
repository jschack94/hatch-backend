class Api::V1::MessagesController < ApplicationController
  skip_before_action :authorized, only: [:create]

  # def index
  #   conversations = Conversation.all
  #   render json: conversations
  # end

  def create
    message = Message.new(message_params)
    # relationship = Relationship.find(message_params[:relationship_id])
    if message.save
      serialized_data = ActiveModelSerializers::Adapter::Json.new(
        MessageSerializer.new(message)
      ).serializable_hash
      ActionCable.server.broadcast 'messages_channel', serialized_data
      head :ok
    end
  end

  private

  def message_params
    params.require(:message).permit(:text, :relationship_id, :user_id)
  end
end
