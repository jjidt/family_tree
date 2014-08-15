class Relationship < ActiveRecord::Base
  belongs_to :person, :foreign_key => "person_id", :class_name => "Person"
  belongs_to :parent, :foreign_key => "parent_id", :class_name => "Person"
  belongs_to :child, :foreign_key => "child_id", :class_name => "Person"

  def self.make_connection attributes
    child = attributes[:child]
    parents = attributes[:parents]
    child.parents.concat(parents)
    parents.each { |parent| parent.children << child }
  end
end
