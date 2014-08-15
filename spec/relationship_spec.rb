require 'spec_helper'

describe 'relationship' do
  it 'describes a person as a child of 2 people' do
    steve = Person.create({:name => "Steve"})
    rhonda = Person.create({:name => "Rhonda"})
    robert = Person.create({:name => "Robert"})
    Relationship.make_connection({:parents => [steve, rhonda], :child => robert})
    expect(robert.parents).to eq [steve, rhonda]
    expect(rhonda.children).to eq [robert]
  end
end

