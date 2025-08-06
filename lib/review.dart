import 'package:flutter/material.dart';

class ReviewTab extends StatelessWidget {
  const ReviewTab({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> jobList = [
  {
    "logo": "assets/Slack_logo.png",
    "title": "UI/UX",
    "company": "Slack",
    "salary": "\$800.0 /month",
    "date": "02 May 1995"
  },
  {
    "logo": "assets/LinkedIn-logo.png",
    "title": "Frontend",
    "company": "Linkedin",
    "salary": "\$900.0 /month",
    "date": "02 May 1995"
  },
  {
    "logo": "assets/Slack_logo.png",
    "title": "Backend",
    "company": "Slack",
    "salary": "\$800.0 /month",
    "date": "02 May 1995"
  },
  {
    "logo": "assets/GitHub-logo.png",
    "title": "Android",
    "company": "Github",
    "salary": "\$900.0 /month",
    "date": "02 May 1995"
  },
];

        return ListView.builder(
      itemCount: jobList.length,
      itemBuilder: (context, index) {
        final job = jobList[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                job['logo'],
                width: 40,
                height: 40,
              ),
              const SizedBox(width: 12),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      job['title'],
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Text(
                      job['company'],
                      style: const TextStyle(color: Colors.grey),
                    ),
                    Text(
                      "Salary ${job['salary']}",
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),

              // Date
              Text(
                job['date'],
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          ),
        );
      },
    );

  }
}
