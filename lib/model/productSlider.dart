// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProductSlider {
   String image;
   String title; 
   String category;
   double price;
   String description; 
  ProductSlider({
    required this.image,
    required this.title,
    required this.category,
    required this.price,
    required this.description
  });

  get length => null;
}


List<ProductSlider> productSliders = [
  
  ProductSlider(
    image: "assets/products/slider/2.jpg",
    title: "Adidas Ultraboost 21",
    category: "Adidas",
    price: 200,
     description: 'The New Balance Fresh Foam 1080v12 is a premium neutral running shoe designed for long-distance training. Featuring Fresh Foam X midsole technology, it delivers superior cushioning and energy return to propel you through every stride. The engineered mesh upper offers breathable comfort, while the blown rubber outsole provides durability and grip on various surfaces. Experience a smooth, responsive ride that keeps you going mile after mile.',
  ), 
  ProductSlider(
    image: "assets/products/slider/3.jpg",
    title: "Adidas CrazyTrain",
    category: "Adidas",
    price:140, 
    description: 'Conquer the trails with the Merrell Moab 3 Mid Waterproof Hiking Boots. Crafted with a waterproof membrane and durable leather and mesh uppers, these boots keep your feet dry and protected. The Vibram® outsole ensures excellent traction on rugged terrain, while the molded nylon arch shank and air cushion heel absorb shock for all-day comfort. With a supportive fit and versatile style, these boots are your reliable companions for outdoor adventures.',
  ), 
  ProductSlider(
    image: "assets/products/slider/4.jpg",
    title: "Puma Dame",
    category: "Puma",
    price: 420,
     description: 'Step into sophistication with the Cole Haan Grand Ambition Wingtip Oxford. Handcrafted from full-grain leather, these classic wingtips exude timeless elegance. The lightweight EVA outsole with rubber pods provides flexibility and traction, while the fully padded leather sock lining ensures all-day comfort. The burnished toe and brogue detailing add a touch of distinction, making these shoes perfect for the office or formal occasions.',
  ), 
  ProductSlider(
    image: "assets/products/slider/5.jpg",
    title: "Jordan Gamecourt",
    category: "Jordan",
    price: 310,
     description: 'Elevate your street style with the adidas Originals Stan Smith Sneakers. These iconic low-tops feature a clean, minimalist design with a full leather upper and perforated 3-Stripes. The Ortholite® sockliner delivers cushioned comfort, while the rubber cupsole ensures durability and grip. With a classic look that never goes out of style, these sneakers seamlessly transition from casual outings to trendy ensembles.',
  ), 
  ProductSlider(
    image: "assets/products/slider/6.jpg",
    title: "Nike Yeezy Boost",
    category: "Nike",
    price: 240,
     description: 'Embrace the summer vibes with the Teva Hurricane XLT2 Sandals. Designed for outdoor adventures, these sandals feature a water-ready polyester webbing upper with a quick-drying midsole. The rust-free zinc-alloy hardware and durable rubber outsole provide lasting wear, while the EVA foam footbed offers cushioned comfort. With adjustable straps and a secure fit, these sandals are ideal for hiking, water sports, or simply enjoying the great outdoors.',
  ), 
];