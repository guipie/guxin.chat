// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_req_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoginReqModelImpl _$$LoginReqModelImplFromJson(Map<String, dynamic> json) =>
    _$LoginReqModelImpl(
      account: json['Account'] as String?,
      password: json['Password'] as String?,
      code: json['Code'] as String?,
      u: json['U'] as String?,
    );

Map<String, dynamic> _$$LoginReqModelImplToJson(_$LoginReqModelImpl instance) =>
    <String, dynamic>{
      'Account': instance.account,
      'Password': instance.password,
      'Code': instance.code,
      'U': instance.u,
    };
