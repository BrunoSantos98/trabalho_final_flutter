import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_final_project/platform_chanel_advice.dart';
import 'package:flutter_final_project/retrofit/html_interceptor.dart';
import 'package:flutter_final_project/retrofit/retrofit_config.dart';
import 'package:dio/dio.dart';
import 'package:flutter_final_project/database/database.dart';
import 'package:flutter_final_project/widgets/project_button.dart';
import 'package:flutter_final_project/cubit/cubit_advice.dart';

class GetAdviceScreen extends StatelessWidget {
  final DatabaseHelper _dbHelper = DatabaseHelper();

  GetAdviceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Conselho do dia"),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: BlocProvider(
        create: (context) {
          final dio = Dio();
          dio.interceptors.add(HtmlToJsonInterceptor());
          final restAdviceClient = RestAdviceClient(dio);
          final cubitAdvice = CubitAdvice(restAdviceClient);

          Future.microtask(() => cubitAdvice.fetchAdvice());

          return cubitAdvice;
        },
        child: BlocBuilder<CubitAdvice, AdviceState>(
          builder: (context, state) {
            if (state is AdviceLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is AdviceLoaded) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      state.advice,
                      style: const TextStyle(fontSize: 18),
                    ),
                    const Spacer(),
                    Center(
                      child: Row(
                        children: [
                          CustomButton(
                            text: "Salva Conselho",
                            onPressed: () async {
                              _dbHelper.insertAdvice(state.advice);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text("Conselho salvo com sucesso")),
                              );
                            },
                            icon: const Icon(Icons.bookmark_add),
                          ),
                          Spacer(),
                          CustomButton(
                            text: "Enviar conselho",
                            onPressed: () {
                              ShareHelper.shareAdvice(state.advice.toString());
                            },
                            icon: const Icon(Icons.send),
                          ),
                        ],
                      )
                    ),
                  ],
                ),
              );
            } else if (state is AdviceError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(state.message, style: const TextStyle(fontSize: 18)),
                    const SizedBox(height: 16),
                    CustomButton(
                      text: "Tentar novamente",
                      onPressed: () {
                        context.read<CubitAdvice>().fetchAdvice();
                      },
                      icon: const Icon(Icons.refresh),
                    ),
                  ],
                ),
              );
            }
            return const Center(
              child: CircularProgressIndicator()
            );
          },
        ),
      ),
    );
  }
}
