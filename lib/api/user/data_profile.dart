import 'package:json_annotation/json_annotation.dart';

part 'data_profile.g.dart';

@JsonSerializable()
class DataProfile {
  DataProfile({
     this.fullName,
     this.uid,
     this.mdu,
     this.gender,
     this.meli,
     this.mobile,
    this.amount = 0,
     this.shabaNumber,
     this.cartNumber,
     this.image,
  });

  @JsonKey(name: 'full_name')
  final String? fullName;
  final String? uid;
  final String? mdu;
  final int? gender;
  final int? amount;
  final String? mobile;

  @JsonKey(name: 'passport_code')
  final String? meli;

  @JsonKey(name: 'shaba_number')
  final String? shabaNumber;

  @JsonKey(name: 'cart_number')
  final String? cartNumber;
  final String? image;

  DataProfile copyWith({
    String? fullName,
    String? uid,
    String? mdu,
    int? gender,
    int? amount,
    String? mobile,
    String? meli,
    String? shabaNumber,
    String? cartNumber,
    String? image,
  }) {
    return DataProfile(
      fullName: fullName ?? this.fullName,
      uid: uid ?? this.uid,
      mdu: mdu ?? this.mdu,
      gender: gender ?? this.gender,
      amount: amount ?? this.amount,
      meli: meli ?? this.meli,
      mobile: mobile ?? this.mobile,
      shabaNumber: shabaNumber ?? this.shabaNumber,
      cartNumber: cartNumber ?? this.cartNumber,
      image: image ?? this.image,
    );
  }

  factory DataProfile.fromJson(Map<String, dynamic> json) => _$DataProfileFromJson(json);

  Map<String, dynamic> toJson() => _$DataProfileToJson(this);

  @override
  String toString(){
    return "$fullName, $uid, $mdu, $gender, $mobile, $shabaNumber, $cartNumber, $image,$amount ";
  }
}
