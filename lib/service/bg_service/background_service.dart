abstract class BackgroundServiceHandler {
  Future<void> initializeBackgroundService();
  Future<void> startService();
  Future<void> stopService();
  Future<dynamic> getService();
  Stream<bool> isRunning();
  void setLastData(List<dynamic> items);
  Future<List<String>> getLastSyncItem();
}
