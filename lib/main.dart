import 'package:flutter/material.dart';

void main() {
  runApp(const MyCVApp());
}

class MyCVApp extends StatelessWidget {
  const MyCVApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Buhle App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurpleAccent,
        ),
        useMaterial3: true,
      ),
      home: const CVHomePage(),
    );
  }
}

class CVHomePage extends StatefulWidget {
  const CVHomePage({super.key});

  @override
  State<CVHomePage> createState() => _CVHomePageState();
}

class _CVHomePageState extends State<CVHomePage> {
  int selectedIndex = 0;

  final List<Widget> pages = const [
    HomePage(),
    InformationPage(),
    EducationSkillsPage(),
    ExperiencePage(),
  ];

  final List<String> pageTitles = [
    'Buhles CV',
    'Information',
    'Education & Skills',
    'Experience',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pageTitles[selectedIndex]),
        centerTitle: true,
        backgroundColor: Colors.purple,
        foregroundColor: Colors.lightGreenAccent,
      ),

      body: IndexedStack(
        index: selectedIndex,
        children: pages,
      ),

      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (int index) {
          setState(() {
            selectedIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Information',
          ),
          NavigationDestination(
            icon: Icon(Icons.school_outlined),
            selectedIcon: Icon(Icons.school),
            label: 'Education',
          ),
          NavigationDestination(
            icon: Icon(Icons.work_outline),
            selectedIcon: Icon(Icons.work),
            label: 'Experience',
          ),
        ],
      ),
    );
  }
}


Widget sectionTitle(String title, IconData icon) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 12),
    child: Row(
      children: [
        Icon(icon, color: Colors.deepPurple, size: 26),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
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
      padding: const EdgeInsets.all(12),
      child: child,
    ),
  );
}
Widget professionalLink({
  required BuildContext context,
  required IconData icon,
  required String title,
  required String subtitle,
  required String url,
}) {
  return Card(
    margin: const EdgeInsets.only(bottom: 10),
    child: ListTile(
      leading: Icon(
        icon,
        color: Colors.green,
        size: 30,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(subtitle),
      trailing: const Icon(Icons.open_in_new),

    ),
  );
}

class LaunchMode {
}
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child:SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const SizedBox(height: 30),

          const CircleAvatar(
            radius: 65,
            backgroundColor: Colors.yellowAccent,
            backgroundImage: AssetImage('images/tema.jpg'),
            ),


          const SizedBox(height: 20),

          const Text(
            'Hlandze Nobuhle Temakhulandle',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 27,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),

          const Text(
            'Information Technology Student',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 17,
              color: Colors.deepPurple,
            ),
          ),

          const SizedBox(height: 20),

          infoCard(
            const Column(
              children: [
                Icon(
                  Icons.waving_hand,
                  size: 40,
                  color: Colors.deepPurple,
                ),
                SizedBox(height: 12),
                Text(
                  'About Me',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'I am a motivated Information Technology '
                      'student interested in software development, '
                      'mobile applications, and solving problems '
                      'using technology.',
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          const Text(
            'Welcome to my digital CV!',
            style: TextStyle(
              fontSize: 16,
              fontStyle: FontStyle.italic,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    )
    );
  }
}

class InformationPage extends StatelessWidget {
  const InformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          sectionTitle(
            'Personal Information',
            Icons.person,
          ),

          infoCard(
            const Column(
              children: [
                ListTile(
                  leading: Icon(
                    Icons.badge,
                    color: Colors.green,
                  ),
                  title: Text('Full Name'),
                  subtitle: Text('Hlandze Nobuhle Temakhulandle'),
                ),
                Divider(),
                ListTile(
                  leading: Icon(
                    Icons.location_on,
                    color: Colors.green,
                  ),
                  title: Text('Location'),
                  subtitle: Text('Eswatini'),
                ),
                Divider(),
                ListTile(
                  leading: Icon(
                    Icons.school,
                    color: Colors.green,
                  ),
                  title: Text('Occupation'),
                  subtitle: Text('Information Technology Student'),
                ),
              ],
            ),
          ),

          sectionTitle(
            'Contact Details',
            Icons.contact_mail,
          ),

          infoCard(
            const Column(
              children: [
                ListTile(
                  leading: Icon(
                    Icons.email,
                    color: Colors.green,
                  ),
                  title: Text('Email Address'),
                  subtitle: Text('buhle@gmail.com'),
                ),
                Divider(),
                ListTile(
                  leading: Icon(
                    Icons.phone,
                    color: Colors.green,
                  ),
                  title: Text('Phone Number'),
                  subtitle: Text('79345434'),
                ),
              ],
            ),
          ),

          sectionTitle(
            'Professional Links',
            Icons.link,
          ),

          professionalLink(
            context: context,
            icon: Icons.work,
            title: 'LinkedIn',
            subtitle: 'View my LinkedIn profile',
            url: 'https://www.linkedin.com/',
          ),

          professionalLink(
            context: context,
            icon: Icons.code,
            title: 'GitHub',
            subtitle: 'View my coding projects',
            url: 'https://github.com/',
          ),

          professionalLink(
            context: context,
            icon: Icons.language,
            title: 'Personal Portfolio',
            subtitle: 'View my portfolio website',
            url: 'https://example.com/',
          ),
          sectionTitle(
            'Career Objective',
            Icons.flag,
          ),

          infoCard(
            const Text(
              'To develop my knowledge and practical skills '
                  'in Information Technology, gain experience in '
                  'software development, and contribute to '
                  'technology-based solutions.',
              style: TextStyle(fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }
}


class EducationSkillsPage extends StatelessWidget {
  const EducationSkillsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final skills = [
      'Flutter',
      'C++',
      'HTML',
      'CSS',
      'JavaScript',
      'Problem Solving',
    ];

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          sectionTitle(
            'Education',
            Icons.school,
          ),

          infoCard(
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.account_balance,
                  size: 35,
                  color: Colors.green,
                ),
                SizedBox(height: 12),
                Text(
                  'Bachelor of Science in Information Technology',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Limkokwing University of Creative Technology',
                ),
                SizedBox(height: 8),
                Text(
                  'Status: Currently studying',
                  style: TextStyle(color: Colors.green),
                ),
              ],
            ),
          ),

          sectionTitle(
            'Technical and Personal Skills',
            Icons.code,
          ),

          infoCard(
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: skills.map((skill) {
                return Chip(
                  avatar: const Icon(
                    Icons.check_circle,
                    size: 18,
                    color: Colors.green,
                  ),
                  label: Text(skill),
                  backgroundColor: Colors.yellow.shade50,
                );
              }).toList(),
            ),
          ),

          sectionTitle(
            'Strengths',
            Icons.star,
          ),

          infoCard(
            const Column(
              children: [
                ListTile(
                  leading: Icon(
                    Icons.check_circle,
                    color: Colors.green,
                  ),
                  title: Text('Willingness to learn'),
                ),
                ListTile(
                  leading: Icon(
                    Icons.check_circle,
                    color: Colors.green,
                  ),
                  title: Text('Teamwork and collaboration'),
                ),
                ListTile(
                  leading: Icon(
                    Icons.check_circle,
                    color: Colors.green,
                  ),
                  title: Text('Problem-solving skills'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ExperiencePage extends StatelessWidget {
  const ExperiencePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          sectionTitle(
            'Projects and Experience',
            Icons.work,
          ),

          infoCard(
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.phone_android,
                  color: Colors.green,
                  size: 35,
                ),
                SizedBox(height: 12),
                Text(
                  'Mobile Application Development',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Developing Flutter applications and practising '
                      'user interface design, navigation, and '
                      'Dart programming.',
                ),
              ],
            ),
          ),

          infoCard(
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.local_hospital,
                  color: Colors.green,
                  size: 35,
                ),
                SizedBox(height: 12),
                Text(
                  'Patient Appointment System',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'An academic software project focused on '
                      'patient registration, appointment booking, '
                      'and appointment scheduling.',
                ),
              ],
            ),
          ),

          infoCard(
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.folder,
                  color: Colors.green,
                  size: 35,
                ),
                SizedBox(height: 12),
                Text(
                  'File Manager Project',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Learning to develop a graphical application '
                      'for browsing directories and managing files '
                      'and folders.',
                ),
              ],
            ),
          ),

          sectionTitle(
            'Certifications',
            Icons.workspace_premium,
          ),

          infoCard(
            const Text(
              'Add your completed certificates and professional '
                  'training here. Only include qualifications '
                  'you have actually earned.',
            ),
          ),

          const SizedBox(height: 20),

          const Center(
            child: Text(
              'Thank you for viewing my CV!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}