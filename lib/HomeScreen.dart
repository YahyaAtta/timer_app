import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AudioPlayer ticking = AudioPlayer();
  AudioPlayer complete = AudioPlayer();
  void startticking() {
    ticking.play(AssetSource("audios/ticking.mp3"));
  }

  void stopticking() {
    ticking.stop();
  }

  void completeTimer() {
    complete.play(AssetSource('audios/complete.mp3'));
  }

  void StopTimer() {
    complete.stop();
  }

  void stop() {
    ticking.stop();
    complete.stop();
  }

  int time = 25;
  int breaktime = 5;
  int counter = (25 * 60);
  int timestop = 0;
  Timer? timer;
  void _startTimer(int timeinmin) {
    counter = timeinmin * 60;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (counter == 0) {
        setState(() {
          stopticking();
          completeTimer();
          timer.cancel();
        });
      } else {
        setState(() {
          counter--;
          startticking();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: const Text('Timer',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
                fontFamily: 'Segoe UI')),
        centerTitle: true,
        actions: [
          IconButton(
            padding: const EdgeInsets.only(right: 20, left: 20),
            icon: const Icon(Icons.info, size: 30),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return const AboutDialog(
                      applicationIcon: Icon(Icons.timer, size: 46),
                      applicationName: 'Timer',
                      applicationVersion: '1.0.0',
                    );
                  });
            },
          ),
        ],
      ),
      drawer: Drawer(
        elevation: 0.0,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 30),
            ),
            DrawerHeader(
                child: UserAccountsDrawerHeader(
              accountName: const Text('Guest',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14.5,

                  )),
              accountEmail: const Text('guest@info.com',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14.5,

                  )),
              currentAccountPicture: const Icon(
                Icons.person,
                size: 45,
                color: Colors.white,
              ),
              currentAccountPictureSize: const Size.square(45),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: const Color.fromARGB(255, 109, 5, 127),
                boxShadow: const [
                  BoxShadow(
                      color: Color.fromARGB(255, 127, 68, 229),
                      blurRadius: 10,
                      spreadRadius: 3),
                ],
              ),
            )),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 20),
          ),
          Text(
            '${counter ~/ 60 < 10 ? "0${counter ~/ 60}" : counter ~/ 60} : ${counter % 60 < 10 ? "0${counter % 60}" : counter % 60}',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: max(90, MediaQuery.of(context).size.width / 10)),
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RawMaterialButton(
                padding: const EdgeInsets.all(25),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                onPressed: () {
                  if (timer != null) {
                    setState(() {
                      timer!.cancel();
                      stop();
                    });
                  }
                  _startTimer(time);
                },
                fillColor: const Color.fromARGB(64, 154, 151, 151),
                child: const Icon(
                  Icons.play_arrow_rounded,
                  size: 40,
                ),
              ),
              const SizedBox(
                width: 35,
                height: 35,
              ),
              RawMaterialButton(
                padding: const EdgeInsets.all(25),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                onPressed: () {
                  if (timer != null) {
                    setState(() {
                      timer!.cancel();
                      stop();
                    });
                  }
                  _startTimer(breaktime);
                },
                fillColor: const Color.fromARGB(64, 154, 151, 151),
                child: const Icon(
                  Icons.timelapse_sharp,
                  size: 40,
                ),
              ),
              const SizedBox(
                width: 35,
                height: 35,
              ),
              RawMaterialButton(
                padding: const EdgeInsets.all(25),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                onPressed: () {
                  if (timer != null) {
                    setState(() {
                      timer!.cancel();
                      counter = 25 * 60;
                      stop();
                    });
                  }
                },
                fillColor: const Color.fromARGB(64, 154, 151, 151),
                child: const Icon(
                  Icons.stop_rounded,
                  size: 40,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
