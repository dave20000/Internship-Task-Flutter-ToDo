import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/business_logic/enums/theme_type.dart';
import 'package:todo_app/business_logic/view_models/theme_context_view_model.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final currentTheme =
        Provider.of<ThemeContextViewModel>(context, listen: false);

    return Flexible(
      child: ListView(
        children: [
          SwitchListTile(
            title: Text("Light Theme",
                style: Theme.of(context).textTheme.headline3),
            value: currentTheme.themeType == ThemeType.light ? true : false,
            onChanged: (newValue) {
              if (newValue)
                currentTheme.themeType = ThemeType.light;
              else
                currentTheme.themeType = ThemeType.system;
            },
          ),
          SwitchListTile(
            title: Text("Dark Theme",
                style: Theme.of(context).textTheme.headline3),
            value: currentTheme.themeType == ThemeType.dark ? true : false,
            onChanged: (newValue) {
              if (newValue)
                currentTheme.themeType = ThemeType.dark;
              else
                currentTheme.themeType = ThemeType.system;
            },
          ),
          SwitchListTile(
            title: Text("System Default",
                style: Theme.of(context).textTheme.headline3),
            value: currentTheme.themeType == ThemeType.system ? true : false,
            onChanged: (newValue) {
              currentTheme.themeType = ThemeType.system;
            },
          ),
        ],
      ),
    );
  }
}
