import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/bloc/pokemon_bloc_cubit.dart';
import 'package:pokemon/bloc/pokemon_bloc_state.dart';
import 'package:pokemon/pages/detail_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<PokemonBlocCubit>().getData();
    return Scaffold(
      appBar: AppBar(
        title: Text("Pokemon"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: BlocBuilder<PokemonBlocCubit, PokemonBlocState>(

            builder: (context, state) {
              if(state.loading){
                return CircularProgressIndicator();
              }
              else if(state.error.toString().isNotEmpty){
                return Text(state.error.toString());
              }
              else if(state.pokemonList.isEmpty){
                return Text("No Data Found");
              }else{
                return ListView.builder(
                    itemBuilder: (context,index){
                      var item=state.pokemonList[index];
                  return Card(
                    child: ListTile(
                      contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                      leading: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        backgroundImage: NetworkImage(item.image??""),
                      ),
                      title: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("ID: ${item.id??"ID"}"),
                          Text("Name: ${item.name??"Name"}"),
                          Text("Classification: ${item.classification??"Classification"}"),
                        ],
                      ),
                      subtitle: Row(
                        children: [
                          Expanded(child: Column(
                            children: [
                              SizedBox(height: 10,),
                              Text("Height"),
                              Text("Max Height: ${item.height?.maximum??"Maximum"}"),
                              Text("Min Height: ${item.height?.minimum??"Minimum"}"),
                            ],
                          )),
                          Expanded(child: Column(
                            children: [
                              SizedBox(height: 10,),
                              Text("Weight"),
                              Text("Max Weight: ${item.weight?.maximum??"Maximum"}"),
                              Text("Min Weight: ${item.height?.minimum??"Minimum"}"),
                            ],
                          )),
                        ],
                      ),
                      onTap: (){
                        context.read<PokemonBlocCubit>().getSinglePokemon(item.id.toString());
                        Navigator.of(context).push(MaterialPageRoute(builder: (_)=> DetailPage()));
                      },
                    ),
                  );
                },
                  itemCount: state.pokemonList.length,
                );
              }
              return SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
