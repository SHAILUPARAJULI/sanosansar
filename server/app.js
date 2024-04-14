// app.js

const express = require('express');
const mongoose = require('mongoose');
const authRoutes = require('./routes/auth');

const app = express();

// Middleware
app.use(express.json());

// Routes
app.use('/auth', authRoutes);

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