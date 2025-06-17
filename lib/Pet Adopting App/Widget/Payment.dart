import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'paymentDone.dart'; // Make sure this file exists and has a PaymentDone widget

void main() {
  runApp(PaymentApp());
}

class PaymentApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CheckoutPage(),
      theme: ThemeData.dark(),
    );
  }
}

class CheckoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Checkout', style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 10,
                    spreadRadius: 2,
                    offset: Offset(0, 5),
                  )
                ],
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    'https://www.connectingthedotsinfin.tech/content/images/2024/05/visa-mastercard-logos.jpg',
                    width: 60,
                    height: 70,
                  ),
                  SizedBox(height: 10),
                  Text(
                    '8154 3265 0045 1582',
                    style: TextStyle(
                      fontSize: 20,
                      letterSpacing: 2,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Exp date: 07/20'),
                      Text('CVV: 007'),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 30),
            Text('Or Checkout With', style: TextStyle(color: Colors.grey)),
            SizedBox(height: 20),
            paymentButton(
              'PayPal',
              'https://static.vecteezy.com/system/resources/previews/044/625/954/non_2x/paypal-logotype-on-white-background-paypal-logo-debit-electronic-payment-system-financial-management-electronic-wallet-nfc-banking-app-bank-application-editorial-free-vector.jpg',
            ),
            SizedBox(height: 10),
            paymentButton(
              'Apple Pay',
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQcYzY7Y0UjL7dKukVUFhaF-VXugb-fTrnF-o_7SqlaDbYd3xTT4wqrCDWHLofs9G-UVGc&usqp=CAU',
            ),
            Spacer(),
            Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                gradient: LinearGradient(
                  colors: [Colors.black, Colors.black],
                ),
              ),
              child: Center(
                child: TextButton(
                  onPressed: () async {
                    // Show loading
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (context) => Center(
                        child: CircularProgressIndicator(),
                      ),
                    );

                    // Simulate delay
                    await Future.delayed(Duration(seconds: 2));
                    Navigator.pop(context); // Close dialog

                    // Navigate to payment done
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => PaymentDone(),
                      ),
                    );
                  },
                  child: Text(
                    'CONFIRM PAYMENT',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget paymentButton(String title, String imageUrl) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Image.network(imageUrl, width: 40, height: 40),
          SizedBox(width: 10),
          Text(
            title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
