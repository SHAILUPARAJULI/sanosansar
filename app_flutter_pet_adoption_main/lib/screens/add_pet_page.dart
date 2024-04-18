import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddPetPage extends StatefulWidget {
  @override
  _AddPetPageState createState() => _AddPetPageState();
}

class _AddPetPageState extends State<AddPetPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _imageUrlController = TextEditingController();
  TextEditingController _petNameController = TextEditingController();
  TextEditingController _locationController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _rateController = TextEditingController();
  TextEditingController _idController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  TextEditingController _ownerNameController = TextEditingController();
  TextEditingController _ownerPhotoUrlController = TextEditingController();
  TextEditingController _sexController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  TextEditingController _colorController = TextEditingController();
  TextEditingController _albumController = TextEditingController();

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
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
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

  void _submitForm() async {
    // Prepare pet data
    Map<String, dynamic> petData = {
      "imageUrl": _imageUrlController.text,
      "petName": _petNameController.text,
      "location": _locationController.text,
      "description": _descriptionController.text,
      "rate": double.parse(_rateController.text),
      "petId": _idController.text,
      "price": double.parse(_priceController.text),
      "ownerName": _ownerNameController.text,
      "ownerPhotoUrl": _ownerPhotoUrlController.text,
      "sex": _sexController.text,
      "age": _ageController.text,
      "color": _colorController.text,
      "albumUrls": _albumController.text.split(','),
    };

    // Send POST request to PHP script
    Uri url = Uri.parse('http://your_server_address/add_pet.php');
    var response = await http.post(url, body: petData);

    // Check response status
    if (response.statusCode == 200) {
      // Pet added successfully
      print('Pet added successfully');
    } else {
      // Error adding pet
      print('Error adding pet: ${response.body}');
    }
  }
}
