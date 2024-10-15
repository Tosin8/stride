import 'package:flutter/material.dart';
import 'package:easy_stepper/easy_stepper.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  int currentStep = 0; // Keep track of the current step

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            EasyStepper(
              activeStep: currentStep,
             // lineLength: 50, // Length of the lines connecting the steps
              steppingEnabled: true, // Enable/disable stepping
              steps: const [
                EasyStep(
                  title: 'Shipping',
                  icon: Icon(Icons.local_shipping), // Add an icon for the Shipping step
                ),
                EasyStep(
                  title: 'Payment',
                  icon: Icon(Icons.payment), // Add an icon for the Payment step
                ),
                EasyStep(
                  title: 'Review',
                  icon: Icon(Icons.rate_review), // Add an icon for the Review step
                ),
              ],
            ),
            Expanded(
              child: IndexedStack(
                index: currentStep,
                children: [
                  _ShippingPage(onNext: _goToNextStep),
                  _PaymentPage(onNext: _goToNextStep),
                  _ReviewPage(onOrderPlaced: _placeOrder),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                if (currentStep > 0)
                  ElevatedButton(
                    onPressed: _goToPreviousStep,
                    child: const Text('Back'),
                  ),
                if (currentStep < 2)
                  ElevatedButton(
                    onPressed: _goToNextStep,
                    child: const Text('Next'),
                  ),
                if (currentStep == 2)
                  ElevatedButton(
                    onPressed: _placeOrder,
                    child: const Text('Place Order'),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _goToNextStep() {
    if (currentStep < 2) {
      setState(() {
        currentStep++;
      });
    }
  }

  void _goToPreviousStep() {
    if (currentStep > 0) {
      setState(() {
        currentStep--;
      });
    }
  }

  void _placeOrder() {
    // Handle placing the order logic here
    print('Order placed successfully!');
  }
}

// Shipping Page
class _ShippingPage extends StatelessWidget {
  final VoidCallback onNext;

  const _ShippingPage({super.key, required this.onNext});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Enter Shipping Information'),
        // Add your shipping form fields here
        ElevatedButton(
          onPressed: onNext,
          child: const Text('Next'),
        ),
      ],
    );
  }
}

// Payment Page
class _PaymentPage extends StatelessWidget {
  final VoidCallback onNext;

  const _PaymentPage({super.key, required this.onNext});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Enter Payment Information'),
        // Add your payment form fields here
        ElevatedButton(
          onPressed: onNext,
          child: const Text('Next'),
        ),
      ],
    );
  }
}

// Review Page
class _ReviewPage extends StatelessWidget {
  final VoidCallback onOrderPlaced;

  const _ReviewPage({super.key, required this.onOrderPlaced});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Review Your Order'),
        // Add your review fields here (summary of order, etc.)
        ElevatedButton(
          onPressed: onOrderPlaced,
          child: const Text('Place Order'),
        ),
      ],
    );
  }
}
