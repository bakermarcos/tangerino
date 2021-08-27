// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dados.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Dados _$DadosFromJson(Map<String, dynamic> json) => Dados(
      funcionariosAtivos: (json['funcionariosAtivos'] as List<dynamic>)
          .map((e) => FuncionariosAtivo.fromJson(e as String))
          .toList(),
      comPresenca: json['comPresenca'] as int,
      semPresenca: json['semPresenca'] as int,
      pontoAberto: json['pontoAberto'] as int,
      pontoFechado: json['pontoFechado'] as int,
      emFerias: json['emFerias'] as int,
      comHoraExtra: json['comHoraExtra'] as int,
    );

Map<String, dynamic> _$DadosToJson(Dados instance) => <String, dynamic>{
      'funcionariosAtivos': instance.funcionariosAtivos,
      'comPresenca': instance.comPresenca,
      'semPresenca': instance.semPresenca,
      'pontoAberto': instance.pontoAberto,
      'pontoFechado': instance.pontoFechado,
      'emFerias': instance.emFerias,
      'comHoraExtra': instance.comHoraExtra,
    };
