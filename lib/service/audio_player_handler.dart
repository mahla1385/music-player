import 'package:audio_service/audio_service.dart';
import 'package:music/service/audio_state.dart';

abstract class AudioPlayerHandler implements AudioHandler {
  Stream<QueueState> get queueState;
  Future<void> moveQueueItem(int currentIndex, int newIndex);
}



