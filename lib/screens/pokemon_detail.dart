import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:pokemon/model/pokemon_model.dart';

class PokemonDetail extends StatelessWidget {
  const PokemonDetail({super.key,required this.model});
  final PokemonModel model;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 59, 160, 173),
      appBar: AppBar(title: Text('${model.name} Detail'),backgroundColor: Color.fromARGB(255, 59, 160, 173),elevation: 0,),
      body: _buildbody
    );
  }
  get _buildbody{
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20,),
            Center(
              child: SizedBox(
                width: 200,
                height: 200,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(model.imageurl.toString()),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text('Description : ${model.xdescription}',style:TextStyle(color: Colors.white,fontSize: 17)),
            SizedBox(height: 10),
            Text('Height : ${model.height}',style:TextStyle(color: Colors.yellow)),
            SizedBox(height: 10),
            Text('Category : ${model.category}',style:TextStyle(color: Colors.black)),
            SizedBox(height: 10),
            Text('Weight : ${model.weight}',style:TextStyle(color: Colors.brown)),
            SizedBox(height: 10),
            Text('Type : ${model.typeofpokemon}',style:TextStyle(color: Colors.red)),
            SizedBox(height: 10),
            Text('Speed : ${model.speed}',style:TextStyle(color: Colors.purple)),
            SizedBox(height: 10),
            Text('HP : ${model.hp}',style:TextStyle(color: Colors.pink)),
            SizedBox(height: 10),
            Text('Attack : ${model.attack}',style:TextStyle(color: Colors.orange)),
            SizedBox(height: 10),
            Text('Defense : ${model.defense}',style:TextStyle(color: Colors.amber)),
            SizedBox(height: 10),
            Text('Weakneses : ${model.weaknesses}',style:TextStyle(color: Colors.white)),
            SizedBox(height: 10),
            Text('evolutions : ${model.evolutions}',style:TextStyle(color: Colors.white)),
            SizedBox(height: 10),
            Text('abilities : ${model.abilities}',style:TextStyle(color: Colors.white)),
            SizedBox(height: 10),
            Text('special_attack : ${model.specialAttack}',style:TextStyle(color: Colors.white)),
            SizedBox(height: 10),
            Text('special_defense : ${model.specialDefense}',style:TextStyle(color: Colors.white)),
            SizedBox(height: 10),
            Text('total : ${model.total}',style:TextStyle(color: Colors.white)),
            SizedBox(height: 10),
            Text('male_percentage : ${model.malePercentage}',style:TextStyle(color: Colors.white)),
            SizedBox(height: 10),
            Text('female_percentage : ${model.femalePercentage}',style:TextStyle(color: Colors.white)),
            SizedBox(height: 10),
            Text('egg_groups : ${model.eggGroups}',style:TextStyle(color: Colors.white)),
            SizedBox(height: 10),
            Text('evolvedfrom : ${model.evolvedfrom}',style:TextStyle(color: Colors.white)),
            SizedBox(height: 10),
            Text('base_exp : ${model.baseExp}',style:TextStyle(color: Colors.white)),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}