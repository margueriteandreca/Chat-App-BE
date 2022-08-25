class MessagesController < ApplicationController

    def index

    end

    def show

    end

    def create
        message = Message.create(message_params)
        conversation = Conversation.find(params[:conversation_id])
        render json: conversation, include: [:messages, :users], methods: [:last_message]
        
    end

    # def actioncablemessages
    #     message = Message.create(message_params)

    #     convo = Conversation.find(params[:conversation_id])
    #     ChatsChannel.broadcast_to(convo, {
    #         messages: message
    #     })
    # end

    # def update

    # end

    # def destroy

    # end

    private 

    def message_params
        params.permit(:message_content, :user_id, :conversation_id)
    end
end

