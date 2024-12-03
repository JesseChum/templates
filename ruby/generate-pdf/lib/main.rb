# Initialize the Appwrite client
require 'appwrite'

include Appwrite

client = Client.new()

client
    .set_endpoint('https://cloud.appwrite.io/v1') # Your Appwrite Endpoint
    .set_project('6746417c002c68c9a571') # Your project ID
    .set_key('standard_2bdcc7ba2e07a9ed421a6e78125aa0a944dc9c3ca43194634a7778d41f073ebf1afb20990b027d270dd376c202a7eaae109e3a219726ae4a7c2d9f7dfcf4661e56990ace4d3545eb7edb8d602106266f5bb9a50b75b41d94332741f9fd98db9e1881005e3bf866ed4491eda2fdb6e3b5636d6c046629a80883565f0b4722aeac') # Your secret API key

    #Testing 
  databases = Appwrite::Databases.new(client)
  puts databases.list