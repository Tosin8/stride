import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';

class PromoSlider extends StatefulWidget {
  const PromoSlider({super.key});

  @override
  State<PromoSlider> createState() => _PromoSliderState();
}

class _PromoSliderState extends State<PromoSlider> {
  int _currentIndex = 0;
  List<String> _carouselImages = [];

  @override
  void initState() {
    super.initState();
    _loadCarouselImages();
  }

  // Load images from Firebase
  Future<void> _loadCarouselImages() async {
    try {
      final ListResult result =
          await FirebaseStorage.instance.ref('banners').listAll();
      final List<String> urls = await Future.wait(
        result.items.map((item) async => await item.getDownloadURL()).toList(),
      );
      setState(() {
        _carouselImages = urls;
      });
    } catch (e) {
      print('Failed to load images: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return _carouselImages.isEmpty
        ? const Center(child: CircularProgressIndicator())
        : Column(
            children: [
              CarouselSlider(
                items: _carouselImages.map((url) {
                  return ClipRRect(
                     borderRadius: BorderRadius.circular(15),
                    child: CachedNetworkImage(
                      imageUrl: url,
                      placeholder: (context, url) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  );
                }).toList(),
                options: CarouselOptions(
                  autoPlayAnimationDuration: const Duration(milliseconds: 1000),
                  autoPlayInterval: const Duration(seconds: 5), 
                  autoPlayCurve: Curves.easeIn,
                  height: 180.0,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _carouselImages.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _currentIndex = entry.key;
                      });
                    },
                    child: Container(
                      width: 8.0,
                      height: 8.0,
                      margin: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 4.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _currentIndex == entry.key
                            ? Colors.black
                            : Colors.grey,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          );
  }
}
