class AddPhotoToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :photos, index: true
  end
end
