import 'package:fe_lab_clinicas_self_service/src/modules/self_Service/documents/documents_page.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/self_Service/documents/scan/documents_scan_page.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/self_Service/documents/scan_confirm/documents_scan_confirm_page.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/self_Service/done/done_page.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/self_Service/find_patient/find_patient_page.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/self_Service/patient/patient_page.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/self_Service/self_service_controller.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/self_Service/self_service_page.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/self_Service/who_i_am/who_i_am_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

class SelfServiceModule extends FlutterGetItModule {
  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton((i) => SelfServiceController()),
      ];

  @override
  String get moduleRouteName => '/self-service';

  @override
  Map<String, WidgetBuilder> get pages => {
        '/': (context) => const SelfServicePage(),
        '/whoIAm': (context) => const WhoIAmPage(),
        '/find-patient': (context) => const FindPatientPage(),
        '/patient': (context) => const PatientPage(),
        '/documents': (context) => const DocumentsPage(),
        '/documents/scan': (context) => const DocumentsScanPage(),
        '/documents/confirm': (context) => const DocumentsScanConfirmPage(),
        '/done': (context) => const DonePage(),
      };
}
