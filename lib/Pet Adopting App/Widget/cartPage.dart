import 'package:flutter/material.dart';
import 'package:flutterproject/Pet%20Adopting%20App/Widget/Payment.dart';
import 'package:flutterproject/Pet%20Adopting%20App/Widget/homePage.dart';

void main() {
  runApp(Cartpage());
}

class Cartpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CartPage(),
    );
  }
}

class CartPage extends StatelessWidget {
  final List<Map<String, String>> pets = [
    {
      'name': 'Whiskers',
      'breed': 'Siamese Cat',
      'gender': 'Female',
      'age': '4 years',
      'price': '₹8000.00',
      'image':
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRGwWUxSKkbWNr_3GNckNAkMQW03zVRSXT-UQ&s'
    },
    {
      'name': 'Gracie',
      'breed': 'Golden Retriever',
      'gender': 'female',
      'age': '7 moths',
      'price': '₹15000.00',
      'image':
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ9sdY0YrxTv2qP-EKpiOozVk11R2wamdZtKQ&s'
    },
    {
      'name': 'Max',
      'breed': 'Beagle',
      'gender': 'male',
      'age': '1 year',
      'price': '₹9000.00',
      'image':
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT9xYMMNAnjwliV8opAZXyCBj9L505H5USQWA&s'
    },
    {
      'name': 'Thumper',
      'breed': 'Holland Lop',
      'gender': 'Female',
      'age': '6 months',
      'image':
      'https://static.vecteezy.com/system/resources/thumbnails/054/604/970/small/adorable-holland-lop-bunny-sitting-on-a-soft-brown-fabric-photo.jpg'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF6F0),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Cart'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => PetAdoptionApp()),
            );
          },
        ),
      ),
      body: ListView.builder(
        itemCount: pets.length,
        itemBuilder: (context, index) {
          final pet = pets[index];
          return Card(
            margin: EdgeInsets.all(12),
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                children: [
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          pet['image']!,
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(pet['name']!,
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                            SizedBox(height: 4),
                            Text(pet['breed']!),
                            Text("Gender: ${pet['gender']}"),
                            Text("Age: ${pet['age']}"),
                            Text(
                              pet['price']!,
                              style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        padding: EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PaymentApp()),
                        );
                      },
                      child: Text('Adopt Now'),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
