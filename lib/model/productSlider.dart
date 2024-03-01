// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProductSlider {
  final String image;
  final String title; 
  final String category;
  final double price;
  ProductSlider({
    required this.image,
    required this.title,
    required this.category,
    required this.price,
  });
}


List<ProductSlider> productSliders = [
  ProductSlider(
    image: "assets/products/slider/1.jpg",
    title: "Product 1",
    category: "Adidas",
    price: 200,
  ), 
  ProductSlider(
    image: "assets/products/slider/2.jpg",
    title: "Product 1",
    category: "Adidas",
    price: 200,
  ), ProductSlider(
    image: "assets/products/slider/3.jpg",
    title: "Product 1",
    category: "Adidas",
    price:140,
  ), ProductSlider(
    image: "assets/products/slider/4.jpg",
    title: "Product 1",
    category: "Puma",
    price: 420,
  ), ProductSlider(
    image: "assets/products/slider/5.jpg",
    title: "Product 1",
    category: "Jordan",
    price: 310,
  ), ProductSlider(
    image: "assets/products/slider/6.jpg",
    title: "Product 1",
    category: "Nike",
    price: 240,
  ), 
];