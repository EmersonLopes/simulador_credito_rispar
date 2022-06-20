import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simulador_credito_rispar/controllers/simulation_controller.dart';
import 'package:simulador_credito_rispar/pages/user/user_page.dart';
import 'package:simulador_credito_rispar/repositories/simulation_repository.dart';
import 'package:simulador_credito_rispar/services/client_http_service.dart';
import 'package:simulador_credito_rispar/utils/app_routes.dart';

import 'pages/request_ammount/request_ammount_page.dart';
import 'pages/result/result_page.dart';
import 'pages/warranty/warranty_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (_) => SimulationController(
            SimulationRepository(
              ClientHttpService(),
            ),
          ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
              color: Colors.white,
              iconTheme: const IconThemeData(color: Color(0xff1D9D9D))),
          colorScheme: const ColorScheme.light(
            primary: Color(0xff83C6C9),
            secondary: Color(0xff1D9D9D),
          ),
        ),
        initialRoute: AppRoutes.USER,
        routes: {
          AppRoutes.USER: (ctx) => UserPage(),
          AppRoutes.REQUEST_AMMOUNT: (ctx) => RequestAmmountPage(),
          AppRoutes.WARRANTY: (ctx) => const WarrantyPage(),
          AppRoutes.RESULT: (ctx) => const ResultPage(),
        },
      ),
    );
  }
}
