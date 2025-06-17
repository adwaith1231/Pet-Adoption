import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(PetAdoptionApp());
}

class PetAdoptionApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pet Adoption',
      theme: ThemeData(primarySwatch: Colors.orange),
      home: PetHomePage(),
    );
  }
}

class PetHomePage extends StatelessWidget {
  final List<Map<String, String>> pets = [
    {
      'name': 'Gracie',
      'breed': 'Golden Retriever',
      'gender': 'Female',
      'age': '7 months',
      'image':
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ9sdY0YrxTv2qP-EKpiOozVk11R2wamdZtKQ&s',
    },
    {
      'name': 'Whiskers',
      'breed': 'Siamese',
      'gender': 'Male',
      'age': '2 Years',
      'image':
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRGwWUxSKkbWNr_3GNckNAkMQW03zVRSXT-UQ&s'
    },
    {
      'name': 'Max',
      'breed': 'Beagle',
      'gender': 'Male',
      'age': '1 Year',
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

  final List<String> categories = ['Dogs', 'Cats', 'Rabbits', 'Birds'];

  final List<String> carouselImages = [
    'https://www.ferplast.com/cdn/shop/collections/3000x750px_03_PICCOLI_ANIMALI_Sottocategorie-1_GABBIE-RODITORI_1400x.jpg?v=1604493475',
    'https://embed-ssl.wistia.com/deliveries/832b06f0b4b9a72214e6cd1733da1f57.webp?image_crop_resized=960x540',
    'https://cdnblog.fly.homes/uploads/2023/12/List-of-Legal-Pets-in-Australia.webp',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text(
          'Looking for Love',
          style: TextStyle(
              color: Colors.red, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: CircleAvatar(
              backgroundImage:
              NetworkImage('https://i.imgur.com/zL4Krbz.jpg'),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider(
              items: carouselImages.map((imageUrl) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                );
              }).toList(),
              options: CarouselOptions(
                height: 180,
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 16 / 9,
                viewportFraction: 0.9,
              ),
            ),
            SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: categories
                    .map((category) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: Chip(
                    label: Text(category),
                    backgroundColor: Colors.grey[300],
                  ),
                ))
                    .toList(),
              ),
            ),
            SizedBox(height: 16),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: pets.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 0.75,
              ),
              padding: EdgeInsets.all(12),
              itemBuilder: (context, index) {
                final pet = pets[index];
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      )
                    ],
                  ),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius:
                        BorderRadius.vertical(top: Radius.circular(16)),
                        child: Image.network(
                          pet['image']!,
                          height: 100,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextButton(onPressed: (){}, child: Text(pet['name']!,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16)),),
                            Text(pet['breed']!,
                                style: TextStyle(color: Colors.grey[600])),
                            Row(
                              children: [
                                Icon(
                                  pet['gender'] == 'Female'
                                      ? Icons.female
                                      : Icons.male,
                                  size: 14,
                                  color: pet['gender'] == 'Female'
                                      ? Colors.pink
                                      : Colors.blue,
                                ),
                                SizedBox(width: 4),
                                Text(pet['gender']!),
                                Spacer(),
                                Text(pet['age']!),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
