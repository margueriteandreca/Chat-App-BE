class MessageSerializer < ActiveModel::Serializer
  attributes :id, :message_content, :user_id, :conversation_id
end
