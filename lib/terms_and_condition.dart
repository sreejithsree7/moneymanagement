// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class TermsAndConditionsPage extends StatelessWidget {
  const TermsAndConditionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Terms and Condition',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'CashFlow App Terms and Conditions',
              style: TextStyle(fontSize: 21.5, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Text(
              'Welcome to CashFlow, a money management mobile application ("App"). By accessing or using this App, you agree to be bound by these Terms and Conditions.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 20.0),
            Text(
              '1. Acceptance of Terms',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            Text(
              'By using the CashFlow app, you accept and agree to these Terms and Conditions. If you do not agree with these terms, please refrain from using the App.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 10.0),
            Text(
              '2. Use of the App',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            Text(
              'The CashFlow app is intended for personal financial management purposes only.\n'
              'You are responsible for maintaining the confidentiality of your financial data and any actions taken using the App.\n'
              'You may not use the App for any illegal or unauthorized purpose.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 10.0),
            Text(
              '3. User-Generated Content',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            Text(
              'CashFlow allows users to input and manage financial data. You agree to only provide accurate and lawful information.\n'
              'Users are solely responsible for the content they input into the App and its accuracy.\n',
              style: TextStyle(fontSize: 16.0),
            ),

            Text(
              '4. Intellectual Property Rights',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            Text(
              'The CashFlow app and its content, features, and functionality are owned by the developers and are protected by copyright and other intellectual property laws.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 10.0),
            Text(
              '5. Limitation of Liability',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            Text(
              'CashFlow shall not be liable for any direct, indirect, incidental, special, consequential, or exemplary damages arising from your use of the App.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 10.0),
            Text(
              '6. Privacy',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            Text(
              'Our Privacy Policy explains how we collect, use, and protect user information. By using CashFlow, you consent to our Privacy Policy.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 10.0),
            Text(
              '7. Changes to Terms and Conditions',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            Text(
              'CashFlow reserves the right to modify or replace these Terms and Conditions at any time. It is your responsibility to review these terms periodically.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 10.0),
            Text(
              '8. Governing Law',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            Text(
              'These Terms and Conditions shall be governed and construed in accordance with the laws of [Your jurisdiction].',
              style: TextStyle(fontSize: 16.0),
            ),

            // Add the rest of the sections and content from the provided Terms and Conditions

            SizedBox(height: 20.0),

            Text(
              '9. Contact Us',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            Text(
              'For any questions or concerns regarding these Terms and Conditions, please contact us at:',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              'Email: [Your contact email]\n'
              'Mailing Address:\n'
              '[Your Company Name]\n'
              '[Your Address Line 1]\n'
              '[Your Address Line 2]\n'
              '[City, State, Zip Code]\n'
              '[Country]',
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
