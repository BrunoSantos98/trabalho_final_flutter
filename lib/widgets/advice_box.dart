import 'package:flutter/material.dart';
import 'package:flutter_final_project/widgets/project_button.dart';

class AdviceBox extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;
  final String actionText;
  final VoidCallback onPressed;

  const AdviceBox({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.actionText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12)
      ),
      color: Colors.black87,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12)
            ),
            child: Image.asset(
              imagePath,
              width: double.infinity,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    subtitle,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14
                    ),
                  ),
                  CustomButton(
                      text: actionText,
                      onPressed: onPressed
                  )
                ],
              ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
