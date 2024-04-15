const mongoose = require('mongoose');

// Define the schema for the Pet model
const petSchema = new mongoose.Schema({
  image: {
    type: String,
    required: true
  },
  name: {
    type: String,
    required: true
  },
  location: {
    type: String,
    required: true
  },
  is_favorited: {
    type: Boolean,
    default: false
  },
  description: {
    type: String,
    required: true
  },
  rate: {
    type: Number,
    required: true
  },
  price: {
    type: String,
    required: true
  },
  owner_name: {
    type: String,
    required: true
  },
  owner_photo: {
    type: String,
    required: true
  },
  sex: {
    type: String,
    required: true
  },
  age: {
    type: String,
    required: true
  },
  color: {
    type: String,
    required: true
  },
  album: {
    type: [String],
    required: true
  }
});

// Create the Pet model based on the schema
const Pet = mongoose.model('Pet', petSchema);

// Export the Pet model
module.exports = Pet;
