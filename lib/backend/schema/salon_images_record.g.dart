// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'salon_images_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SalonImagesRecord> _$salonImagesRecordSerializer =
    new _$SalonImagesRecordSerializer();

class _$SalonImagesRecordSerializer
    implements StructuredSerializer<SalonImagesRecord> {
  @override
  final Iterable<Type> types = const [SalonImagesRecord, _$SalonImagesRecord];
  @override
  final String wireName = 'SalonImagesRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, SalonImagesRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.salon;
    if (value != null) {
      result
        ..add('salon')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DocumentReference)));
    }
    value = object.imgUrl;
    if (value != null) {
      result
        ..add('img_url')
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
  SalonImagesRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SalonImagesRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'salon':
          result.salon = serializers.deserialize(value,
                  specifiedType: const FullType(DocumentReference))
              as DocumentReference;
          break;
        case 'img_url':
          result.imgUrl = serializers.deserialize(value,
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

class _$SalonImagesRecord extends SalonImagesRecord {
  @override
  final DocumentReference salon;
  @override
  final String imgUrl;
  @override
  final DocumentReference reference;

  factory _$SalonImagesRecord(
          [void Function(SalonImagesRecordBuilder) updates]) =>
      (new SalonImagesRecordBuilder()..update(updates)).build();

  _$SalonImagesRecord._({this.salon, this.imgUrl, this.reference}) : super._();

  @override
  SalonImagesRecord rebuild(void Function(SalonImagesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SalonImagesRecordBuilder toBuilder() =>
      new SalonImagesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SalonImagesRecord &&
        salon == other.salon &&
        imgUrl == other.imgUrl &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, salon.hashCode), imgUrl.hashCode), reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SalonImagesRecord')
          ..add('salon', salon)
          ..add('imgUrl', imgUrl)
          ..add('reference', reference))
        .toString();
  }
}

class SalonImagesRecordBuilder
    implements Builder<SalonImagesRecord, SalonImagesRecordBuilder> {
  _$SalonImagesRecord _$v;

  DocumentReference _salon;
  DocumentReference get salon => _$this._salon;
  set salon(DocumentReference salon) => _$this._salon = salon;

  String _imgUrl;
  String get imgUrl => _$this._imgUrl;
  set imgUrl(String imgUrl) => _$this._imgUrl = imgUrl;

  DocumentReference _reference;
  DocumentReference get reference => _$this._reference;
  set reference(DocumentReference reference) => _$this._reference = reference;

  SalonImagesRecordBuilder() {
    SalonImagesRecord._initializeBuilder(this);
  }

  SalonImagesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _salon = $v.salon;
      _imgUrl = $v.imgUrl;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SalonImagesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SalonImagesRecord;
  }

  @override
  void update(void Function(SalonImagesRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SalonImagesRecord build() {
    final _$result = _$v ??
        new _$SalonImagesRecord._(
            salon: salon, imgUrl: imgUrl, reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
