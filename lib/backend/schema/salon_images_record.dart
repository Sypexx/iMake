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
  @BuiltValueField(wireName: 'img_url')
  String get imgUrl;

  @nullable
  DocumentReference get salon;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(SalonImagesRecordBuilder builder) =>
      builder..imgUrl = '';

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
  String imgUrl,
  DocumentReference salon,
}) =>
    serializers.toFirestore(
        SalonImagesRecord.serializer,
        SalonImagesRecord((s) => s
          ..imgUrl = imgUrl
          ..salon = salon));

SalonImagesRecord get dummySalonImagesRecord {
  final builder = SalonImagesRecordBuilder()..imgUrl = dummyImagePath;
  return builder.build();
}

List<SalonImagesRecord> createDummySalonImagesRecord({int count}) =>
    List.generate(count, (_) => dummySalonImagesRecord);
