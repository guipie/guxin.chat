// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_req_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatReqDtoImpl _$$ChatReqDtoImplFromJson(Map<String, dynamic> json) =>
    _$ChatReqDtoImpl(
      conversationId: (json['ConversationId'] as num).toInt(),
      message: json['Message'] as String,
      model: json['Model'] as String,
      chatDbId: (json['ChatDbId'] as num?)?.toInt(),
      rolePrompt: json['RolePrompt'] as String?,
      maxContext: (json['MaxContext'] as num?)?.toInt(),
      useAsyncDb: json['UseAsyncDb'] as bool? ?? false,
      options: json['Options'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$ChatReqDtoImplToJson(_$ChatReqDtoImpl instance) =>
    <String, dynamic>{
      'ConversationId': instance.conversationId,
      'Message': instance.message,
      'Model': instance.model,
      'ChatDbId': instance.chatDbId,
      'RolePrompt': instance.rolePrompt,
      'MaxContext': instance.maxContext,
      'UseAsyncDb': instance.useAsyncDb,
      'Options': instance.options,
    };
