// import 'dart:async';

// import 'index.dart';
// import 'serializers.dart';
// import 'package:built_value/built_value.dart';

// part 'salon_images_record.g.dart';

// abstract class SalonImagesRecord
//     implements Built<SalonImagesRecord, SalonImagesRecordBuilder> {
//   static Serializer<SalonImagesRecord> get serializer =>
//       _$salonImagesRecordSerializer;

//   @nullable
//   DocumentReference get salon;

//   @nullable
//   @BuiltValueField(wireName: 'img_url')
//   String get imgUrl;

//   @nullable
//   @BuiltValueField(wireName: kDocumentReferenceField)
//   DocumentReference get reference;

//   static void _initializeBuilder(SalonImagesRecordBuilder builder) =>
//       builder..imgUrl = '';

//   static CollectionReference get collection =>
//       FirebaseFirestore.instance.collection('salon_images');

//   static Stream<SalonImagesRecord> getDocument(DocumentReference ref) => ref
//       .snapshots()
//       .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

//   SalonImagesRecord._();
//   factory SalonImagesRecord([void Function(SalonImagesRecordBuilder) updates]) =
//       _$SalonImagesRecord;

//   static SalonImagesRecord getDocumentFromData(
//           Map<String, dynamic> data, DocumentReference reference) =>
//       serializers.deserializeWith(
//           serializer, {...data, kDocumentReferenceField: reference});
// }

// Map<String, dynamic> createSalonImagesRecordData({
//   DocumentReference salon,
//   String imgUrl,
// }) =>
//     serializers.toFirestore(
//         SalonImagesRecord.serializer,
//         SalonImagesRecord((s) => s
//           ..salon = salon
//           ..imgUrl = imgUrl));
