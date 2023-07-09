import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/bloc/pokemon_bloc_cubit.dart';
import 'package:pokemon/bloc/pokemon_bloc_state.dart';

class DetailPage extends StatelessWidget {


  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Pokemon Details"),
        centerTitle: true,
        automaticallyImplyLeading: true,
      ),
      body: BlocBuilder<PokemonBlocCubit, PokemonBlocState>(
        builder: (context, state) {
          log("state ${state.loadingDetail}");
          if(state.loadingDetail){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          else if(state.error.toString().isNotEmpty){
            return Center(child: Text(state.error.toString()));
          }else{
            return Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      state.singlePokemon.image!.isEmpty?Image.asset("assets/images/loading.png"):CircleAvatar(
                        backgroundColor: Colors.transparent,
                        backgroundImage: NetworkImage(state.singlePokemon.image??""),
                        radius: 80,
                      ),

                      SizedBox(height: 10,),
                      Text("ID: ${state.singlePokemon.id??"ID"}"),
                      Text("Name: ${state.singlePokemon.name??"Name"}"),
                      Text("Classification: ${state.singlePokemon.classification??"Classification"}"),

                      Row(
                        children: [
                          Expanded(child: Column(
                            children: [
                              SizedBox(height: 10,),
                              Text("Height"),
                              Text("Max Height: ${state.singlePokemon.height?.maximum??"Maximum"}"),
                              Text("Min Height: ${state.singlePokemon.height?.minimum??"Minimum"}"),
                            ],
                          )),
                          Expanded(child: Column(
                            children: [
                              SizedBox(height: 10,),
                              Text("Weight"),
                              Text("Max Weight: ${state.singlePokemon.weight?.maximum??"Maximum"}"),
                              Text("Min Weight: ${state.singlePokemon.height?.minimum??"Minimum"}"),
                            ],
                          )),
                        ],
                      )

                    ],
                  ),
                ),
              ),
            );
          }

        },
      ),
    );
  }
}
