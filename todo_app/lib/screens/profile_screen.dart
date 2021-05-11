import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/viewModels/theme_context.dart';
import 'package:todo_app/widgets/bottom_nav.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeContext currentTheme =
        Provider.of<ThemeContext>(context, listen: false);
    return Column(
      children: [
        const SizedBox(height: 50),
        Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 0, 0, 0),
          child: Align(
            alignment: Alignment.topLeft,
            child:
                Text('Profile', style: Theme.of(context).textTheme.headline5),
          ),
        ),
        Expanded(
            child: ListView(
          children: [
            SwitchListTile(
              title: Text("Light Theme",
                  style: Theme.of(context).textTheme.headline3),
              value: currentTheme.isLight,
              onChanged: (newValue) {
                currentTheme.isLight = newValue;
                currentTheme.isDark = false;
                newValue
                    ? currentTheme.isSystem = false
                    : currentTheme.isSystem = true;

                Provider.of<ThemeContext>(context, listen: false).switchTheme();
              },
            ),
            SwitchListTile(
              title: Text("Dark Theme",
                  style: Theme.of(context).textTheme.headline3),
              value: currentTheme.isDark,
              onChanged: (newValue) {
                currentTheme.isDark = newValue;
                currentTheme.isLight = false;
                newValue
                    ? currentTheme.isSystem = false
                    : currentTheme.isSystem = true;

                Provider.of<ThemeContext>(context, listen: false).switchTheme();
              },
            ),
            SwitchListTile(
              title: Text("System Default",
                  style: Theme.of(context).textTheme.headline3),
              value: currentTheme.isSystem,
              onChanged: (newValue) {
                currentTheme.isDark = false;
                currentTheme.isLight = false;
                currentTheme.isSystem = newValue;
                Provider.of<ThemeContext>(context, listen: false).switchTheme();
              },
            ),
          ],
        )),
        /*
          BottomNav(
            isHomeScreen: false,
          ),*/
      ],
    );
  }
}
