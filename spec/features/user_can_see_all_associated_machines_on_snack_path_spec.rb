require 'rails_helper'

describe "User visits the snack show path" do
  it "they see all associated machine locations" do
    owner = Owner.create(name: "Sam's Snacks")    
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    oreos = dons.snacks.create(name: "Oreos", price: 2)

    visit snack_path(oreos)

    expect(page).to have_content("Oreos Price: $2")
    expect(page).to have_content("Locations: Don's Mixed Drinks (1 kind of snack, average price of $2.0)")
  end


end