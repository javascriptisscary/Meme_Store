# This will guess the User class
FactoryGirl.define do
  
 
  
  

  
  factory :user do
    first_name "John"
    last_name  "Doe"
    email "example@example.com"
    password "12345678"
    admin false
  end

  
  
  
  
  factory :product do
    name "funniest"
    image_url "http://s2.quickmeme.com/img/c9/c994561a97196e69fbd2c11d1cf53f375fb098aaea8abf0b9701b8a5c6bb8a83.jpg"
    
   factory :comment do
      
      rating 3
      body "I'm a comment mofo!"
      association :product, factory: product
    
    end
   
 
   
  end
end

