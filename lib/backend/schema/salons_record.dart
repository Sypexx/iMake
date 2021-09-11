// import 'dart:async';

// import 'index.dart';
// import 'serializers.dart';
// import 'package:built_value/built_value.dart';

// part 'salons_record.g.dart';

// abstract class SalonsRecord
//     implements Built<SalonsRecord, SalonsRecordBuilder> {
//   static Serializer<SalonsRecord> get serializer => _$salonsRecordSerializer;

//   @nullable
//   @BuiltValueField(wireName: 'front_image')
//   String get frontImage;

//   @nullable
//   @BuiltValueField(wireName: 'salon_name')
//   String get salonName;

//   @nullable
//   @BuiltValueField(wireName: 'salon_street')
//   String get salonStreet;

//   @nullable
//   DocumentReference get user;

//   @nullable
//   @BuiltValueField(wireName: kDocumentReferenceField)
//   DocumentReference get reference;

//   static void _initializeBuilder(SalonsRecordBuilder builder) => builder
//     ..frontImage = ''
//     ..salonName = ''
//     ..salonStreet = '';

//   static CollectionReference get collection =>
//       FirebaseFirestore.instance.collection('salons');

//   static Stream<SalonsRecord> getDocument(DocumentReference ref) => ref
//       .snapshots()
//       .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

//   SalonsRecord._();
//   factory SalonsRecord([void Function(SalonsRecordBuilder) updates]) =
//       _$SalonsRecord;

//   static SalonsRecord getDocumentFromData(
//           Map<String, dynamic> data, DocumentReference reference) =>
//       serializers.deserializeWith(
//           serializer, {...data, kDocumentReferenceField: reference});
// }

// Map<String, dynamic> createSalonsRecordData({
//   String frontImage,
//   String salonName,
//   String salonStreet,
//   DocumentReference user,
// }) =>
//     serializers.toFirestore(
//         SalonsRecord.serializer,
//         SalonsRecord((s) => s
//           ..frontImage = frontImage
//           ..salonName = salonName
//           ..salonStreet = salonStreet
//           ..user = user));
