import 'package:equatable/equatable.dart';
import 'package:pokemon/model/single_pokemon.dart';

class PokemonBlocState extends Equatable {
  final bool loading;
  final String error;
  final List<SinglePokemon> pokemonList;
  final bool loadingDetail;
  final String errorDetail;
  final SinglePokemon singlePokemon;

  const PokemonBlocState(
      {required this.loading, required this.error, required this.pokemonList,required this.loadingDetail,required this.errorDetail,required this.singlePokemon});

  PokemonBlocState copyWith({
    bool? loading,
    String? error,
    List<SinglePokemon>? pokemonList,
     bool? loadingDetail,
     String? errorDetail,
    SinglePokemon? singlePokemon
  }) {
    return PokemonBlocState(
      loading: loading ?? this.loading,
      error: error ?? this.error,
      pokemonList: pokemonList ?? this.pokemonList,
      loadingDetail: loadingDetail??this.loadingDetail,
      errorDetail: errorDetail??this.errorDetail,
      singlePokemon: singlePokemon??this.singlePokemon,
    );
  }

  @override
  List<Object> get props => [loading, error, pokemonList,loadingDetail,errorDetail,singlePokemon];
}
