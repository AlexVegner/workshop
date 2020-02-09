import 'package:connectivity/connectivity.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

@Bind.toType(NetworkCheckImpl)
@injectable
abstract class NetworkCheck {
  Future<bool> isOnline();
}

@lazySingleton
@injectable
class NetworkCheckImpl implements NetworkCheck {
  final Connectivity connectivity;

  NetworkCheckImpl({@required this.connectivity});

  @override
  Future<bool> isOnline() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      // I am connected to a mobile network.
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a wifi network.
      return true;
    }
    return false;
  }
}
