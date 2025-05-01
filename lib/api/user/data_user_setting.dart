import 'package:json_annotation/json_annotation.dart';

part 'data_user_setting.g.dart';

@JsonSerializable()
class DataUserSetting {
  DataUserSetting({
    this.uid,
    this.subscriptionStatus = false,
    this.subscriptionDate,
    this.balance = 0,
    this.targetSteps = 10000,
    this.walletAmount = 0,
    this.userToken,
    this.currentSteps = 0,
    this.countStepYesterday = 0,
    this.countPost = 0,
    this.countStepYAll = 0,
  });

  final String? uid;
  final bool subscriptionStatus;
  final DateTime? subscriptionDate;
  final int balance;
  final int targetSteps;
  final int walletAmount;
  final String? userToken;
  final int currentSteps;

  @JsonKey(name: 'count_step_yesterday')
  final int countStepYesterday;

  @JsonKey(name: 'count_post')
  final int countPost;

  @JsonKey(name: 'count_step_all')
  final int countStepYAll;

  DataUserSetting copyWith({
    String? uid,
    bool? subscriptionStatus,
    DateTime? subscriptionDate,
    int? balance,
    int? targetSteps,
    int? walletAmount,
    String? userToken,
    int? currentSteps,
    int? countStepYesterday,
    int? countPost,
    int? countStepYAll,
  }) {
    return DataUserSetting(
      uid: uid ?? this.uid,
      subscriptionStatus: subscriptionStatus ?? this.subscriptionStatus,
      subscriptionDate: subscriptionDate ?? this.subscriptionDate,
      balance: balance ?? this.balance,
      targetSteps: targetSteps ?? this.targetSteps,
      walletAmount: walletAmount ?? this.walletAmount,
      userToken: userToken ?? this.userToken,
      currentSteps: currentSteps ?? this.currentSteps,
      countStepYesterday: countStepYesterday ?? this.countStepYesterday,
      countPost: countPost ?? this.countPost,
      countStepYAll: countStepYAll ?? this.countStepYAll,
    );
  }

  factory DataUserSetting.fromJson(Map<String, dynamic> json) =>
      _$DataUserSettingFromJson(json);

  Map<String, dynamic> toJson() => _$DataUserSettingToJson(this);
}
