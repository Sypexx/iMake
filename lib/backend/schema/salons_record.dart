import 'dart:async';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:latlong/latlong.dart';

import 'schema_util.dart';
import 'serializers.dart';

part 'salons_record.g.dart';

abstract class SalonsRecord
    implements Built<SalonsRecord, SalonsRecordBuilder> {
  static Serializer<SalonsRecord> get serializer => _$salonsRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'front_image')
  String get frontImage;

  @nullable
  @BuiltValueField(wireName: 'salon_name')
  String get salonName;

  @nullable
  @BuiltValueField(wireName: 'salon_street')
  String get salonStreet;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(SalonsRecordBuilder builder) => builder
    ..frontImage = ''
    ..salonName = ''
    ..salonStreet = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('salons');

  static Stream<SalonsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  SalonsRecord._();
  factory SalonsRecord([void Function(SalonsRecordBuilder) updates]) =
      _$SalonsRecord;

  static SalonsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(
          serializer, {...data, kDocumentReferenceField: reference});
}

Map<String, dynamic> createSalonsRecordData({
  String frontImage,
  String salonName,
  String salonStreet,
}) =>
    serializers.toFirestore(
        SalonsRecord.serializer,
        SalonsRecord((s) => s
          ..frontImage = frontImage
          ..salonName = salonName
          ..salonStreet = salonStreet));

SalonsRecord get dummySalonsRecord {
  final builder = SalonsRecordBuilder()
    ..frontImage = dummyImagePath
    ..salonName = dummyString
    ..salonStreet = dummyString;
  return builder.build();
}

List<SalonsRecord> createDummySalonsRecord({int count}) =>
    List.generate(count, (_) => dummySalonsRecord);
