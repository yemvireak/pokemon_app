import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:pokemon/model/pokemon_model.dart';
import 'package:pokemon/repose/repository.dart';

import '../bloc/bloc/pokemon_bloc.dart';
import 'pokemon_detail.dart';

class PokemonScreen extends StatefulWidget {
  PokemonScreen({super.key, required this.model});

  List<PokemonModel> model;
  @override
  State<PokemonScreen> createState() => _PokemonScreenState();
}

class _PokemonScreenState extends State<PokemonScreen> {



  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PokemonBloc(Repository()),
        ),
      ],
      child: BlocBuilder<PokemonBloc, PokemonState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Color.fromARGB(255, 94, 59, 173),
            appBar: AppBar(
              
              elevation: 0,
              backgroundColor: Color.fromARGB(255, 94, 59, 173),
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Text('List of Pokemons',style:TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold)),
              ),
              SizedBox(height: 20,),
              _buildbody],
            ),
          );
        },
      ),
    );
    
  }

  get _buildbody {
    return BlocProvider(
      create: (context) => PokemonBloc(
        Repository(),
      )..add(PokemonEventLoad()),
      child: BlocBuilder<PokemonBloc, PokemonState>(
        builder: (context, state) {
          if (state is PokemonLoading) {
            return _buildloading;
          } else if (state is PokemonStateLoaded) {
            return _buildcard(context, state.data);
          } else {
            return Container();
          }
        },
      ),
    );
  }
  
  _buildcard(BuildContext context, List<PokemonModel> model) {
    return Expanded(
      child: ListView.builder(
        itemCount: model.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PokemonDetail(
                            model: model[index],
                          )));
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                title: Text(
                  model[index].name.toString(),
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                subtitle: Text(model[index].typeofpokemon.toString(),
                    style: TextStyle(color: Colors.yellow)),
                trailing: Text(model[index].id.toString(),
                    style: TextStyle(color: Colors.green)),
                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage:
                      NetworkImage(model[index].imageurl.toString()),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
  get _buildloading {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
