FactoryBot.define do
  factory :quotation do
    product_name { 'aaa' }
    quantity     { 'aaa' }
    unit         { 'aaa' }
    unit_price   { 'aaa' }
    money        { '1111' }
    remarks      { 'aaa' }
    association :cost_pdf
  end
end
