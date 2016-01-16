class AddPhoneUuidToUers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :phone_uuid, :string
    add_index :users, :phone_uuid, unique: true
  end
end
