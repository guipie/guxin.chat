// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatItemModelImpl _$$ChatItemModelImplFromJson(Map<String, dynamic> json) =>
    _$ChatItemModelImpl(
      id: (json['Id'] as num?)?.toInt(),
      conversationId: (json['ConversationId'] as num).toInt(),
      sendMsg: json['SendMsg'] as String,
      receiveMsg: json['ReceiveMsg'] as String,
      msgType: $enumDecode(_$MsgTypeEnumEnumMap, json['MsgType']),
      sendId: (json['SendId'] as num).toInt(),
      receiveId: (json['ReceiveId'] as num).toInt(),
      desc: json['Desc'] as String?,
      createTime: _$JsonConverterFromJson<String, DateTime>(
          json['CreateTime'], const DateTimeConverter().fromJson),
      lastTime: _$JsonConverterFromJson<String, DateTime>(
          json['LastTime'], const DateTimeConverter().fromJson),
      type: $enumDecode(_$ConversationEnumEnumMap, json['Type']),
      relationId: (json['RelationId'] as num?)?.toInt() ?? 0,
      status: json['status'] == null
          ? ChatResStatusEnum.error
          : ChatResStatusEnum.fromJson((json['status'] as num).toInt()),
      extens: json['Extens'] as String?,
    );

Map<String, dynamic> _$$ChatItemModelImplToJson(_$ChatItemModelImpl instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'ConversationId': instance.conversationId,
      'SendMsg': instance.sendMsg,
      'ReceiveMsg': instance.receiveMsg,
      'MsgType': _$MsgTypeEnumEnumMap[instance.msgType]!,
      'SendId': instance.sendId,
      'ReceiveId': instance.receiveId,
      'Desc': instance.desc,
      'CreateTime': _$JsonConverterToJson<String, DateTime>(
          instance.createTime, const DateTimeConverter().toJson),
      'LastTime': _$JsonConverterToJson<String, DateTime>(
          instance.lastTime, const DateTimeConverter().toJson),
      'Type': _$ConversationEnumEnumMap[instance.type]!,
      'RelationId': instance.relationId,
      'status': ChatResStatusEnum.toJson(instance.status),
      'Extens': instance.extens,
    };

const _$MsgTypeEnumEnumMap = {
  MsgTypeEnum.text: 'text',
  MsgTypeEnum.image: 'image',
  MsgTypeEnum.audio: 'audio',
  MsgTypeEnum.video: 'video',
  MsgTypeEnum.file: 'file',
};

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

const _$ConversationEnumEnumMap = {
  ConversationEnum.chat: 'chat',
  ConversationEnum.prompt: 'prompt',
  ConversationEnum.model: 'model',
  ConversationEnum.group: 'group',
};

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
