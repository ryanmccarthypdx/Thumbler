class CreatePhotosUsers < ActiveRecord::Migration
  def change
    create_table :photos_users do |t|
      t.belongs_to :photos
      t.belongs_to :users
    end

    create_table :photos do |t|
      t.attachment :file
    end
  end
end
