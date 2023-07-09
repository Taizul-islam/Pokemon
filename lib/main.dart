import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/bloc/pokemon_bloc_cubit.dart';
import 'package:pokemon/bloc/pokemon_bloc_state.dart';
import 'package:pokemon/pages/home_page.dart';

import 'api_service/api_service.dart';

void main() {
  ApiService apiService=ApiService();
  runApp(MyApp(apiService));
}

class MyApp extends StatelessWidget {
  final ApiService apiService;

  const MyApp(this.apiService, {super.key});

  @override
  Widget build(BuildContext context) {
    
    return MultiBlocProvider(
      providers: [

       BlocProvider(create: (context)=>PokemonBlocCubit(apiService: apiService))
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomePage(),
      ),
    );
  }
}

