import 'package:fe_lab_clinicas_self_service/src/modules/self_Service/documents/documents_page.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/self_Service/documents/scan/documents_scan_page.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/self_Service/documents/scan_confirm/documents_scan_confirm_router.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/self_Service/done/done_page.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/self_Service/find_patient/find_patient_router.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/self_Service/patient/patient_router.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/self_Service/self_service_controller.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/self_Service/self_service_page.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/self_Service/who_i_am/who_i_am_page.dart';
import 'package:fe_lab_clinicas_self_service/src/repositories/information_form/information_form_repository.dart';
import 'package:fe_lab_clinicas_self_service/src/repositories/information_form/information_form_repository_impl.dart';
import 'package:fe_lab_clinicas_self_service/src/repositories/patients/patient_repository.dart';
import 'package:fe_lab_clinicas_self_service/src/repositories/patients/patient_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

class SelfServiceModule extends FlutterGetItModule {
  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton<InformationFormRepository>(
          (i) => InformationFormRepositoryImpl(restClient: i()),
        ),
        Bind.lazySingleton(
          (i) => SelfServiceController(informationFormRepository: i()),
        ),
        Bind.lazySingleton<PatientRepository>(
          (i) => PatientRepositoryImpl(restClient: i()),
        ),
      ];

  @override
  String get moduleRouteName => '/self-service';

  @override
  Map<String, WidgetBuilder> get pages => {
        '/': (context) => const SelfServicePage(),
        '/whoIAm': (context) => const WhoIAmPage(),
        '/find-patient': (context) => const FindPatientRouter(),
        '/patient': (context) => const PatientRouter(),
        '/documents': (context) => const DocumentsPage(),
        '/documents/scan': (context) => const DocumentsScanPage(),
        '/documents/scan/confirm': (context) =>
            const DocumentsScanConfirmRouter(),
        '/done': (context) => DonePage(),
      };
}
