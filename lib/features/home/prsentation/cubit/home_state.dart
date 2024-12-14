part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class GetHistoricalPeriodSuccess extends HomeState {}

final class GetHistoricalPeriodLoading extends HomeState {}

final class GetHistoricalPeriodFailure extends HomeState {
  final String errMessage;

  GetHistoricalPeriodFailure(this.errMessage);
}
