import 'package:flutter/material.dart';
import 'package:flutter_provider/screens/favouirate%20screen/favourite_screen.dart';
import 'package:flutter_provider/screens/theme_change_screen.dart';
// import 'package:flutter_provider/screens/favourite_screen.dart';
import 'package:provider/provider.dart';

import '../provider/count_provider.dart';
import 'login/login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double slid = 0.5;

  @override
  Widget build(BuildContext context) {
    debugPrint("Re-Build");
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Flutter Provider"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              // height: 300,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(style: BorderStyle.solid),
              ),
              child: Column(
                children: [
                  Consumer<CountProivder>(
                    builder: (context, value, child) {
                      return Text(
                        value.count.toString(),
                        style: const TextStyle(fontSize: 130),
                      );
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Consumer<CountProivder>(
                        builder: (context, value, child) {
                          return ElevatedButton(
                              onPressed: () {
                                value.decrementCount();
                              },
                              style: ElevatedButton.styleFrom(
                                  fixedSize: const Size(150, 50),
                                  backgroundColor: Colors.red[700]),
                              child: const Icon(
                                Icons.remove,
                                color: Colors.white,
                              ));
                        },
                      ),
                      Consumer<CountProivder>(
                        builder: (context, value, child) {
                          return ElevatedButton(
                              onPressed: () {
                                value.incrementCount();
                              },
                              style: ElevatedButton.styleFrom(
                                  fixedSize: const Size(150, 50),
                                  backgroundColor: Colors.blue),
                              child: const Icon(
                                Icons.add,
                                color: Colors.white,
                              ));
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 100,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(style: BorderStyle.solid),
                // color: Colors.indigo[200],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Consumer<CountProivder>(
                    builder: (context, value, child) => Text(
                      "Auto Increment \nCount : ${value.timerCount.toString()}",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Consumer<CountProivder>(
                        builder: (context, value, child) {
                          return ElevatedButton(
                              onPressed: () {
                                value.timerStart();
                              },
                              style: ElevatedButton.styleFrom(
                                  fixedSize: const Size(70, 50),
                                  foregroundColor: Colors.black,
                                  backgroundColor: Colors.green[500]),
                              child: const Icon(Icons.play_arrow));
                        },
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Consumer<CountProivder>(
                        builder: (context, value, child) {
                          return ElevatedButton(
                              onPressed: () {
                                value.timerCountReset();
                              },
                              style: ElevatedButton.styleFrom(
                                fixedSize: const Size(70, 50),
                                foregroundColor: Colors.black,
                                backgroundColor: Colors.yellow,
                              ),
                              child: const Icon(Icons.restart_alt));
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Consumer<CountProivder>(
              builder: (context, provider, child) {
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(provider.sliderValue),
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(style: BorderStyle.solid),
                  ),
                  child: Column(
                    children: [
                      Slider(
                        value: provider.sliderValue,
                        thumbColor: Colors.red,
                        onChanged: (value) {
                          provider.sliderChange(value);
                        },
                      ),
                      Text(
                        provider.sliderValue.toStringAsFixed(2),
                        style: const TextStyle(fontSize: 25),
                      ),
                    ],
                  ),
                );
              },
            ),
            Consumer<CountProivder>(
              builder: (context, value, child) {
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  margin: const EdgeInsets.symmetric(vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            value.changeVisible();
                          },
                          style: ElevatedButton.styleFrom(
                              fixedSize: const Size(50, 60),
                              backgroundColor: Colors.indigo,
                              foregroundColor: Colors.white),
                          child: const Icon(Icons.chevron_left)),
                      Text(
                        value.visible.toString(),
                        style: const TextStyle(fontSize: 40),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            value.changeVisible();
                          },
                          style: ElevatedButton.styleFrom(
                              fixedSize: const Size(50, 60),
                              backgroundColor: Colors.indigo,
                              foregroundColor: Colors.white),
                          child: const Icon(Icons.chevron_right)),
                    ],
                  ),
                );
              },
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FavouriteScreen(),
                      ));
                },
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(400, 50),
                    backgroundColor: Colors.brown,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                child: const Text(
                  "Favouirate Screen",
                  style: TextStyle(fontSize: 25),
                )),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ThemeChangeScreen(),
                      ));
                },
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(400, 50),
                    backgroundColor: Colors.deepOrange[500],
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                child: const Text(
                  "Theme Change Screen",
                  style: TextStyle(fontSize: 25),
                )),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ));
                },
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(400, 50),
                    backgroundColor: Colors.teal,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                child: const Text(
                  "Login Screen",
                  style: TextStyle(fontSize: 25),
                )),
          ],
        ),
      ),
    );
  }
}
