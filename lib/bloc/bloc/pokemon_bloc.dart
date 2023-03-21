import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pokemon/model/pokemon_model.dart';
import 'package:pokemon/repose/repository.dart';

part 'pokemon_event.dart';
part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  final Repository repository;
  PokemonBloc(this.repository) : super(PokemonInitial()) {

  on<PokemonEventLoad>((event, emit)async{
    emit(PokemonLoading());
    try{
      final data=await repository.getPokemon();
      emit(PokemonStateLoaded(data));
    }catch(e){
      emit(PokemonStateError(e.toString()));
    }
  });

  }
}
