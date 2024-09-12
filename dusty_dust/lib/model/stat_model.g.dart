// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stat_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetStatModelCollection on Isar {
  IsarCollection<StatModel> get statModels => this.collection();
}

const StatModelSchema = CollectionSchema(
  name: r'StatModel',
  id: -3478456056871061230,
  properties: {
    r'dataTime': PropertySchema(
      id: 0,
      name: r'dataTime',
      type: IsarType.dateTime,
    ),
    r'itemCode': PropertySchema(
      id: 1,
      name: r'itemCode',
      type: IsarType.byte,
      enumMap: _StatModelitemCodeEnumValueMap,
    ),
    r'region': PropertySchema(
      id: 2,
      name: r'region',
      type: IsarType.byte,
      enumMap: _StatModelregionEnumValueMap,
    ),
    r'stat': PropertySchema(
      id: 3,
      name: r'stat',
      type: IsarType.double,
    )
  },
  estimateSize: _statModelEstimateSize,
  serialize: _statModelSerialize,
  deserialize: _statModelDeserialize,
  deserializeProp: _statModelDeserializeProp,
  idName: r'id',
  indexes: {
    r'region_dataTime_itemCode': IndexSchema(
      id: -8883658203633169973,
      name: r'region_dataTime_itemCode',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'region',
          type: IndexType.value,
          caseSensitive: false,
        ),
        IndexPropertySchema(
          name: r'dataTime',
          type: IndexType.value,
          caseSensitive: false,
        ),
        IndexPropertySchema(
          name: r'itemCode',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _statModelGetId,
  getLinks: _statModelGetLinks,
  attach: _statModelAttach,
  version: '3.1.0+1',
);

int _statModelEstimateSize(
  StatModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _statModelSerialize(
  StatModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.dataTime);
  writer.writeByte(offsets[1], object.itemCode.index);
  writer.writeByte(offsets[2], object.region.index);
  writer.writeDouble(offsets[3], object.stat);
}

StatModel _statModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = StatModel();
  object.dataTime = reader.readDateTime(offsets[0]);
  object.id = id;
  object.itemCode =
      _StatModelitemCodeValueEnumMap[reader.readByteOrNull(offsets[1])] ??
          ItemCode.SO2;
  object.region =
      _StatModelregionValueEnumMap[reader.readByteOrNull(offsets[2])] ??
          Region.seoul;
  object.stat = reader.readDouble(offsets[3]);
  return object;
}

P _statModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (_StatModelitemCodeValueEnumMap[reader.readByteOrNull(offset)] ??
          ItemCode.SO2) as P;
    case 2:
      return (_StatModelregionValueEnumMap[reader.readByteOrNull(offset)] ??
          Region.seoul) as P;
    case 3:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _StatModelitemCodeEnumValueMap = {
  'SO2': 0,
  'CO': 1,
  'O3': 2,
  'NO2': 3,
  'PM10': 4,
  'PM25': 5,
};
const _StatModelitemCodeValueEnumMap = {
  0: ItemCode.SO2,
  1: ItemCode.CO,
  2: ItemCode.O3,
  3: ItemCode.NO2,
  4: ItemCode.PM10,
  5: ItemCode.PM25,
};
const _StatModelregionEnumValueMap = {
  'seoul': 0,
  'busan': 1,
  'daegu': 2,
  'incheon': 3,
  'gwangju': 4,
  'daejeon': 5,
  'ulsan': 6,
  'gyeonggi': 7,
  'gangwon': 8,
  'chungbuk': 9,
  'chungnam': 10,
  'jeonbuk': 11,
  'jeonnam': 12,
  'gyeongbuk': 13,
  'gyeongnam': 14,
  'jeju': 15,
  'sejong': 16,
};
const _StatModelregionValueEnumMap = {
  0: Region.seoul,
  1: Region.busan,
  2: Region.daegu,
  3: Region.incheon,
  4: Region.gwangju,
  5: Region.daejeon,
  6: Region.ulsan,
  7: Region.gyeonggi,
  8: Region.gangwon,
  9: Region.chungbuk,
  10: Region.chungnam,
  11: Region.jeonbuk,
  12: Region.jeonnam,
  13: Region.gyeongbuk,
  14: Region.gyeongnam,
  15: Region.jeju,
  16: Region.sejong,
};

Id _statModelGetId(StatModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _statModelGetLinks(StatModel object) {
  return [];
}

void _statModelAttach(IsarCollection<dynamic> col, Id id, StatModel object) {
  object.id = id;
}

extension StatModelByIndex on IsarCollection<StatModel> {
  Future<StatModel?> getByRegionDataTimeItemCode(
      Region region, DateTime dataTime, ItemCode itemCode) {
    return getByIndex(
        r'region_dataTime_itemCode', [region, dataTime, itemCode]);
  }

  StatModel? getByRegionDataTimeItemCodeSync(
      Region region, DateTime dataTime, ItemCode itemCode) {
    return getByIndexSync(
        r'region_dataTime_itemCode', [region, dataTime, itemCode]);
  }

  Future<bool> deleteByRegionDataTimeItemCode(
      Region region, DateTime dataTime, ItemCode itemCode) {
    return deleteByIndex(
        r'region_dataTime_itemCode', [region, dataTime, itemCode]);
  }

  bool deleteByRegionDataTimeItemCodeSync(
      Region region, DateTime dataTime, ItemCode itemCode) {
    return deleteByIndexSync(
        r'region_dataTime_itemCode', [region, dataTime, itemCode]);
  }

  Future<List<StatModel?>> getAllByRegionDataTimeItemCode(
      List<Region> regionValues,
      List<DateTime> dataTimeValues,
      List<ItemCode> itemCodeValues) {
    final len = regionValues.length;
    assert(dataTimeValues.length == len && itemCodeValues.length == len,
        'All index values must have the same length');
    final values = <List<dynamic>>[];
    for (var i = 0; i < len; i++) {
      values.add([regionValues[i], dataTimeValues[i], itemCodeValues[i]]);
    }

    return getAllByIndex(r'region_dataTime_itemCode', values);
  }

  List<StatModel?> getAllByRegionDataTimeItemCodeSync(List<Region> regionValues,
      List<DateTime> dataTimeValues, List<ItemCode> itemCodeValues) {
    final len = regionValues.length;
    assert(dataTimeValues.length == len && itemCodeValues.length == len,
        'All index values must have the same length');
    final values = <List<dynamic>>[];
    for (var i = 0; i < len; i++) {
      values.add([regionValues[i], dataTimeValues[i], itemCodeValues[i]]);
    }

    return getAllByIndexSync(r'region_dataTime_itemCode', values);
  }

  Future<int> deleteAllByRegionDataTimeItemCode(List<Region> regionValues,
      List<DateTime> dataTimeValues, List<ItemCode> itemCodeValues) {
    final len = regionValues.length;
    assert(dataTimeValues.length == len && itemCodeValues.length == len,
        'All index values must have the same length');
    final values = <List<dynamic>>[];
    for (var i = 0; i < len; i++) {
      values.add([regionValues[i], dataTimeValues[i], itemCodeValues[i]]);
    }

    return deleteAllByIndex(r'region_dataTime_itemCode', values);
  }

  int deleteAllByRegionDataTimeItemCodeSync(List<Region> regionValues,
      List<DateTime> dataTimeValues, List<ItemCode> itemCodeValues) {
    final len = regionValues.length;
    assert(dataTimeValues.length == len && itemCodeValues.length == len,
        'All index values must have the same length');
    final values = <List<dynamic>>[];
    for (var i = 0; i < len; i++) {
      values.add([regionValues[i], dataTimeValues[i], itemCodeValues[i]]);
    }

    return deleteAllByIndexSync(r'region_dataTime_itemCode', values);
  }

  Future<Id> putByRegionDataTimeItemCode(StatModel object) {
    return putByIndex(r'region_dataTime_itemCode', object);
  }

  Id putByRegionDataTimeItemCodeSync(StatModel object,
      {bool saveLinks = true}) {
    return putByIndexSync(r'region_dataTime_itemCode', object,
        saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByRegionDataTimeItemCode(List<StatModel> objects) {
    return putAllByIndex(r'region_dataTime_itemCode', objects);
  }

  List<Id> putAllByRegionDataTimeItemCodeSync(List<StatModel> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'region_dataTime_itemCode', objects,
        saveLinks: saveLinks);
  }
}

extension StatModelQueryWhereSort
    on QueryBuilder<StatModel, StatModel, QWhere> {
  QueryBuilder<StatModel, StatModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<StatModel, StatModel, QAfterWhere> anyRegionDataTimeItemCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'region_dataTime_itemCode'),
      );
    });
  }
}

extension StatModelQueryWhere
    on QueryBuilder<StatModel, StatModel, QWhereClause> {
  QueryBuilder<StatModel, StatModel, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<StatModel, StatModel, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<StatModel, StatModel, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<StatModel, StatModel, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<StatModel, StatModel, QAfterWhereClause> idBetween(
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

  QueryBuilder<StatModel, StatModel, QAfterWhereClause>
      regionEqualToAnyDataTimeItemCode(Region region) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'region_dataTime_itemCode',
        value: [region],
      ));
    });
  }

  QueryBuilder<StatModel, StatModel, QAfterWhereClause>
      regionNotEqualToAnyDataTimeItemCode(Region region) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'region_dataTime_itemCode',
              lower: [],
              upper: [region],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'region_dataTime_itemCode',
              lower: [region],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'region_dataTime_itemCode',
              lower: [region],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'region_dataTime_itemCode',
              lower: [],
              upper: [region],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<StatModel, StatModel, QAfterWhereClause>
      regionGreaterThanAnyDataTimeItemCode(
    Region region, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'region_dataTime_itemCode',
        lower: [region],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<StatModel, StatModel, QAfterWhereClause>
      regionLessThanAnyDataTimeItemCode(
    Region region, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'region_dataTime_itemCode',
        lower: [],
        upper: [region],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<StatModel, StatModel, QAfterWhereClause>
      regionBetweenAnyDataTimeItemCode(
    Region lowerRegion,
    Region upperRegion, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'region_dataTime_itemCode',
        lower: [lowerRegion],
        includeLower: includeLower,
        upper: [upperRegion],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<StatModel, StatModel, QAfterWhereClause>
      regionDataTimeEqualToAnyItemCode(Region region, DateTime dataTime) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'region_dataTime_itemCode',
        value: [region, dataTime],
      ));
    });
  }

  QueryBuilder<StatModel, StatModel, QAfterWhereClause>
      regionEqualToDataTimeNotEqualToAnyItemCode(
          Region region, DateTime dataTime) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'region_dataTime_itemCode',
              lower: [region],
              upper: [region, dataTime],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'region_dataTime_itemCode',
              lower: [region, dataTime],
              includeLower: false,
              upper: [region],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'region_dataTime_itemCode',
              lower: [region, dataTime],
              includeLower: false,
              upper: [region],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'region_dataTime_itemCode',
              lower: [region],
              upper: [region, dataTime],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<StatModel, StatModel, QAfterWhereClause>
      regionEqualToDataTimeGreaterThanAnyItemCode(
    Region region,
    DateTime dataTime, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'region_dataTime_itemCode',
        lower: [region, dataTime],
        includeLower: include,
        upper: [region],
      ));
    });
  }

  QueryBuilder<StatModel, StatModel, QAfterWhereClause>
      regionEqualToDataTimeLessThanAnyItemCode(
    Region region,
    DateTime dataTime, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'region_dataTime_itemCode',
        lower: [region],
        upper: [region, dataTime],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<StatModel, StatModel, QAfterWhereClause>
      regionEqualToDataTimeBetweenAnyItemCode(
    Region region,
    DateTime lowerDataTime,
    DateTime upperDataTime, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'region_dataTime_itemCode',
        lower: [region, lowerDataTime],
        includeLower: includeLower,
        upper: [region, upperDataTime],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<StatModel, StatModel, QAfterWhereClause>
      regionDataTimeItemCodeEqualTo(
          Region region, DateTime dataTime, ItemCode itemCode) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'region_dataTime_itemCode',
        value: [region, dataTime, itemCode],
      ));
    });
  }

  QueryBuilder<StatModel, StatModel, QAfterWhereClause>
      regionDataTimeEqualToItemCodeNotEqualTo(
          Region region, DateTime dataTime, ItemCode itemCode) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'region_dataTime_itemCode',
              lower: [region, dataTime],
              upper: [region, dataTime, itemCode],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'region_dataTime_itemCode',
              lower: [region, dataTime, itemCode],
              includeLower: false,
              upper: [region, dataTime],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'region_dataTime_itemCode',
              lower: [region, dataTime, itemCode],
              includeLower: false,
              upper: [region, dataTime],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'region_dataTime_itemCode',
              lower: [region, dataTime],
              upper: [region, dataTime, itemCode],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<StatModel, StatModel, QAfterWhereClause>
      regionDataTimeEqualToItemCodeGreaterThan(
    Region region,
    DateTime dataTime,
    ItemCode itemCode, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'region_dataTime_itemCode',
        lower: [region, dataTime, itemCode],
        includeLower: include,
        upper: [region, dataTime],
      ));
    });
  }

  QueryBuilder<StatModel, StatModel, QAfterWhereClause>
      regionDataTimeEqualToItemCodeLessThan(
    Region region,
    DateTime dataTime,
    ItemCode itemCode, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'region_dataTime_itemCode',
        lower: [region, dataTime],
        upper: [region, dataTime, itemCode],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<StatModel, StatModel, QAfterWhereClause>
      regionDataTimeEqualToItemCodeBetween(
    Region region,
    DateTime dataTime,
    ItemCode lowerItemCode,
    ItemCode upperItemCode, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'region_dataTime_itemCode',
        lower: [region, dataTime, lowerItemCode],
        includeLower: includeLower,
        upper: [region, dataTime, upperItemCode],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension StatModelQueryFilter
    on QueryBuilder<StatModel, StatModel, QFilterCondition> {
  QueryBuilder<StatModel, StatModel, QAfterFilterCondition> dataTimeEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dataTime',
        value: value,
      ));
    });
  }

  QueryBuilder<StatModel, StatModel, QAfterFilterCondition> dataTimeGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dataTime',
        value: value,
      ));
    });
  }

  QueryBuilder<StatModel, StatModel, QAfterFilterCondition> dataTimeLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dataTime',
        value: value,
      ));
    });
  }

  QueryBuilder<StatModel, StatModel, QAfterFilterCondition> dataTimeBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dataTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<StatModel, StatModel, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<StatModel, StatModel, QAfterFilterCondition> idGreaterThan(
    Id value, {
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

  QueryBuilder<StatModel, StatModel, QAfterFilterCondition> idLessThan(
    Id value, {
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

  QueryBuilder<StatModel, StatModel, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
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

  QueryBuilder<StatModel, StatModel, QAfterFilterCondition> itemCodeEqualTo(
      ItemCode value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'itemCode',
        value: value,
      ));
    });
  }

  QueryBuilder<StatModel, StatModel, QAfterFilterCondition> itemCodeGreaterThan(
    ItemCode value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'itemCode',
        value: value,
      ));
    });
  }

  QueryBuilder<StatModel, StatModel, QAfterFilterCondition> itemCodeLessThan(
    ItemCode value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'itemCode',
        value: value,
      ));
    });
  }

  QueryBuilder<StatModel, StatModel, QAfterFilterCondition> itemCodeBetween(
    ItemCode lower,
    ItemCode upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'itemCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<StatModel, StatModel, QAfterFilterCondition> regionEqualTo(
      Region value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'region',
        value: value,
      ));
    });
  }

  QueryBuilder<StatModel, StatModel, QAfterFilterCondition> regionGreaterThan(
    Region value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'region',
        value: value,
      ));
    });
  }

  QueryBuilder<StatModel, StatModel, QAfterFilterCondition> regionLessThan(
    Region value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'region',
        value: value,
      ));
    });
  }

  QueryBuilder<StatModel, StatModel, QAfterFilterCondition> regionBetween(
    Region lower,
    Region upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'region',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<StatModel, StatModel, QAfterFilterCondition> statEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<StatModel, StatModel, QAfterFilterCondition> statGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'stat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<StatModel, StatModel, QAfterFilterCondition> statLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'stat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<StatModel, StatModel, QAfterFilterCondition> statBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'stat',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension StatModelQueryObject
    on QueryBuilder<StatModel, StatModel, QFilterCondition> {}

extension StatModelQueryLinks
    on QueryBuilder<StatModel, StatModel, QFilterCondition> {}

extension StatModelQuerySortBy on QueryBuilder<StatModel, StatModel, QSortBy> {
  QueryBuilder<StatModel, StatModel, QAfterSortBy> sortByDataTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dataTime', Sort.asc);
    });
  }

  QueryBuilder<StatModel, StatModel, QAfterSortBy> sortByDataTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dataTime', Sort.desc);
    });
  }

  QueryBuilder<StatModel, StatModel, QAfterSortBy> sortByItemCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemCode', Sort.asc);
    });
  }

  QueryBuilder<StatModel, StatModel, QAfterSortBy> sortByItemCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemCode', Sort.desc);
    });
  }

  QueryBuilder<StatModel, StatModel, QAfterSortBy> sortByRegion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'region', Sort.asc);
    });
  }

  QueryBuilder<StatModel, StatModel, QAfterSortBy> sortByRegionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'region', Sort.desc);
    });
  }

  QueryBuilder<StatModel, StatModel, QAfterSortBy> sortByStat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stat', Sort.asc);
    });
  }

  QueryBuilder<StatModel, StatModel, QAfterSortBy> sortByStatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stat', Sort.desc);
    });
  }
}

extension StatModelQuerySortThenBy
    on QueryBuilder<StatModel, StatModel, QSortThenBy> {
  QueryBuilder<StatModel, StatModel, QAfterSortBy> thenByDataTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dataTime', Sort.asc);
    });
  }

  QueryBuilder<StatModel, StatModel, QAfterSortBy> thenByDataTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dataTime', Sort.desc);
    });
  }

  QueryBuilder<StatModel, StatModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<StatModel, StatModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<StatModel, StatModel, QAfterSortBy> thenByItemCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemCode', Sort.asc);
    });
  }

  QueryBuilder<StatModel, StatModel, QAfterSortBy> thenByItemCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemCode', Sort.desc);
    });
  }

  QueryBuilder<StatModel, StatModel, QAfterSortBy> thenByRegion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'region', Sort.asc);
    });
  }

  QueryBuilder<StatModel, StatModel, QAfterSortBy> thenByRegionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'region', Sort.desc);
    });
  }

  QueryBuilder<StatModel, StatModel, QAfterSortBy> thenByStat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stat', Sort.asc);
    });
  }

  QueryBuilder<StatModel, StatModel, QAfterSortBy> thenByStatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stat', Sort.desc);
    });
  }
}

extension StatModelQueryWhereDistinct
    on QueryBuilder<StatModel, StatModel, QDistinct> {
  QueryBuilder<StatModel, StatModel, QDistinct> distinctByDataTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dataTime');
    });
  }

  QueryBuilder<StatModel, StatModel, QDistinct> distinctByItemCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'itemCode');
    });
  }

  QueryBuilder<StatModel, StatModel, QDistinct> distinctByRegion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'region');
    });
  }

  QueryBuilder<StatModel, StatModel, QDistinct> distinctByStat() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'stat');
    });
  }
}

extension StatModelQueryProperty
    on QueryBuilder<StatModel, StatModel, QQueryProperty> {
  QueryBuilder<StatModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<StatModel, DateTime, QQueryOperations> dataTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dataTime');
    });
  }

  QueryBuilder<StatModel, ItemCode, QQueryOperations> itemCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'itemCode');
    });
  }

  QueryBuilder<StatModel, Region, QQueryOperations> regionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'region');
    });
  }

  QueryBuilder<StatModel, double, QQueryOperations> statProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'stat');
    });
  }
}
