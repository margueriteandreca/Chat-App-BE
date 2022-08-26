class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :username, :status

  # def :avatar_img
  #   if object.avatar.attached?
  #     Rails.application.routes.url_helpers.rails_blob_path(object.avatar, host: "local")
  #   end
  # end
end
