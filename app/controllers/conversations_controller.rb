class ConversationsController < ApplicationController
    # before_action :find_conversation, only: [:show, :update, :destroy]


    #USER CONVERSATIONS
    def index
        token = params[:token]
        payload = decode(token)
        user = User.find(payload['user_id'])
        conversations = user.conversations 
        render json: conversations, include: [:messages, :users], methods: [:last_message]
    end


    def newchat
        recipient = User.find(params[:recipient_id])
        token = params[:token]
        payload = decode(token)
        user = User.find(payload['user_id'])
        conversation = Conversation.create(name: "New Chat")
        message1 = Message.create(message_content: "Hey! Glad we could connect!", user: user, conversation: conversation)
        message2 = Message.create(message_content: "Yay!", user: recipient, conversation: conversation)


        render json: conversation
    end

    # used to show individual conversation and all its messages 
    # def show
    #     token = params[:token]
    #     payload = decode(token)
    #     user = User.find(payload['user_id'])
    #     conversation = Conversation.fm

    #     render json: @conversation
    # end

    # def create
    #     token = params[:token]
    #     payload = decode(token)
    #     user = User.find(payload['user_id'])
    #     conversation = Conversation.create!(conversation_params)
    #     message = Message.new(message_content: "Hey! Glad we could connect!", user: user, conversation_id: conversation)
    #     render json: conversation
    # end

    # def update
    #     token = params[:token]
    #     payload = decode(token)
    #     user = User.find(payload['user_id'])
    #     conversation = user.conversations.where()
    #     render json: Conversation.update!(:name)
    # end

    def destroy
        @conversation.destroy
        head :no_content 
    end


    private 

    def find_conversation
        @conversation = Conversation.find(params[:id])
    end

    def conversation_params
        params.permit(:name)
    end


end
