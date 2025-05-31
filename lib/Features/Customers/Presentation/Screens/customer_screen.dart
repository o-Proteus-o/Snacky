import 'package:flutter/material.dart';

class CustomerScreen extends StatelessWidget {
  const CustomerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: const IndexedStack(index: 0, children: []),
      // bottomNavigationBar: Padding(
      //   padding: const EdgeInsets.only(bottom: 10),
      //   child: CrystalNavigationBar(
      //     items: [],
      //   ),
      // ),
    );
  }
}
