import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';
import 'package:flutter/foundation.dart' show kIsWeb;

import '../constants/constants.dart';
import '../utils/responsive.dart';
import '../widgets/navbar.dart';
import '../widgets/section_title.dart';
import '../utils/web_utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  int _selectedIndex = 0;

  final List<GlobalKey> _sectionKeys = List.generate(5, (_) => GlobalKey());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Navigation Bar
          NavBar(
            selectedIndex: _selectedIndex,
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });
              _scrollToSection(index);
            },
          ),

          // Content
          Expanded(
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  // Hero Section
                  Container(
                    key: _sectionKeys[0],
                    padding: const EdgeInsets.symmetric(
                      horizontal: Constants.defaultPadding * 2,
                      vertical: Constants.sectionPadding,
                    ),
                    child: _buildHeroSection(),
                  ),

                  // About Section
                  Container(
                    key: _sectionKeys[1],
                    padding: const EdgeInsets.symmetric(
                      horizontal: Constants.defaultPadding * 2,
                      vertical: Constants.sectionPadding,
                    ),
                    decoration: BoxDecoration(
                      color: Constants.bgColor.withOpacity(0.8),
                    ),
                    child: _buildAboutSection(),
                  ),

                  // Skills Section
                  Container(
                    key: _sectionKeys[2],
                    padding: const EdgeInsets.symmetric(
                      horizontal: Constants.defaultPadding * 2,
                      vertical: Constants.sectionPadding,
                    ),
                    child: _buildSkillsSection(),
                  ),

                  // Projects Section
                  Container(
                    key: _sectionKeys[3],
                    padding: const EdgeInsets.symmetric(
                      horizontal: Constants.defaultPadding * 2,
                      vertical: Constants.sectionPadding,
                    ),
                    decoration: BoxDecoration(
                      color: Constants.bgColor.withOpacity(0.8),
                    ),
                    child: _buildProjectsSection(),
                  ),

                  // Contact Section
                  Container(
                    key: _sectionKeys[4],
                    padding: const EdgeInsets.symmetric(
                      horizontal: Constants.defaultPadding * 2,
                      vertical: Constants.sectionPadding,
                    ),
                    child: _buildContactSection(),
                  ),

                  // Footer
                  Container(
                    padding: const EdgeInsets.all(Constants.defaultPadding),
                    color: Constants.bgColor.withOpacity(0.9),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: const FaIcon(
                                FontAwesomeIcons.github,
                                color: Constants.secondaryColor,
                              ),
                              onPressed: () async {
                                await _launchUrl(Constants.github);
                              },
                            ),
                            IconButton(
                              icon: const FaIcon(
                                FontAwesomeIcons.linkedin,
                                color: Constants.secondaryColor,
                              ),
                              onPressed: () async {
                                await _launchUrl(Constants.linkedin);
                              },
                            ),
                            IconButton(
                              icon: const FaIcon(
                                FontAwesomeIcons.twitter,
                                color: Constants.secondaryColor,
                              ),
                              onPressed: () async {
                                await _launchUrl(Constants.twitter);
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Text(
                          '© ${DateTime.now().year} ${Constants.name}. All rights reserved.',
                          style: const TextStyle(
                            color: Constants.subtitleColor,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeroSection() {
    return Responsive(mobile: _buildMobileHero(), desktop: _buildDesktopHero());
  }

  Widget _buildMobileHero() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Container(
            width: 180,
            height: 180,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Constants.primaryColor, width: 3),
              boxShadow: [
                BoxShadow(
                  color: Constants.primaryColor.withOpacity(0.3),
                  blurRadius: 15,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(90),
              child: Image.asset(
                Constants.profileImage,
                width: 180,
                height: 180,
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
                errorBuilder: (context, error, stackTrace) {
                  print('Error loading profile image: $error');
                  return Container(
                    width: 180,
                    height: 180,
                    color: Constants.primaryColor.withOpacity(0.2),
                    child: Center(
                      child: Icon(
                        Icons.person,
                        size: 80,
                        color: Constants.secondaryColor,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
        const SizedBox(height: Constants.defaultPadding),
        const Text(
          Constants.name,
          style: Constants.headingStyle,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        AnimatedTextKit(
          animatedTexts: [
            TyperAnimatedText(
              Constants.profession,
              textStyle: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Constants.secondaryColor,
              ),
              speed: const Duration(milliseconds: 100),
            ),
          ],
          repeatForever: true,
        ),
        const SizedBox(height: Constants.defaultPadding),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: const Text(
            Constants.about,
            style: Constants.bodyTextStyle,
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: Constants.defaultPadding),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                _scrollToSection(4); // Scroll to Contact section
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Constants.primaryColor,
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 15,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text('Contact Me'),
            ),
            const SizedBox(width: 15),
            ElevatedButton(
              onPressed: () {
                openPdf(Constants.resumePath);
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Constants.secondaryColor,
                backgroundColor: Colors.transparent,
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 15,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                  side: BorderSide(color: Constants.secondaryColor, width: 2),
                ),
              ),
              child: const Text('View Resume'),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDesktopHero() {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello, I\'m',
                style: TextStyle(fontSize: 24, color: Constants.secondaryColor),
              ),
              const SizedBox(height: 10),
              const FittedBox(
                fit: BoxFit.scaleDown,
                alignment: Alignment.centerLeft,
                child: Text(
                  Constants.name,
                  style: TextStyle(
                    fontSize: 64,
                    fontWeight: FontWeight.bold,
                    color: Constants.textColor,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              AnimatedTextKit(
                animatedTexts: [
                  TyperAnimatedText(
                    Constants.profession,
                    textStyle: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                      color: Constants.secondaryColor,
                    ),
                    speed: const Duration(milliseconds: 100),
                  ),
                ],
                repeatForever: true,
              ),
              const SizedBox(height: Constants.defaultPadding),
              const Text(
                Constants.about,
                style: Constants.bodyTextStyle,
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: Constants.defaultPadding),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _scrollToSection(4); // Scroll to Contact section
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Constants.primaryColor,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 15,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text('Contact Me'),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      openPdf(Constants.resumePath);
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Constants.secondaryColor,
                      backgroundColor: Colors.transparent,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 15,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        side: BorderSide(
                          color: Constants.secondaryColor,
                          width: 2,
                        ),
                      ),
                    ),
                    child: const Text('View Resume'),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(width: Constants.defaultPadding * 2),
        Expanded(
          flex: 2,
          child: Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Constants.primaryColor, width: 3),
              boxShadow: [
                BoxShadow(
                  color: Constants.primaryColor.withOpacity(0.3),
                  blurRadius: 15,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(150),
              child: Image.asset(
                Constants.profileImage,
                width: 300,
                height: 300,
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
                errorBuilder: (context, error, stackTrace) {
                  print('Error loading desktop profile image: $error');
                  return Container(
                    width: 300,
                    height: 300,
                    color: Constants.primaryColor.withOpacity(0.2),
                    child: Center(
                      child: Icon(
                        Icons.person,
                        size: 120,
                        color: Constants.secondaryColor,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAboutSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SectionTitle(title: 'About Me'),
        Responsive(
          mobile: Column(
            children: [
              _buildInfoItem(Icons.person, 'Name', Constants.name),
              _buildInfoItem(Icons.work, 'Profession', Constants.profession),
              _buildInfoItem(Icons.email, 'Email', Constants.email),
              _buildInfoItem(Icons.location_on, 'Location', Constants.location),
            ],
          ),
          desktop:
              Responsive.isDesktop(context)
                  ? Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: _buildInfoItem(
                              Icons.person,
                              'Name',
                              Constants.name,
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: _buildInfoItem(
                              Icons.work,
                              'Profession',
                              Constants.profession,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            child: _buildInfoItem(
                              Icons.email,
                              'Email',
                              Constants.email,
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: _buildInfoItem(
                              Icons.location_on,
                              'Location',
                              Constants.location,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                  : Wrap(
                    spacing: 40,
                    runSpacing: 20,
                    alignment: WrapAlignment.center,
                    children: [
                      _buildInfoItem(Icons.person, 'Name', Constants.name),
                      _buildInfoItem(
                        Icons.work,
                        'Profession',
                        Constants.profession,
                      ),
                      _buildInfoItem(Icons.email, 'Email', Constants.email),
                      _buildInfoItem(
                        Icons.location_on,
                        'Location',
                        Constants.location,
                      ),
                    ],
                  ),
        ),
        const SizedBox(height: Constants.defaultPadding * 2),
        const SectionTitle(title: 'My Services'),
        Responsive(
          mobile: Column(
            children:
                Constants.services
                    .map(
                      (service) => _buildServiceItem(
                        service['title']!,
                        service['description']!,
                      ),
                    )
                    .toList(),
          ),
          desktop: Row(
            children:
                Constants.services
                    .map(
                      (service) => Expanded(
                        child: _buildServiceItem(
                          service['title']!,
                          service['description']!,
                        ),
                      ),
                    )
                    .toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildInfoItem(IconData icon, String title, String value) {
    final bool isDesktop = Responsive.isDesktop(context);

    return Container(
      width:
          isDesktop
              ? null
              : (Responsive.isMobile(context) ? double.infinity : 250),
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Constants.lightBgColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Constants.primaryColor.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Constants.secondaryColor),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Constants.subtitleColor,
                    fontSize: 14,
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Text(
                    value,
                    style: const TextStyle(
                      color: Constants.textColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildServiceItem(String title, String description) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Constants.lightBgColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Constants.primaryColor.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Constants.secondaryColor,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 10),
          Container(
            height: 2,
            width: 40,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Constants.primaryColor, Constants.secondaryColor],
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const SizedBox(height: 15),
          Text(
            description,
            style: const TextStyle(
              color: Constants.subtitleColor,
              fontSize: 16,
            ),
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _buildSkillsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SectionTitle(title: 'My Skills'),
        const SizedBox(height: Constants.defaultPadding),
        Wrap(
          spacing: 20,
          runSpacing: 20,
          alignment: WrapAlignment.center,
          children: Constants.skills.map(_buildSkillChip).toList(),
        ),
      ],
    );
  }

  Widget _buildSkillChip(String skill) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Constants.secondaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Constants.secondaryColor),
      ),
      child: Text(
        skill,
        style: TextStyle(
          color: Constants.secondaryColor,
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
      ),
    );
  }

  Widget _buildProjectsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SectionTitle(title: 'My Projects'),
        const SizedBox(height: Constants.defaultPadding),
        Responsive(
          mobile: Column(
            children:
                Constants.projects
                    .map((project) => _buildProjectCard(project))
                    .toList(),
          ),
          desktop:
              Constants.projects.length > 2
                  ? SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:
                          Constants.projects
                              .map(
                                (project) => SizedBox(
                                  width: 350,
                                  child: _buildProjectCard(project),
                                ),
                              )
                              .toList(),
                    ),
                  )
                  : Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:
                        Constants.projects
                            .map(
                              (project) =>
                                  Expanded(child: _buildProjectCard(project)),
                            )
                            .toList(),
                  ),
        ),
      ],
    );
  }

  Widget _buildProjectCard(Map<String, String> project) {
    return Container(
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Constants.lightBgColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Constants.primaryColor.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              color: Constants.primaryColor.withOpacity(0.2),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              child: Center(
                child: Text(
                  project['title']?.substring(0, 1) ?? 'P',
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: Constants.secondaryColor,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  project['title'] ?? 'Project',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Constants.secondaryColor,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 10),
                Text(
                  project['description'] ?? 'No description available',
                  style: const TextStyle(
                    color: Constants.subtitleColor,
                    fontSize: 16,
                  ),
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SectionTitle(title: 'Get In Touch'),
        const SizedBox(height: Constants.defaultPadding),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'I\'m currently open for new opportunities. Feel free to contact me!',
            style: TextStyle(color: Constants.subtitleColor, fontSize: 18),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: Constants.defaultPadding * 2),
        Responsive(
          mobile: Column(
            children: [
              _buildContactItem(
                Icons.email,
                'Email',
                Constants.email,
                'mailto:${Constants.email}',
              ),
              const SizedBox(height: 20),
              _buildContactItem(
                Icons.location_on,
                'Location',
                Constants.location,
                '',
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildSocialButton(FontAwesomeIcons.github, Constants.github),
                  _buildSocialButton(
                    FontAwesomeIcons.linkedin,
                    Constants.linkedin,
                  ),
                  _buildSocialButton(
                    FontAwesomeIcons.twitter,
                    Constants.twitter,
                  ),
                ],
              ),
            ],
          ),
          desktop: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildContactItem(
                  Icons.email,
                  'Email',
                  Constants.email,
                  'mailto:${Constants.email}',
                ),
                const SizedBox(width: 40),
                _buildContactItem(
                  Icons.location_on,
                  'Location',
                  Constants.location,
                  '',
                ),
                const SizedBox(width: 40),
                Column(
                  children: [
                    const Text(
                      'Socials',
                      style: TextStyle(
                        color: Constants.subtitleColor,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        _buildSocialButton(
                          FontAwesomeIcons.github,
                          Constants.github,
                        ),
                        _buildSocialButton(
                          FontAwesomeIcons.linkedin,
                          Constants.linkedin,
                        ),
                        _buildSocialButton(
                          FontAwesomeIcons.twitter,
                          Constants.twitter,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildContactItem(
    IconData icon,
    String title,
    String value,
    String url,
  ) {
    return InkWell(
      onTap: url.isEmpty ? null : () => _launchUrl(url),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Constants.lightBgColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Constants.primaryColor.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          children: [
            Icon(icon, color: Constants.secondaryColor, size: 30),
            const SizedBox(height: 15),
            Text(
              title,
              style: const TextStyle(
                color: Constants.subtitleColor,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              value,
              style: const TextStyle(
                color: Constants.textColor,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialButton(IconData icon, String url) {
    return IconButton(
      icon: FaIcon(icon, color: Constants.secondaryColor),
      onPressed: () => _launchUrl(url),
      iconSize: 24,
      padding: const EdgeInsets.all(10),
    );
  }

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $url');
    }
  }

  void _scrollToSection(int index) {
    final context = _sectionKeys[index].currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    }
  }
}
