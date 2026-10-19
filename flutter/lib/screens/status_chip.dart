import 'package:flutter/material.dart';

import '../contract/contract.dart';

const statusLabel = {
  SurveyStatus.notStarted: 'Not started',
  SurveyStatus.inProgress: 'In progress',
  SurveyStatus.submitted: 'Submitted',
  SurveyStatus.approved: 'Approved',
  SurveyStatus.needsRework: 'Needs rework',
};

const statusColor = {
  SurveyStatus.notStarted: Color(0xFF6B7280),
  SurveyStatus.inProgress: Color(0xFF2563EB),
  SurveyStatus.submitted: Color(0xFF16A34A),
  SurveyStatus.approved: Color(0xFF15803D),
  SurveyStatus.needsRework: Color(0xFFDC2626),
};

class StatusChip extends StatelessWidget {
  const StatusChip({super.key, required this.status});

  final SurveyStatus status;

  @override
  // Material: during a Hero flight the chip has no Material above it, and
  // its text would show the yellow "missing Material" underline.
  Widget build(BuildContext context) => Material(
        type: MaterialType.transparency,
        child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        decoration: BoxDecoration(
          color: statusColor[status],
          borderRadius: BorderRadius.circular(999),
        ),
        child: Text(
          statusLabel[status]!,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ),
      );
}