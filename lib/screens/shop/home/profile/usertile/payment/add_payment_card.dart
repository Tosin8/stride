import 'package:flutter/material.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert'; // Import for JSON encoding and decoding

class AddPaymentCard extends StatefulWidget {
  const AddPaymentCard({super.key});

  @override
  State<AddPaymentCard> createState() => _AddPaymentCardState();
}

class _AddPaymentCardState extends State<AddPaymentCard> {
  // Initialize FlutterSecureStorage
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  final TextEditingController expiryController = TextEditingController();
  final GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Payment Card'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              _buildCardDisplay(), // Card with flip animation
              const SizedBox(height: 10),
              _buildCardForm(),
              const SizedBox(height: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 15 , horizontal: 20),
                ),
                onPressed: _onValidate,
                child: const Text('Add Card', 
                style: TextStyle(color: Colors.white),),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCardDisplay() {
    return FlipCard(
      key: cardKey,
      flipOnTouch: false, // Disable flipping on touch
      front: _buildFrontCard(), // Front of the card
      back: _buildBackCard(), // Back of the card (shows CVV)
    );
  }

  Widget _buildFrontCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Dynamic logo based on card number
          Image.asset(
            _getCardLogo(),
            height: 40,
          ),
          const SizedBox(height: 10),
          const Text('Card Number', style: TextStyle(color: Colors.white)),
          Text(cardNumber.isNotEmpty ? cardNumber : 'XXXX XXXX XXXX XXXX',
              style: const TextStyle(color: Colors.white, fontSize: 24)),
          const SizedBox(height: 10),
          const Text('Card Holder Name', style: TextStyle(color: Colors.white)),
          Text(cardHolderName.isNotEmpty ? cardHolderName : 'FULL NAME',
              style: const TextStyle(color: Colors.white, fontSize: 18)),
          const SizedBox(height: 10),
          const Text('Expiry Date', style: TextStyle(color: Colors.white)),
          Text(expiryDate.isNotEmpty ? expiryDate : 'MM/YY',
              style: const TextStyle(color: Colors.white, fontSize: 18)),
        ],
      ),
    );
  }

  Widget _buildBackCard() {
    return Container(
      width: double.infinity,
      height: 200,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('CVV', style: TextStyle(color: Colors.white)),
          Text(cvvCode.isNotEmpty ? cvvCode : '***',
              style: const TextStyle(color: Colors.white, fontSize: 24)),
        ],
      ),
    );
  }

  Widget _buildCardForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          onChanged: (value) {
            setState(() {
              cardNumber = value; // Update card number
            });
          },
          maxLength: 19, // Allow space for formatting
          decoration: const InputDecoration(
            labelText: 'Card Number',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          onChanged: (value) {
            setState(() {
              cardHolderName = value; // Update card holder name
            });
          },
          decoration: const InputDecoration(
            labelText: 'Card Holder Name',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: expiryController,
          onChanged: (value) {
            setState(() {
              expiryDate = _formatExpiryDate(value); // Format and update expiry date
              expiryController.value = expiryController.value.copyWith(
                text: expiryDate,
                selection: TextSelection.collapsed(offset: expiryDate.length),
              );
            });
          },
          keyboardType: TextInputType.number,
          maxLength: 5, // Max length for MM/YY format
          decoration: const InputDecoration(
            labelText: 'Expiry Date (MM/YY)',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          onChanged: (value) {
            setState(() {
              if (value.length <= 3) {
                cvvCode = value; // Update CVV code
              }
              if (!isCvvFocused) {
                cardKey.currentState?.toggleCard(); // Flip to back when CVV is focused
                isCvvFocused = true;
              }
            });
          },
          onEditingComplete: () {
            setState(() {
              if (isCvvFocused) {
                cardKey.currentState?.toggleCard(); // Flip back to front
                isCvvFocused = false;
              }
            });
          },
          obscureText: true,
          maxLength: 3, // Limit CVV to 3 digits
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            labelText: 'CVV',
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }

  String _formatExpiryDate(String input) {
    if (input.length == 2 && !input.contains('/')) {
      return '$input/'; // Add slash after MM
    } else if (input.length == 5) {
      return input; // Max length for MM/YY format
    }
    return input;
  }

  String _getCardLogo() {
    if (cardNumber.startsWith('506')) {
      return 'assets/icons/verve.png'; // Verve card
    } else if (cardNumber.startsWith('5')) {
      return 'assets/icons/master-card.png'; // MasterCard
    } else {
      return 'assets/icons/master-card.png'; // Default card
    }
  }

  void _onValidate() async {
    if (cardNumber.isEmpty || cardHolderName.isEmpty || expiryDate.isEmpty || cvvCode.isEmpty) {
      _showSnackBar('Validation Error', 'Please fill in all fields', ContentType.failure);
    } else if (cardNumber.replaceAll(' ', '').length != 16) {
      _showSnackBar('Validation Error', 'Card number must be 16 digits', ContentType.failure);
    } else {
      // Create a map of card details
      Map<String, String> cardData = {
        'cardNumber': cardNumber,
        'expiryDate': expiryDate,
        'cardHolderName': cardHolderName,
        'cvvCode': cvvCode,
      };

      // Save card info securely as JSON string
      await secureStorage.write(key: cardNumber, value: json.encode(cardData));

      // Show success and return to the previous screen
      _showSnackBar('Success', 'Credit card has been added', ContentType.success);
      Navigator.pop(context, true); // Return true so PaymentCard can reload
    }
  }

  void _showSnackBar(String title, String message, ContentType contentType) {
    final snackBar = SnackBar(
      content: AwesomeSnackbarContent(
        title: title,
        message: message,
        contentType: contentType,
      ),
      duration: const Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
