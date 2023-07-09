import 'package:bloc/bloc.dart';
import 'package:pokemon/api_service/api_service.dart';
import 'package:pokemon/bloc/pokemon_bloc_state.dart';
import 'package:pokemon/model/single_pokemon.dart';



import '../api_service/api_service.dart';class PokemonBlocCubit extends Cubit<PokemonBlocState> {
 final ApiService apiService;
  PokemonBlocCubit({required this.apiService}) : super(  PokemonBlocState(loading: false, error: "", pokemonList: [],loadingDetail:false,errorDetail:"",singlePokemon:SinglePokemon()));
  getData(){
    emit(state.copyWith(loading: true));
    apiService.getPokemon().then((value) {
     emit(state.copyWith(loading: false));
     emit(state.copyWith(error: ""));
     emit(state.copyWith(pokemonList: value));
    },onError: (e){
      emit(state.copyWith(loading: false));
      emit(state.copyWith(error: e.toString()));
    });
  }
  getSinglePokemon(String id){
    emit(state.copyWith(loadingDetail: true));
    apiService.getSinglePokemon(id).then((value) {
      emit(state.copyWith(loadingDetail: false));
      emit(state.copyWith(errorDetail: ""));
      emit(state.copyWith(singlePokemon: value));
    },onError: (e){
      emit(state.copyWith(loadingDetail: false));
      emit(state.copyWith(errorDetail: e.toString()));
    });
  }
}
