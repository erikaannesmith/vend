require 'rails_helper'

describe Machine do
  it "can find the average price of the snacks within the machine" do
    owner = Owner.create(name: "Sam's Snacks")    
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    dons.snacks.create(name: "Oreos", price: 2)
    dons.snacks.create(name: "Chips", price: 4)
    dons.snacks.create(name: "Candy", price: 6)

    expect(dons.average_price).to eq(4.0)
  end
end