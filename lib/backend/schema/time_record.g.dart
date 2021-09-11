// // GENERATED CODE - DO NOT MODIFY BY HAND

// part of 'time_record.dart';

// // **************************************************************************
// // BuiltValueGenerator
// // **************************************************************************

// Serializer<TimeRecord> _$timeRecordSerializer = new _$TimeRecordSerializer();

// class _$TimeRecordSerializer implements StructuredSerializer<TimeRecord> {
//   @override
//   final Iterable<Type> types = const [TimeRecord, _$TimeRecord];
//   @override
//   final String wireName = 'TimeRecord';

//   @override
//   Iterable<Object> serialize(Serializers serializers, TimeRecord object,
//       {FullType specifiedType = FullType.unspecified}) {
//     final result = <Object>[];
//     Object value;
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
//   TimeRecord deserialize(Serializers serializers, Iterable<Object> serialized,
//       {FullType specifiedType = FullType.unspecified}) {
//     final result = new TimeRecordBuilder();

//     final iterator = serialized.iterator;
//     while (iterator.moveNext()) {
//       final key = iterator.current as String;
//       iterator.moveNext();
//       final Object value = iterator.current;
//       switch (key) {
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

// class _$TimeRecord extends TimeRecord {
//   @override
//   final String text;
//   @override
//   final DocumentReference reference;

//   factory _$TimeRecord([void Function(TimeRecordBuilder) updates]) =>
//       (new TimeRecordBuilder()..update(updates)).build();

//   _$TimeRecord._({this.text, this.reference}) : super._();

//   @override
//   TimeRecord rebuild(void Function(TimeRecordBuilder) updates) =>
//       (toBuilder()..update(updates)).build();

//   @override
//   TimeRecordBuilder toBuilder() => new TimeRecordBuilder()..replace(this);

//   @override
//   bool operator ==(Object other) {
//     if (identical(other, this)) return true;
//     return other is TimeRecord &&
//         text == other.text &&
//         reference == other.reference;
//   }

//   @override
//   int get hashCode {
//     return $jf($jc($jc(0, text.hashCode), reference.hashCode));
//   }

//   @override
//   String toString() {
//     return (newBuiltValueToStringHelper('TimeRecord')
//           ..add('text', text)
//           ..add('reference', reference))
//         .toString();
//   }
// }

// class TimeRecordBuilder implements Builder<TimeRecord, TimeRecordBuilder> {
//   _$TimeRecord _$v;

//   String _text;
//   String get text => _$this._text;
//   set text(String text) => _$this._text = text;

//   DocumentReference _reference;
//   DocumentReference get reference => _$this._reference;
//   set reference(DocumentReference reference) => _$this._reference = reference;

//   TimeRecordBuilder() {
//     TimeRecord._initializeBuilder(this);
//   }

//   TimeRecordBuilder get _$this {
//     final $v = _$v;
//     if ($v != null) {
//       _text = $v.text;
//       _reference = $v.reference;
//       _$v = null;
//     }
//     return this;
//   }

//   @override
//   void replace(TimeRecord other) {
//     ArgumentError.checkNotNull(other, 'other');
//     _$v = other as _$TimeRecord;
//   }

//   @override
//   void update(void Function(TimeRecordBuilder) updates) {
//     if (updates != null) updates(this);
//   }

//   @override
//   _$TimeRecord build() {
//     final _$result =
//         _$v ?? new _$TimeRecord._(text: text, reference: reference);
//     replace(_$result);
//     return _$result;
//   }
// }

// // ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
