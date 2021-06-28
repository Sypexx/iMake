import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'time_record.g.dart';

abstract class TimeRecord implements Built<TimeRecord, TimeRecordBuilder> {
  static Serializer<TimeRecord> get serializer => _$timeRecordSerializer;

  @nullable
  String get text;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(TimeRecordBuilder builder) =>
      builder..text = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('time');

  static Stream<TimeRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  TimeRecord._();
  factory TimeRecord([void Function(TimeRecordBuilder) updates]) = _$TimeRecord;

  static TimeRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(
          serializer, {...data, kDocumentReferenceField: reference});
}

Map<String, dynamic> createTimeRecordData({
  String text,
}) =>
    serializers.toFirestore(
        TimeRecord.serializer, TimeRecord((t) => t..text = text));
