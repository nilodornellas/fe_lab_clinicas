import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:flutter/material.dart';

class DocumentBoxWidget extends StatelessWidget {
  final Widget icon;
  final String label;
  final int totalFiles;
  final bool uploaded;

  const DocumentBoxWidget({
    super.key,
    required this.uploaded,
    required this.label,
    required this.totalFiles,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final totalFilesLabel = totalFiles > 0 ? '($totalFiles)' : '';

    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: uploaded ? LabClinicasTheme.lightOrangeColor : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: LabClinicasTheme.orangeColor),
        ),
        child: Column(
          children: [
            Expanded(child: icon),
            Text(
              '$label $totalFilesLabel',
              style: const TextStyle(
                fontSize: 14,
                color: LabClinicasTheme.orangeColor,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
