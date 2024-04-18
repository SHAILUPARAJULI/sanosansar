import 'package:flutter/material.dart';
import 'add_pet_page.dart'; // Import the AddPetPage class from the new file

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool _darkModeEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionHeader('Theme Settings'),
            _buildSwitchSettingItem('Dark Mode', _darkModeEnabled, _handleDarkModeChanged),
            _buildDivider(),
            _buildSectionHeader('Language Settings'),
            _buildSettingItem('Change Language', Icons.language),
            _buildDivider(),
            _buildAdminFeatureButton('Add New Pet for Adoption', Icons.pets, context),
            _buildDivider(),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildSettingItem(String title, IconData icon) {
    return Card(
      elevation: 4.0,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          _handleSettingItemTap(title);
        },
      ),
    );
  }

  Widget _buildSwitchSettingItem(String title, bool value, ValueChanged<bool> onChanged) {
    return Card(
      elevation: 4.0,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: SwitchListTile(
        title: Text(title),
        value: value,
        onChanged: onChanged,
      ),
    );
  }

  Widget _buildAdminFeatureButton(String title, IconData icon, BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        _buildAdminFeatureDialog(context);
      },
      icon: Icon(icon),
      label: Text(title),
    );
  }

  Widget _buildDivider() {
    return Divider(thickness: 1.0);
  }

  void _buildAdminFeatureDialog(BuildContext context) {
    TextEditingController adminKeyController = TextEditingController();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add New Pet for Adoption'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('This feature is exclusive to admins.'),
              TextField(
                controller: adminKeyController,
                decoration: InputDecoration(labelText: 'Enter Admin Key'),
                obscureText: true,
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                String adminKey = adminKeyController.text;
                if (adminKey == '2057') {
                  Navigator.of(context).pop(); // Close the dialog
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddPetPage()),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Invalid admin key. Please try again.'),
                  ));
                }
              },
              child: Text('Verify'),
            ),
          ],
        );
      },
    );
  }

  void _handleSettingItemTap(String title) {
    // Handle tap based on the setting item title
    switch (title) {
      case 'Change Language':
      // Navigate to language selection screen
        break;
      case 'Change Password':
      // Navigate to change password screen
        break;
      case 'Logout':
      // Perform logout action
        break;
      case 'Terms of Service':
      // Navigate to terms of service screen
        break;
      case 'Privacy Policy':
      // Navigate to privacy policy screen
        break;
      default:
        break;
    }
  }

  void _handleDarkModeChanged(bool newValue) {
    setState(() {
      _darkModeEnabled = newValue;
      // Implement dark mode functionality here
    });
  }
}
