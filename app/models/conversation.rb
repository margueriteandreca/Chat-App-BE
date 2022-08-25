class Conversation < ApplicationRecord
    has_many :messages
    has_many :users, through: :messages 

    def last_message 
        self.messages.last
    end

    validates :id, uniqueness: true
end
