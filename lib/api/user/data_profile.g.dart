// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataProfile _$DataProfileFromJson(Map<String, dynamic> json) => DataProfile(
      fullName: json['full_name'] as String?,
      uid: json['uid'] as String?,
      mdu: json['mdu'] as String?,
      gender: (json['gender'] as num?)?.toInt(),
      meli: json['passport_code'] as String?,
      mobile: json['mobile'] as String?,
      amount: (json['amount'] as num?)?.toInt() ?? 0,
      shabaNumber: json['shaba_number'] as String?,
      cartNumber: json['cart_number'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$DataProfileToJson(DataProfile instance) =>
    <String, dynamic>{
      'full_name': instance.fullName,
      'uid': instance.uid,
      'mdu': instance.mdu,
      'gender': instance.gender,
      'amount': instance.amount,
      'mobile': instance.mobile,
      'passport_code': instance.meli,
      'shaba_number': instance.shabaNumber,
      'cart_number': instance.cartNumber,
      'image': instance.image,
    };
