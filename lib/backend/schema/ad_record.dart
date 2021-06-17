import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:latlong/latlong.dart';

import 'schema_util.dart';
import 'serializers.dart';

part 'ad_record.g.dart';

abstract class AdRecord implements Built<AdRecord, AdRecordBuilder> {
  static Serializer<AdRecord> get serializer => _$adRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'img_url')
  String get imgUrl;

  @nullable
  int get id;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(AdRecordBuilder builder) => builder
    ..imgUrl = ''
    ..id = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ad');

  static Stream<AdRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  AdRecord._();
  factory AdRecord([void Function(AdRecordBuilder) updates]) = _$AdRecord;
}

Map<String, dynamic> createAdRecordData({
  String imgUrl,
  int id,
}) =>
    serializers.toFirestore(
        AdRecord.serializer,
        AdRecord((a) => a
          ..imgUrl = imgUrl
          ..id = id));

AdRecord get dummyAdRecord {
  final builder = AdRecordBuilder()
    ..imgUrl = dummyImagePath
    ..id = dummyInteger;
  return builder.build();
}

List<AdRecord> createDummyAdRecord({int count}) =>
    List.generate(count, (_) => dummyAdRecord);
