import 'package:flutter/material.dart';
import 'package:flutter_final_project/retrofit/retro_test.dart';
import 'package:flutter_final_project/retrofit/retrofit_config.dart';
import 'package:dio/dio.dart';

import 'package:flutter_final_project/widgets/project_button.dart';

class GetAdviceScreen extends StatefulWidget {
  const GetAdviceScreen({super.key});

  @override
  State<GetAdviceScreen> createState() => _GetAdviceScreenState();
}

class _GetAdviceScreenState extends State<GetAdviceScreen> {
  String? advice;
  bool isLoading = true;
  late RestAdviceClient _restAdviceClient;
  late RestClient _restTest;

  @override
  void initState(){
    super.initState();
    final dio = Dio();
    _restAdviceClient = RestAdviceClient(dio);
    _restTest = RestClient(dio);
    fetchAdvice();
  }

  Future<void> fetchAdvice() async {
    setState(() {
      isLoading = true;
    });

    try {
      print("testetestetestetestetestetestetestetestetestetestetestetesteteste");
      final response2 = await _restTest.getTasks();
      final response = await _restAdviceClient.getAdvice();
      final String name = response2[0].name;
      print('Advice meu: $name e meu resultado é $response');
      setState(() {
        //advice = response.slip.advice;
        isLoading = false;
      });
    } catch (e) {
      print("error: $e");
      setState(() {
        advice = "Algum erro ocorreu ao buscar seu conselho tente novamente mais tarde";
        isLoading = false;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Conselho do dia"),
        leading: IconButton(
            onPressed: () => Navigator.pop(context), 
            icon: const Icon(Icons.arrow_back)
        ),
      ),
      body: isLoading ? const Center(child: CircularProgressIndicator()) :
          Padding(padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(advice ?? '',
                style: const TextStyle(fontSize: 18),
              ),
              const Spacer(),
              Center(
                child: CustomButton(
                    text: "Salva Conselho", 
                    onPressed: (){},
                    icon: const Icon(Icons.bookmark_add),
                ),
              )
            ],
          ),
          ),
    );
  }
}
