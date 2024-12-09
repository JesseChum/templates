# Initialize the Appwrite client
require 'appwrite'
require 'prawn'

include Appwrite

client = Client.new()

client
    .set_endpoint('https://cloud.appwrite.io/v1') # Your Appwrite Endpoint
    .set_project('6746417c002c68c9a571') # Your project ID
    .set_key('standard_2bdcc7ba2e07a9ed421a6e78125aa0a944dc9c3ca43194634a7778d41f073ebf1afb20990b027d270dd376c202a7eaae109e3a219726ae4a7c2d9f7dfcf4661e56990ace4d3545eb7edb8d602106266f5bb9a50b75b41d94332741f9fd98db9e1881005e3bf866ed4491eda2fdb6e3b5636d6c046629a80883565f0b4722aeac') # Your secret API key

# Method to generate a fake order
def generate_fake_order
    {
      name: Faker::Name.name,
      product: Faker::Commerce.product_name,
      quantity: rand(1..5),
      total: Faker::Commerce.price(range: 10..500)
    }
  end
  
  # Method to create the PDF
  def create_pdf(order)
    pdf = Prawn::Document.new
    pdf.text "Order Details"
    pdf.text "Name: #{order[:name]}"
    pdf.text "Product: #{order[:product]}"
    pdf.text "Quantity: #{order[:quantity]}"
    pdf.text "Total: $#{order[:total]}"
    pdf.render # Returns the PDF as a binary string
  end
  
  # Main function to generate PDF and return as a response
  def main(context)
    log = context[:log]
    res = context[:res]
  
    # Generate a fake order
    fake_order = generate_fake_order
    log.call("Generated fake order: #{JSON.pretty_generate(fake_order)}")
  
    # Create a PDF from the fake order
    pdf_buffer = create_pdf(fake_order)
    log.call('PDF created.')
  
    # Return the PDF response with the correct headers
    res.call(pdf_buffer, 200, { 'Content-Type' => 'application/pdf' })
  end

  