// // GENERATED CODE - DO NOT MODIFY BY HAND

// part of 'ad_record.dart';

// // **************************************************************************
// // BuiltValueGenerator
// // **************************************************************************

// Serializer<AdRecord> _$adRecordSerializer = new _$AdRecordSerializer();

// class _$AdRecordSerializer implements StructuredSerializer<AdRecord> {
//   @override
//   final Iterable<Type> types = const [AdRecord, _$AdRecord];
//   @override
//   final String wireName = 'AdRecord';

//   @override
//   Iterable<Object> serialize(Serializers serializers, AdRecord object,
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
//     value = object.id;
//     if (value != null) {
//       result
//         ..add('id')
//         ..add(serializers.serialize(value, specifiedType: const FullType(int)));
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
//   AdRecord deserialize(Serializers serializers, Iterable<Object> serialized,
//       {FullType specifiedType = FullType.unspecified}) {
//     final result = new AdRecordBuilder();

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
//         case 'id':
//           result.id = serializers.deserialize(value,
//               specifiedType: const FullType(int)) as int;
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

// class _$AdRecord extends AdRecord {
//   @override
//   final String imgUrl;
//   @override
//   final int id;
//   @override
//   final DocumentReference reference;

//   factory _$AdRecord([void Function(AdRecordBuilder) updates]) =>
//       (new AdRecordBuilder()..update(updates)).build();

//   _$AdRecord._({this.imgUrl, this.id, this.reference}) : super._();

//   @override
//   AdRecord rebuild(void Function(AdRecordBuilder) updates) =>
//       (toBuilder()..update(updates)).build();

//   @override
//   AdRecordBuilder toBuilder() => new AdRecordBuilder()..replace(this);

//   @override
//   bool operator ==(Object other) {
//     if (identical(other, this)) return true;
//     return other is AdRecord &&
//         imgUrl == other.imgUrl &&
//         id == other.id &&
//         reference == other.reference;
//   }

//   @override
//   int get hashCode {
//     return $jf(
//         $jc($jc($jc(0, imgUrl.hashCode), id.hashCode), reference.hashCode));
//   }

//   @override
//   String toString() {
//     return (newBuiltValueToStringHelper('AdRecord')
//           ..add('imgUrl', imgUrl)
//           ..add('id', id)
//           ..add('reference', reference))
//         .toString();
//   }
// }

// class AdRecordBuilder implements Builder<AdRecord, AdRecordBuilder> {
//   _$AdRecord _$v;

//   String _imgUrl;
//   String get imgUrl => _$this._imgUrl;
//   set imgUrl(String imgUrl) => _$this._imgUrl = imgUrl;

//   int _id;
//   int get id => _$this._id;
//   set id(int id) => _$this._id = id;

//   DocumentReference _reference;
//   DocumentReference get reference => _$this._reference;
//   set reference(DocumentReference reference) => _$this._reference = reference;

//   AdRecordBuilder() {
//     AdRecord._initializeBuilder(this);
//   }

//   AdRecordBuilder get _$this {
//     final $v = _$v;
//     if ($v != null) {
//       _imgUrl = $v.imgUrl;
//       _id = $v.id;
//       _reference = $v.reference;
//       _$v = null;
//     }
//     return this;
//   }

//   @override
//   void replace(AdRecord other) {
//     ArgumentError.checkNotNull(other, 'other');
//     _$v = other as _$AdRecord;
//   }

//   @override
//   void update(void Function(AdRecordBuilder) updates) {
//     if (updates != null) updates(this);
//   }

//   @override
//   _$AdRecord build() {
//     final _$result =
//         _$v ?? new _$AdRecord._(imgUrl: imgUrl, id: id, reference: reference);
//     replace(_$result);
//     return _$result;
//   }
// }

// // ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
