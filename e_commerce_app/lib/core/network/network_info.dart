import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImplimentation implements NetworkInfo {
  InternetStatus internetStatus;
  NetworkInfoImplimentation({required this.internetStatus});

  @override
  Future<bool> get isConnected async =>
      internetStatus == InternetStatus.connected;
}

// void main() {
//   InternetStatus a = InternetStatus.connected;
//   NetworkInfoImplimentation ac = NetworkInfoImplimentation(internetStatus: a);
//   print(ac.isConnected);
// }
