require 'prawn'

Prawn::Document.generate("example.pdf") do
  text "Hello, World!", size: 30, style: :bold
  move_down 20
  text "This is a sample PDF generated using the Prawn gem.", size: 16
end

puts "PDF created successfully!"