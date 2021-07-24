// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'date_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<DateRecord> _$dateRecordSerializer = new _$DateRecordSerializer();

class _$DateRecordSerializer implements StructuredSerializer<DateRecord> {
  @override
  final Iterable<Type> types = const [DateRecord, _$DateRecord];
  @override
  final String wireName = 'DateRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, DateRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.text;
    if (value != null) {
      result
        ..add('text')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.reference;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DocumentReference)));
    }
    return result;
  }

  @override
  DateRecord deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DateRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'text':
          result.text = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'Document__Reference__Field':
          result.reference = serializers.deserialize(value,
                  specifiedType: const FullType(DocumentReference))
              as DocumentReference;
          break;
      }
    }

    return result.build();
  }
}

class _$DateRecord extends DateRecord {
  @override
  final String text;
  @override
  final DocumentReference reference;

  factory _$DateRecord([void Function(DateRecordBuilder) updates]) =>
      (new DateRecordBuilder()..update(updates)).build();

  _$DateRecord._({this.text, this.reference}) : super._();

  @override
  DateRecord rebuild(void Function(DateRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DateRecordBuilder toBuilder() => new DateRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DateRecord &&
        text == other.text &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, text.hashCode), reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('DateRecord')
          ..add('text', text)
          ..add('reference', reference))
        .toString();
  }
}

class DateRecordBuilder implements Builder<DateRecord, DateRecordBuilder> {
  _$DateRecord _$v;

  String _text;
  String get text => _$this._text;
  set text(String text) => _$this._text = text;

  DocumentReference _reference;
  DocumentReference get reference => _$this._reference;
  set reference(DocumentReference reference) => _$this._reference = reference;

  DateRecordBuilder() {
    DateRecord._initializeBuilder(this);
  }

  DateRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _text = $v.text;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DateRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DateRecord;
  }

  @override
  void update(void Function(DateRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$DateRecord build() {
    final _$result =
        _$v ?? new _$DateRecord._(text: text, reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
