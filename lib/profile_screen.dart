
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: ListView(
          children: [
            nameTextField(), 
            SizedBox(height: 20,),
            professionTextField(),
             SizedBox(height: 20,),
            dobField(),
             SizedBox(height: 20,),
            titleTextField(),
             SizedBox(height: 20,),
            aboutTextField(),
               SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
  

  Widget nameTextField(){
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.teal)
        ),
        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.orange, width: 2)),
        prefixIcon: Icon(Icons.person, color: Colors.green,),
        labelText: 'Name',
        helperText: 'Name cant be empty',
        hintText: 'Dev Stack'
      ),
    );
  }
  Widget professionTextField(){
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.teal)
        ),
        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.orange, width: 2)),
        prefixIcon: Icon(Icons.person, color: Colors.green,),
        labelText: 'Profession',
        helperText: 'Profession cant be empty',
        hintText: 'Full Stack Developer'
      ),
    );
  }
  Widget dobField(){
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.teal)
        ),
        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.orange, width: 2)),
        prefixIcon: Icon(Icons.person, color: Colors.green,),
        labelText: 'Date of Birth',
        helperText: 'Provide DOB on dd/mm/yyyy',
        hintText: '01/01/2020'
      ),
    );
  }
  Widget titleTextField(){
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.teal)
        ),
        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.orange, width: 2)),
        prefixIcon: Icon(Icons.person, color: Colors.green,),
        labelText: 'Title',
        helperText: 'It cant be empty',
        hintText: 'Flutter Developer'
      ),
    );
  }
  Widget aboutTextField(){
    return TextFormField(
      maxLines: 4,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.teal)
        ),
        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.orange, width: 2)),
        
        labelText: 'About',
        helperText: 'Write about yourself',
        hintText: ' I am Dev Stack'
      ),
    );
  }
}