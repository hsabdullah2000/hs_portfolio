import 'package:flutter/material.dart';

class Constants {
  // Colors - Updated to a more vibrant and light theme
  static const Color primaryColor = Color(0xFF5D8BF4); // Vibrant blue
  static const Color secondaryColor = Color(0xFFFF7D54); // Coral orange
  static const Color accentColor = Color(0xFF9ACD32); // Yellow-green
  static const Color bgColor = Color(0xFF272E4F); // Dark blue-purple
  static const Color lightBgColor = Color(
    0xFF313B72,
  ); // Lighter version of bgColor
  static const Color textColor = Colors.white;
  static const Color subtitleColor = Color(0xFFD7DFFF); // Light lavender

  // Text Styles
  static const TextStyle headingStyle = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: textColor,
  );

  static const TextStyle subheadingStyle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: textColor,
  );

  static const TextStyle bodyTextStyle = TextStyle(
    fontSize: 16,
    color: subtitleColor,
  );

  // Padding and Margins
  static const double defaultPadding = 20.0;
  static const double sectionPadding = 80.0;

  // Personal Information
  static const String name = "Syed Muhammad Abdullah";
  static const String profession = "Jr. Flutter Developer";
  static const String email = "example@email.com"; // Replace with actual email
  static const String location =
      "Your Location"; // Replace with actual location
  static const String about =
      "I am a Flutter developer with expertise in creating mobile and web applications. I'm passionate about building elegant, responsive and user-friendly interfaces with a focus on delivering exceptional user experiences.";

  // Resume path
  static const String resumePath =
      "assets/images/Syed Muhammad Abdullah_Updated Resume.pdf";
  static const String profileImage = "assets/images/profile.jpeg";

  // Skills
  static const List<String> skills = [
    "Flutter",
    "Dart",
    "UI/UX Design",
    "Firebase",
    "State Management",
    "RESTful APIs",
    "Git",
    "Responsive Design",
  ];

  // Services
  static const List<Map<String, String>> services = [
    {
      "title": "Mobile App Development",
      "description":
          "Creating cross-platform mobile applications with Flutter for Android and iOS.",
    },
    {
      "title": "Web Development",
      "description": "Building responsive web applications using Flutter Web.",
    },
    {
      "title": "UI/UX Design",
      "description":
          "Designing intuitive and beautiful user interfaces with a focus on user experience.",
    },
  ];

  // Projects
  static const List<Map<String, String>> projects = [
    {
      "title": "E-Commerce App",
      "description":
          "A full-featured online shopping app with payment gateway integration and order tracking features.",
      "image": "assets/images/ecommerce.png",
    },
    {
      "title": "Food Delivery App",
      "description":
          "A food delivery platform with real-time order tracking, restaurant ratings, and payment processing.",
      "image": "assets/images/food_delivery.png",
    },
    {
      "title": "Social Network App",
      "description":
          "A social media application with features like posts, stories, chat, and profile management.",
      "image": "assets/images/social_network.png",
    },
    {
      "title": "Fitness Tracker",
      "description":
          "A health and fitness app that tracks workouts, nutrition, and provides personalized fitness plans.",
      "image": "assets/images/fitness.png",
    },
    {
      "title": "Travel Companion",
      "description":
          "A travel app with itinerary planning, booking management, and destination recommendations.",
      "image": "assets/images/travel.png",
    },
    {
      "title": "Task Management",
      "description":
          "A productivity app for task management with features like reminders, categories, and progress tracking.",
      "image": "assets/images/task_management.png",
    },
    {
      "title": "Weather Forecast",
      "description":
          "A weather application with current conditions, forecasts, and severe weather alerts.",
      "image": "assets/images/weather.png",
    },
    {
      "title": "Video Streaming App",
      "description":
          "A video streaming platform with content categories, user profiles, and personalized recommendations.",
      "image": "assets/images/streaming.png",
    },
  ];

  // Social Media Links
  static const String github = "https://github.com/yourusername";
  static const String linkedin = "https://linkedin.com/in/yourusername";
  static const String twitter = "https://twitter.com/yourusername";
}
