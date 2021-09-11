// import 'dart:async';

// import 'index.dart';
// import 'serializers.dart';
// import 'package:built_value/built_value.dart';

// part 'date_record.g.dart';

// abstract class DateRecord implements Built<DateRecord, DateRecordBuilder> {
//   static Serializer<DateRecord> get serializer => _$dateRecordSerializer;

//   @nullable
//   String get text;

//   @nullable
//   @BuiltValueField(wireName: kDocumentReferenceField)
//   DocumentReference get reference;

//   static void _initializeBuilder(DateRecordBuilder builder) =>
//       builder..text = '';

//   static CollectionReference get collection =>
//       FirebaseFirestore.instance.collection('date');

//   static Stream<DateRecord> getDocument(DocumentReference ref) => ref
//       .snapshots()
//       .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

//   DateRecord._();
//   factory DateRecord([void Function(DateRecordBuilder) updates]) = _$DateRecord;

//   static DateRecord getDocumentFromData(
//           Map<String, dynamic> data, DocumentReference reference) =>
//       serializers.deserializeWith(
//           serializer, {...data, kDocumentReferenceField: reference});
// }

// Map<String, dynamic> createDateRecordData({
//   String text,
// }) =>
//     serializers.toFirestore(
//         DateRecord.serializer, DateRecord((d) => d..text = text));
