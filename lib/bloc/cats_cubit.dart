import 'package:bloc_usage/service/cats_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cats_state.dart';

class CatsCubit extends Cubit<CatsState> {
  final SampleCatsRepository _catsRepository;
  CatsCubit(this._catsRepository) : super(CatsInitial());

  Future<void> getCats() async {
    try {
      emit(CatsLoading());
      final response = await _catsRepository.fetchCats();
      emit(CatsLoaded(response));
    } catch (e) {
      emit(CatsError(e.toString()));
    }
  }
}
