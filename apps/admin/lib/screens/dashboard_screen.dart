import 'package:flutter/material.dart';
import '../models/agent.dart';
import '../widgets/control_card.dart';
import 'agent_detail_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});
  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final agents = const [
    Agent(id: 'agent_001', name: 'Agent 001', model: 'TECNO KI7', android: 'Android 13', online: true, battery: 82, network: 'Wi-Fi', ip: '192.168.1.25', location: 'Permission enabled'),
    Agent(id: 'agent_002', name: 'Agent 002', model: 'Samsung A54', android: 'Android 14', online: false, battery: 41, network: 'Offline', ip: '—', location: 'Permission disabled'),
  ];

  Agent get selected => agents.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PRIVATE AGENT', style: TextStyle(fontWeight: FontWeight.w900, letterSpacing: 1.5)),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications_none_rounded)),
          const Padding(padding: EdgeInsets.only(right: 14), child: CircleAvatar(child: Icon(Icons.person_outline))),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 28),
        children: [
          _hero(),
          const SizedBox(height: 16),
          _sectionTitle('AGENTS'),
          const SizedBox(height: 10),
          SizedBox(
            height: 112,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: agents.length,
              separatorBuilder: (_, __) => const SizedBox(width: 10),
              itemBuilder: (_, i) => _agentChip(agents[i]),
            ),
          ),
          const SizedBox(height: 20),
          _sectionTitle('CONTROL'),
          const SizedBox(height: 10),
          ControlCard(icon: Icons.flashlight_on_rounded, title: 'Flashlight', subtitle: 'Agent device flashlight', accent: Colors.amber, value: false, onChanged: (_) {}),
          const SizedBox(height: 10),
          ControlCard(icon: Icons.play_circle_outline_rounded, title: 'Play Video', subtitle: 'MP4 / YouTube URL • visible playback', accent: Colors.redAccent, onTap: () {}),
          const SizedBox(height: 10),
          ControlCard(icon: Icons.wallpaper_rounded, title: 'Set Wallpaper', subtitle: 'Upload an image to the selected Agent', accent: Colors.cyanAccent, onTap: () {}),
          const SizedBox(height: 10),
          ControlCard(icon: Icons.lock_outline_rounded, title: 'Lock Device', subtitle: 'Duration + visible lock screen', accent: Colors.orangeAccent, value: false, onChanged: (_) {}),
          const SizedBox(height: 10),
          ControlCard(icon: Icons.warning_amber_rounded, title: 'Lock V2', subtitle: 'Authorized alert mode • visible to Agent', accent: Colors.redAccent, value: false, onChanged: (_) {}),
          const SizedBox(height: 20),
          _sectionTitle('LIVE'),
          const SizedBox(height: 10),
          Row(children: [
            Expanded(child: _liveTile(Icons.phone_android_rounded, 'SCREEN', Colors.cyanAccent, () => _openAgent(selected))),
            const SizedBox(width: 10),
            Expanded(child: _liveTile(Icons.videocam_outlined, 'CAMERA', Colors.redAccent, () {})),
          ]),
          const SizedBox(height: 10),
          Row(children: [
            Expanded(child: _liveTile(Icons.location_on_outlined, 'LOCATION', Colors.greenAccent, () {})),
            const SizedBox(width: 10),
            Expanded(child: _liveTile(Icons.phone_outlined, 'CALL', Colors.orangeAccent, () {})),
          ]),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: 0,
        onDestinationSelected: (_) {},
        destinations: const [
          NavigationDestination(icon: Icon(Icons.dashboard_outlined), selectedIcon: Icon(Icons.dashboard), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.bug_report_outlined), selectedIcon: Icon(Icons.bug_report), label: 'Live'),
          NavigationDestination(icon: Icon(Icons.settings_outlined), selectedIcon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }

  Widget _hero() => Container(
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
      gradient: const LinearGradient(colors: [Color(0xFF12285C), Color(0xFF240F25)]),
      borderRadius: BorderRadius.circular(26),
      border: Border.all(color: Colors.redAccent.withValues(alpha: .35)),
    ),
    child: const Row(children: [
      Icon(Icons.shield_rounded, color: Colors.redAccent, size: 40),
      SizedBox(width: 14),
      Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('CONTROL CENTER', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900)),
        SizedBox(height: 4),
        Text('Authorized Agent management', style: TextStyle(color: Colors.white54)),
      ])),
      Column(children: [Text('8', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900)), Text('ONLINE', style: TextStyle(fontSize: 10, color: Colors.greenAccent))]),
    ]),
  );

  Widget _sectionTitle(String text) => Text(text, style: const TextStyle(fontWeight: FontWeight.w900, letterSpacing: 1.6, color: Colors.white70));

  Widget _agentChip(Agent a) => InkWell(
    onTap: () => _openAgent(a),
    borderRadius: BorderRadius.circular(20),
    child: Container(width: 220, padding: const EdgeInsets.all(14), decoration: BoxDecoration(color: const Color(0xFF0D1C40), borderRadius: BorderRadius.circular(20), border: Border.all(color: a.online ? Colors.greenAccent.withValues(alpha: .35) : Colors.white12)), child: Row(children: [CircleAvatar(backgroundColor: a.online ? Colors.greenAccent.withValues(alpha: .15) : Colors.white10, child: Icon(Icons.phone_android, color: a.online ? Colors.greenAccent : Colors.white38)), const SizedBox(width: 10), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center, children: [Text(a.name, style: const TextStyle(fontWeight: FontWeight.bold)), Text(a.model, style: const TextStyle(fontSize: 11, color: Colors.white54)), const SizedBox(height: 5), Text(a.online ? '● ONLINE' : '○ OFFLINE', style: TextStyle(fontSize: 10, color: a.online ? Colors.greenAccent : Colors.white38))]))])),
  );

  Widget _liveTile(IconData icon, String label, Color color, VoidCallback onTap) => InkWell(onTap: onTap, borderRadius: BorderRadius.circular(20), child: Container(height: 90, decoration: BoxDecoration(color: const Color(0xFF0D1C40), borderRadius: BorderRadius.circular(20), border: Border.all(color: color.withValues(alpha: .28))), child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(icon, color: color, size: 30), const SizedBox(height: 7), Text(label, style: const TextStyle(fontWeight: FontWeight.w800, letterSpacing: 1.1))])));

  void _openAgent(Agent agent) => Navigator.push(context, MaterialPageRoute(builder: (_) => AgentDetailScreen(agent: agent)));
}
