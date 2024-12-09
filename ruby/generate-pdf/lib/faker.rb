require 'faker'

def generate_fake_order
  # Generate a list of items with random description, quantity, and cost
  items = Array.new(rand(1..5)) do
    {
      description: Faker::Commerce.product_name,
      quantity: rand(1..10),
      cost: Faker::Commerce.price
    }
  end

  # Calculate the total by summing the cost of all items
  total = items.reduce(0) { |acc, item| acc + item[:cost].to_f }

  {
    id: Faker::Internet.uuid,
    date: Faker::Date.backward(days: rand(1..365)),
    name: Faker::Name.name,
    items: items,
    total: total
  }
end