import 'package:flutter/material.dart';
import 'package:flutter_final_project/widgets/project_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                  child: Center(
                    child: Image.asset(
                        "assets/images/flower.jpg",
                      fit: BoxFit.contain,
                    ),
                  )
              ),
              const SizedBox(height: 24),
              const Text(
                "Bem vindo ao Advice",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              const Text(
                "Estamos construindo uma comunidade de crescimento pessoal, venha e junte-se a nós nesta gloriosa jornada!",
                style: TextStyle(
                  fontSize: 16,
                  height: 1.5
                ),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: CustomButton(
                    text: "Vamos iniciar.",
                    onPressed: () {
                      Navigator.pushNamed(context, '/choose_screen');
                    }
                ),
              ),
            ],
          ),
      ),
    );
  }
}
