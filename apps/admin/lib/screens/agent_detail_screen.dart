import 'package:flutter/material.dart';
import '../models/agent.dart';

class AgentDetailScreen extends StatelessWidget {
  final Agent agent;
  const AgentDetailScreen({super.key, required this.agent});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(agent.name)),
      body: ListView(padding: const EdgeInsets.all(16), children: [
        Container(padding: const EdgeInsets.all(18), decoration: BoxDecoration(color: const Color(0xFF0D1C40), borderRadius: BorderRadius.circular(24), border: Border.all(color: Colors.redAccent.withValues(alpha: .28))), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [const CircleAvatar(radius: 27, child: Icon(Icons.phone_android)), const SizedBox(width: 12), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(agent.model, style: const TextStyle(fontSize: 19, fontWeight: FontWeight.w900)), Text(agent.android, style: const TextStyle(color: Colors.white54))])), Text(agent.online ? 'ONLINE' : 'OFFLINE', style: TextStyle(color: agent.online ? Colors.greenAccent : Colors.white38, fontWeight: FontWeight.bold))]),
          const SizedBox(height: 18),
          _info('Battery', '${agent.battery}%'),
          _info('Network', agent.network),
          _info('IP', agent.ip),
          _info('Location', agent.location),
        ])),
        const SizedBox(height: 16),
        const Text('LIVE ACCESS', style: TextStyle(fontWeight: FontWeight.w900, letterSpacing: 1.4, color: Colors.white70)),
        const SizedBox(height: 10),
        _action(Icons.screen_share_outlined, 'Screen', 'Start authorized screen sharing', Colors.cyanAccent),
        _action(Icons.videocam_outlined, 'Camera', 'Start visible camera session', Colors.redAccent),
        _action(Icons.location_on_outlined, 'Location', 'View current location with permission', Colors.greenAccent),
        _action(Icons.phone_outlined, 'Phone', 'Open authorized call workflow', Colors.orangeAccent),
      ]),
    );
  }

  Widget _info(String a, String b) => Padding(padding: const EdgeInsets.only(top: 9), child: Row(children: [Text(a, style: const TextStyle(color: Colors.white54)), const Spacer(), Text(b, style: const TextStyle(fontWeight: FontWeight.w700))]));

  Widget _action(IconData icon, String title, String subtitle, Color color) => Container(margin: const EdgeInsets.only(bottom: 10), padding: const EdgeInsets.all(15), decoration: BoxDecoration(color: const Color(0xFF0D1C40), borderRadius: BorderRadius.circular(19), border: Border.all(color: color.withValues(alpha: .25))), child: Row(children: [Icon(icon, color: color, size: 30), const SizedBox(width: 14), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, style: const TextStyle(fontWeight: FontWeight.w800)), const SizedBox(height: 3), Text(subtitle, style: const TextStyle(fontSize: 11, color: Colors.white54))])), const Icon(Icons.chevron_right, color: Colors.white38)]));
}
