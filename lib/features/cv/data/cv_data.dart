import 'package:flutter/material.dart';

import '../domain/entities/contact_info.dart';
import '../domain/entities/cv_data.dart';
import '../domain/entities/education_item.dart';
import '../domain/entities/experience_item.dart';
import '../domain/entities/language_item.dart';
import '../domain/entities/skill_group.dart';
import '../domain/enums/contact_type.dart';


const cvData = CvData(
  name: 'RAFAEL VARGAS',
  role: 'DESARROLLADOR BACKEND',
  contacts: [
    ContactInfo(
      icon: Icons.phone,
      label: '+591 768-48909',
      type: ContactType.phone,
      value: '+59176848909',
    ),
    ContactInfo(
      icon: Icons.email_outlined,
      label: 'rafaelandresvargasm@gmail.com',
      type: ContactType.email,
      value: 'rafaelandresvargasm@gmail.com',
    ),
    ContactInfo(
      icon: Icons.location_on_outlined,
      label: 'Santa Cruz, Bolivia',
      type: ContactType.location,
      value: '',
    ),
    ContactInfo(
      icon: Icons.business_center_outlined,
      label: 'linkedin.com/in/rafael-andres-vargas',
      type: ContactType.linkedin,
      value: 'https://linkedin.com/in/rafael-andres-vargas',
    ),
    ContactInfo(
      icon: Icons.code,
      label: 'github.com/rafael1199v',
      type: ContactType.github,
      value: 'https://github.com/rafael1199v',
    ),
  ],
  profile:
      'Estudiante de Ingeniería de Software, orientado al trabajo en equipo, '
      'autodidacta y apasionado por el desarrollo de soluciones tecnológicas, '
      'aplicando principios SOLID, patrones de diseño y código limpio. Con '
      'experiencia en programación competitiva, destaco por mi capacidad de '
      'identificar y resolver problemas de manera eficiente y creativa.',
  education: [
    EducationItem(
      period: '2023 - Actualidad',
      institution: 'UNIVERSIDAD CATÓLICA BOLIVIANA SAN PABLO',
      detail: 'Ingeniería de software',
    ),
  ],
  experience: [
    ExperienceItem(
      project: 'Sushi Restaurant',
      year: '2025',
      description:
          'Implementé un sistema web para un restaurante con información '
          'general, blogs y reserva de mesas, usando Vanilla JavaScript en el '
          'frontend, y Express.js con Prisma para el backend. Desplegado en AWS '
          '(EC2), configurando Nginx como un proxy inverso e implementando un '
          'certificado SSL para mejorar la seguridad.',
    ),
    ExperienceItem(
      project: 'Delivery App',
      year: '2025',
      description:
          'Participé en el desarrollo de una aplicación web para la creación y '
          'gestión de pedidos. Se utilizaron tecnologías como React y Tailwind '
          'CSS para la interfaz, y Supabase como servicio de base de datos, '
          'aplicando el framework Scrum para la entrega continua de valor al '
          'proyecto.',
    ),
    ExperienceItem(
      project: 'Postulación Docente',
      year: '2024',
      description:
          'Realicé un proyecto que permite a los postulantes registrarse a las '
          'vacantes creadas por los directores de carrera, utilizando una '
          'metodología ágil para gestionar el ciclo de vida del software. '
          'Frontend en Angular y backend en ASP.NET Core con SQL Server.',
    ),
  ],
  technicalSkills: [
    SkillGroup(label: 'Lenguajes', value: 'C#, JavaScript, Python'),
    SkillGroup(
      label: 'Frameworks',
      value: 'Angular, React, .NET, Express.js',
    ),
    SkillGroup(label: 'Base de datos', value: 'PostgreSQL, SQL Server'),
  ],
  softSkills: [
    'Comunicativo',
    'Pensamiento Crítico',
    'Organizado',
    'Creativo',
    'Autodidacta',
    'Trabajo en equipo',
  ],
  achievements: [
    'Diploma de Excelencia Académica, 1er lugar - Universidad Católica '
        'Boliviana (2024 – 1ra y 2da gestión)',
    '2do Lugar | ICPC - Competencia Internacional Universitaria de '
        'Programación | Fase Nacional (Santa Cruz, Bolivia)',
    '2do Lugar | ICPC - Competencia Internacional Universitaria de '
        'Programación | Fase Pre-Nacional (Santa Cruz, Bolivia)',
  ],
  certifications: [
    'AWS Academy Graduate - AWS Academy Cloud Foundations',
    'JavaScript Essentials - Cisco Network Academy',
    'IT Essentials: Pc hardware and software - Cisco Network Academy',
  ],
  languages: [
    LanguageItem(
      language: 'Inglés',
      levels: ['General: Intermedio (B2)', 'Técnico: Intermedio (B2)'],
    ),
    LanguageItem(language: 'Español', levels: ['Nativo']),
  ],
);
