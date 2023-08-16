import 'package:flutter/material.dart';
import 'package:flutter_provider/provider/change_theme_provider.dart';
import 'package:provider/provider.dart';

class ThemeChangeScreen extends StatefulWidget {
  const ThemeChangeScreen({super.key});

  @override
  State<ThemeChangeScreen> createState() => _ThemeChangeScreenState();
}

class _ThemeChangeScreenState extends State<ThemeChangeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 10,
        title: const Text("Theme Change Screen"),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Consumer<ThemeChangeProvider>(
          builder: (context, value, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "The Theme Selection :",
                  style: TextStyle(fontSize: 25),
                ),
                RadioListTile<ThemeMode>(
                    title: const Text("Light Mode"),
                    value: ThemeMode.light,
                    groupValue: value.thememode,
                    onChanged: value.setTheme),
                RadioListTile<ThemeMode>(
                    title: const Text("Dark Mode"),
                    value: ThemeMode.dark,
                    groupValue: value.thememode,
                    onChanged: value.setTheme),
                RadioListTile<ThemeMode>(
                    title: const Text("System Mode"),
                    value: ThemeMode.system,
                    groupValue: value.thememode,
                    onChanged: value.setTheme),
              ],
            );
          },
        ),
      ),
    );
  }
}
