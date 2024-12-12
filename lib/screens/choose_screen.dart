import 'package:flutter/material.dart';
import 'package:flutter_final_project/widgets/advice_box.dart';

class ChooseScreen extends StatelessWidget {
  const ChooseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            'Advice',
          style: TextStyle(
              color: Colors.white
          ),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            const Text(
                "O que você gostaria hoje?",
              style: TextStyle(
                fontSize: 24
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
                child:
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    AdviceBox(
                        imagePath: "assets/images/sun.jpg",
                        title: "Conselho do dia",
                        subtitle: "Busque um conselho diário",
                        actionText: "Busca Conselho",
                        onPressed: (){
                          Navigator.pushNamed(context, '/get_advice_screen');
                        }
                    ),
                    AdviceBox(
                        imagePath: "assets/images/ocean.jpg",
                        title: "Conselhos salvos",
                        subtitle: "Veja conselhos salvos ",
                        actionText: "Rever Conselhos",
                        onPressed: (){
                          Navigator.pushNamed(context, "/saved_advices");
                        }
                    ),
                  ],
                )
            )
          ],
        ),
      ),
    );
  }
}
