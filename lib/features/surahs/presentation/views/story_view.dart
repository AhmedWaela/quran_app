import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:share_plus/share_plus.dart';

import '../../data/models/surah_model/ayah.dart';

class StoryView extends StatefulWidget {
  const StoryView({super.key, required this.ayah});
  final Ayah ayah;

  @override
  State<StoryView> createState() => _StoryViewState();
}

class _StoryViewState extends State<StoryView> {
  double _progress = 0.0;
  Ticker? _ticker;

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) => _startProgress());
  }

  void _startProgress() {
    _ticker = Ticker((elapsed) {
      if (mounted) {
        setState(() {
          _progress = elapsed.inMilliseconds / 5000; // 5 ثواني
        });
        if (_progress >= 1.0) {
          _closeStory();
        }
      }
    });
    _ticker?.start();
  }

  void _closeStory() {
    if (mounted && Navigator.canPop(context)) {
      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    _ticker?.stop();
    _ticker?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: LinearProgressIndicator(
                value: _progress,
                backgroundColor: Colors.white30,
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Align(
                alignment: AlignmentDirectional.topEnd,
                child: Container(
                  height: 24,
                  width: 24,
                  decoration: BoxDecoration(
                    border: Border.all(width: 0.5, color: Colors.white),
                    shape: BoxShape.circle,
                    color: Colors.black.withOpacity(0.5),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Center(
                      child: Icon(
                        Icons.close,
                        size: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    widget.ayah.text ?? "",
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                  onPressed: () async {
                    await Share.share(widget.ayah.text ?? "");
                  },
                  icon: Icon(Icons.send)),
            )
          ],
        ),
      ),
    );
  }
}
