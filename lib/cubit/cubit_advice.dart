import 'package:bloc/bloc.dart';
import 'package:flutter_final_project/database/database.dart';
import 'package:flutter_final_project/retrofit/retrofit_config.dart';

class CubitAdvice extends Cubit<AdviceState> {
    final RestAdviceClient _restAdviceClient;
    final DatabaseHelper _databaseHelper;

    CubitAdvice(this._restAdviceClient, this._databaseHelper) : super(AdviceInitial());

    Future<void> fetchAdvice() async{
      emit(AdviceLoading());
      try{
        final response = await _restAdviceClient.getAdvice();
        emit(AdviceLoaded(response.slip?.advice?? 'Sem conselho'));
      }catch(e){
        emit(AdviceError("Erro ao buscar o conselho: $e" ));
      }
    }

    Future<void> fetchSavedAdvice() async {
      emit(AdviceLoading());
      try{
        final advices = await _databaseHelper.getAllAdvices();
        emit(SavedAdvicesLoaded(advices));
      }catch(e){
        emit(AdviceError("Erro ao carregar conselhos salvos: $e"));
      }
    }
}

abstract class AdviceState{}
class AdviceInitial extends AdviceState{}
class AdviceLoading extends AdviceState{}
class AdviceLoaded extends AdviceState{
  final String advice;
  AdviceLoaded(this.advice);
}
class SavedAdvicesLoaded extends AdviceState{
  final List<String> advices;
  SavedAdvicesLoaded(this.advices);
}
class AdviceError extends AdviceState{
  final String message;
  AdviceError(this.message);
}