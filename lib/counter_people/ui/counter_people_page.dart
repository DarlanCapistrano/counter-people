
import 'package:counter_people/counter_people/counter_people_controller.dart';
import 'package:flutter/material.dart';

class CounterPeoplePage extends StatefulWidget {
  const CounterPeoplePage({Key? key}) : super(key: key);

  @override
  State<CounterPeoplePage> createState() => _CounterPeoplePageState();
}

class _CounterPeoplePageState extends State<CounterPeoplePage> {
  final CounterPeopleController _pageController = CounterPeopleController();

  @override
  Widget build(BuildContext context) {
    return counterPeoplePage(context);
  }

  Widget counterPeoplePage(BuildContext context){
    final title = _pageController.counterPeople == 0 ? "Está vazio!" : _pageController.counterPeople < 20 ? "Pode entrar!" : "Está cheio!";
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Container(
        decoration: const BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/restaurant_image.jpeg"), fit: BoxFit.cover)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(color: Colors.black.withOpacity(0.6), borderRadius: BorderRadius.circular(16)),
                padding: const EdgeInsets.all(12),
                child: Text(title, style: const TextStyle(color: Colors.white, fontSize: 28)),
              ),
              const SizedBox(height: 32),
              Text("${_pageController.counterPeople}", style: TextStyle(color: _pageController.isFull ? Colors.red : Colors.white, fontSize: 80)),
              const SizedBox(height: 32),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: _pageController.isEmpty ? Colors.white.withOpacity(0.4) : Colors.white,
                      primary: Colors.black,
                      fixedSize: const Size(100, 100),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    ),
                    onPressed: _pageController.isEmpty ? null : decreaseCounterPeople,
                    child: const Text("Saiu", style: TextStyle(fontSize: 18)),
                  ),
                  const SizedBox(width: 32),
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: _pageController.isFull ? Colors.white.withOpacity(0.4) : Colors.white,
                      primary: Colors.black,
                      fixedSize: const Size(100, 100),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    ),
                    onPressed: _pageController.isFull ? null : increaseCounterPeople,
                    child: const Text("Entrou", style: TextStyle(fontSize: 18)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void increaseCounterPeople(){
    setState(() {
      _pageController.counterPeople++;
    });
  }

  void decreaseCounterPeople(){
    setState(() {
      _pageController.counterPeople--;
    });
  }
}