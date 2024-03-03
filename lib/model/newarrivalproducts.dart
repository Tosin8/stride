// ignore_for_file: public_member_api_docs, sort_constructors_first
class newArrivalProduct {
  String image; 
  String title;
  String category;
  String price; 
  newArrivalProduct({
    required this.image,
    required this.title,
    required this.category,
    required this.price, 
  });
}

final List newArrivalProducts = [
  newArrivalProduct(
    image: "assets/products/newarrival/1.jpg",
    title: "Product 1",
    category: "Adidas",
    price: '200',
  ), newArrivalProduct(
    image: "assets/products/newarrival/2.jpg",
    title: "Product 1",
    category: "Nike",
    price: '400',
  ), newArrivalProduct(
    image: "assets/products/newarrival/3.jpg",
    title: "Product 1",
    category: "Jordan",
    price: '200',
  ), newArrivalProduct(
    image: "assets/products/newarrival/4.jpg",
    title: "Product 1",
    category: "Adidas",
    price: '550',
  ),
   newArrivalProduct(
    image: "assets/products/newarrival/5.jpg",
    title: "Product 1",
    category: 'Puma'
    ,price: '200',
   ),
];