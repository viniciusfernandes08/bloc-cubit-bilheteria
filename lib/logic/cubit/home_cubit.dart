import 'package:bilheteria_panucci/models/movie.dart';
import 'package:bilheteria_panucci/services/movies_api.dart';
import 'package:bloc/bloc.dart';

part 'home_states.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitial());
  
  final HomeService _homeService = HomeService();

  Future<void> getMovies() async {
    emit(HomeLoading());
     
    try {
      final movies = await _homeService.fetchMovies();
      emit(HomeSuccess(movies));
    } catch (e) {
      emit(HomeError('Ocorreu um erro ao buscar a lista de filmes.'));
    }
  }
}