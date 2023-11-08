import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../postlar.dart';

part 'networking_event.dart';

part 'networking_state.dart';

class NetworkingBloc extends Bloc<NetworkingEvent, NetworkingState> {
  NetworkingBloc() : super(NetworkingInitial()) {

    on<NetworkLoad>((event, emit) async {
      Dio dio = Dio();
      emit(NetworkingLoading());
      try {
        var response =
            await dio.get("https://jsonplaceholder.typicode.com/posts");
        if (response.statusCode == 200) {
          emit(NetworkingSuccess(listfromJson(response.data)));
        } else {
          emit(NetworkingError("NXato"));
        }
      } on DioException catch (e) {
        emit(NetworkingError(e.toString()));
      }
    });
  }
}
