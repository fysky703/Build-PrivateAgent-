class Agent {
  final String id;
  final String name;
  final String model;
  final String android;
  final bool online;
  final int battery;
  final String network;
  final String ip;
  final String location;

  const Agent({
    required this.id,
    required this.name,
    required this.model,
    required this.android,
    required this.online,
    required this.battery,
    required this.network,
    required this.ip,
    required this.location,
  });
}
