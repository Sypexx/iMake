// import 'dart:async';

// import 'index.dart';
// import 'serializers.dart';
// import 'package:built_value/built_value.dart';

// part 'ad_record.g.dart';

// abstract class AdRecord implements Built<AdRecord, AdRecordBuilder> {
//   static Serializer<AdRecord> get serializer => _$adRecordSerializer;

//   @nullable
//   @BuiltValueField(wireName: 'img_url')
//   String get imgUrl;

//   @nullable
//   int get id;

//   @nullable
//   @BuiltValueField(wireName: kDocumentReferenceField)
//   DocumentReference get reference;

//   static void _initializeBuilder(AdRecordBuilder builder) => builder
//     ..imgUrl = ''
//     ..id = 0;

//   static CollectionReference get collection =>
//       FirebaseFirestore.instance.collection('ad');

//   static Stream<AdRecord> getDocument(DocumentReference ref) => ref
//       .snapshots()
//       .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

//   AdRecord._();
//   factory AdRecord([void Function(AdRecordBuilder) updates]) = _$AdRecord;

//   static AdRecord getDocumentFromData(
//           Map<String, dynamic> data, DocumentReference reference) =>
//       serializers.deserializeWith(
//           serializer, {...data, kDocumentReferenceField: reference});
// }

// Map<String, dynamic> createAdRecordData({
//   String imgUrl,
//   int id,
// }) =>
//     serializers.toFirestore(
//         AdRecord.serializer,
//         AdRecord((a) => a
//           ..imgUrl = imgUrl
//           ..id = id));
