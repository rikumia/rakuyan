FactoryBot.define do
  factory :cost_pdf do
    company_name        { 'aaa' }
    postal_code         { '000-0000'}
    address             { 'aaa' }
    tell                { '09000000000' }
    fax                 { '09000000000' }
    delivery_date       { '2021/12/24' }
    delivery_location   { 'aaa' }
    payment_terms       { 'aaa' }
    expiration_date     { '2021/12/24' }
    subtotal            { '1111' }
    total               { '1111' }
    tax                 { '1111' }
    cliant_name         { 'aaa' }
    memo                { 'aaa' }
  end
end
