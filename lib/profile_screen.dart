import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  XFile? _imageFile;

  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: ListView(
          children: [
            imageProfile(context),
            SizedBox(height: 20),
            nameTextField(),
            SizedBox(height: 20),
            professionTextField(),
            SizedBox(height: 20),
            dobField(),
            SizedBox(height: 20),
            titleTextField(),
            SizedBox(height: 20),
            aboutTextField(),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget bottomSheet(BuildContext context) {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          Text('Choose profile photo', style: TextStyle(fontSize: 20)),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton.icon(
                onPressed: () {
                  takePhoto(ImageSource.camera);
                },
                icon: Icon(Icons.camera),
                label: Text('Camera'),
              ),

              TextButton.icon(
                onPressed: () {
                  takePhoto(ImageSource.gallery);
                },
                icon: Icon(Icons.image),
                label: Text('Gallery'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget imageProfile(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          CircleAvatar(
            radius: 80,
            backgroundImage:
                _imageFile == null
                    ? AssetImage('assets/profile_img.jpg') as ImageProvider
                    : FileImage(File(_imageFile!.path)) as ImageProvider,
          ),

          Positioned( 
            bottom: 20,
            right: 0,
            child: InkWell(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: ((builder) => bottomSheet(context)),
                );
              },
              child: Icon(Icons.camera_alt, color: Colors.teal, size: 30),
            ),
          ),
        ],
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    setState(() {
      _imageFile = pickedFile;
    });
  }

  Widget nameTextField() {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(borderSide: BorderSide(color: Colors.teal)),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.orange, width: 2),
        ),
        prefixIcon: Icon(Icons.person, color: Colors.green),
        labelText: 'Name',
        helperText: 'Name cant be empty',
        hintText: 'Dev Stack',
      ),
    );
  }

  Widget professionTextField() {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(borderSide: BorderSide(color: Colors.teal)),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.orange, width: 2),
        ),
        prefixIcon: Icon(Icons.person, color: Colors.green),
        labelText: 'Profession',
        helperText: 'Profession cant be empty',
        hintText: 'Full Stack Developer',
      ),
    );
  }

  Widget dobField() {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(borderSide: BorderSide(color: Colors.teal)),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.orange, width: 2),
        ),
        prefixIcon: Icon(Icons.person, color: Colors.green),
        labelText: 'Date of Birth',
        helperText: 'Provide DOB on dd/mm/yyyy',
        hintText: '01/01/2020',
      ),
    );
  }

  Widget titleTextField() {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(borderSide: BorderSide(color: Colors.teal)),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.orange, width: 2),
        ),
        prefixIcon: Icon(Icons.person, color: Colors.green),
        labelText: 'Title',
        helperText: 'It cant be empty',
        hintText: 'Flutter Developer',
      ),
    );
  }

  Widget aboutTextField() {
    return TextFormField(
      maxLines: 4,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderSide: BorderSide(color: Colors.teal)),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.orange, width: 2),
        ),

        labelText: 'About',
        helperText: 'Write about yourself',
        hintText: ' I am Dev Stack',
      ),
    );
  }
}
