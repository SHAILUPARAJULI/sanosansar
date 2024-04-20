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
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Pet'),
      ),
<<<<<<< Updated upstream
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
=======
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _imageUrlController,
                decoration: InputDecoration(labelText: 'Image URL'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the pet image URL';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _petNameController,
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the pet name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _locationController,
                decoration: InputDecoration(labelText: 'Location'),
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
                maxLines: 3,
              ),
              TextFormField(
                controller: _rateController,
                decoration: InputDecoration(labelText: 'Rate'),
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                controller: _idController,
                decoration: InputDecoration(labelText: 'ID'),
              ),
              TextFormField(
                controller: _priceController,
                decoration: InputDecoration(labelText: 'Price'),
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                controller: _ownerNameController,
                decoration: InputDecoration(labelText: 'Owner Name'),
              ),
              TextFormField(
                controller: _ownerPhotoUrlController,
                decoration: InputDecoration(labelText: 'Owner Photo URL'),
              ),
              TextFormField(
                controller: _sexController,
                decoration: InputDecoration(labelText: 'Sex'),
              ),
              TextFormField(
                controller: _ageController,
                decoration: InputDecoration(labelText: 'Age'),
              ),
              TextFormField(
                controller: _colorController,
                decoration: InputDecoration(labelText: 'Color'),
              ),
              TextFormField(
                controller: _albumController,
                decoration: InputDecoration(labelText: 'Album URLs (comma-separated)'),
              ),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    await _submitForm();
                  }
                },
                child: Text('Add Pet'),
              ),
            ],
>>>>>>> Stashed changes
          ),
        ),
      ),
    );
  }

<<<<<<< Updated upstream
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

=======
  Future<void> _submitForm() async {
    var url = Uri.parse('http://192.168.1.66/dashboard/php_scripts/insert_pets.php');
    var response = await http.post(
      url,
      body: {
        'image_url': _imageUrlController.text,
        'pet_name': _petNameController.text,
        'location': _locationController.text,
        'description': _descriptionController.text,
        'rate': _rateController.text,
        'id': _idController.text,
        'price': _priceController.text,
        'owner_name': _ownerNameController.text,
        'owner_photo_url': _ownerPhotoUrlController.text,
        'sex': _sexController.text,
        'age': _ageController.text,
        'color': _colorController.text,
        'album': _albumController.text,
      },
    );

    if (response.statusCode == 200) {
      print('Pet added successfully!');
    } else {
      print('Failed to add pet: ${response.body}');
    }
  }
}

void main() {
  runApp(MaterialApp(
    home: AddPetPage(),
  ));
}
>>>>>>> Stashed changes
