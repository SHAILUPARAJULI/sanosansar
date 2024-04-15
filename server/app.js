const express = require('express');
const mongoose = require('mongoose');
const bodyParser = require('body-parser');
const Pet = require('./models/Pet'); // Assuming you have a Pet model

const app = express();

// Middleware
app.use(bodyParser.json());

// Routes
app.get('/api/pets', async (req, res) => {
  try {
    const pets = await Pet.find(); // Fetch all pets from the database
    res.status(200).json(pets); // Send the pets as JSON response
  } catch (error) {
    console.error('Failed to fetch pets:', error);
    res.status(500).json({ error: 'Failed to fetch pets' }); // Handle error
  }
});

// MongoDB connection
mongoose.connect('mongodb://localhost:27017/myapp', {
  useNewUrlParser: true,
  useUnifiedTopology: true
})
.then(() => console.log('Connected to MongoDB'))
.catch(error => console.error('MongoDB connection error:', error));

// Start server
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => console.log(`Server running on port ${PORT}`));