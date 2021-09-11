// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'zapis_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

// Serializer<ZapisRecord> _$zapisRecordSerializer = new _$ZapisRecordSerializer();

// class _$ZapisRecordSerializer implements StructuredSerializer<ZapisRecord> {
//   @override
//   final Iterable<Type> types = const [ZapisRecord, _$ZapisRecord];
//   @override
//   final String wireName = 'ZapisRecord';

//   @override
//   Iterable<Object> serialize(Serializers serializers, ZapisRecord object,
//       {FullType specifiedType = FullType.unspecified}) {
//     final result = <Object>[];
//     Object value;
//     value = object.date;
//     if (value != null) {
//       result
//         ..add('date')
//         ..add(serializers.serialize(value,
//             specifiedType: const FullType(DateTime)));
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
//   ZapisRecord deserialize(Serializers serializers, Iterable<Object> serialized,
//       {FullType specifiedType = FullType.unspecified}) {
//     final result = new ZapisRecordBuilder();

//     final iterator = serialized.iterator;
//     while (iterator.moveNext()) {
//       final key = iterator.current as String;
//       iterator.moveNext();
//       final Object value = iterator.current;
//       switch (key) {
//         case 'date':
//           result.date = serializers.deserialize(value,
//               specifiedType: const FullType(DateTime)) as DateTime;
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

// class _$ZapisRecord extends ZapisRecord {
//   @override
//   final DateTime date;
//   @override
//   final DocumentReference user;
//   @override
//   final DocumentReference reference;

//   factory _$ZapisRecord([void Function(ZapisRecordBuilder) updates]) =>
//       (new ZapisRecordBuilder()..update(updates)).build();

//   _$ZapisRecord._({this.date, this.user, this.reference}) : super._();

//   @override
//   ZapisRecord rebuild(void Function(ZapisRecordBuilder) updates) =>
//       (toBuilder()..update(updates)).build();

//   @override
//   ZapisRecordBuilder toBuilder() => new ZapisRecordBuilder()..replace(this);

//   @override
//   bool operator ==(Object other) {
//     if (identical(other, this)) return true;
//     return other is ZapisRecord &&
//         date == other.date &&
//         user == other.user &&
//         reference == other.reference;
//   }

//   @override
//   int get hashCode {
//     return $jf(
//         $jc($jc($jc(0, date.hashCode), user.hashCode), reference.hashCode));
//   }

//   @override
//   String toString() {
//     return (newBuiltValueToStringHelper('ZapisRecord')
//           ..add('date', date)
//           ..add('user', user)
//           ..add('reference', reference))
//         .toString();
//   }
// }

// class ZapisRecordBuilder implements Builder<ZapisRecord, ZapisRecordBuilder> {
//   _$ZapisRecord _$v;

//   DateTime _date;
//   DateTime get date => _$this._date;
//   set date(DateTime date) => _$this._date = date;

//   DocumentReference _user;
//   DocumentReference get user => _$this._user;
//   set user(DocumentReference user) => _$this._user = user;

//   DocumentReference _reference;
//   DocumentReference get reference => _$this._reference;
//   set reference(DocumentReference reference) => _$this._reference = reference;

//   ZapisRecordBuilder() {
//     ZapisRecord._initializeBuilder(this);
//   }

//   ZapisRecordBuilder get _$this {
//     final $v = _$v;
//     if ($v != null) {
//       _date = $v.date;
//       _user = $v.user;
//       _reference = $v.reference;
//       _$v = null;
//     }
//     return this;
//   }

//   @override
//   void replace(ZapisRecord other) {
//     ArgumentError.checkNotNull(other, 'other');
//     _$v = other as _$ZapisRecord;
//   }

//   @override
//   void update(void Function(ZapisRecordBuilder) updates) {
//     if (updates != null) updates(this);
//   }

//   @override
//   _$ZapisRecord build() {
//     final _$result = _$v ??
//         new _$ZapisRecord._(date: date, user: user, reference: reference);
//     replace(_$result);
//     return _$result;
//   }
// }