// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_collection.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetSavedSettingCollection on Isar {
  IsarCollection<SavedSetting> get savedSettings => this.collection();
}

const SavedSettingSchema = CollectionSchema(
  name: r'SavedSetting',
  id: 4576022866914814185,
  properties: {
    r'adjustAmount': PropertySchema(
      id: 0,
      name: r'adjustAmount',
      type: IsarType.long,
    ),
    r'quickAdjust': PropertySchema(
      id: 1,
      name: r'quickAdjust',
      type: IsarType.bool,
    )
  },
  estimateSize: _savedSettingEstimateSize,
  serialize: _savedSettingSerialize,
  deserialize: _savedSettingDeserialize,
  deserializeProp: _savedSettingDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _savedSettingGetId,
  getLinks: _savedSettingGetLinks,
  attach: _savedSettingAttach,
  version: '3.1.0+1',
);

int _savedSettingEstimateSize(
  SavedSetting object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _savedSettingSerialize(
  SavedSetting object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.adjustAmount);
  writer.writeBool(offsets[1], object.quickAdjust);
}

SavedSetting _savedSettingDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SavedSetting(
    adjustAmount: reader.readLongOrNull(offsets[0]),
    id: id,
    quickAdjust: reader.readBoolOrNull(offsets[1]),
  );
  return object;
}

P _savedSettingDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readBoolOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _savedSettingGetId(SavedSetting object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _savedSettingGetLinks(SavedSetting object) {
  return [];
}

void _savedSettingAttach(
    IsarCollection<dynamic> col, Id id, SavedSetting object) {
  object.id = id;
}

extension SavedSettingQueryWhereSort
    on QueryBuilder<SavedSetting, SavedSetting, QWhere> {
  QueryBuilder<SavedSetting, SavedSetting, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension SavedSettingQueryWhere
    on QueryBuilder<SavedSetting, SavedSetting, QWhereClause> {
  QueryBuilder<SavedSetting, SavedSetting, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<SavedSetting, SavedSetting, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<SavedSetting, SavedSetting, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<SavedSetting, SavedSetting, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<SavedSetting, SavedSetting, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension SavedSettingQueryFilter
    on QueryBuilder<SavedSetting, SavedSetting, QFilterCondition> {
  QueryBuilder<SavedSetting, SavedSetting, QAfterFilterCondition>
      adjustAmountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'adjustAmount',
      ));
    });
  }

  QueryBuilder<SavedSetting, SavedSetting, QAfterFilterCondition>
      adjustAmountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'adjustAmount',
      ));
    });
  }

  QueryBuilder<SavedSetting, SavedSetting, QAfterFilterCondition>
      adjustAmountEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'adjustAmount',
        value: value,
      ));
    });
  }

  QueryBuilder<SavedSetting, SavedSetting, QAfterFilterCondition>
      adjustAmountGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'adjustAmount',
        value: value,
      ));
    });
  }

  QueryBuilder<SavedSetting, SavedSetting, QAfterFilterCondition>
      adjustAmountLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'adjustAmount',
        value: value,
      ));
    });
  }

  QueryBuilder<SavedSetting, SavedSetting, QAfterFilterCondition>
      adjustAmountBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'adjustAmount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SavedSetting, SavedSetting, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<SavedSetting, SavedSetting, QAfterFilterCondition>
      idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<SavedSetting, SavedSetting, QAfterFilterCondition> idEqualTo(
      Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SavedSetting, SavedSetting, QAfterFilterCondition> idGreaterThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SavedSetting, SavedSetting, QAfterFilterCondition> idLessThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SavedSetting, SavedSetting, QAfterFilterCondition> idBetween(
    Id? lower,
    Id? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SavedSetting, SavedSetting, QAfterFilterCondition>
      quickAdjustIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'quickAdjust',
      ));
    });
  }

  QueryBuilder<SavedSetting, SavedSetting, QAfterFilterCondition>
      quickAdjustIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'quickAdjust',
      ));
    });
  }

  QueryBuilder<SavedSetting, SavedSetting, QAfterFilterCondition>
      quickAdjustEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'quickAdjust',
        value: value,
      ));
    });
  }
}

extension SavedSettingQueryObject
    on QueryBuilder<SavedSetting, SavedSetting, QFilterCondition> {}

extension SavedSettingQueryLinks
    on QueryBuilder<SavedSetting, SavedSetting, QFilterCondition> {}

extension SavedSettingQuerySortBy
    on QueryBuilder<SavedSetting, SavedSetting, QSortBy> {
  QueryBuilder<SavedSetting, SavedSetting, QAfterSortBy> sortByAdjustAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'adjustAmount', Sort.asc);
    });
  }

  QueryBuilder<SavedSetting, SavedSetting, QAfterSortBy>
      sortByAdjustAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'adjustAmount', Sort.desc);
    });
  }

  QueryBuilder<SavedSetting, SavedSetting, QAfterSortBy> sortByQuickAdjust() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quickAdjust', Sort.asc);
    });
  }

  QueryBuilder<SavedSetting, SavedSetting, QAfterSortBy>
      sortByQuickAdjustDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quickAdjust', Sort.desc);
    });
  }
}

extension SavedSettingQuerySortThenBy
    on QueryBuilder<SavedSetting, SavedSetting, QSortThenBy> {
  QueryBuilder<SavedSetting, SavedSetting, QAfterSortBy> thenByAdjustAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'adjustAmount', Sort.asc);
    });
  }

  QueryBuilder<SavedSetting, SavedSetting, QAfterSortBy>
      thenByAdjustAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'adjustAmount', Sort.desc);
    });
  }

  QueryBuilder<SavedSetting, SavedSetting, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<SavedSetting, SavedSetting, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<SavedSetting, SavedSetting, QAfterSortBy> thenByQuickAdjust() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quickAdjust', Sort.asc);
    });
  }

  QueryBuilder<SavedSetting, SavedSetting, QAfterSortBy>
      thenByQuickAdjustDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quickAdjust', Sort.desc);
    });
  }
}

extension SavedSettingQueryWhereDistinct
    on QueryBuilder<SavedSetting, SavedSetting, QDistinct> {
  QueryBuilder<SavedSetting, SavedSetting, QDistinct> distinctByAdjustAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'adjustAmount');
    });
  }

  QueryBuilder<SavedSetting, SavedSetting, QDistinct> distinctByQuickAdjust() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'quickAdjust');
    });
  }
}

extension SavedSettingQueryProperty
    on QueryBuilder<SavedSetting, SavedSetting, QQueryProperty> {
  QueryBuilder<SavedSetting, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<SavedSetting, int?, QQueryOperations> adjustAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'adjustAmount');
    });
  }

  QueryBuilder<SavedSetting, bool?, QQueryOperations> quickAdjustProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'quickAdjust');
    });
  }
}
