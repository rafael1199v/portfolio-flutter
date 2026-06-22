import 'package:flutter/material.dart';

import '../domain/entities/experience.dart';
import '../domain/entities/portfolio_data.dart';
import '../domain/entities/project.dart';
import '../domain/entities/skill_group.dart';
import '../domain/entities/social_link.dart';
import '../domain/entities/stat.dart';

const portfolioData = PortfolioData(
  greeting: 'Hola, mi nombre es',
  firstName: 'Rafael Vargas',
  fullName: 'Rafael Vargas',
  title: 'Ing. Software',
  email: 'rafaelandresvargasm@gmail.com',
  intro: [
    'Estudiante de Ingeniería de Software, orientado al trabajo en equipo, '
    'autodidacta y apasionado por el desarrollo de soluciones tecnológicas, '
    'aplicando principios SOLID, patrones de diseño y código limpio. Con '
    'experiencia en programación competitiva, destaco por mi capacidad de '
    'identificar y resolver problemas de manera eficiente y creativa.',
  ],
  aboutMe: [
    'Desde que era niño, la tecnología me ha fascinado, especialmente las aplicaciones de software y cómo funcionan. Escribir mi primer programa en la escuela secundaria me llevó a estudiar Ingeniería de Software en la Universidad Católica San Pablo, donde he podido perfeccionar mis habilidades en el arte del desarrollo de software.',
    'Soy una persona con iniciativa, comunicativa y empática, capaz de adaptarse a entornos que cambian rápidamente, con una sólida ética de trabajo. Además, disfruto ampliar mis conocimientos y contribuir al campo de la tecnología.',
    'Para mí, la ingeniería de software no se trata solo de lenguajes de programación y frameworks; se trata de analizar y diseñar aplicaciones mantenibles a largo plazo para resolver problemas del mundo real.',
    'Fuera de mi vida profesional, me apasiona la programación competitiva y jugar al baloncesto. Estas actividades me ayudan a relajarme y a mantenerme mentalmente ágil, al mismo tiempo que fortalecen mis habilidades de resolución de problemas y trabajo en equipo.'
  ],
  socials: [
    SocialLink(
      icon: Icons.code,
      label: 'GitHub',
      url: 'https://github.com/rafael1199v',
    ),
    SocialLink(
      icon: Icons.business_center_outlined,
      label: 'LinkedIn',
      url: 'https://www.linkedin.com/in/rafael-andres-vargas',
    ),
    SocialLink(
      icon: Icons.email_outlined,
      label: 'Correo',
      url: 'rafaelandresvargasm@gmail.com',
    ),
  ],
  projects: [
    Project(
      name: 'Deepfake detector',
      description: 'Aplicación creada en React Native conectada a una apliación en Python que usa un modelo de inteligencia artificial para la clasificación de imágenes Deepfakes',
      tags: ['NODEJS', 'ML', 'FULLSTACK', 'ANGULAR'],
      language: 'TypeScript',
      languageColor: Color(0xFF3572A5),
      url: 'https://github.com/rafael1199v/DeepFakeDetector.git'
    ),
    Project(
      name: 'Sushi restaurant',
      description: 'Aplicacion de reserva de pedidos, con el frontend hecho en VanillaJs y Express.js para el backend con una base de datos PostgreSQL conectado mediante Prisma.',
      tags: ['JS', 'AWS', 'NGINX', 'NODEJS'],
      language: 'JavaScript',
      languageColor: Color(0xFFE7C04B),
      url: 'https://github.com/rafael1199v/ExamenFinal-AplicacionesWeb.git'
    ),
    Project(
      name: 'Student housing app',
      description: 'Aplicación multiplataforma que conecta a estudiantes que buscan habitaciones con propietarios que publican espacios en alquiler agilizando el proceso de búsqueda y reserva.',
      tags: ['MICROAPPS', 'WEB', 'ANDROID', 'FLUTTER'],
      language: 'DART',
      languageColor: Color(0xFF3178C6),
      url: 'https://github.com/rafael1199v/housing-student-mobile-app.git'
    )
  ],
  stats: [
    Stat(value: '100+', label: 'Commits (último año)'),
    Stat(value: '120', label: 'Pull Requests'),
    Stat(value: '150', label: 'PRs revisados'),
    Stat(value: '5', label: 'Repositorios'),
  ],
  skills: [
    SkillGroup(category: 'Lenguajes', items: ['Java', 'TypeScript', 'Python']),
    SkillGroup(category: 'Frontend', items: ['React', 'Next.js', 'Redux']),
    SkillGroup(category: 'Backend', items: ['Spring Boot', 'Node', 'Express']),
    SkillGroup(
      category: 'Cloud & DevOps',
      items: ['Azure', 'AWS', 'Docker', 'Kubernetes'],
    ),
    SkillGroup(
      category: 'Datos & Mensajería',
      items: ['Kafka', 'GraphQL', 'SQL'],
    ),
  ],
  experience: [
    Experience(
      company: 'BancoSol',
      role: 'Asegurador de calidad de software',
      period: '2026 - Presente',
      location: 'Santa Cruz, Bolivia',
      description:
          'Responsable de garantizar la calidad del software en el equipo de APIs para los diferentes productos tecnológicos del banco. '
          'Implementación de pruebas de integración para los flujos de trabajo esenciales, aumentando el coverage de pruebas y reduciendo los errores en producción.',
    ),
  ],
);
