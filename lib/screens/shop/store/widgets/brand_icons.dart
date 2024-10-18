
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class BrandIcons extends StatefulWidget {
  const BrandIcons({super.key});

  @override
  State<BrandIcons> createState() => _BrandIconsState();
}

class _BrandIconsState extends State<BrandIcons> {
  final List<String> _brandImages = [];  // List to store image URLs
  bool _isLoading = true;  // To track loading state

  @override
  void initState() {
    super.initState();
    _loadBrandImages();
  }

  Future<void> _loadBrandImages() async {
    try {
      // Fetch list of images from Firebase Storage folder 'brands'
      final ListResult result = await FirebaseStorage.instance.ref('brands').listAll();

      // Get the download URLs for each image
      final List<String> urls = await Future.wait(result.items.map((item) async => await item.getDownloadURL()).toList());

      // Update the state with the image URLs
      setState(() {
        _brandImages.addAll(urls);
        _isLoading = false;  // Loading is complete
      });
    } catch (e) {
      print('Failed to load images: $e');
      setState(() {
        _isLoading = false;  // Even if there's an error, stop loading indicator
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? _buildShimmerEffect()  // Show shimmer effect while loading images
        : _brandImages.isNotEmpty
            ? SizedBox( 
                height: 50,  // Set a fixed height for the ListView
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: _brandImages.map((imageUrl) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),  // Add some horizontal padding between images
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),  // Rounded corners for images
                        child: Image.network(
                          imageUrl,
                          fit: BoxFit.cover,  // Scale the image to cover the widget
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return _buildShimmerEffect();  // Show shimmer effect while loading the image
                          },
                          errorBuilder: (context, error, stackTrace) => const Icon(Icons.error),  // Show an error icon if the image fails to load
                        ),
                      ),
                    );
                  }).toList(),
                ),
              )
            : const Center(child: Text('No brand images available.'));  // Show a message if no images are available
  }

  // Function to build shimmer effect
  Widget _buildShimmerEffect() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        width: double.infinity,
        height: 50,  // Adjust height as needed
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }
}
