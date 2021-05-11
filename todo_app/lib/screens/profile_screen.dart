import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/viewModels/theme_context.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeContext>(context, listen: false);

    return Expanded(
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

              currentTheme.switchTheme();
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

              currentTheme.switchTheme();
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
              currentTheme.switchTheme();
            },
          ),
        ],
      ),
    );
  }
}
