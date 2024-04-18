import 'package:http/http.dart' as http;
import 'dart:convert';

var profile = "https://avatars.githubusercontent.com/u/86506519?v=4";

List categories = [
  {
    "name" : "All",
    "icon" :  "assets/icons/pet-border.svg"
  },
  {
    "name" : "Dog",
    "icon" :  "assets/icons/dog.svg"
  },
  {
    "name" : "Cat",
    "icon" :  "assets/icons/cat.svg"
  },
  {
    "name" : "Parrot",
    "icon" :  "assets/icons/parrot.svg"
  },
  {
    "name" : "Rabbit",
    "icon" :  "assets/icons/rabbit.svg"
  },
  {
    "name" : "Fish",
    "icon" :  "assets/icons/fish.svg"
  },
  {
    "name" : "Turtle",
    "icon" :  "assets/icons/turtle.svg"
  },
];

List pets = [];

var chats = [
  {
    "image": "https://images.unsplash.com/photo-1544005313-94ddf0286df2?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MjV8fHByb2ZpbGV8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "fname" : "John",
    "lname" : "Siphron",
    "name": "John Siphron",
    "skill": "Dermatologists",
    "last_text": "Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document",
    "date": "1 min",
    "notify" : 4,
  },
  // Add other chat data here...
];

// PHP code integration


Future<void> fetchPets() async {
  try {
    var petsResponse = await http.get(Uri.parse('http://192.168.1.66/dashboard/php_scripts/add_pet.php'));
    if (petsResponse.statusCode == 200) {
      pets = json.decode(petsResponse.body);
    } else {
      throw Exception('Failed to load pets');
    }
  } catch (e) {
    print('Error fetching pets: $e');
  }
}

void main() async {
  try {
    await fetchPets();
    // Print the fetched pets to verify
    print('Pets: $pets');
  } catch (e) {
    print('Error: $e');
  }
}
