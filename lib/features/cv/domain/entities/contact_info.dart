import 'package:flutter/material.dart';

import '../enums/contact_type.dart';

class ContactInfo {
  final IconData icon;
  final String label;
  final ContactType type;
  final String value;

  const ContactInfo({
    required this.icon,
    required this.label,
    required this.type,
    required this.value,
  });
}