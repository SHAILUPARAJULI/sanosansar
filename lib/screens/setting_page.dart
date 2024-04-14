import 'package:flutter/material.dart';
import 'add_pet_page.dart'; // Import the AddPetPage class from the new file

class SettingPage extends StatelessWidget {
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
            _buildSettingItem('Dark Mode', Icons.dark_mode),
            _buildDivider(),
            _buildSectionHeader('Language Settings'),
            _buildSettingItem('Change Language', Icons.language),
            _buildDivider(),
            _buildSectionHeader('Notification Preferences'),
            _buildSwitchSettingItem('Receive Notifications', true),
            _buildSwitchSettingItem('Sound Notifications', false),
            _buildDivider(),
            _buildSectionHeader('Account Settings'),
            _buildSettingItem('Change Password', Icons.lock),
            _buildSettingItem('Logout', Icons.exit_to_app),
            _buildDivider(),
            _buildAdminFeatureButton('Add New Pet for Adoption', Icons.pets, context),
            _buildDivider(),
            _buildSectionHeader('About and Legal'),
            _buildSettingItem('App Version', Icons.info),
            _buildSettingItem('Terms of Service', Icons.rule),
            _buildSettingItem('Privacy Policy', Icons.privacy_tip),
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

  Widget _buildSwitchSettingItem(String title, bool value) {
    return Card(
      elevation: 4.0,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: SwitchListTile(
        title: Text(title),
        value: value,
        onChanged: (newValue) {
          _handleSwitchValueChanged(title, newValue);
        },
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

  void _handleSwitchValueChanged(String title, bool newValue) {
    // Handle switch value change based on the setting item title
    switch (title) {
      case 'Receive Notifications':
      // Update notification preferences
        break;
      case 'Sound Notifications':
      // Update sound notification preferences
        break;
      default:
        break;
    }
  }
}