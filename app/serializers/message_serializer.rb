class MessageSerializer < ActiveModel::Serializer
  attributes :id, :from_username, :to_username, :message_content, :user_id, :conversation_id
end
