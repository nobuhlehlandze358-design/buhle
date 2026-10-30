import 'package:flutter/material.dart';

void main() {
  runApp(const BuhleApp());
}

class BuhleApp extends StatelessWidget {
  const BuhleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Buhles App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.purple,
        ),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Widget sectionTitle(String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Icon(icon, color: Colors.yellow, size: 26),
          const SizedBox(width: 10),
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget infoCard(Widget child) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: child,
      ),
    );
  }

  Widget skillChip(String skill) {
    return Chip(
      label: Text(skill),
      backgroundColor: Colors.red.shade50,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buhles CV'),
        centerTitle: true,
        backgroundColor: Colors.red,
        foregroundColor: Colors.white60,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Center(
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 55,
                    backgroundColor: Colors.green,
                    child: Icon(
                      Icons.person,
                      size: 65,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Hlandze Nobuhle Temakhulandle',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    'Software Engineering Student',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.red,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'I am a motivated student interested in '
                        'software development, mobile applications, '
                        'and solving problems using technology.',
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),


            sectionTitle('Contact Information', Icons.contact_mail),

            infoCard(
              const Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.email, color: Colors.blue),
                    title: Text('Email'),
                    subtitle: Text('buhle@gmail.com'),
                  ),
                  ListTile(
                    leading: Icon(Icons.phone, color: Colors.blue),
                    title: Text('Phone'),
                    subtitle: Text('76898765'),
                  ),
                  ListTile(
                    leading: Icon(Icons.location_on, color: Colors.blue),
                    title: Text('Location'),
                    subtitle: Text('Eswatini'),
                  ),
                ],
              ),
            ),


            sectionTitle('My Skills', Icons.code),

            Wrap(
              spacing: 14,
              runSpacing:8,
              children: [
                skillChip('Flutter'),
                skillChip('Dart'),
                skillChip('C++'),
                skillChip('HTML'),
                skillChip('CSS'),
                skillChip('JavaScript'),
                skillChip('Teamwork'),

              ],
            ),

            sectionTitle('Education', Icons.school),

            infoCard(
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Bachelor of Science in Information Technology',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text('Limkokwing University of Creative Technology'),
                  Text('Status: Currently studying'),
                ],
              ),
            ),


            sectionTitle('Projects & Experience', Icons.work),

            infoCard(
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Mobile Application Development',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    'Developing Flutter applications and practising '
                        'user interface design, navigation, and '
                        'programming.',
                  ),
                ],
              ),
            ),

            infoCard(
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Patient Appointment System',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    'Academic software project focused on managing '
                        'patient registration and appointment scheduling.',
                  ),
                ],
              ),
            ),


            sectionTitle('Certifications', Icons.workspace_premium),

            infoCard(
              const Text(
                'form 5 certification',
              ),
            ),

            const SizedBox(height: 20),

            Center(
              child: Text(
                'Thank you for viewing my CV!',
                style: TextStyle(
                  color: Colors.pink.shade600,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}