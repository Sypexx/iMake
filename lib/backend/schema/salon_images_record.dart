import 'dart:async';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:latlong/latlong.dart';

import 'schema_util.dart';
import 'serializers.dart';

part 'salon_images_record.g.dart';

abstract class SalonImagesRecord
    implements Built<SalonImagesRecord, SalonImagesRecordBuilder> {
  static Serializer<SalonImagesRecord> get serializer =>
      _$salonImagesRecordSerializer;

  @nullable
  String get img;

  @nullable
  DocumentReference get salon;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(SalonImagesRecordBuilder builder) =>
      builder..img = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('salon_images');

  static Stream<SalonImagesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  SalonImagesRecord._();
  factory SalonImagesRecord([void Function(SalonImagesRecordBuilder) updates]) =
      _$SalonImagesRecord;

  static SalonImagesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(
          serializer, {...data, kDocumentReferenceField: reference});
}

Map<String, dynamic> createSalonImagesRecordData({
  String img,
  DocumentReference salon,
}) =>
    serializers.toFirestore(
        SalonImagesRecord.serializer,
        SalonImagesRecord((s) => s
          ..img = img
          ..salon = salon));

SalonImagesRecord get dummySalonImagesRecord {
  final builder = SalonImagesRecordBuilder()..img = dummyImagePath;
  return builder.build();
}

List<SalonImagesRecord> createDummySalonImagesRecord({int count}) =>
    List.generate(count, (_) => dummySalonImagesRecord);
