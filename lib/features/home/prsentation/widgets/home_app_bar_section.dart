import 'package:flutter/material.dart';

import 'home_app_bar_widget.dart';

class HomeAppBarSection extends StatelessWidget {
  const HomeAppBarSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 28.0),
          child: CustomHomeViewAppBar(),
        ),
        SizedBox(height: 32),
      ],
    );
  }
}
