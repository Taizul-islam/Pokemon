const query_pokemons = r"""
 query pokemon($count:Int!) {
    pokemons(first: $count) {
            id,
            name,
            image,
            classification,
            weight{
               minimum
               maximum
            },
            height{
                minimum
                maximum
            }
    }
  }
""";

const query_single_pokemon = r"""
    query pokemon($id:String){
    pokemon(id:$id){
      id,
      name,
      classification,
      weight{
        minimum
        maximum
      },
      height{
        minimum
        maximum
      },
      image
    }
  }
""";



