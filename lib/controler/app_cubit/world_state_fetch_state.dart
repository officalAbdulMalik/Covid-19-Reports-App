part of 'world_state_fetch_cubit.dart';

@immutable
abstract class WorldStateFetchState {}

class WorldStateFetchInitial extends WorldStateFetchState {}

class WorldLStateFetchLoading extends WorldStateFetchState {}

class WorldStateFetchLoaded extends WorldStateFetchState {}

class WorldStateFetchError extends WorldStateFetchState {
  String Error;

  WorldStateFetchError({required this.Error});
}
