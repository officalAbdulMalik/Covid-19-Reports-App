part of 'country_state_fetch_cubit.dart';

@immutable
abstract class CountryStateFetchState {}

class CountryStateFetchInitial extends CountryStateFetchState {}

class CountryStateFetchLoading extends CountryStateFetchState {}

class CountryStateFetchLoaded extends CountryStateFetchState {}

class CountryStateFetchError extends CountryStateFetchState {}
