import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const XylophoneApp());
}

class XylophoneApp extends StatefulWidget {
  const XylophoneApp({super.key});

  @override
  State<XylophoneApp> createState() => _XylophoneAppState();
}

class _XylophoneAppState extends State<XylophoneApp> {
  // 1. Tạo 1 đối tượng player duy nhất dùng chung cho toàn màn hình
  final AudioPlayer _player = AudioPlayer();

  // 2. Hàm phát âm thanh tối ưu
  void _playSound(int soundNumber) async {
    // Ngắt âm thanh đang phát trước đó để phát ngay nốt mới
    await _player.stop(); 
    await _player.play(AssetSource('sounds/sound$soundNumber.mp3'));
  }

  // 3. Hàm tạo phím nhạc động để tránh lặp code
  Widget _buildKey({required Color color, required int soundNumber}) {
    return Expanded(
      child: Material(
        color: color,
        child: InkWell(
          onTap: () => _playSound(soundNumber),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // 解放 Giải phóng bộ nhớ player khi hủy Widget
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.grey[900],
          title: const Center(
            child: Text(
              'XYLOPHONE',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildKey(color: Colors.red, soundNumber: 1),
              _buildKey(color: Colors.orange, soundNumber: 2),
              _buildKey(color: Colors.yellow, soundNumber: 3),
              _buildKey(color: Colors.green, soundNumber: 4),
              _buildKey(color: Colors.blue, soundNumber: 5),
              _buildKey(color: Colors.indigo, soundNumber: 6),
              _buildKey(color: Colors.purple, soundNumber: 7),
            ],
          ),
        ),
      ),
    );
  }
}