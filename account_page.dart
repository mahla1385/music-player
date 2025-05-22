import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State {
  File? _profileImage;
  final picker = ImagePicker();
  String username = 'testUser';
  String email = 'test@example.com';
  double credit = 150.0;
  String subscriptionType = 'Normal';
  bool isDarkTheme = false;

  Future _pickImage(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  void _goToPaymentPage(String reason) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => PaymentPage(reason: reason)));
  }

  void _editInfo() {
    // Navigate to an edit screen or show dialog
  }

  void _contactSupport() {
    // Navigate to support chat screen
  }

  void _deleteAccount() {
    // Confirmation and deletion logic
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Account')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => _showImagePickerOptions(),
              child: CircleAvatar(
                radius: 50,
                backgroundImage:
                _profileImage != null ? FileImage(_profileImage!) : AssetImage('assets/images/default_avatar.png') as ImageProvider,
              ),
            ),
            SizedBox(height: 16),
            Text('Username: $username'),
            Text('Email: $email'),
            SizedBox(height: 8),
            ElevatedButton(onPressed: _editInfo, child: Text('Edit Info')),
            Divider(),
            Text('Credit: \$${credit.toStringAsFixed(2)}'),
            ElevatedButton(
              onPressed: () { Navigator.pushNamed(context, '/payment');},
              child: Text('Increase Credit'),
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Theme'),
                Switch(
                  value: isDarkTheme,
                  onChanged: (val) {
                    setState(() => isDarkTheme = val);
                    // Change app theme logic
                  },
                ),
              ],
            ),
            Divider(),
            Text('Subscription: $subscriptionType'),
            ElevatedButton(
              onPressed: () {Navigator.pushNamed(context, '/payment');},
              child: Text('Buy Premium Subscription'),
            ),
            Divider(),
            ElevatedButton(
              onPressed: _contactSupport,
              child: Text('Contact Support'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _deleteAccount,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: Text('Delete Account'),
            ),
          ],
        ),
      ),
    );
  }

  void _showImagePickerOptions() {
    showModalBottomSheet(
      context: context,
      builder: (context) => Wrap(
        children: [
          ListTile(
            leading: Icon(Icons.photo_library),
            title: Text('Choose from gallery'),
            onTap: () {
              Navigator.pop(context);
              _pickImage(ImageSource.gallery);
            },
          ),
          ListTile(
            leading: Icon(Icons.camera_alt),
            title: Text('Take a picture'),
            onTap: () {
              Navigator.pop(context);
              _pickImage(ImageSource.camera);
            },
          ),
        ],
      ),
    );
  }
}

class PaymentPage extends StatelessWidget {
  final String reason;
  PaymentPage({required this.reason});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Payment')),
      body: Center(child: Text('Payment page for: $reason')),
    );
  }
}