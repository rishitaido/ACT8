import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fading Text Animation',
      // TODO: Add theme data here for day/night mode support
      home: const FadingTextAnimation(),
    );
  }
}

class FadingTextAnimation extends StatefulWidget {
  const FadingTextAnimation({Key? key}) : super(key: key);

  @override
  _FadingTextAnimationState createState() => _FadingTextAnimationState();
}

class _FadingTextAnimationState extends State<FadingTextAnimation> {
  bool _isVisible = true;

  bool _isDarkMode = false; 
  Color _textColor = Colors.blue; 
  bool _showFrame = false;

  void toggleVisibility() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  // TODO: Add method to toggle day/night mode
  void toggleMode(){
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
    
  }

  // TODO: Add method to open color picker dialog
  void _showColorPicker() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Pick a color'),
        content: SingleChildScrollView(
          child: ColorPicker(
            pickerColor: _textColor,
            onColorChanged: (color) {
              setState(() {
                _textColor = color;
              });
            },
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Done'),
          ),
        ],
      ),
    );
  }
   

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _isDarkMode ? Colors.grey[900] : Colors.amber,
      appBar: AppBar(
        title: const Text('Fading Text Animation'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(_isDarkMode ? Icons.wb_sunny: Icons.nightlight_round),
            onPressed: toggleMode), 
          IconButton(
            icon: const Icon(Icons.palette), 
            onPressed: _showColorPicker
            ),
        ],
      ),
      body: GestureDetector(
        onHorizontalDragEnd: (details){
          if (details.primaryVelocity! < 0){
            Navigator.push(
              context, 
              MaterialPageRoute(builder: (context) => const SecondPage())
              );
          }
        },
        // TODO: Add onHorizontalDragEnd to detect swipe gesture
        // Navigate to second screen when swiped
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedOpacity(
                opacity: _isVisible ? 1.0 : 0.0,
                duration: const Duration(seconds: 1),
                curve: Curves.easeInOut,
                child: Text(
                  'Hello, Flutter!',
                  style: TextStyle(fontSize: 24, color: _textColor,),
                ),
              ),
              const SizedBox(height: 40),
              Container(
                decoration: _showFrame
                  ? BoxDecoration(
                      border: Border.all(color: Colors.blue, width: 4),
                      borderRadius: BorderRadius.circular(20),
                    )
                  : null,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'assets/gengar.jpg',
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),
            SwitchListTile(
              title: Text('Show Frame', style: TextStyle(color: Colors.white), textAlign: TextAlign.center,),
              value: _showFrame,
              onChanged: (bool value) {
                setState(() {
                  _showFrame = value;
                });
              },
            ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: toggleVisibility,
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage>{
  bool _isVisible = true; 

  void toggleVisibility(){
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  @override 
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("Second Animation"), 
      ),
      body: Center(
        child: AnimatedOpacity(
          opacity: _isVisible ? 1.0 : 0.0, 
          duration: const Duration(seconds: 3), 
          curve: Curves.easeInOut, 
          child: const Text(
            'Second Animation', 
            style: TextStyle(fontSize: 24),
            ),
          ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: toggleVisibility, 
        child: const Icon(Icons.play_arrow),
      ),
      );
  }
}
