class CreateCouples < ActiveRecord::Migration
  def change
    create_table :relationships |t|
      t.belongs_to :person
      t.belongs_to :parent
      t.belongs_to :child
    end
  end
end


