import 'package:evenodd/num-split-scrn.dart';
import 'package:evenodd/routes/route-name.dart';
import 'package:evenodd/splash-screen.dart';
import 'package:get/get.dart';




class ApplicationRoutes {
  static appRoutes() => {
        GetPage(
          name: RouteName.splashScreen,
          page: () => SplashScreen(),
        ),
        GetPage(
          name: RouteName.numbersplitscreen,
          page: () => NumberSplitterScreen(),
        ),
        
        
      };
}
