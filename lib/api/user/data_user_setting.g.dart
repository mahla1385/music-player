// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_user_setting.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataUserSetting _$DataUserSettingFromJson(Map<String, dynamic> json) =>
    DataUserSetting(
      uid: json['uid'] as String?,
      subscriptionStatus: json['subscriptionStatus'] as bool? ?? false,
      subscriptionDate: json['subscriptionDate'] == null
          ? null
          : DateTime.parse(json['subscriptionDate'] as String),
      balance: (json['balance'] as num?)?.toInt() ?? 0,
      targetSteps: (json['targetSteps'] as num?)?.toInt() ?? 10000,
      walletAmount: (json['walletAmount'] as num?)?.toInt() ?? 0,
      userToken: json['userToken'] as String?,
      currentSteps: (json['currentSteps'] as num?)?.toInt() ?? 0,
      countStepYesterday: (json['count_step_yesterday'] as num?)?.toInt() ?? 0,
      countPost: (json['count_post'] as num?)?.toInt() ?? 0,
      countStepYAll: (json['count_step_all'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$DataUserSettingToJson(DataUserSetting instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'subscriptionStatus': instance.subscriptionStatus,
      'subscriptionDate': instance.subscriptionDate?.toIso8601String(),
      'balance': instance.balance,
      'targetSteps': instance.targetSteps,
      'walletAmount': instance.walletAmount,
      'userToken': instance.userToken,
      'currentSteps': instance.currentSteps,
      'count_step_yesterday': instance.countStepYesterday,
      'count_post': instance.countPost,
      'count_step_all': instance.countStepYAll,
    };
