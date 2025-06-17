import 'package:flutter/material.dart';

void main() {
  runApp(PetDetailsApp());
}

class PetDetailsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pet Adoption Details',
      debugShowCheckedModeBanner: false,
      home: PetDetailsPage(),
    );
  }
}

class PetDetailsPage extends StatelessWidget {
  final String petName = 'Bella';
  final String petBreed = 'Golden Retriever';
  final String petAge = '2 Years';
  final String petDescription =
      'Bella is a friendly and active Golden Retriever who loves to play and cuddle. She is vaccinated and well-trained. Looking for a loving forever home.';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adopt $petName'),
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Pet Image
            Container(
              width: double.infinity,
              height: 300,
              child: Image.network(
                'https://placedog.net/640/480?id=10',
                fit: BoxFit.cover,
              ),
            ),

            // Pet Info
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    petName,
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '$petBreed • $petAge',
                    style: TextStyle(fontSize: 18, color: Colors.grey[700]),
                  ),
                  SizedBox(height: 16),
                  Text(
                    petDescription,
                    style: TextStyle(fontSize: 16, height: 1.5),
                  ),
                  SizedBox(height: 30),

                  // Adopt Button
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Adoption Request Sent for $petName!'),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Text(
                        'Adopt Now',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
