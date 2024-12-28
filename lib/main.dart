import 'package:elevate_flutter_task/core/di/service_locator.dart';
import 'package:elevate_flutter_task/core/routes/route_generator.dart';
import 'package:elevate_flutter_task/core/routes/routes.dart';
import 'package:elevate_flutter_task/core/utils/bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
    WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);


  await ScreenUtil.ensureScreenSize();
  Bloc.observer = MyBlocObserver();
  await configureDependencies();
  runApp(const ElevateFlutterTask());
}

class ElevateFlutterTask extends StatelessWidget {
  const ElevateFlutterTask({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) => const MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RouteGenerator.getRoute,
        initialRoute: Routes.products,
      ),
    );
  }
}
