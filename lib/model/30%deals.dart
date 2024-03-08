class dealsProduct {
  String image; 
  String title; 
  String price; 
  String category; 

  dealsProduct({
    required this.image,
    required this.title,
    required this.category,
    required this.price,
  });
}


 List <dealsProduct> dealsProducts = [
  dealsProduct(
    image: "assets/products/newarrival/1.jpg",
    title: "Product 1",
    category: "Adidas",
    price: '200',
  ),
  dealsProduct(
    image: "assets/products/newarrival/2.jpg",
    title: "Product 1",
    category: "Nike",
    price: '400',
  ),
   dealsProduct(
    image: "assets/products/newarrival/3.jpg",
    title: "Product 1",
    category: "Jordan",
    price: '200',
  ),
   dealsProduct(
    image: "assets/products/newarrival/4.jpg",
    title: "Product 1",
    category: "Adidas",
    price: '550',
  ),
   dealsProduct(
    image: "assets/products/newarrival/5.jpg",
    title: "Product 1",
    category: 'Puma'
    ,price: '200',
   ),
];