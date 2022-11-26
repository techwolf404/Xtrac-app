class AddAuthorToSubjects < ActiveRecord::Migration[7.0]
  def change
    add_reference :subjects, :author, foreign_key: { to_table: :users }
  end
end
