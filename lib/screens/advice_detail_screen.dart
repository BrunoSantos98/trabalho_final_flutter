import 'package:flutter/material.dart';
import 'package:flutter_final_project/platform_chanel_advice.dart';
import 'package:flutter_final_project/widgets/project_button.dart';

class AdviceDetailScreen extends StatelessWidget {
  const AdviceDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final advice = ModalRoute.of(context)?.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Conselho"),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child:Center(
                  child: Text(
                    advice,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
              CustomButton(
                  text: "Compartilhar conselho",
                  onPressed: (){
                    ShareHelper.shareAdvice(advice);
                  },
                icon: Icon(Icons.send),
              )
            ],
          )
      ),
    );
  }
}
