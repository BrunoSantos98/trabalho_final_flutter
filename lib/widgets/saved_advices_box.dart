import 'package:flutter/material.dart';
import 'package:flutter_final_project/widgets/project_button.dart';

class SavedAdviceBox extends StatelessWidget {
  final String advice;

  const SavedAdviceBox({
    super.key,
    required this.advice
});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
          padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                advice,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                ),
            ),
            const SizedBox(height: 8),
            Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomButton(
                      text: "Ver Conselho",
                      onPressed: (){
                        Navigator.pushNamed(
                            context,
                            "/advice_detail",
                            arguments: advice
                        );
                      },
                    icon: Icon(Icons.remove_red_eye_rounded)
                  )
                ],
            )
          ],
        ),
      ),
    );
  }
}
