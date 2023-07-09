import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:graphql/client.dart';
import 'package:pokemon/constant/all_constant.dart';
import 'package:pokemon/model/single_pokemon.dart';

class ApiService{
  static const baseUrl="https://graphql-pokemon2.vercel.app/";
  final httpLink = HttpLink(baseUrl);

  GraphQLClient? client;

  ApiService() {
    client = GraphQLClient(link: httpLink, cache: GraphQLCache());
  }
  Future getPokemon() async {
    try {
      var res = await client?.query(QueryOptions(document: gql(query_pokemons), variables: {'count': 20}));
      if(res!.hasException){
        throw Exception(res.exception.toString());
      }else{
        var apiResponseData = res.data?['pokemons'] as List;
        return apiResponseData.map((e) => SinglePokemon.fromJson(e)).toList();
      }

    }on SocketException{
      throw Exception("Internet connection Error");
    } on TimeoutException{
      throw Exception("Timeout Please try agaian");
    }
  }

  Future<SinglePokemon> getSinglePokemon(String id) async {
    try {
      var res = await client?.query(QueryOptions(
          document: gql(query_single_pokemon), variables: {'id': id}));
      if(res!.hasException){
        throw Exception(res.exception.toString());
      }else{
        var apiResponseData = res.data?['pokemon'];
        return SinglePokemon.fromJson(apiResponseData);
      }

    }on SocketException{
      throw Exception("Internet connection error");
    } on TimeoutException{
      throw Exception("Timeout Please try again");
    }

  }

}