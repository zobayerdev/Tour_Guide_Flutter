import 'package:boylar_plate/common_widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class PrivacyScreen extends StatefulWidget {
  const PrivacyScreen({super.key});

  @override
  State<PrivacyScreen> createState() => _PrivacyScreenState();
}

class _PrivacyScreenState extends State<PrivacyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Privacy Policy',
        isCenterd: true,
      ),
      body: const Center(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  Text('Privacy Policy'),
                  Text('Privacy Policy'),
                  Text('Privacy Policy'),
                  Text('Privacy Policy'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
