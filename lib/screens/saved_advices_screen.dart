import 'package:dio/src/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_final_project/database/database.dart';
import 'package:flutter_final_project/cubit/cubit_advice.dart';
import 'package:flutter_final_project/retrofit/retrofit_config.dart';
import 'package:retrofit/dio.dart';

import '../widgets/saved_advices_box.dart';

class SavedAdvicesScreen extends StatelessWidget {
  const SavedAdvicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => CubitAdvice(
            RestAdviceClient(Dio()),
            DatabaseHelper()
        )..fetchSavedAdvice(),
            child: Scaffold(
              appBar: AppBar(
                title: const Text("Conselhos salvos"),
              ),
              body: BlocBuilder<CubitAdvice, AdviceState>(
                  builder: (context, state){
                    if(state is AdviceLoading){
                      return const Center(child: CircularProgressIndicator());
                    }else if(state is AdviceError){
                      return Center(child: Text(state.message));
                    }else if(state is SavedAdvicesLoaded){
                      final advices = state.advices;

                      if(advices.isEmpty){
                        return const Center(child: Text("Sem conselhos salvos ainda"));
                      }
                      return ListView.builder(
                        itemCount: advices.length,
                        itemBuilder: (context, index){
                          return SavedAdviceBox(advice: advices[index]);
                        }
                      );
                    }
                    return const Center(child: Text("Estado desconheciodo, por favor tente novamente"));
                  }
              ),
    ),
    );
  }
}
