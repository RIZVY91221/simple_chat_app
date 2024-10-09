import 'package:app_base_flutter/bindings/initial_binding.dart';
import 'package:app_base_flutter/core/theme/app_themes.dart';
import 'package:app_base_flutter/translations/app_translations.dart';
import 'package:app_base_flutter/datasource/local_data_source/base_local_source.dart';
import 'package:app_base_flutter/routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

@module
abstract class App {
  @lazySingleton
  GetMaterialApp provideGetMaterialApp(BaseLocalDataSource baseLocalDataSource) {
    return GetMaterialApp(
        initialBinding: InitialBinding(),
        debugShowCheckedModeBanner: false,
        debugShowMaterialGrid: false,
        initialRoute: AppRoutes.INITINAL,
        theme: AppTheme.primaryTheme(),
        darkTheme: AppTheme.darkModeTheme(),
        defaultTransition: Transition.fade,
        getPages: AppRoutes.routes,
        locale: Get.deviceLocale,
       /* localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],*/
        supportedLocales: AppTranslation.localeMapper.values,
        fallbackLocale: AppTranslation.localeMapper["en_US"],
        translationsKeys: AppTranslation.translations
        //Get.deviceLocale, //AppTranslation.localeMapper["nl_NL"], // //localeMapper["en_US"],
        );
  }
}
