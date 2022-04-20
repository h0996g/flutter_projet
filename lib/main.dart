import 'package:agence/Api/constApi.dart';
import 'package:agence/home/home.dart';
import 'package:agence/login/cupitlogin/cupitl.dart';
import 'package:agence/login/cupitlogin/cupitmain.dart';
import 'package:agence/login/cupitlogin/observer.dart';
import 'package:agence/login/login.dart';
import 'package:agence/login/onbording.dart';
import 'package:agence/login/other/cachhelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'THEM/Theme.dart';
import 'home/cubitHome/cupit_home.dart';
import 'home/cubitHome/homeStates.dart';

main() {
  BlocOverrides.runZoned(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      await CachHelper.init();
      bool onbordingmain = CachHelper.getData(key: 'onbording') ?? false;

      bool darkswitchmain = CachHelper.getData(key: 'dartswitch') ?? false;
      TOKEN = CachHelper.getData(key: 'token') ?? '';

      runApp(MyApp(onbordingmain, darkswitchmain));
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  final bool onbordingmain;
  final bool darkswitchmain;

  MyApp(this.onbordingmain, this.darkswitchmain);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginCubit()),
        // BlocProvider(create: (context) => CupitMain()),
        BlocProvider(
            create: (context) =>
                CupitHome()..changeSwitch(darkswitchmain: darkswitchmain)),
      ],
      child: BlocConsumer<CupitHome, HomeStates>(
        builder: (BuildContext context, state) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: onbordingmain
                  ? (TOKEN != '' ? const Home() : LoginScreen())
                  : const Onbording(),
              themeMode: CupitHome.get(context).dartSwitch
                  ? ThemeMode.dark
                  : ThemeMode.light,
              theme: light_theme(),
              darkTheme: dark_theme());
        },
        listener: (BuildContext context, Object? state) {},
      ),
    );
  }
}
