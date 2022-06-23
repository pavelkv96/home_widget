import 'package:home_widget/feature/counter/data/datasource/counter_local_data_source.dart';
import 'package:home_widget/feature/counter/domain/repositories/counter_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: CounterRepository)
class CounterRepositoryImpl implements CounterRepository {
  final CounterLocalDataSource localDataSource;

  const CounterRepositoryImpl({required this.localDataSource});

  @override
  Future<int> fetchCurrentValue() {
    return localDataSource.fetchCurrentValue();
  }

  @override
  Future<bool> setNewValue(int value) {
    return localDataSource.setNewValue(value);
  }
}
