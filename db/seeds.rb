product_list = [
  [ "shirt","They soon became popular as a bottom layer of clothing for workers in various industries.",1000,0.0,"Clothing","Male",10,"best,seller,piped,cotton",1,"a.jpg" ],
  [ "shirt","They soon became popular as a bottom layer of clothing for workers in various industries.",2000,0.0,"Clothing","Male",10,"best,seller,piped,cotton",1,"a.jpg" ],
  [ "shirt","They soon became popular as a bottom layer of clothing for workers in various industries.",1500,0.0,"Clothing","Male",10,"best,seller,piped,cotton",1,"a.jpg" ],
  [ "shirt","They soon became popular as a bottom layer of clothing for workers in various industries.",1200,0.0,"Clothing","Female",10,"best,seller,piped,cotton",1,"a.jpg" ],
  [ "shirt","They soon became popular as a bottom layer of clothing for workers in various industries.",1600,0.0,"Clothing","Female",10,"best,seller,piped,cotton",1,"a.jpg" ],
  [ "shirt","They soon became popular as a bottom layer of clothing for workers in various industries.",1800,0.0,"Clothing","Female",10,"best,seller,piped,cotton",1,"a.jpg" ],

  [ "Interia","They soon became popular as a bottom layer of clothing for workers in various industries.",1000,0.0,"Home","Any",10,"best,seller,piped,cotton",1,"a.jpg" ],
  [ "Interica","They soon became popular as a bottom layer of clothing for workers in various industries.",1000,0.0,"Home","Any",10,"best,seller,piped,cotton",1,"a.jpg" ],
  [ "Interio","They soon became popular as a bottom layer of clothing for workers in various industries.",1000,0.0,"Home","Any",10,"best,seller,piped,cotton",1,"a.jpg" ],


  [ "Beauty Kit","They soon became popular as a bottom layer of clothing for workers in various industries.",1080,0.0,"Beauty","Female",10,"best,seller,piped,cotton",1,"a.jpg" ],
  [ "Lemiz Kit","They soon became popular as a bottom layer of clothing for workers in various industries.",10090,0.0,"Beauty","Female",10,"best,seller,piped,cotton",1,"a.jpg" ],
  [ "Verico Kit","They soon became popular as a bottom layer of clothing for workers in various industries.",10330,0.0,"Beauty","Female",10,"best,seller,piped,cotton",1,"a.jpg" ],


  [ "Rugby Ball","They soon became popular as a bottom layer of clothing for workers in various industries.",1009,0.0,"Sports","Any",10,"best,seller,piped,sport",1,"a.jpg" ],
  [ "Basket ball","They soon became popular as a bottom layer of clothing for workers in various industries.",1050,0.0,"Sports","Any",10,"best,seller,piped",1,"a.jpg" ],
  [ "bat","They soon became popular as a bottom layer of clothing for workers in various industries.",2000,0.0,"Sports","Any",10,"best,seller,piped",1,"a.jpg" ],


  [ "Gardena","They soon became popular as a bottom layer of clothing for workers in various industries.",1099,0.0,"Garden","Any",10,"best,seller,piped,cotton",1,"a.jpg" ],
  [ "Garden Kit","They soon became popular as a bottom layer of clothing for workers in various industries.",1008,0.0,"Garden","Any",10,"best,seller,piped,cotton",1,"a.jpg" ],
  [ "Greora","They soon became popular as a bottom layer of clothing for workers in various industries.",2000,0.0,"Garden","Any",10,"best,seller,piped,cotton",1,"a.jpg" ]
]

product_list.each do |a,b,c,d,e,f,g,h,i,j|
  Product.create(  name: a, description: b, cost: c, discount: d, category: e, gender: f, quantity: g, tags: h, seller_id: i, image: j )
end
