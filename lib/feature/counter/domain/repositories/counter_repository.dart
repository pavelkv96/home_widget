abstract class CounterRepository {
  Future<int> fetchCurrentValue();

  Future<bool> setNewValue(int value);
}
