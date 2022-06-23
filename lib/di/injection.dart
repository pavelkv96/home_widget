import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:home_widget/di/injection.config.dart';

final locator = GetIt.instance;

@InjectableInit(preferRelativeImports: false)
Future<void> configureDI({String? env}) async => $initGetIt(locator, environment: env);
