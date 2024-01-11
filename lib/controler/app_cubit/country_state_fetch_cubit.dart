import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../repositry.dart';

part 'country_state_fetch_state.dart';

class CountryStateFetchCubit extends Cubit<CountryStateFetchState> {
  CountryStateFetchCubit() : super(CountryStateFetchInitial());

  getCountryState() async {
    try {
      emit(CountryStateFetchLoading());
      print('Loading Emit');
      var data = await AppRepo().fethCountryState();
      if (data == 200) {
        emit(CountryStateFetchLoaded());
        print('Loaded Emit');
      } else if (data == 201) {
        emit(CountryStateFetchError());
      }
    } catch (e) {
      print(e);
    }
  }
}
