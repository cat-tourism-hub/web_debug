import 'package:flutter/material.dart';
import 'package:tourism_hub/Models/Establishment.dart';

abstract class BaseCard extends StatelessWidget {
  final Establishment establishment;
  final VoidCallback? onTap;

  const BaseCard({
    super.key,
    required this.establishment,
    this.onTap,
  });

  @override
  Widget build(BuildContext context);
}
