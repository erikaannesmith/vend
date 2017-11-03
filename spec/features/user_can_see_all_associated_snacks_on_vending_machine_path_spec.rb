require 'rails_helper'

describe "User visits a machine show path" do
  it "they can see all associated snacks with prices" do
    owner = Owner.create(name: "Sam's Snacks")    
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    dons.snacks.create(name: "Oreos", price: 2)

    visit machine_path(dons)

    expect(page).to have_content("Snacks: Oreos $2")
  end

  it "they can see the average price" do
    owner = Owner.create(name: "Sam's Snacks")    
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    dons.snacks.create(name: "Oreos", price: 2)
    dons.snacks.create(name: "Chips", price: 4)
    dons.snacks.create(name: "Candy", price: 6)

    visit machine_path(dons)

    expect(page).to have_content("Average Price: $4.0")
  end
end