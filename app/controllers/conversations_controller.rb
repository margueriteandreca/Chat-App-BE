class ConversationsController < ApplicationController
    before_action :find_conversation, only: [:show, :update, :destroy]

    def index
        render json: Conversation.all, include: :users, methods: [:last_message]
    end

    def show
        render json: @conversation
    end

    def create
        conversation = Conversation.create!(conversation_params)
        render json: conversation
    end

    def update
        render json: @conversation.update!(:name)
    end

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
