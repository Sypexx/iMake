// import 'dart:async';

// import 'index.dart';
// import 'serializers.dart';
// import 'package:built_value/built_value.dart';

// part 'categories_record.g.dart';

// abstract class CategoriesRecord
//     implements Built<CategoriesRecord, CategoriesRecordBuilder> {
//   static Serializer<CategoriesRecord> get serializer =>
//       _$categoriesRecordSerializer;

//   @nullable
//   @BuiltValueField(wireName: 'img_url')
//   String get imgUrl;

//   @nullable
//   String get text;

//   @nullable
//   @BuiltValueField(wireName: kDocumentReferenceField)
//   DocumentReference get reference;

//   static void _initializeBuilder(CategoriesRecordBuilder builder) => builder
//     ..imgUrl = ''
//     ..text = '';

//   static CollectionReference get collection =>
//       FirebaseFirestore.instance.collection('categories');

//   static Stream<CategoriesRecord> getDocument(DocumentReference ref) => ref
//       .snapshots()
//       .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

//   CategoriesRecord._();
//   factory CategoriesRecord([void Function(CategoriesRecordBuilder) updates]) =
//       _$CategoriesRecord;

//   static CategoriesRecord getDocumentFromData(
//           Map<String, dynamic> data, DocumentReference reference) =>
//       serializers.deserializeWith(
//           serializer, {...data, kDocumentReferenceField: reference});
// }

// Map<String, dynamic> createCategoriesRecordData({
//   String imgUrl,
//   String text,
// }) =>
//     serializers.toFirestore(
//         CategoriesRecord.serializer,
//         CategoriesRecord((c) => c
//           ..imgUrl = imgUrl
//           ..text = text));
