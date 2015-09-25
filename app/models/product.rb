class Product < ActiveRecord::Base
   has_many :orders
   has_many :comments
  
   validates :name, presence: true
   
   def average_rating
     comments.average(:rating).to_f
   end
   
   def cents_to_dollars(amount)
   #add "$" and drop the last two zeroes becuz stripe is dumb, unless product is nil.
     if (amount == nil)
       amount
     else
       "$"+(amount.chop.chop)
     end
   end
   
end
