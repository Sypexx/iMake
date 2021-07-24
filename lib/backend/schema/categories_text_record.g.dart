// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories_text_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CategoriesTextRecord> _$categoriesTextRecordSerializer =
    new _$CategoriesTextRecordSerializer();

class _$CategoriesTextRecordSerializer
    implements StructuredSerializer<CategoriesTextRecord> {
  @override
  final Iterable<Type> types = const [
    CategoriesTextRecord,
    _$CategoriesTextRecord
  ];
  @override
  final String wireName = 'CategoriesTextRecord';

  @override
  Iterable<Object> serialize(
      Serializers serializers, CategoriesTextRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.text;
    if (value != null) {
      result
        ..add('text')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
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
  CategoriesTextRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CategoriesTextRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'text':
          result.text.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
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

class _$CategoriesTextRecord extends CategoriesTextRecord {
  @override
  final BuiltList<String> text;
  @override
  final DocumentReference reference;

  factory _$CategoriesTextRecord(
          [void Function(CategoriesTextRecordBuilder) updates]) =>
      (new CategoriesTextRecordBuilder()..update(updates)).build();

  _$CategoriesTextRecord._({this.text, this.reference}) : super._();

  @override
  CategoriesTextRecord rebuild(
          void Function(CategoriesTextRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CategoriesTextRecordBuilder toBuilder() =>
      new CategoriesTextRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CategoriesTextRecord &&
        text == other.text &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, text.hashCode), reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('CategoriesTextRecord')
          ..add('text', text)
          ..add('reference', reference))
        .toString();
  }
}

class CategoriesTextRecordBuilder
    implements Builder<CategoriesTextRecord, CategoriesTextRecordBuilder> {
  _$CategoriesTextRecord _$v;

  ListBuilder<String> _text;
  ListBuilder<String> get text => _$this._text ??= new ListBuilder<String>();
  set text(ListBuilder<String> text) => _$this._text = text;

  DocumentReference _reference;
  DocumentReference get reference => _$this._reference;
  set reference(DocumentReference reference) => _$this._reference = reference;

  CategoriesTextRecordBuilder() {
    CategoriesTextRecord._initializeBuilder(this);
  }

  CategoriesTextRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _text = $v.text?.toBuilder();
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CategoriesTextRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CategoriesTextRecord;
  }

  @override
  void update(void Function(CategoriesTextRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$CategoriesTextRecord build() {
    _$CategoriesTextRecord _$result;
    try {
      _$result = _$v ??
          new _$CategoriesTextRecord._(
              text: _text?.build(), reference: reference);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'text';
        _text?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'CategoriesTextRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
