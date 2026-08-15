import 'package:flutter/material.dart';

class ControlCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color accent;
  final bool? value;
  final ValueChanged<bool>? onChanged;
  final VoidCallback? onTap;
  final Widget? trailing;

  const ControlCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.accent,
    this.value,
    this.onChanged,
    this.onTap,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    final body = Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF0D1C40),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: accent.withValues(alpha: .30)),
        boxShadow: [
          BoxShadow(color: accent.withValues(alpha: .08), blurRadius: 20),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: accent.withValues(alpha: .15),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: accent.withValues(alpha: .30)),
            ),
            child: Icon(icon, color: accent),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w700)),
                const SizedBox(height: 4),
                Text(subtitle, style: TextStyle(color: Colors.white.withValues(alpha: .55), fontSize: 12)),
              ],
            ),
          ),
          if (trailing != null) trailing!
          else if (value != null)
            Switch(value: value!, onChanged: onChanged),
        ],
      ),
    );
    return onTap == null ? body : InkWell(onTap: onTap, borderRadius: BorderRadius.circular(22), child: body);
  }
}
