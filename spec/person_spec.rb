require 'spec_helper'

describe Person do
  it { should validate_presence_of :name }

  context '#spouse' do
    it 'returns the person with their spouse_id' do
      earl = Person.create(:name => 'Earl')
      steve = Person.create(:name => 'Steve')
      steve.update(:spouse_id => earl.id)
      steve.spouse.should eq earl
    end

    it "is nil if they aren't married" do
      earl = Person.create(:name => 'Earl')
      earl.spouse.should be_nil
    end
  end

  it "updates the spouse's id when it's spouse_id is changed" do
    earl = Person.create(:name => 'Earl')
    steve = Person.create(:name => 'Steve')
    steve.update(:spouse_id => earl.id)
    earl.reload
    earl.spouse_id.should eq steve.id
  end

  it 'allows you to add parents to a person' do
    earl = Person.create(:name => 'Earl')
    steve = Person.create(:name => 'Steve')
    judy = Person.create(:name => 'Judy')
    earl.parents << steve
    earl.parents << judy
    expect(earl.parents).to eq [steve, judy]
  end

  it 'allows you to find the grandparents of a person' do
    earl = Person.create(:name => 'Earl')
    steve = Person.create(:name => 'Steve')
    judy = Person.create(:name => 'Judy')
    rupert = Person.create(:name => 'Rupert')
    agnes = Person.create(:name => 'Agnes')
    winthorp = Person.create(:name => 'Winthorp')
    mildred = Person.create(:name => 'Mildred')

    Relationship.make_connection(:child => earl, :parents => [steve,judy])
    Relationship.make_connection(:child => steve, :parents => [rupert, agnes])
    Relationship.make_connection(:child => judy, :parents => [winthorp, mildred])

    expect(earl.grandparents).to eq [[rupert, agnes],[winthorp,mildred]]

  end
end
