class AddBodyToProject < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :body, :string
  end
end
