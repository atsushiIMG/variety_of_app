import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:soundpool/soundpool.dart';

final soundsProvider = ChangeNotifierProvider((ref) => SoundsModel());

class SoundsModel extends ChangeNotifier {
  Soundpool _soundpool = Soundpool.fromOptions();
  int? _alarmSoundStreamId;
  late Future<int> _soundId;
  String display = "";

  SoundsModel() {
    loadSounds();
  }

  Future<int> _loadSound() async {
    var asset = await rootBundle.load("assets/sounds/sound_popyyy.mp3");
    return await _soundpool.load(asset);
  }

  Future<void> playSoundInfinity() async {
    var _alarmSound = await _soundId;
    _alarmSoundStreamId = await _soundpool.play(_alarmSound, repeat: -1);
    display = "音が鳴っている！";
    notifyListeners();
  }

  Future<void> stopSound() async {
    if (_alarmSoundStreamId != null) {
      await _soundpool.stop(_alarmSoundStreamId!);
      display = "";
    }
    notifyListeners();
  }

  void loadSounds() {
    _soundId = _loadSound();
  }
}
