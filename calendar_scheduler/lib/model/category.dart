import 'package:drift/drift.dart';

class CategoryTable extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get color => text()();

  DateTimeColumn get createAt => dateTime().clientDefault(
        () => DateTime.now().toUtc(),
      )();
}
