import 'dart:convert';
import 'package:http/http.dart';
import 'package:pokemon/model/pokemon_model.dart';

class Repository {
  final String apiUrl='https://gist.githubusercontent.com/hungps/0bfdd96d3ab9ee20c2e572e47c6834c7/raw/pokemons.json';

  Future<List<PokemonModel>> getPokemon() async{
    Response response= await get(Uri.parse(apiUrl));

    final List result=jsonDecode(response.body);
    return result.map((e) => PokemonModel.fromJson(e)).toList();
  }
}