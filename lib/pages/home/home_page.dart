import 'package:flutter/material.dart';

import '../../common/widgets/content_tile.dart';
import '../../common/widgets/header.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const Header(),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/background.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: ContentTile(
                title: "Hey there! I'm Arun Prakash",
                content:
                    "Emerging from the picturesque terrains of Kerala, I excel in Mobile & Desktop Application Development. With proficiency in Flutter & Xamarin.Forms Frameworks, I've also engineered production-ready libraries.",
                lottie: 'assets/lottie/coding.json',
                subTitle: 'A Senior Software Engineer',
                bottom: ButtonBar(
                  alignment: MainAxisAlignment.start,
                  buttonPadding: EdgeInsets.zero,
                  layoutBehavior: ButtonBarLayoutBehavior.constrained,
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.facebook,
                      ),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.mail,
                      ),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.phone,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
