class ConversationsController < ApplicationController
    # before_action :find_conversation, only: [:show, :update, :destroy]


    #USER CONVERSATIONS
    def index
        token = params[:token]
        payload = decode(token)
        user = User.find(payload['user_id'])
        conversations = user.conversations.uniq
        render json: conversations, include: [:messages, :users], methods: [:last_message]
    end

    def create
        recipient = User.find(params[:recipient_id])
        token = params[:token]
        payload = decode(token)
        user = User.find(payload['user_id'])
        user_convos = user.conversations
        existing_convo = user_convos.joins(:users).where(users: {id: params[:recipient_id]})
    
        if existing_convo != []
            render json: existing_convo[0]

        else

        conversation = Conversation.create(name: "#{recipient.first_name} & #{user.first_name}")
        message1 = Message.create(message_content: "Hey! Glad we could connect!", user: user, conversation: conversation)
        message2 = Message.create(message_content: "Yay!", user: recipient, conversation: conversation)

        render json: conversation

        end


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
        user = User.find(params[:id])
        user.conversations.destroy_all
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
