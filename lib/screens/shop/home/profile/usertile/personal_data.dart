import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:stride/utils/validators/validations.dart';

class PersonalData extends StatefulWidget {
  const PersonalData({super.key});

  @override
  State<PersonalData> createState() => _PersonalDataState();
}

class _PersonalDataState extends State<PersonalData> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(  
        appBar: AppBar( 
          title: const Text('Personal Data'), 
          centerTitle: true,
        ),

        body:  ListView(
          scrollDirection: Axis.vertical,
          // mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 6,), 
            Center(
              child: Stack(
                clipBehavior: Clip.none,
                children:[ const CircleAvatar(
                  radius: 40,
                  child: Icon(Iconsax.user),
                ),
                Positioned(
                  bottom: 0,
                  right: -18,
                  child: IconButton(onPressed: (){}, icon: const Icon(Iconsax.edit, size: 20,)))
                        ]),
            ), 

          // Form. 
          const SizedBox(height: 10),
                    
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Form(
                          child: Column(
                            children: [

                              // the name of the user will appear as hint text  
                              TextFormField(
                                                   //   controller: controller.email,
                               // validator: (value) => BValidator.validateEmail(value),
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.emailAddress,
                                decoration: const InputDecoration(
                                  labelText: 'First Name',
                                  prefixIcon: Icon(Iconsax.user),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20,), 
                              TextFormField(
                                                   //   controller: controller.email,
                               // validator: (value) => BValidator.validateEmail(value),
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.emailAddress,
                                decoration: const InputDecoration(
                                  labelText: 'Last Name',
                                  prefixIcon: Icon(Iconsax.user),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20,), 
                              TextFormField(
                                                   //   controller: controller.email,
                               validator: (value) => BValidator.validatePhoneNumber(value),
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  labelText: 'Phone Number',
                                  prefixIcon: Icon(Icons.phone),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20,), 
                                 TextFormField(
                                                   //   controller: controller.email,
                               //validator: (value) => BValidator.validatePhoneNumb(value),
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  labelText: 'Home Address',
                                  prefixIcon: Icon(Icons.location_on),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                  ),
                                ),
                              ),
                               const SizedBox(height: 20,), 
                                 TextFormField(
                                                   //   controller: controller.email,
                               //validator: (value) => BValidator.validatePhoneNumb(value),
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.name,
                                decoration: const InputDecoration(
                                  labelText: 'Office Address',
                                  prefixIcon: Icon(Icons.location_on),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20,), 
                              const Divider(), 
                               const SizedBox(height: 20,), 
                                 TextFormField(
                                                   //   controller: controller.email,
                               //validator: (value) => BValidator.validatePhoneNumb(value),
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  labelText: 'Change Password',
                                  prefixIcon: Icon(Icons.location_on),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                  ),
                                ),
                              ),
                               const SizedBox(height: 20,), 
                                 TextFormField(
                                                   //   controller: controller.email,
                               //validator: (value) => BValidator.validatePhoneNumb(value),
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  labelText: 'Confirm Password',
                                  prefixIcon: Icon(Icons.location_on),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20,), 
                              Container(
                                height: 55,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                  color: Colors.black, 
                                ),
                                child: const Align(child: Text('Update Info', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),),),
                              )
                            ],
                          ),
                          
                        ),
                      ),
                      const SizedBox(height: 10),
          ],
        )
      ),
    );
  }
}