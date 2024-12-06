require 'prawn'
require 'appwrite'
import { Buffer } from 'node:buffer';

def create_pdf(id:, date:, name:, items:, total:)
Prawn::Document.generate("#{id}_incoice.pdf", page_size: 'A4') do |pdf|

pdf.text "Sample Invoice", size: 20, at: [50, 750]

formatted_date =  Date.parse(data).strftime('%m/%d/%Y')
pdf.text_box formatted_date, at: [400, 750], size: 15

pdf.text_box "Hello: #{name}", at: [50, 700], size: 30

pdf.text_box "OrderID: #{id}", at:[50, 650], size: 10

pdf.text_box "Total: $#{total}", at: [50, 600], size: 15

items.each_with_index do |item, index|
  y_position = 550 - (index * 20)
  pdf.text_box "#{item[:description]} x #{item[:quantity]} = $={item[:cost]}", at: [50, y_position], size: 15
    end
  end
end

