// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:iconsax/iconsax.dart';
// import 'package:stride/screens/shop/home/profile/usertile/add_payment_card.dart';

// class PaymentCard extends StatefulWidget {
//   const PaymentCard({super.key});

//   @override
//   State<PaymentCard> createState() => _PaymentCardState();
// }

// class _PaymentCardState extends State<PaymentCard> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold( 
//       appBar: AppBar(
//         title: const Text('Payment Cards'),
//       ),
//       body:  SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//           children: [

//             // Credit Card. 
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
          
//                const Image(image: AssetImage('assets/icons/master-card.png'), width: 50,), 
//                 const SizedBox(width: 10,), 
//                 const Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     // card holder name
//                     Text('Tosin Ezekiel', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),), 
//                     // card number
//                     Text('42384*******234', 
//                     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),), 
//                     Row(
                      
//                       children: [
//                         // expiry date.
//                         Text( '12/24', style: TextStyle(fontWeight: FontWeight.bold),),
//                         SizedBox(width: 30,), 
//                         // cvv.
//                         Text('232'), 
//                       ],
//                     )
//                   ],
//                 ), 
//                 const SizedBox(width: 130,), 
//                 Expanded(
//                   flex: 2,
//                   child: IconButton(onPressed: (){}, icon: const Icon(Iconsax.trash, color: Colors.red,)))
//               ],
//             ), 
//             const SizedBox(height: 20,),
//             const Divider(), 
//             const SizedBox(height: 20,),

//             // Credit Card
//              Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
          
//                const Image(image: AssetImage('assets/icons/visa.png'), width: 50,), 
//                 const SizedBox(width: 10,), 
//                 const Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     // card holder name
//                     Text('Harry Potter', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),), 
//                     // card number
//                     Text('42384*******234', 
//                     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),), 
//                     Row(
                      
//                       children: [
//                         // expiry date.
//                         Text( '12/24', style: TextStyle(fontWeight: FontWeight.bold),),
//                         SizedBox(width: 30,), 
//                         // cvv.
//                         Text('232'), 
//                       ],
//                     )
//                   ],
//                 ), 
//                 const SizedBox(width: 130,), 
//                 Expanded(
//                   flex: 2,
//                   child: IconButton(onPressed: (){}, icon: const Icon(Iconsax.trash, color: Colors.red,)))
//               ],
//             )
//           ],
//                 ),
//         )), 
//       bottomSheet: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: GestureDetector( 
//           onTap: (){
//             Get.to(() => const AddPaymentCard());
//           },
//           child: Container(
              
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(11), 
//               color: Colors.black,
//             ),
//             height:60,
               
//             child: const Center(
//               child: Text('Add Payment Card', style: TextStyle(color: Colors.white),),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'add_payment_card.dart';

class PaymentCard extends StatefulWidget {
  const PaymentCard({super.key});

  @override
  State<PaymentCard> createState() => _PaymentCardState();
}

class _PaymentCardState extends State<PaymentCard> {
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();
  String? cardNumber;
  String? expiryDate;
  String? cardHolderName;
  String? cvvCode;

  @override
  void initState() {
    super.initState();
    _loadCards();
  }

  Future<void> _loadCards() async {
    cardNumber = await secureStorage.read(key: 'cardNumber');
    expiryDate = await secureStorage.read(key: 'expiryDate');
    cardHolderName = await secureStorage.read(key: 'cardHolderName');
    cvvCode = await secureStorage.read(key: 'cvvCode');
    setState(() {});
  }

  void _deleteCard() async {
    await secureStorage.delete(key: 'cardNumber');
    await secureStorage.delete(key: 'expiryDate');
    await secureStorage.delete(key: 'cardHolderName');
    await secureStorage.delete(key: 'cvvCode');
    _loadCards(); // Reload cards after deletion

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Credit card has been removed')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Cards'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              // Show "No payment card added" if no card is stored
              if (cardNumber == null) 
                const Text('No payment card added'),
              if (cardNumber != null) ...[
                // Credit Card Display
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Image(image: AssetImage('assets/icons/master-card.png'), width: 50),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(cardHolderName ?? '', style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16)),
                        Text(cardNumber?.replaceRange(4, 16, '************') ?? '', 
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                        Row(
                          children: [
                            Text(expiryDate ?? '', style: const TextStyle(fontWeight: FontWeight.bold)),
                            const SizedBox(width: 30),
                            Text(cvvCode ?? ''),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(width: 130),
                    Expanded(
                      flex: 2,
                      child: IconButton(
                        onPressed: _deleteCard, 
                        icon: const Icon(Icons.delete, color: Colors.red)
                      )
                    )
                  ],
                ),
                const SizedBox(height: 20),
                const Divider(),
                const SizedBox(height: 20),
              ],
            ],
          ),
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () {
            Get.to(() => const AddPaymentCard())?.then((_) {
              _loadCards(); // Reload cards after coming back from AddPaymentCard screen
            });
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(11),
              color: Colors.black,
            ),
            height: 50,
            child: const Center(
              child: Text(
                'Add New Card',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
