import 'package:flutter/material.dart';

class AddPetPage extends StatefulWidget {
  @override
  _AddPetPageState createState() => _AddPetPageState();
}

class _AddPetPageState extends State<AddPetPage> {
  final _formKey = GlobalKey<FormState>();
  String _imageUrl = '';
  String _petName = '';
  String _location = '';
  bool _isFavorited = false;
  String _description = '';
  double _rate = 0.0;
  String _id = '';
  double _price = 0.0;
  String _ownerName = '';
  String _ownerPhotoUrl = '';
  String _sex = '';
  String _age = '';
  String _color = '';
  List<String> _album = [];

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.blueAccent,
        scaffoldBackgroundColor: Colors.white,
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Add New Pet'),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ListTile(
                  title: Text('Pet Information'),
                  leading: Icon(Icons.arrow_right),
                ),
                Divider(),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Image URL'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the pet image URL';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _imageUrl = value!;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the pet name';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _petName = value!;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Location'),
                  onSaved: (value) {
                    _location = value!;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Description'),
                  maxLines: 3,
                  onSaved: (value) {
                    _description = value!;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Rate'),
                  keyboardType: TextInputType.number,
                  onSaved: (value) {
                    _rate = double.parse(value!);
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'ID'),
                  onSaved: (value) {
                    _id = value!;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Price'),
                  keyboardType: TextInputType.number,
                  onSaved: (value) {
                    _price = double.parse(value!);
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Owner Name'),
                  onSaved: (value) {
                    _ownerName = value!;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Owner Photo URL'),
                  onSaved: (value) {
                    _ownerPhotoUrl = value!;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Sex'),
                  onSaved: (value) {
                    _sex = value!;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Age'),
                  onSaved: (value) {
                    _age = value!;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Color'),
                  onSaved: (value) {
                    _color = value!;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Album URLs (comma-separated)'),
                  onSaved: (value) {
                    _album = value!.split(',');
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      // Call a function to submit the form data
                      _submitForm();
                    }
                  },
                  child: Text('Add Pet'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: Colors.blueAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _submitForm() {
    // Use the collected form data to create and save the new pet entry
    // For example, you can print the data to see the values
    print('Pet Name: $_petName');
    print('Image URL: $_imageUrl');
    print('Location: $_location');
    print('Description: $_description');
    print('Rate: $_rate');
    print('ID: $_id');
    print('Price: $_price');
    print('Owner Name: $_ownerName');
    print('Owner Photo URL: $_ownerPhotoUrl');
    print('Sex: $_sex');
    print('Age: $_age');
    print('Color: $_color');
    print('Album: $_album');

  }
}

