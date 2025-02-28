import 'package:flutter/material.dart';
import 'package:danek/models/activity_list.dart';
import 'package:neon_circular_timer/neon_circular_timer.dart';

class ActivityDetailsScreen extends StatelessWidget {
  final ActivityList ativityList;

  const ActivityDetailsScreen({super.key,
    required this.ativityList,
  });

  @override
  Widget build(BuildContext context) {
    final CountDownController controller = CountDownController();
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/menubackground.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              if (ativityList != null) ...[
                const SizedBox(height: 10),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/');
                      },
                      child: const CircleAvatar(
                        radius: 30.0,
                        backgroundImage: AssetImage("assets/images/backbutton.png"),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                      width: MediaQuery.of(context).size.width * 0.4,
                    ),
                    const CircleAvatar(
                      radius: 30.0,
                      backgroundImage: AssetImage("assets/images/coin.png"),
                    ),
                  ],
                ),
                Text(ativityList.name.toString(), style: Theme.of(context).textTheme.headline6),
                Image(
                  image: NetworkImage(ativityList.gif.toString()),
                  width: 500,
                  height: 350,
                ),
                Padding(
                  padding: const EdgeInsets.all(30),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                            icon: const Icon(Icons.play_arrow),
                            onPressed: () {
                              controller.resume();
                            }),
                        NeonCircularTimer(
                            onComplete: () {
                              controller.restart();
                            },
                            width: 80,
                            controller: controller,
                            duration: 120,
                            strokeWidth: 3,
                            textStyle: const TextStyle(fontSize: 20),
                            isTimerTextShown: true,
                            neumorphicEffect: true,
                            outerStrokeColor: Colors.grey.shade100,
                            innerFillGradient: LinearGradient(colors: [
                              Colors.greenAccent.shade200,
                              Colors.blueAccent.shade400
                            ]),
                            neonGradient: LinearGradient(colors: [
                              Colors.greenAccent.shade200,
                              Colors.blueAccent.shade400
                            ]),
                            strokeCap: StrokeCap.round,
                            innerFillColor: Colors.black12,
                            backgroudColor: Colors.grey.shade100,
                            neonColor: Colors.blue.shade900),
                        IconButton(
                            icon: const Icon(Icons.pause),
                            onPressed: () {
                              controller.pause();
                            }),
                      ]),
                )
              ],
            ],
          ),
        ),
      ),
    );
  }
}