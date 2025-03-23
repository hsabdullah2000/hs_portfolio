import 'package:flutter/material.dart';
import '../constants/constants.dart';
import '../utils/responsive.dart';

class NavBar extends StatelessWidget {
  final Function(int) onTap;
  final int selectedIndex;

  const NavBar({Key? key, required this.onTap, required this.selectedIndex})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal:
            Responsive.isMobile(context)
                ? Constants.defaultPadding
                : Constants.defaultPadding * 2,
        vertical: Constants.defaultPadding,
      ),
      decoration: BoxDecoration(
        color: Constants.bgColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              Constants.name.split(' ').map((e) => e[0]).join(''),
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Constants.primaryColor,
              ),
            ),
          ),

          // Menu Items
          if (!Responsive.isMobile(context))
            Flexible(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildNavItem('Home', 0),
                    _buildNavItem('About', 1),
                    _buildNavItem('Skills', 2),
                    _buildNavItem('Projects', 3),
                    _buildNavItem('Contact', 4),
                  ],
                ),
              ),
            ),

          // Mobile Menu
          if (Responsive.isMobile(context))
            IconButton(
              onPressed: () {
                _showMobileMenu(context);
              },
              icon: const Icon(Icons.menu, color: Constants.textColor),
            ),
        ],
      ),
    );
  }

  Widget _buildNavItem(String title, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: InkWell(
        onTap: () => onTap(index),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: TextStyle(
                color:
                    selectedIndex == index
                        ? Constants.primaryColor
                        : Constants.textColor,
                fontWeight:
                    selectedIndex == index
                        ? FontWeight.bold
                        : FontWeight.normal,
              ),
            ),
            const SizedBox(height: 5),
            if (selectedIndex == index)
              Container(height: 2, width: 20, color: Constants.primaryColor),
          ],
        ),
      ),
    );
  }

  void _showMobileMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Constants.bgColor,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(Constants.defaultPadding),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text(
                  'Home',
                  style: TextStyle(
                    color:
                        selectedIndex == 0
                            ? Constants.primaryColor
                            : Constants.textColor,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                  onTap(0);
                },
              ),
              ListTile(
                title: Text(
                  'About',
                  style: TextStyle(
                    color:
                        selectedIndex == 1
                            ? Constants.primaryColor
                            : Constants.textColor,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                  onTap(1);
                },
              ),
              ListTile(
                title: Text(
                  'Skills',
                  style: TextStyle(
                    color:
                        selectedIndex == 2
                            ? Constants.primaryColor
                            : Constants.textColor,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                  onTap(2);
                },
              ),
              ListTile(
                title: Text(
                  'Projects',
                  style: TextStyle(
                    color:
                        selectedIndex == 3
                            ? Constants.primaryColor
                            : Constants.textColor,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                  onTap(3);
                },
              ),
              ListTile(
                title: Text(
                  'Contact',
                  style: TextStyle(
                    color:
                        selectedIndex == 4
                            ? Constants.primaryColor
                            : Constants.textColor,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                  onTap(4);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
