import 'package:flutter/material.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Privacy policy',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Privacy Policy for CashFlow App',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Text(
              'This Privacy Policy describes how CashFlow, a money management mobile application ("App"), collects, uses, and protects user information.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 10.0),
            Text(
              'Information Collection and Usage',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5.0),
            Text(
              'CashFlow does not collect any personal information from users. We do not require or request users to create an account with personal information such as email addresses, phone numbers, or any identifiable data.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 10.0),
            Text(
              'User-Generated Data',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5.0),
            Text(
              'The App allows users to input and manage their financial data, including but not limited to expenses, income, transactions, and other financial records. This data is stored locally on the user\'s device and is not transmitted to or stored on any external server.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 10.0),
            Text(
              'Information Security',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5.0),
            Text(
              'CashFlow takes reasonable measures to secure user-generated data stored on the users device. However, its essential for users to understand that no method of transmission over the internet or electronic storage is entirely secure, and we cannot guarantee absolute security.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 10.0),
            Text(
              'Sharing of Information',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5.0),
            Text(
              'CashFlow does not share, sell, or distribute any user-generated data or personal information to third parties.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 10.0),
            Text(
              'Third-Party Services',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5.0),
            Text(
              'CashFlow may link to or integrate with third-party services, websites, or applications. Users are encouraged to review the privacy policies of those third-party services, as CashFlow is not responsible for the privacy practices or content of these third-party providers.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 10.0),
            Text(
              'Childrens Privacy',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5.0),
            Text(
              'CashFlow is not intended for use by children under the age of 13. We do not knowingly collect personal information from children. If you are a parent or guardian and believe that your child has provided us with information, please contact us, and we will delete it.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 10.0),
            Text(
              'Changes to this Privacy Policy',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5.0),
            Text(
              'CashFlow reserves the right to update this Privacy Policy periodically. Users are encouraged to review this policy regularly for any changes. Continued use of the App after any modifications to the Privacy Policy constitutes acceptance of those changes.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 20.0),
            Text(
              'Contact Us',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            Text(
              'If you have any questions or concerns about this Privacy Policy or the App, please contact us at:',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              '- Email: [your contact email]',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 20.0),
            Text(
              'Effective Date: [Current date]',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.0),
            Text(
              'Thank you for using CashFlow!',
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
