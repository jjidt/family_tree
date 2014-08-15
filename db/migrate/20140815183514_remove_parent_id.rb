class RemoveParentId < ActiveRecord::Migration
  def change
    remove_column :people, :parent_id
  end
end
