class RemoveUserIdToSkills < ActiveRecord::Migration[5.1]
  def change
    remove_column :skills, :user_id
  end
end
