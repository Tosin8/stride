import 'dart:io';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stride/auth/repository/user_repo.dart';
import 'package:stride/model/user_model.dart';


import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

class PersonalData extends StatefulWidget {
  final UserModel user;

  const PersonalData({super.key, required this.user});

  @override
  State<PersonalData> createState() => _PersonalDataState();
}

class _PersonalDataState extends State<PersonalData> {
  final _formKey = GlobalKey<FormState>();

  // Controllers for the fields
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _phoneController;
  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;

  // Password visibility states
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  
  bool _isLoading = false;

  // Image picker variables
  File? _imageFile;
  bool _isUploadingImage = false;

  @override
  void initState() {
    super.initState();
    // Initialize controllers with the existing user data
    _firstNameController = TextEditingController(text: widget.user.firstName);
    _lastNameController = TextEditingController(text: widget.user.lastName);
    _phoneController = TextEditingController(text: widget.user.phoneNumber);
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    // Dispose of controllers when not needed
    _firstNameController.dispose();
    _lastNameController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  // Toggle visibility of the Change Password field
  void _togglePasswordView() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  // Toggle visibility of the Confirm Password field
  void _toggleConfirmPasswordView() {
    setState(() {
      _obscureConfirmPassword = !_obscureConfirmPassword;
    });
  }

  // Function to pick an image
  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _isUploadingImage = true;
      });

      // Simulating image upload with a delay
      await Future.delayed(const Duration(seconds: 2));

      setState(() {
        _imageFile = File(pickedFile.path);
        _isUploadingImage = false;
      });
    }
  }

  // Alphanumeric and symbol password validator
  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a new password';
    } else if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }

    // Check for at least one letter, one number, and one special character
    final regex = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{6,}$');
    if (!regex.hasMatch(value)) {
      return 'Password must contain at least one letter, one number, and one symbol';
    }

    return null;
  }

  void _updateInfo() async {
    if (_formKey.currentState!.validate()) {
      // Show progress indicator while updating
      setState(() {
        _isLoading = true;
      });

      // Prepare updated user data
      UserModel updatedUser = widget.user.copyWith(
        firstName: _firstNameController.text,
        lastName: _lastNameController.text,
        phoneNumber: _phoneController.text,
        profilePicture: _imageFile != null ? _imageFile!.path : widget.user.profilePicture,
      );

      // If there's an image, upload it to Firebase Storage and get the URL
      if (_imageFile != null) {
        try {
          final imageUrl = await UserRepository.instance.uploadImage(
            "profile_pictures/${widget.user.id}",
            XFile(_imageFile!.path),
          );
          updatedUser = updatedUser.copyWith(profilePicture: imageUrl);
        } catch (e) {
          _showSnackbar('Image upload failed', e.toString(), ContentType.failure);
        }
      }

      // Update user info in Firestore
      try {
        await UserRepository.instance.updateUserDetails(updatedUser);

        // Notify success
        _showSnackbar('Success', 'Successfully updated your personal info', ContentType.success);

        // Pop and send the updated user data back
        Navigator.pop(context, updatedUser);
      } catch (e) {
        _showSnackbar('Update failed', e.toString(), ContentType.failure);
      }

      setState(() {
        _isLoading = false;
      });
    }
  }

  // Show Snackbar using AwesomeSnackbarContent
  void _showSnackbar(String title, String message, ContentType type) {
    final snackBar = SnackBar(
      content: AwesomeSnackbarContent(
        title: title,
        message: message,
        contentType: type,
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      behavior: SnackBarBehavior.floating,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Personal Data'),
          centerTitle: true,
        ),
        body: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Center(
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  _isUploadingImage
                      ? const CircularProgressIndicator()
                      : CircleAvatar(
                          radius: 50,
                          backgroundImage: _imageFile != null
                              ? FileImage(_imageFile!)
                              : widget.user.profilePicture.isNotEmpty
                                  ? NetworkImage(widget.user.profilePicture)
                                  : const AssetImage('assets/default_avatar.png')
                                      as ImageProvider,
                          child: _imageFile == null && widget.user.profilePicture.isEmpty
                              ? const Icon(Iconsax.user, size: 40)
                              : null,
                        ),
                  Positioned(
                    bottom: 0,
                    right: -18,
                    child: IconButton(
                      onPressed: _pickImage,
                      icon: const Icon(Iconsax.edit, size: 24),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _firstNameController,
                    decoration: const InputDecoration(
                      labelText: 'First Name',
                      prefixIcon: Icon(Iconsax.user),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _lastNameController,
                    decoration: const InputDecoration(
                      labelText: 'Last Name',
                      prefixIcon: Icon(Iconsax.user),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _phoneController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your phone number';
                      } else if (value.length != 11) {
                        return 'Phone number must be 11 digits';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Phone Number',
                      prefixIcon: Icon(Icons.phone),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Change Password Field
                  TextFormField(
                    controller: _passwordController,
                    validator: _validatePassword,
                    obscureText: _obscurePassword,
                    decoration: InputDecoration(
                      labelText: 'Change Password',
                      prefixIcon: const Icon(Iconsax.password_check),
                      suffixIcon: IconButton(
                        icon: Icon(_obscurePassword ? Iconsax.eye_slash : Iconsax.eye),
                        onPressed: _togglePasswordView,
                      ),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Confirm Password Field
                  TextFormField(
                    controller: _confirmPasswordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please confirm your password';
                      } else if (value != _passwordController.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                    obscureText: _obscureConfirmPassword,
                    decoration: InputDecoration(
                      labelText: 'Confirm Password',
                      prefixIcon: const Icon(Iconsax.password_check),
                      suffixIcon: IconButton(
                        icon: Icon(_obscureConfirmPassword ? Iconsax.eye_slash : Iconsax.eye),
                        onPressed: _toggleConfirmPasswordView,
                      ),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  _isLoading
                      ? const CircularProgressIndicator()
                       : ElevatedButton(
                          onPressed: _updateInfo,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            padding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 20),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                            ),
                          ),
                          child: const Text(
                            'Update Personal Info',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                       ), 
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
