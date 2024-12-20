import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  NotificationsPage({super.key});

  // Sample notifications data
  final List<Map<String, String>> notifications = [
    {
      'type': 'Reminder',
      'title': 'Service Reminder',
      'message': 'Your car servicing is due tomorrow at 10:00 AM.'
    },
    {
      'type': 'Alert',
      'title': 'Urgent Alert',
      'message': 'There is a delay in servicing due to unforeseen circumstances.'
    },
    {
      'type': 'Update',
      'title': 'System Update',
      'message': 'New features have been added to the app! Check out the dashboard.'
    },
    {
      'type': 'Reminder',
      'title': 'Payment Reminder',
      'message': 'Your payment for the last service is due. Please clear it soon.'
    },
    {
      'type': 'Alert',
      'title': 'Offer Alert',
      'message': 'Limited-time offer: Get 20% off on your next service booking!'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notification = notifications[index];
          final notificationType = notification['type']!;
          final color = notificationType == 'Alert'
              ? Colors.red
              : notificationType == 'Reminder'
                  ? Colors.blue
                  : Colors.green;

          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: Icon(
                notificationType == 'Alert'
                    ? Icons.warning
                    : notificationType == 'Reminder'
                        ? Icons.notifications
                        : Icons.update,
                color: color,
                size: 40,
              ),
              title: Text(
                notification['title']!,
                style: TextStyle(fontWeight: FontWeight.bold, color: color),
              ),
              subtitle: Text(notification['message']!),
              trailing: Icon(
                Icons.chevron_right,
                color: Colors.grey[600],
              ),
              onTap: () {
                // Handle notification tap if needed
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Tapped on: ${notification['title']}')),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
