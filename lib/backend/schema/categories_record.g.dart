// // GENERATED CODE - DO NOT MODIFY BY HAND

// part of 'categories_record.dart';

// // **************************************************************************
// // BuiltValueGenerator
// // **************************************************************************

// Serializer<CategoriesRecord> _$categoriesRecordSerializer =
//     new _$CategoriesRecordSerializer();

// class _$CategoriesRecordSerializer
//     implements StructuredSerializer<CategoriesRecord> {
//   @override
//   final Iterable<Type> types = const [CategoriesRecord, _$CategoriesRecord];
//   @override
//   final String wireName = 'CategoriesRecord';

//   @override
//   Iterable<Object> serialize(Serializers serializers, CategoriesRecord object,
//       {FullType specifiedType = FullType.unspecified}) {
//     final result = <Object>[];
//     Object value;
//     value = object.imgUrl;
//     if (value != null) {
//       result
//         ..add('img_url')
//         ..add(serializers.serialize(value,
//             specifiedType: const FullType(String)));
//     }
//     value = object.text;
//     if (value != null) {
//       result
//         ..add('text')
//         ..add(serializers.serialize(value,
//             specifiedType: const FullType(String)));
//     }
//     value = object.reference;
//     if (value != null) {
//       result
//         ..add('Document__Reference__Field')
//         ..add(serializers.serialize(value,
//             specifiedType: const FullType(DocumentReference)));
//     }
//     return result;
//   }

//   @override
//   CategoriesRecord deserialize(
//       Serializers serializers, Iterable<Object> serialized,
//       {FullType specifiedType = FullType.unspecified}) {
//     final result = new CategoriesRecordBuilder();

//     final iterator = serialized.iterator;
//     while (iterator.moveNext()) {
//       final key = iterator.current as String;
//       iterator.moveNext();
//       final Object value = iterator.current;
//       switch (key) {
//         case 'img_url':
//           result.imgUrl = serializers.deserialize(value,
//               specifiedType: const FullType(String)) as String;
//           break;
//         case 'text':
//           result.text = serializers.deserialize(value,
//               specifiedType: const FullType(String)) as String;
//           break;
//         case 'Document__Reference__Field':
//           result.reference = serializers.deserialize(value,
//                   specifiedType: const FullType(DocumentReference))
//               as DocumentReference;
//           break;
//       }
//     }

//     return result.build();
//   }
// }

// class _$CategoriesRecord extends CategoriesRecord {
//   @override
//   final String imgUrl;
//   @override
//   final String text;
//   @override
//   final DocumentReference reference;

//   factory _$CategoriesRecord(
//           [void Function(CategoriesRecordBuilder) updates]) =>
//       (new CategoriesRecordBuilder()..update(updates)).build();

//   _$CategoriesRecord._({this.imgUrl, this.text, this.reference}) : super._();

//   @override
//   CategoriesRecord rebuild(void Function(CategoriesRecordBuilder) updates) =>
//       (toBuilder()..update(updates)).build();

//   @override
//   CategoriesRecordBuilder toBuilder() =>
//       new CategoriesRecordBuilder()..replace(this);

//   @override
//   bool operator ==(Object other) {
//     if (identical(other, this)) return true;
//     return other is CategoriesRecord &&
//         imgUrl == other.imgUrl &&
//         text == other.text &&
//         reference == other.reference;
//   }

//   @override
//   int get hashCode {
//     return $jf(
//         $jc($jc($jc(0, imgUrl.hashCode), text.hashCode), reference.hashCode));
//   }

//   @override
//   String toString() {
//     return (newBuiltValueToStringHelper('CategoriesRecord')
//           ..add('imgUrl', imgUrl)
//           ..add('text', text)
//           ..add('reference', reference))
//         .toString();
//   }
// }

// class CategoriesRecordBuilder
//     implements Builder<CategoriesRecord, CategoriesRecordBuilder> {
//   _$CategoriesRecord _$v;

//   String _imgUrl;
//   String get imgUrl => _$this._imgUrl;
//   set imgUrl(String imgUrl) => _$this._imgUrl = imgUrl;

//   String _text;
//   String get text => _$this._text;
//   set text(String text) => _$this._text = text;

//   DocumentReference _reference;
//   DocumentReference get reference => _$this._reference;
//   set reference(DocumentReference reference) => _$this._reference = reference;

//   CategoriesRecordBuilder() {
//     CategoriesRecord._initializeBuilder(this);
//   }

//   CategoriesRecordBuilder get _$this {
//     final $v = _$v;
//     if ($v != null) {
//       _imgUrl = $v.imgUrl;
//       _text = $v.text;
//       _reference = $v.reference;
//       _$v = null;
//     }
//     return this;
//   }

//   @override
//   void replace(CategoriesRecord other) {
//     ArgumentError.checkNotNull(other, 'other');
//     _$v = other as _$CategoriesRecord;
//   }

//   @override
//   void update(void Function(CategoriesRecordBuilder) updates) {
//     if (updates != null) updates(this);
//   }

//   @override
//   _$CategoriesRecord build() {
//     final _$result = _$v ??
//         new _$CategoriesRecord._(
//             imgUrl: imgUrl, text: text, reference: reference);
//     replace(_$result);
//     return _$result;
//   }
// }

// // ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
