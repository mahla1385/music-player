part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}
final class ProfileDataLocal extends ProfileState {
  final DataProfile dataProfile;
  ProfileDataLocal({required this.dataProfile});
}
final class ProfileDataSetting extends ProfileState {
  final DataUserSetting dataUserSetting;
  ProfileDataSetting({required this.dataUserSetting});
}
