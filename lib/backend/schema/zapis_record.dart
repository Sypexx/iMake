import 'dart:async';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:latlong/latlong.dart';

import 'schema_util.dart';
import 'serializers.dart';

part 'zapis_record.g.dart';

abstract class ZapisRecord implements Built<ZapisRecord, ZapisRecordBuilder> {
  static Serializer<ZapisRecord> get serializer => _$zapisRecordSerializer;

  @nullable
  DateTime get date;

  @nullable
  DocumentReference get user;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(ZapisRecordBuilder builder) => builder;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('zapis');

  static Stream<ZapisRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  ZapisRecord._();
  factory ZapisRecord([void Function(ZapisRecordBuilder) updates]) =
      _$ZapisRecord;

  static ZapisRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(
          serializer, {...data, kDocumentReferenceField: reference});
}

Map<String, dynamic> createZapisRecordData({
  DateTime date,
  DocumentReference user,
}) =>
    serializers.toFirestore(
        ZapisRecord.serializer,
        ZapisRecord((z) => z
          ..date = date
          ..user = user));

ZapisRecord get dummyZapisRecord {
  final builder = ZapisRecordBuilder()..date = dummyTimestamp;
  return builder.build();
}

List<ZapisRecord> createDummyZapisRecord({int count}) =>
    List.generate(count, (_) => dummyZapisRecord);
