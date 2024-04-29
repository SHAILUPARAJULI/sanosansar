import React, { useState } from 'react';
import { Button } from '@chakra-ui/react';
import { FaTrash, FaEdit } from 'react-icons/fa';

export const DogsCard = ({ _id, name, breed, age, location, price, deleteDogsData, handleEditDog, newData }) => {
  const [isEditing, setIsEditing] = useState(false);
  const [editedData, setEditedData] = useState({
    name: name,
    breed: breed,
    age: age,
    location: location,
    price: price
  });

  const handleInputChange = (e) => {
    const { name, value } = e.target;
    setEditedData((prevData) => ({
      ...prevData,
      [name]: value
    }));
  };

  const handleSave = () => {
    handleEditDog(_id, editedData);
    setIsEditing(false);
  };

  return (
    <div>
      <div key={_id} style={{ marginTop: '10px', padding: '20px', boxShadow: 'rgba(0, 0, 0, 0.24) 0px 3px 8px' }}>
        {isEditing ? (
          <div>
            <input type="text" name="name" value={editedData.name} onChange={handleInputChange} />
            <input type="text" name="breed" value={editedData.breed} onChange={handleInputChange} />
            <input type="text" name="age" value={editedData.age} onChange={handleInputChange} />
            <input type="text" name="location" value={editedData.location} onChange={handleInputChange} />
            <input type="text" name="price" value={editedData.price} onChange={handleInputChange} />
            <Button mt="15px" colorScheme="green" onClick={handleSave}>Save</Button>
          </div>
        ) : (
          <div>
            <p style={{ fontWeight: 'bold', fontSize: '20px' }}> <span style={{ fontWeight: 'bold' }}>Name :- </span> {name}</p>
            <p> <span style={{ fontWeight: 'bold' }}>Breed :- </span> {breed}</p>
            <p> <span style={{ fontWeight: 'bold' }}>Age :- </span> {age}</p>
            <p> <span style={{ fontWeight: 'bold' }}>Location :- </span> {location}</p>
            <p> <span style={{ fontWeight: 'bold' }}>Price :- </span> {price}</p>
            <Button mt="15px" colorScheme="red" onClick={() => deleteDogsData(_id)}> <FaTrash /> </Button>
            <Button mt="15px" ml="10px" colorScheme="teal" onClick={() => setIsEditing(true)}> <FaEdit /> Edit </Button>
          </div>
        )}
      </div>
    </div>
  );
};
