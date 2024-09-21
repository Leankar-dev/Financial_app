import 'package:financial_app/features/login/login_controller.dart';
import 'package:financial_app/features/register/register_controller.dart';
import 'package:financial_app/services/auth_service.dart';
import 'package:financial_app/services/auth_service_impl.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setupDependencies() {
  locator.registerLazySingleton<AuthService>(() => AuthServiceImpl());

  locator.registerFactory<LoginController>(
    () => LoginController(locator.get<AuthService>()),
  );
  locator.registerFactory<RegisterController>(
    () => RegisterController(locator.get<AuthService>()),
  );
}
