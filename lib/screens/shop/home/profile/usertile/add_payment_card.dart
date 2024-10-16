import 'package:flutter/material.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

class AddPaymentCard extends StatefulWidget {
  const AddPaymentCard({super.key});

  @override
  State<AddPaymentCard> createState() => _AddPaymentCardState();
}

class _AddPaymentCardState extends State<AddPaymentCard> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Payment Card'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  isCvvFocused = !isCvvFocused; // Flip card on tap
                });
              },
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: isCvvFocused ? _buildCardBack() : _buildCardFront(),
              ),
            ),
            const SizedBox(height: 20),
            _buildCardForm(),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),  
                padding: const EdgeInsets.all(20),
                
                
              ), 
              onPressed: _onValidate,
              child: const Text('Add Card'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCardFront() {
    return Container(
      key: const ValueKey<int>(1),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset('assets/icons/master-card.png', height: 40), // Card type logo
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

  Widget _buildCardBack() {
    return Container(
      key: const ValueKey<int>(2),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('CVV', style: TextStyle(color: Colors.white)),
          TextField(
            onChanged: (value) {
              setState(() {
                cvvCode = value; // Update CVV code
              });
            },
            obscureText: true,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: '***',
              hintStyle: const TextStyle(color: Colors.grey),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Colors.grey),
              ),
            ),
          ),
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
          onChanged: (value) {
            setState(() {
              expiryDate = value; // Update expiry date
            });
          },
          decoration: const InputDecoration(
            labelText: 'Expiry Date (MM/YY)',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  void _onValidate() {
    // Handle validation logic here
    if (cardNumber.isEmpty || cardHolderName.isEmpty || expiryDate.isEmpty) {
      _showSnackBar('Validation Error', 'Please fill in all fields', ContentType.failure);
    } else if (cardNumber.replaceAll(' ', '').length != 16) {
      _showSnackBar('Validation Error', 'Card number must be 16 digits', ContentType.failure);
    } else {
      _showSnackBar('Success', 'Credit card has been added', ContentType.success);
      Navigator.pop(context); // Close the screen
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
