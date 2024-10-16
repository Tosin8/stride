import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:iconsax/iconsax.dart';

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
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
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
                GestureDetector(
                  onTap: _goToPreviousStep,
                  child: Container(
                    height: 50, width: 150,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.black
                    ),
                    child: const Align(
                      alignment: Alignment.center,
                      child: Text('Back', style: TextStyle(color: Colors.white),),),
                  ),), 
                  
                  // ElevatedButton(
                  //   onPressed: _goToPreviousStep,
                  //   child: const Text('Back'),
                  // ),
                if (currentStep < 2)
                 GestureDetector(
                  onTap: _goToNextStep,
                  child: Container(
                    height: 50, width: 150,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.black
                    ),
                    child: const Align(
                      alignment: Alignment.center,
                      child: Text('Next', style: TextStyle(color: Colors.white),),),
                  ),), 
                  // ElevatedButton(
                  //   onPressed: _goToNextStep,
                  //   child: const Text('Next'),
                  // ),
                if (currentStep == 2)
                 GestureDetector(
                  onTap: _placeOrder,
                  child: Container(
                    height: 50, width: 150,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.black
                    ),
                    child: const Align(
                      alignment: Alignment.center,
                      child: Text('Place Order', style: TextStyle(color: Colors.white),),),
                  ),), 
                  // ElevatedButton(
                  //   onPressed: _placeOrder,
                  //   child: const Text('Place Order'),
                  // ),
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Enter Shipping Information', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
          const SizedBox(height: 10,),
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(Icons.check_box,),
              const SizedBox(width: 18,), 
              const Expanded(
                child: Column(
                  
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Home Delivery', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                    Text('123 Main Street, Anytown, USA 12345'),
                    Text('Phone: (555) 555-5555'),
                  ],
                ),
              ),
              TextButton(onPressed: (){}, 
              child: const Text('Change'))
            ],
          ), 

          // store. 
           const SizedBox(height: 15,),
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(Icons.check_box_outline_blank,),
              const SizedBox(width: 18,), 
              const Expanded(
                child: Column(
                  
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Pickup Point', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                    Text('123 Main Street, Anytown, USA 12345'),
                    Text('Phone: (555) 555-5555'),
                  ],
                ),
              ),
              TextButton(onPressed: (){}, 
              child: const Text('Change'))
            ],
          ), 
         const SizedBox(height: 15,), 
         const Divider(), 
         const SizedBox(height: 15,),
         const Text('Delivery Options', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
         const SizedBox(height: 15,), 
         const Row(
          children: [
            Icon(Icons.check_box,),
            SizedBox(width: 18,), 
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text('Free', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),), 
                    Text(' Standard Delivery', style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),),
                  ],
                ),
                Text('Delivered on or before Monday, 23 April 2024', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),),
              ],
            ),

          ],
         ), 
          const SizedBox(height: 15,), 
         const Row(
          children: [
            Icon(Icons.check_box_outline_blank_outlined,),
            SizedBox(width: 18,), 
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                     Text('\$10', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                    Text(' Express Delivery', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
                  ],
                ),
                Text('Delivered on or before Monday, 13 April 2024', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),),
              ],
            ),

          ],
         ), 

          // Add your shipping form fields here
          const SizedBox(height: 100,),
        
          // ElevatedButton(
          //   onPressed: onNext,
          //   child: const Text('Proceed to Payment'),
          // ),
        ],
      ),
    );
  }
}

// Payment Page
class _PaymentPage extends StatelessWidget {
  final VoidCallback onNext;

  const _PaymentPage({super.key, required this.onNext});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           const Text('Choose your payment method', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
            const SizedBox(height: 10,),
          // Add your payment form fields here
        const SizedBox(height: 15,),
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(Icons.check_box,),
              const SizedBox(width: 18,),
              Expanded(
                child: CachedNetworkImage(
                  imageUrl:'https://firebasestorage.googleapis.com/v0/b/stride-67509.appspot.com/o/payments%2Fmaster-card.png?alt=media&token=c22077e6-fc8f-46eb-b570-7bd081f30c16', 
                scale: 1.5,),),
              
              const SizedBox(width: 10,), 
               const Expanded(
                flex: 2, 
                child: Column(
                  
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Zenith Bank', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                    Text('42*************085'),
                    Text('Expires: 02/24'),
                  ],
                ),
              ),
              Expanded(
                child: TextButton(onPressed: (){}, 
                child: const Text('Change')),
              )
            ],
          ), 
          const SizedBox(height: 12,), 
          const Divider(), 
          const SizedBox(height: 20,), 
          const Row(
            children: [
              Icon(Icons.check_box_outline_blank_outlined), 
              SizedBox(width: 18,),
              Text('Cash on Delivery', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
              
            ],
          ), 
          const SizedBox(height: 12,),
            const Divider(), 
          const SizedBox(height: 20,),
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(Icons.check_box_outline_blank_outlined), 
              const SizedBox(width: 18,),
              const Expanded( 
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Make Bank Transfer', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                     Text('WEMA BANK', style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),),
                     Text('Stride Limited', style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),),
                      Text('09023472837', style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),),
                       Text('Ref ID: 12345abuq', style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),),
                  ],
                ),
              ),
              TextButton(onPressed: (){}, child: const Text('Confirm Payment')), 
              
            ],
          ), 
          const SizedBox(height: 15,), 
          const Divider(), 
          const SizedBox(height: 20,), 
          const Text('Disclaimer'), 
          const SizedBox(height: 10,),
          const Text('Make sure to send the exact amount of money which must include the delivery fee and bank charges if you choose bank transfer, to confirm your order, otherwise order will not be processed'),
        ],
      ),
    );
  }
}

// Review Page
class _ReviewPage extends StatelessWidget {
  final VoidCallback onOrderPlaced;

  const _ReviewPage({super.key, required this.onOrderPlaced});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text('Kindly confirm your order', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
           SizedBox(height: 6,),
               Text('By clicking on place order you agree to our terms and conditions', style: TextStyle(fontSize: 16, ),),
            SizedBox(height: 30,),
          // Add your review fields here (summary of order, etc.)
          // ElevatedButton(
          //   onPressed: onOrderPlaced,
          //   child: const Text('Place Order'),
          // ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Payment', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),), 
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: Image(image: NetworkImage('https://firebasestorage.googleapis.com/v0/b/stride-67509.appspot.com/o/payments%2Fmaster-card.png?alt=media&token=c22077e6-fc8f-46eb-b570-7bd081f30c16', ))), 
                  SizedBox(width: 10,),
                  Text('**** 4714', style: TextStyle(fontSize: 15, ),),
                  SizedBox(width: 50,), 
                  Expanded(
                    flex: 1,
                    child: Text('01/24', style: TextStyle(fontSize: 15),)),


                ],
              ), 
SizedBox(height: 20,),
              Divider(), 
            ],
          ), 
          SizedBox(height: 10,),
           Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Shipping Address', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),), 
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 
                  Text('Name', style: TextStyle(fontSize: 15, ),),
                  SizedBox(width: 50,), 
                  Expanded(
                    flex: 1,
                    child: Text('John Doe', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),)),


                ],
              ), 
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 
                  Text('Address', style: TextStyle(fontSize: 15, ),),
                  SizedBox(width: 50,), 
                  Expanded(
                    flex: 2,
                    child: Text('123 Main Street Anytown USA 12345', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),)),


                ],
              ),
SizedBox(height: 20,),
              Divider(), 
            ],
          ), 
           SizedBox(height: 10,),
           Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Order Summary', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),), 
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 
                  Text('Subtotal', style: TextStyle(fontSize: 15, ),),
                  SizedBox(width: 50,), 
                  Expanded(
                    flex: 1,
                    child: Text('\$100.00', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),)),


                ],
              ), 
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 
                  Text('Delivery fee', style: TextStyle(fontSize: 15, ),),
                  SizedBox(width: 50,), 
                  Expanded(
                    flex: 2,
                    child: Text('\$10.00', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),)),
                    


                ],
                
              ),
              SizedBox(height: 10,),
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 
                  Text('Total', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold ),),
                  SizedBox(width: 50,), 
                  Expanded(
                    flex: 2,
                    child: Text('\$110.00', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),)),
                    


                ],
              ),
SizedBox(height: 20,),
              Divider(), 
            ],
          )
        ],
      ),
    );
  }
}
