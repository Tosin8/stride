import 'package:flutter/material.dart';

class FAQScreen extends StatelessWidget {
  const FAQScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FAQs"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            _buildCategoryHeader('Order & Payment'),
            _buildFAQTile(
              "How do I place an order?",
              "To place an order, select the items you wish to purchase, add them to your cart, and proceed to checkout. Enter your shipping details, choose a payment method, and confirm your order.",
            ),
            _buildFAQTile(
              "What payment methods are accepted?",
              "We accept a variety of payment methods including:\n- Credit/Debit Cards (Visa, MasterCard, Verve)\n- Digital Wallets (e.g., PayPal, Google Pay)\n- Bank Transfer\n- Cash on Delivery (select locations only).",
            ),
            _buildFAQTile(
              "How do I apply discount codes?",
              "During checkout, enter your discount code in the ‘Promo Code’ field and click ‘Apply’. The total amount will be adjusted accordingly.",
            ),
            _buildFAQTile(
              "Can I cancel or modify my order after placing it?",
              "Yes, you can cancel or modify your order if it has not yet been shipped. Go to 'My Orders' and select the order to view the available options. Contact support if you need further assistance.",
            ),
            _buildFAQTile(
              "Why was my payment declined?",
              "There are several reasons why a payment might be declined:\n1. Insufficient funds.\n2. Incorrect card details.\n3. Bank restrictions.\n4. Payment method not supported.\nCheck with your bank or try a different payment method.",
            ),

            // Shipping & Delivery Section
            const SizedBox(height: 20),
            _buildCategoryHeader('Shipping & Delivery'),
            _buildFAQTile(
              "How long will it take to receive my order?",
              "Delivery times depend on your location and the shipping method chosen. Typically, orders are delivered within 3-7 business days. Expedited shipping options may be available at checkout.",
            ),
            _buildFAQTile(
              "How do I track my order?",
              "Once your order is shipped, you will receive a tracking number via email or SMS. You can use this number to track your order on our website or the courier’s tracking portal.",
            ),
            _buildFAQTile(
              "What are the shipping fees?",
              "Shipping fees vary based on the delivery location and the shipping method you choose. Free shipping may be available for orders over a certain amount.",
            ),
            _buildFAQTile(
              "Can I change my shipping address after placing an order?",
              "You can change your shipping address if the order has not been shipped yet. Please contact our support team immediately to make the change.",
            ),
            _buildFAQTile(
              "What happens if I miss my delivery?",
              "If you miss a delivery attempt, the courier will usually leave a note with instructions for rescheduling delivery or picking up the package at a nearby location.",
            ),

            // Returns & Refunds Section
            const SizedBox(height: 20),
            _buildCategoryHeader('Returns & Refunds'),
            _buildFAQTile(
              "What is your return policy?",
              "We offer a 30-day return policy for unused and undamaged items. To initiate a return, please visit our Returns page or contact our customer support.",
            ),
            _buildFAQTile(
              "How do I return an item?",
              "To return an item, go to your order history, select the item you wish to return, and follow the instructions. You may need to print a return label and drop off the package at a specified location.",
            ),
            _buildFAQTile(
              "How long does it take to get a refund?",
              "Once we receive the returned item, it typically takes 5-7 business days for the refund to be processed. The refund will be credited back to your original payment method.",
            ),
            _buildFAQTile(
              "Can I exchange an item instead of returning it?",
              "Yes, exchanges are available for select items. Please check the product details or contact support to see if an exchange is possible.",
            ),

            // Account & Security Section
            const SizedBox(height: 20),
            _buildCategoryHeader('Account & Security'),
            _buildFAQTile(
              "How do I enable fingerprint login?",
              "To enable fingerprint login, go to 'Settings' > 'Security' > 'Enable Fingerprint'. Follow the prompts to register your fingerprint for secure login.",
            ),
            _buildFAQTile(
              "Is my personal information safe?",
              "Yes, we prioritize your privacy and use industry-standard encryption to protect your personal information. For more details, please see our Privacy Policy.",
            ),
            _buildFAQTile(
              "How do I sign out of my account?",
              "To sign out, go to the main menu, scroll down, and select 'Sign Out'. This will log you out of the app until you log in again.",
            ),
            _buildFAQTile(
              "Why is my account locked?",
              "Your account may be locked due to multiple unsuccessful login attempts. Contact customer support to verify your identity and unlock your account.",
            ),
            _buildFAQTile(
              "How can I update my newsletter preferences?",
              "You can update your newsletter preferences by going to 'Settings' > 'Email Preferences'. From there, you can opt-in or opt-out of promotional emails.",
            ),

            // Product Questions Section
            const SizedBox(height: 20),
            _buildCategoryHeader('Product Questions'),
            _buildFAQTile(
              "How do I know if an item is in stock?",
              "The availability of an item is displayed on the product page. If an item is out of stock, you may have the option to sign up for notifications when it becomes available again.",
            ),
            _buildFAQTile(
              "What do I do if an item is out of stock?",
              "If an item is out of stock, you can sign up to be notified when it's back in stock, or browse similar items that may be available.",
            ),
            _buildFAQTile(
              "How can I review a product?",
              "After purchasing and receiving an item, you will be prompted to leave a review. You can also go to the product page and submit a review directly from there.",
            ),
            _buildFAQTile(
              "What should I do if I receive a damaged or wrong item?",
              "If you receive a damaged or incorrect item, contact our support team immediately. We will arrange a return or replacement at no extra cost.",
            ),
            _buildFAQTile(
              "Do you offer gift wrapping or gift cards?",
              "Yes, we offer gift wrapping for select items during checkout. You can also purchase digital gift cards that are sent via email.",
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to create category headers
  Widget _buildCategoryHeader(String categoryTitle) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 5),
      child: Text(
        categoryTitle,
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  // Helper method to create FAQ Tiles
  Widget _buildFAQTile(String question, String answer) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ExpansionTile(
        title: Text(
          question,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              answer,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
