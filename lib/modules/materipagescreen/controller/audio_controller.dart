import 'package:get/get.dart';
import 'package:audioplayers/audioplayers.dart';

class AudioController extends GetxController {
  // List of audio assets corresponding to each card
  final List<String> audioAssets = [
    'materi_satu_card1.mp3',
    'materi_satu_card2.mp3',
    'materi_satu_card3.mp3',
    'materi_satu_card4.mp3',
    'materi_satu_card5.mp3',
    'materi_dua_card1.mp3',
    'materi_dua_card2.mp3',
    'materi_dua_card3.mp3',
    'materi_dua_card4.mp3',
    'materi_dua_card5.mp3',
    'materi_tiga_card1.mp3',
    'materi_tiga_card2.mp3',
    'materi_tiga_card3.mp3',
    'materi_tiga_card4.mp3',
    'materi_tiga_card5.mp3',
  ];
  
  // One AudioPlayer instance for each card
  late List<AudioPlayer> audioPlayers;
  
  // Observable list to track playing state of each audio
  final RxList<bool> isPlaying = List.generate(15, (_) => false).obs; // Expanded to 15 entries
  
  @override
  void onInit() {
    super.onInit();
    // Initialize audio players
    audioPlayers = List.generate(15, (_) => AudioPlayer()); // Expanded to 15 players
    
    // Set up listeners for each player to update state when audio completes
    for (int i = 0; i < audioPlayers.length; i++) {
      final index = i; // Capture the index value
      audioPlayers[i].onPlayerComplete.listen((_) {
        isPlaying[index] = false;
        update();
      });
    }
  }
  
  @override
  void onClose() {
    // Properly dispose of all audio players
    for (var player in audioPlayers) {
      player.dispose();
    }
    super.onClose();
  }
  
  // Toggle audio play/pause for a specific card
  Future<void> toggleAudio(int index) async {
    try {
      if (isPlaying[index]) {
        // If currently playing, pause it
        await audioPlayers[index].pause();
        isPlaying[index] = false;
      } else {
        // Pause any other playing audio first
        for (int i = 0; i < audioPlayers.length; i++) {
          if (isPlaying[i]) {
            await audioPlayers[i].pause();
            isPlaying[i] = false;
          }
        }
        
        // Get the correct folder based on the index
        String folder;
        if (index < 5) {
          folder = 'pembelajaran_satu';
        } else if (index  < 10 && index >= 5) {
          folder = 'pembelajaran_dua';
        } else {
          folder = 'pembelajaran_tiga';
        }
        
        // Play the selected audio
        await audioPlayers[index].play(AssetSource('audio/$folder/${audioAssets[index]}'));
        isPlaying[index] = true;
      }
      update(); // Notify GetX listeners to rebuild
    } catch (e) {
      print('Error playing audio: $e');
    }
  }
}