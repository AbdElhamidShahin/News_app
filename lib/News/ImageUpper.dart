import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/screens/Sports.dart';

import '../screens/BusinessPage.dart';
import '../screens/HealthPage.dart';
import '../screens/SciencePage.dart';
import '../screens/TechnologyPage.dart';

class ImageUpper extends StatelessWidget {
  final String image;
  final String text;

  ImageUpper({required this.image, required this.text});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(130),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              height: 90,
              width: 165,
              child: Image(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 28,
            child: Container(
              padding: EdgeInsets.all(3),
              child: Text(
                text,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ImageUpperItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => BusinessPage()),
            );
          },
          child: ImageUpper(
            image: 'assets/images/business-landing-header.jpg',
            text: 'Business',
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HealthPage()),
            );
          },
          child: ImageUpper(
            image: 'assets/images/helth.jpg',
            text: 'Health',
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SciencePage()),
            );
          },
          child: ImageUpper(
            image: 'assets/images/science.jpg',
            text: 'Science',
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SportsPage()),
            );
          },
          child: ImageUpper(
            image: 'assets/images/sports.jpg',
            text: 'Sports',
          ),
        ),

        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TechnologyPage()),
            );
          },
          child: ImageUpper(
            image: 'assets/images/technology.jpg',
            text: 'Technology',
          ),
        ),

        // Add more ImageUpper widgets with corresponding onTap callbacks for other pages
      ],
    );
  }
}
