import 'dart:async';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:latlong/latlong.dart';

import 'schema_util.dart';
import 'serializers.dart';

part 'categories_text_record.g.dart';

abstract class CategoriesTextRecord
    implements Built<CategoriesTextRecord, CategoriesTextRecordBuilder> {
  static Serializer<CategoriesTextRecord> get serializer =>
      _$categoriesTextRecordSerializer;

  @nullable
  BuiltList<String> get text;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(CategoriesTextRecordBuilder builder) =>
      builder..text = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('categories_text');

  static Stream<CategoriesTextRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  CategoriesTextRecord._();
  factory CategoriesTextRecord(
          [void Function(CategoriesTextRecordBuilder) updates]) =
      _$CategoriesTextRecord;

  static CategoriesTextRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(
          serializer, {...data, kDocumentReferenceField: reference});
}

Map<String, dynamic> createCategoriesTextRecordData() =>
    serializers.toFirestore(CategoriesTextRecord.serializer,
        CategoriesTextRecord((c) => c..text = null));

CategoriesTextRecord get dummyCategoriesTextRecord {
  final builder = CategoriesTextRecordBuilder()
    ..text = ListBuilder([dummyString, dummyString]);
  return builder.build();
}

List<CategoriesTextRecord> createDummyCategoriesTextRecord({int count}) =>
    List.generate(count, (_) => dummyCategoriesTextRecord);
