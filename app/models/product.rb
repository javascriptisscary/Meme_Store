class Product < ActiveRecord::Base
  has_many :orders
  has_many :comments,
            dependent: :destroy
  
  has_attached_file :meme, styles: { original: "640x480>", med: "320x240>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :meme, content_type: /\Aimage\/.*\Z/
  

  validates :name, presence: true
   
  validates_with AttachmentPresenceValidator, attributes: :meme
  validates_attachment_content_type :meme, content_type: /\Aimage\/.*\Z/
  validates_with AttachmentSizeValidator, attributes: :meme, less_than: 1.megabytes
  validates_attachment_file_name :meme, matches: [/png\Z/, /jpe?g\Z/]
   
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
