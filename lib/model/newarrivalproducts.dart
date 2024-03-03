// ignore_for_file: public_member_api_docs, sort_constructors_first
class newArrivalProduct {
  String image; 
  String title;
  String category;
  newArrivalProduct({
    required this.image,
    required this.title,
    required this.category,
  });
}

final List newArrivalProducts = [
  newArrivalProduct(
    image: "assets/products/newarrival/1.jpg",
    title: "Product 1",
    category: "Adidas",
  ), newArrivalProduct(
    image: "assets/products/newarrival/2.jpg",
    title: "Product 1",
    category: "Nike",
  ), newArrivalProduct(
    image: "assets/products/newarrival/3.jpg",
    title: "Product 1",
    category: "Jordan",
  ), newArrivalProduct(
    image: "assets/products/newarrival/4.jpg",
    title: "Product 1",
    category: "Adidas",
  ),
   newArrivalProduct(
    image: "assets/products/newarrival/5.jpg",
    title: "Product 1",
    category: 'Puma'
   ),
];