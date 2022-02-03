Company.create!([
  {name: "Orange Carp", address: "111 Orange Carp Street"},
  {name: "Blue Carp", address: "111 Blue Carp Avenue"},
  {name: "Purple Carp", address: "111 Purple Carp Lane"}
])
User.create!([
  {first_name: "Harrison", last_name: "Ford", email: "harrison.ford@orange.carp", company_id: 1},
  {first_name: "Nick", last_name: "Offerman", email: "Nick.Offerman@orange.carp", company_id: 1},
  {first_name: "Santa", last_name: "Claus", email: "santa.claus@blue.carp", company_id: 2}
])
Product.create!([
  {name: "Oak 2in*4in*8ft", price: "109.96"},
  {name: "Cedar 2in*4in*8ft", price: "99.54"}
])
Order.create!([
  {user_id: 1, subtotal: "419.0", tax: "12.15", total: "431.15"}
])
Quote.create!([
  {user_id: 1, total: "219.92", order_id: 1},
  {user_id: 1, total: "199.08", order_id: 1}
])
QuotedProduct.create!([
  {product_id: 1, quote_id: 1, quantity: 2},
  {product_id: 2, quote_id: 2, quantity: 2}
])
CartedOrder.create!([
  {user_id: 1, quote_id: 1, order_id: 1, status: "purchased"},
  {user_id: 1, quote_id: 2, order_id: 1, status: "purchased"}
])
Payment.create!([
  {user_id: 1, order_id: 1, amount: "215.58", method: "check"},
  {user_id: 1, order_id: 1, amount: "215.57", method: "check"}
])
