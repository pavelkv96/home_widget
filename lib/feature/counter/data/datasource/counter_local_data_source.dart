import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class CounterLocalDataSource {
  Future<int> fetchCurrentValue();

  Future<bool> setNewValue(int value);
}

@LazySingleton(as: CounterLocalDataSource)
class CounterLocalDataSourceImpl implements CounterLocalDataSource {
  final SharedPreferences preferences;

  const CounterLocalDataSourceImpl({required this.preferences});

  @override
  Future<int> fetchCurrentValue() async {
    return preferences.getInt('test_key') ?? 0;
  }

  @override
  Future<bool> setNewValue(int value) async {
    try {
      return preferences.setInt('test_key', value);
      // ignore: no_leading_underscores_for_local_identifiers
    } on Object catch (_, __) {
      return false;
    }
  }
}
