import 'package:flutter/material.dart';

class Project {
  final String name;
  final String description;
  final List<String> tags;
  final String language;
  final Color languageColor;
  final int stars;
  final int forks;
  final String version;
  final String url;

  const Project({
    required this.name,
    required this.description,
    required this.tags,
    required this.language,
    this.languageColor = const Color(0xFFE7C04B),
    this.stars = 0,
    this.forks = 0,
    this.version = '',
    this.url = '',
  });
}
