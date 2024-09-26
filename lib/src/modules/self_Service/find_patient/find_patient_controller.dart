import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:fe_lab_clinicas_self_service/src/model/patient_model.dart';
import 'package:fe_lab_clinicas_self_service/src/repositories/patients/patient_repository.dart';
import 'package:signals_flutter/signals_core.dart';

class FindPatientController with MessageStateMixin {
  final PatientRepository _patientRepository;

  FindPatientController({
    required PatientRepository patientRepository,
  }) : _patientRepository = patientRepository;

  final _patientNotFound = Signal<bool?>(null);
  final _patient = Signal<PatientModel?>(null);

  bool? get patientNotFound => _patientNotFound();
  PatientModel? get patient => _patient();

  Future<void> findPatientByDocument(String document) async {
    final patientResult =
        await _patientRepository.findPatientByDocument(document);

    bool patientNotFound;
    PatientModel? patient;

    switch (patientResult) {
      case Right(value: PatientModel model?):
        patientNotFound = false;
        patient = model;
      case Right(value: _):
        patientNotFound = true;
        patient = null;
      case Left():
        showError('Erro ao buscar o paciente');
        return;
    }

    batch(() {
      _patient.set(patient);
      _patientNotFound.set(patientNotFound);
    });
  }

  void continueWithoutDocument() {
    batch(() {
      _patient.set(null);
      _patientNotFound.set(true);
    });
  }
}
