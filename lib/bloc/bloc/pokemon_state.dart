part of 'pokemon_bloc.dart';

abstract class PokemonState extends Equatable {
  const PokemonState();
  
  @override
  List<Object> get props => [];
}

class PokemonInitial extends PokemonState {}

class PokemonLoading extends PokemonState{

}
class PokemonStateLoaded extends PokemonState{
  final List<PokemonModel> data;
  PokemonStateLoaded(this.data);
}
class PokemonStateError extends PokemonState{
  final String error;
  PokemonStateError(this.error);
}
