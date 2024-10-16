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
import 'package:iconsax/iconsax.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'add_payment_card.dart';

class PaymentCard extends StatefulWidget {
  const PaymentCard({super.key});

  @override
  State<PaymentCard> createState() => _PaymentCardState();
}

class _PaymentCardState extends State<PaymentCard> {
  final FlutterSecureStorage storage = const FlutterSecureStorage();
  List<Map<String, String>> cardList = [];

  @override
  void initState() {
    super.initState();
    _loadCards(); // Load existing cards from secure storage
  }

  Future<void> _loadCards() async {
    String? cards = await storage.read(key: 'cards');
    if (cards != null) {
      List<String> storedCards = cards.split(';');
      setState(() {
        cardList = storedCards.map((card) {
          List<String> details = card.split(',');
          return {
            'cardHolderName': details[0],
            'cardNumber': details[1],
            'expiryDate': details[2],
            'cardType': details[3],
          };
        }).toList();
      });
    }
  }

  Future<void> _removeCard(int index) async {
    setState(() {
      cardList.removeAt(index);
    });

    await storage.write(key: 'cards', value: cardList.map((card) => 
      '${card['cardHolderName']},${card['cardNumber']},${card['expiryDate']},${card['cardType']}').join(';'));
      
    Get.snackbar('Success', 'Credit card has been removed', 
      snackPosition: SnackPosition.BOTTOM, duration: const Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Cards'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: cardList.isEmpty
            ? const Center(child: Text('No payment card added'))
            : ListView.builder(
                itemCount: cardList.length,
                itemBuilder: (context, index) {
                  final card = cardList[index];
                  return Column(
                    children: [
                      _buildCardWidget(card, index),
                      if (index < cardList.length - 1) const Divider(),
                    ],
                  );
                },
              ),
      ),
     bottomSheet: Padding(
  padding: const EdgeInsets.all(8.0),
  child: GestureDetector(
    onTap: () async {
      await Get.to(() => const AddPaymentCard()); // Await the navigation
      _loadCards(); // Reload cards after coming back from AddPaymentCard screen
    },
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(11),
        color: Colors.black,
      ),
      height: 60,
      child: const Center(
        child: Text('Add Payment Card', style: TextStyle(color: Colors.white)),
      ),
    ),
  ),
),
    );
  }

  Widget _buildCardWidget(Map<String, String> card, int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image(
          image: AssetImage(
            card['cardType'] == 'Visa'
                ? 'assets/icons/visa.png'
                : 'assets/icons/master-card.png',
          ),
          width: 50,
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              card['cardHolderName'] ?? '',
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            ),
            Text(
              card['cardNumber']?.replaceRange(4, card['cardNumber']!.length - 4, '*' * (card['cardNumber']!.length - 8)) ?? '',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Row(
              children: [
                Text(
                  card['expiryDate'] ?? '',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 30),
                const Text('***'), // Masking CVV for security
              ],
            ),
          ],
        ),
        IconButton(
          onPressed: () {
            _removeCard(index);
          },
          icon: const Icon(Iconsax.trash, color: Colors.red),
        ),
      ],
    );
  }
}
