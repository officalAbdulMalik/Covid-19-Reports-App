import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../repositry.dart';
part 'world_state_fetch_state.dart';

class WorldStateFetchCubit extends Cubit<WorldStateFetchState> {
  WorldStateFetchCubit() : super(WorldStateFetchInitial());

  getWorldStateData() async {
    emit(WorldLStateFetchLoading());
    print('Loading Emit');
    try {
      var data = await AppRepo.fetchWorldState();
      if (data == 200) {
        emit(WorldStateFetchLoaded());
        print('Loaded emit');
      } else if (data == 501) {
        emit(WorldStateFetchError(Error: 'Network Error'));
      } else if (data == 401) {
        emit(WorldStateFetchError(Error: 'Data Not Found'));
      } else if (data == 404) {
        emit(WorldStateFetchError(Error: 'Server Error'));
      }
    } catch (e) {
      print('$e');
    }
  }
}
