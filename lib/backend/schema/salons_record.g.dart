// // GENERATED CODE - DO NOT MODIFY BY HAND

// part of 'salons_record.dart';

// // **************************************************************************
// // BuiltValueGenerator
// // **************************************************************************

// Serializer<SalonsRecord> _$salonsRecordSerializer =
//     new _$SalonsRecordSerializer();

// class _$SalonsRecordSerializer implements StructuredSerializer<SalonsRecord> {
//   @override
//   final Iterable<Type> types = const [SalonsRecord, _$SalonsRecord];
//   @override
//   final String wireName = 'SalonsRecord';

//   @override
//   Iterable<Object> serialize(Serializers serializers, SalonsRecord object,
//       {FullType specifiedType = FullType.unspecified}) {
//     final result = <Object>[];
//     Object value;
//     value = object.frontImage;
//     if (value != null) {
//       result
//         ..add('front_image')
//         ..add(serializers.serialize(value,
//             specifiedType: const FullType(String)));
//     }
//     value = object.salonName;
//     if (value != null) {
//       result
//         ..add('salon_name')
//         ..add(serializers.serialize(value,
//             specifiedType: const FullType(String)));
//     }
//     value = object.salonStreet;
//     if (value != null) {
//       result
//         ..add('salon_street')
//         ..add(serializers.serialize(value,
//             specifiedType: const FullType(String)));
//     }
//     value = object.user;
//     if (value != null) {
//       result
//         ..add('user')
//         ..add(serializers.serialize(value,
//             specifiedType: const FullType(DocumentReference)));
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
//   SalonsRecord deserialize(Serializers serializers, Iterable<Object> serialized,
//       {FullType specifiedType = FullType.unspecified}) {
//     final result = new SalonsRecordBuilder();

//     final iterator = serialized.iterator;
//     while (iterator.moveNext()) {
//       final key = iterator.current as String;
//       iterator.moveNext();
//       final Object value = iterator.current;
//       switch (key) {
//         case 'front_image':
//           result.frontImage = serializers.deserialize(value,
//               specifiedType: const FullType(String)) as String;
//           break;
//         case 'salon_name':
//           result.salonName = serializers.deserialize(value,
//               specifiedType: const FullType(String)) as String;
//           break;
//         case 'salon_street':
//           result.salonStreet = serializers.deserialize(value,
//               specifiedType: const FullType(String)) as String;
//           break;
//         case 'user':
//           result.user = serializers.deserialize(value,
//                   specifiedType: const FullType(DocumentReference))
//               as DocumentReference;
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

// class _$SalonsRecord extends SalonsRecord {
//   @override
//   final String frontImage;
//   @override
//   final String salonName;
//   @override
//   final String salonStreet;
//   @override
//   final DocumentReference user;
//   @override
//   final DocumentReference reference;

//   factory _$SalonsRecord([void Function(SalonsRecordBuilder) updates]) =>
//       (new SalonsRecordBuilder()..update(updates)).build();

//   _$SalonsRecord._(
//       {this.frontImage,
//       this.salonName,
//       this.salonStreet,
//       this.user,
//       this.reference})
//       : super._();

//   @override
//   SalonsRecord rebuild(void Function(SalonsRecordBuilder) updates) =>
//       (toBuilder()..update(updates)).build();

//   @override
//   SalonsRecordBuilder toBuilder() => new SalonsRecordBuilder()..replace(this);

//   @override
//   bool operator ==(Object other) {
//     if (identical(other, this)) return true;
//     return other is SalonsRecord &&
//         frontImage == other.frontImage &&
//         salonName == other.salonName &&
//         salonStreet == other.salonStreet &&
//         user == other.user &&
//         reference == other.reference;
//   }

//   @override
//   int get hashCode {
//     return $jf($jc(
//         $jc(
//             $jc($jc($jc(0, frontImage.hashCode), salonName.hashCode),
//                 salonStreet.hashCode),
//             user.hashCode),
//         reference.hashCode));
//   }

//   @override
//   String toString() {
//     return (newBuiltValueToStringHelper('SalonsRecord')
//           ..add('frontImage', frontImage)
//           ..add('salonName', salonName)
//           ..add('salonStreet', salonStreet)
//           ..add('user', user)
//           ..add('reference', reference))
//         .toString();
//   }
// }

// class SalonsRecordBuilder
//     implements Builder<SalonsRecord, SalonsRecordBuilder> {
//   _$SalonsRecord _$v;

//   String _frontImage;
//   String get frontImage => _$this._frontImage;
//   set frontImage(String frontImage) => _$this._frontImage = frontImage;

//   String _salonName;
//   String get salonName => _$this._salonName;
//   set salonName(String salonName) => _$this._salonName = salonName;

//   String _salonStreet;
//   String get salonStreet => _$this._salonStreet;
//   set salonStreet(String salonStreet) => _$this._salonStreet = salonStreet;

//   DocumentReference _user;
//   DocumentReference get user => _$this._user;
//   set user(DocumentReference user) => _$this._user = user;

//   DocumentReference _reference;
//   DocumentReference get reference => _$this._reference;
//   set reference(DocumentReference reference) => _$this._reference = reference;

//   SalonsRecordBuilder() {
//     SalonsRecord._initializeBuilder(this);
//   }

//   SalonsRecordBuilder get _$this {
//     final $v = _$v;
//     if ($v != null) {
//       _frontImage = $v.frontImage;
//       _salonName = $v.salonName;
//       _salonStreet = $v.salonStreet;
//       _user = $v.user;
//       _reference = $v.reference;
//       _$v = null;
//     }
//     return this;
//   }

//   @override
//   void replace(SalonsRecord other) {
//     ArgumentError.checkNotNull(other, 'other');
//     _$v = other as _$SalonsRecord;
//   }

//   @override
//   void update(void Function(SalonsRecordBuilder) updates) {
//     if (updates != null) updates(this);
//   }

//   @override
//   _$SalonsRecord build() {
//     final _$result = _$v ??
//         new _$SalonsRecord._(
//             frontImage: frontImage,
//             salonName: salonName,
//             salonStreet: salonStreet,
//             user: user,
//             reference: reference);
//     replace(_$result);
//     return _$result;
//   }
// }

// // ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
