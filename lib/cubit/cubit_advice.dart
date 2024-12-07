import 'package:bloc/bloc.dart';
import 'package:flutter_final_project/retrofit/retrofit_config.dart';

class CubitAdvice extends Cubit<AdviceState> {
    final RestAdviceClient _restAdviceClient;

    CubitAdvice(this._restAdviceClient) : super(AdviceInitial());

    Future<void> fetchAdvice() async{
      emit(AdviceLoading());
      try{
        final response = await _restAdviceClient.getAdvice();
        emit(AdviceLoaded(response.slip?.advice?? 'Sem conselho'));
      }catch(e){
        emit(AdviceError("Erro ao buscar o conselho: $e" ));
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
class AdviceError extends AdviceState{
  final String message;
  AdviceError(this.message);
}