
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class RadioPlayer extends StatefulWidget {
  @override
  _RadioPlayerState createState() => _RadioPlayerState();
}

class _RadioPlayerState extends State<RadioPlayer> {
  // Create an instance of AudioPlayer
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _isPlaying = false; // Track whether the audio is playing
  // URL of the streaming radio (you can use any online stream)
  final String _streamUrl = 'https://streams.ilovemusic.de/iloveradio6.mp3'; // Replace with actual radio stream

  @override
  void initState() {
    super.initState();
    _startPlaying();
  }

  // Function to start the radio stream
  void _startPlaying() async {
    try {

      await _audioPlayer.play(UrlSource(_streamUrl)); // Updated to use UrlSource for URL streams
      // Success playing
      print("Radio stream started successfully");
      setState(() {
        _isPlaying = true;
      });
    } catch (e) {
      // Handle the error
      print("Error in playing radio stream: $e");
    }
  }

  // Function to toggle play and pause
  void _togglePlayPause() async {
    if (_isPlaying) {
      await _audioPlayer.pause();
    } else {
      await _audioPlayer.play(UrlSource(_streamUrl));
    }
    setState(() {
      _isPlaying = !_isPlaying; // Toggle the playing state
    });
  }

  // Ensure to dispose of the audio player when not in use
  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Radio Player'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.radio, size: 100, color: Colors.red),
            SizedBox(height: 20),
            Text(
              '89.6 MHZ.',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _togglePlayPause, // Use the toggle function
              child: Text(_isPlaying ? 'Pause' : 'Play'), // Change button text based on state
            ),
          ],
        ),
      ),
    );
  }
}
