class CreateSelfJoin < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.belongs_to :person
      t.belongs_to :parent
      t.belongs_to :child
    end
  end
end
