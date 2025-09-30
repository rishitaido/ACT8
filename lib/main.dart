import 'package:flutter/material.dart';

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
  Color textColor = Colors.blue; 
  bool showFrame = false;

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
   

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TODO: Update backgroundColor based on day/night mode
      appBar: AppBar(
        title: const Text('Fading Text Animation'),
        actions: [
          // TODO: Add sun/moon icon button for day/night mode toggle
          // TODO: Add color palette icon button to open color picker
        ],
      ),
      body: GestureDetector(
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
                child: const Text(
                  'Hello, Flutter!',
                  style: TextStyle(fontSize: 24),
                  // TODO: Update text color based on selected color
                ),
              ),
              const SizedBox(height: 40),
              // TODO: Add Container with image
              // TODO: Add BoxDecoration with border when showFrame is true
              // TODO: Add ClipRRect for rounded corners
              const SizedBox(height: 20),
              // TODO: Add SwitchListTile to toggle frame on/off
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

// TODO: Create SecondScreen widget for the second fading animation
// This screen should have:
// - Different animation duration
// - Similar fading effect
// - AppBar with back navigation