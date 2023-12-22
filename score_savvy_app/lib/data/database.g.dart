// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $PlayerItemsTable extends PlayerItems
    with TableInfo<$PlayerItemsTable, PlayerItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PlayerItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _gameNameIdMeta =
      const VerificationMeta('gameNameId');
  @override
  late final GeneratedColumn<int> gameNameId = GeneratedColumn<int>(
      'game_name_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _playerNameMeta =
      const VerificationMeta('playerName');
  @override
  late final GeneratedColumn<String> playerName = GeneratedColumn<String>(
      'player_name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 32),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _pointsMeta = const VerificationMeta('points');
  @override
  late final GeneratedColumn<int> points = GeneratedColumn<int>(
      'points', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, gameNameId, playerName, points];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'player_items';
  @override
  VerificationContext validateIntegrity(Insertable<PlayerItem> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('game_name_id')) {
      context.handle(
          _gameNameIdMeta,
          gameNameId.isAcceptableOrUnknown(
              data['game_name_id']!, _gameNameIdMeta));
    } else if (isInserting) {
      context.missing(_gameNameIdMeta);
    }
    if (data.containsKey('player_name')) {
      context.handle(
          _playerNameMeta,
          playerName.isAcceptableOrUnknown(
              data['player_name']!, _playerNameMeta));
    } else if (isInserting) {
      context.missing(_playerNameMeta);
    }
    if (data.containsKey('points')) {
      context.handle(_pointsMeta,
          points.isAcceptableOrUnknown(data['points']!, _pointsMeta));
    } else if (isInserting) {
      context.missing(_pointsMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PlayerItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PlayerItem(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      gameNameId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}game_name_id'])!,
      playerName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}player_name'])!,
      points: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}points'])!,
    );
  }

  @override
  $PlayerItemsTable createAlias(String alias) {
    return $PlayerItemsTable(attachedDatabase, alias);
  }
}

class PlayerItem extends DataClass implements Insertable<PlayerItem> {
  final int id;
  final int gameNameId;
  final String playerName;
  final int points;
  const PlayerItem(
      {required this.id,
      required this.gameNameId,
      required this.playerName,
      required this.points});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['game_name_id'] = Variable<int>(gameNameId);
    map['player_name'] = Variable<String>(playerName);
    map['points'] = Variable<int>(points);
    return map;
  }

  PlayerItemsCompanion toCompanion(bool nullToAbsent) {
    return PlayerItemsCompanion(
      id: Value(id),
      gameNameId: Value(gameNameId),
      playerName: Value(playerName),
      points: Value(points),
    );
  }

  factory PlayerItem.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PlayerItem(
      id: serializer.fromJson<int>(json['id']),
      gameNameId: serializer.fromJson<int>(json['gameNameId']),
      playerName: serializer.fromJson<String>(json['playerName']),
      points: serializer.fromJson<int>(json['points']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'gameNameId': serializer.toJson<int>(gameNameId),
      'playerName': serializer.toJson<String>(playerName),
      'points': serializer.toJson<int>(points),
    };
  }

  PlayerItem copyWith(
          {int? id, int? gameNameId, String? playerName, int? points}) =>
      PlayerItem(
        id: id ?? this.id,
        gameNameId: gameNameId ?? this.gameNameId,
        playerName: playerName ?? this.playerName,
        points: points ?? this.points,
      );
  @override
  String toString() {
    return (StringBuffer('PlayerItem(')
          ..write('id: $id, ')
          ..write('gameNameId: $gameNameId, ')
          ..write('playerName: $playerName, ')
          ..write('points: $points')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, gameNameId, playerName, points);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PlayerItem &&
          other.id == this.id &&
          other.gameNameId == this.gameNameId &&
          other.playerName == this.playerName &&
          other.points == this.points);
}

class PlayerItemsCompanion extends UpdateCompanion<PlayerItem> {
  final Value<int> id;
  final Value<int> gameNameId;
  final Value<String> playerName;
  final Value<int> points;
  const PlayerItemsCompanion({
    this.id = const Value.absent(),
    this.gameNameId = const Value.absent(),
    this.playerName = const Value.absent(),
    this.points = const Value.absent(),
  });
  PlayerItemsCompanion.insert({
    this.id = const Value.absent(),
    required int gameNameId,
    required String playerName,
    required int points,
  })  : gameNameId = Value(gameNameId),
        playerName = Value(playerName),
        points = Value(points);
  static Insertable<PlayerItem> custom({
    Expression<int>? id,
    Expression<int>? gameNameId,
    Expression<String>? playerName,
    Expression<int>? points,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (gameNameId != null) 'game_name_id': gameNameId,
      if (playerName != null) 'player_name': playerName,
      if (points != null) 'points': points,
    });
  }

  PlayerItemsCompanion copyWith(
      {Value<int>? id,
      Value<int>? gameNameId,
      Value<String>? playerName,
      Value<int>? points}) {
    return PlayerItemsCompanion(
      id: id ?? this.id,
      gameNameId: gameNameId ?? this.gameNameId,
      playerName: playerName ?? this.playerName,
      points: points ?? this.points,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (gameNameId.present) {
      map['game_name_id'] = Variable<int>(gameNameId.value);
    }
    if (playerName.present) {
      map['player_name'] = Variable<String>(playerName.value);
    }
    if (points.present) {
      map['points'] = Variable<int>(points.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PlayerItemsCompanion(')
          ..write('id: $id, ')
          ..write('gameNameId: $gameNameId, ')
          ..write('playerName: $playerName, ')
          ..write('points: $points')
          ..write(')'))
        .toString();
  }
}

class $GameItemsTable extends GameItems
    with TableInfo<$GameItemsTable, GameItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GameItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 32),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _roundMeta = const VerificationMeta('round');
  @override
  late final GeneratedColumn<int> round = GeneratedColumn<int>(
      'round', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, round];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'game_items';
  @override
  VerificationContext validateIntegrity(Insertable<GameItem> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('round')) {
      context.handle(
          _roundMeta, round.isAcceptableOrUnknown(data['round']!, _roundMeta));
    } else if (isInserting) {
      context.missing(_roundMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  GameItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GameItem(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      round: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}round'])!,
    );
  }

  @override
  $GameItemsTable createAlias(String alias) {
    return $GameItemsTable(attachedDatabase, alias);
  }
}

class GameItem extends DataClass implements Insertable<GameItem> {
  final int id;
  final String name;
  final int round;
  const GameItem({required this.id, required this.name, required this.round});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['round'] = Variable<int>(round);
    return map;
  }

  GameItemsCompanion toCompanion(bool nullToAbsent) {
    return GameItemsCompanion(
      id: Value(id),
      name: Value(name),
      round: Value(round),
    );
  }

  factory GameItem.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GameItem(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      round: serializer.fromJson<int>(json['round']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'round': serializer.toJson<int>(round),
    };
  }

  GameItem copyWith({int? id, String? name, int? round}) => GameItem(
        id: id ?? this.id,
        name: name ?? this.name,
        round: round ?? this.round,
      );
  @override
  String toString() {
    return (StringBuffer('GameItem(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('round: $round')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, round);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GameItem &&
          other.id == this.id &&
          other.name == this.name &&
          other.round == this.round);
}

class GameItemsCompanion extends UpdateCompanion<GameItem> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> round;
  const GameItemsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.round = const Value.absent(),
  });
  GameItemsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required int round,
  })  : name = Value(name),
        round = Value(round);
  static Insertable<GameItem> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? round,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (round != null) 'round': round,
    });
  }

  GameItemsCompanion copyWith(
      {Value<int>? id, Value<String>? name, Value<int>? round}) {
    return GameItemsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      round: round ?? this.round,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (round.present) {
      map['round'] = Variable<int>(round.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GameItemsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('round: $round')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $PlayerItemsTable playerItems = $PlayerItemsTable(this);
  late final $GameItemsTable gameItems = $GameItemsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [playerItems, gameItems];
}
