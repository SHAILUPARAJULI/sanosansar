import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> pets = []; // List to hold pet data
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    // Fetch data when the widget is initialized
    fetchData();
  }

  // Function to fetch data from the database
  Future<void> fetchData() async {
    // Make a GET request to fetch pet data from the database
    final response = await http.get(Uri.parse('http://localhost:3000/pets'));
    if (response.statusCode == 200) {
      // If the request is successful, parse the response body
      final List<dynamic> jsonData = jsonDecode(response.body);
      // Update the pets list with the fetched data
      setState(() {
        pets = jsonData.cast<Map<String, dynamic>>();
        isLoading = false;
      });
    } else {
      // If the request fails, handle the error
      // You can show an error message or retry logic here
      print('Failed to fetch data: ${response.statusCode}');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Display the carousel with pet data or placeholder if no data available
            isLoading ? _buildPlaceholder() : _buildCarousel(),
          ],
        ),
      ),
    );
  }

  // Function to build the placeholder widget
  Widget _buildPlaceholder() {
    return Center(
      child: CircularProgressIndicator(), // Or any other placeholder widget
    );
  }

  // Function to build the carousel with pet data
  Widget _buildCarousel() {
    double width = MediaQuery.of(context).size.width * 0.8;
    return CarouselSlider(
      options: CarouselOptions(
        height: 400,
        enlargeCenterPage: true,
        disableCenter: true,
        viewportFraction: 0.8,
      ),
      items: pets.map((pet) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: width,
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    pet['image'], // URL of the pet image
                    fit: BoxFit.cover,
                    height: 200,
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      pet['name'], // Name of the pet
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                  // Add other details of the pet here
                  // For example: Age, sex, color, etc.
                ],
              ),
            );
          },
        );
      }).toList(),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}
