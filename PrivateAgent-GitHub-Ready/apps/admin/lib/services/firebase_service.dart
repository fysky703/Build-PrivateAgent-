import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

/// Firebase wiring is intentionally isolated here.
/// Before production use, register the Android Admin app in Firebase and
/// replace the placeholder FirebaseOptions with the generated Android values.
class FirebaseService {
  static Future<void> initialize() async {
    if (Firebase.apps.isNotEmpty) return;
    // Add generated DefaultFirebaseOptions.currentPlatform here after
    // running FlutterFire CLI for the Admin Android application.
    throw StateError('FirebaseOptions are not configured yet.');
  }

  static DatabaseReference agentsRef() => FirebaseDatabase.instance.ref('agents');

  static DatabaseReference commandRef(String agentId) =>
      FirebaseDatabase.instance.ref('commands/$agentId');

  static Future<void> sendCommand({
    required String agentId,
    required String type,
    bool? enabled,
    int? durationMinutes,
    String? value,
    String? message,
  }) async {
    final ref = commandRef(agentId).push();
    await ref.set({
      'type': type,
      'enabled': enabled,
      'durationMinutes': durationMinutes,
      'value': value,
      'message': message,
      'createdAt': ServerValue.timestamp,
      'status': 'pending',
    });
  }
}
