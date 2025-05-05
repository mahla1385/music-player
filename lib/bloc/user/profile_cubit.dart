import 'package:bloc/bloc.dart';
import 'package:music/api/user/data_profile.dart';
import 'package:music/api/user/data_user_setting.dart';
import 'package:music/database/database_user.dart';
import 'package:meta/meta.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());


  Future<void> getProfile() async {
    final dataProfile = await DBUser.getDataProfile();
    emit(ProfileDataLocal(dataProfile: dataProfile));
  }

  Future<void> getSettingUser() async {
    final dataUserSetting = await DBUser.getDataProfileSetting();
    emit(ProfileDataSetting(dataUserSetting: dataUserSetting));
  }


}
