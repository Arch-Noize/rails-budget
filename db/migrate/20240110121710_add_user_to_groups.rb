class AddUserToGroups < ActiveRecord::Migration[7.1]
  def change
    add_reference :groups, :author, foreign_key: { to_table: :users }

    Group.where(author_id: nil).update_all(author_id: 2)

    change_column_null :groups, :author_id, false
  end
end
