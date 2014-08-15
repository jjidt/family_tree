class Person < ActiveRecord::Base
  has_many :relationships, :foreign_key => "person_id",
    :class_name => "Relationship"

  has_many :parents, :through => :relationships

  has_many :children, :through => :relationships

  validates :name, :presence => true

  after_save :make_marriage_reciprocal

  def spouse
    if spouse_id.nil?
      nil
    else
      Person.find(spouse_id)
    end
  end

  def grandparents
    gp = []
    self.parents.each { |parent| gp << parent.parents}
    gp
  end

private

  def make_marriage_reciprocal
    if spouse_id_changed?
      spouse.update(:spouse_id => id)
    end
  end


end
