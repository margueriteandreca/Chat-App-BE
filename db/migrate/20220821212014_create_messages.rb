class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.string :from_username
      t.string :to_username
      t.text :message_content
      t.integer :user_id
      t.integer :conversation_id

      t.timestamps
    end
  end
end
