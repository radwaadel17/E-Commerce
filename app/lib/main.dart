import 'package:app/cubits/cart%20cubit/CartCubit.dart';
import 'package:app/cubits/fav%20cubit/addTofavcubit.dart';
import 'package:app/cubits/total%20sum%20cubit/totalsumCubit.dart';
import 'package:app/firebase_options.dart';
import 'package:app/views/add%20to%20cart%20page.dart';
import 'package:app/views/onboarding%20page.dart';
import 'package:app/views/splash%20page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
void main() async {
  runApp(const App());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create:(context) => AddToFavCubit(),),
        BlocProvider(create:(context) => CartCubit(),),
        BlocProvider(create:(context) => Totalsumcubit(),),

        //BlocProvider(create:(context) => Totalcubit(),),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        child: MaterialApp(
          routes: {
            'on': (context) => onboarding_screen(),
          },
          debugShowCheckedModeBanner: false,
          home: const splash_page(),
        ),
      ),
    );
  }
}
