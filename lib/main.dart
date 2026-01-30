import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
      ),
      home: const MyCVPage(title: ''),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyCVPage extends StatefulWidget {
  const MyCVPage({super.key, required this.title});

  final String title;

  @override
  State<MyCVPage> createState() => _MyCVPageState();
}

class _MyCVPageState extends State<MyCVPage> {
  bool isMobileLayout(BuildContext context) {
    return MediaQuery.of(context).size.width < 600;
  }

  Widget _infoRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: isMobileLayout(context) ? 16 : 18,
            color: Colors.teal,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: isMobileLayout(context) ? 14 : 16),
            ),
          ),
        ],
      ),
    );
  }

  Widget _timelineItem(
    BuildContext context, {
    required IconData icon,
    required String year,
    required String title,
    required String subtitle,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Icon + vertical line
        Column(
          children: [
            SizedBox(height: 5),
            Icon(
              icon,
              color: Colors.teal,
              size: isMobileLayout(context) ? 20 : 24,
            ),
            Container(width: 2, height: 70, color: Colors.teal),
          ],
        ),
        const SizedBox(width: 12),
        // Card with info
        Expanded(
          child: Card(
            color: Colors.teal[50],
            elevation: 2,
            margin: const EdgeInsets.symmetric(vertical: 6),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
              side: const BorderSide(color: Colors.black12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    year,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: isMobileLayout(context) ? 14 : 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: isMobileLayout(context) ? 14 : 18,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: isMobileLayout(context) ? 14 : 16,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: isMobileLayout(context) ? 10 : 24,
                  vertical: isMobileLayout(context) ? 10 : 32,
                ),
                decoration: BoxDecoration(
                  color: Colors.teal.shade50,
                  border: Border.all(color: Colors.black),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Profile Image
                    Container(
                      width: isMobileLayout(context) ? 120 : 150,
                      height: isMobileLayout(context) ? 120 : 150,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.black),
                        image: const DecorationImage(
                          image: AssetImage('assets/images/e20221595.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Name
                    Text(
                      'KHUN BUNHAP',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: isMobileLayout(context) ? 20 : 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 6),

                    // Title
                    Text(
                      '4th Year Telecommunications & Networks Engineering',
                      style: TextStyle(
                        fontSize: isMobileLayout(context) ? 14 : 16,
                        color: Colors.grey[700],
                      ),
                    ),

                    const SizedBox(height: 6),

                    Text(
                      'Institute of Technology of Cambodia',
                      style: TextStyle(
                        fontSize: isMobileLayout(context) ? 14 : 16,
                        color: Colors.grey[700],
                      ),
                    ),

                    const SizedBox(height: 20),
                    const Divider(thickness: 1),

                    // Contact Section
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        children: [
                          Text(
                            'CONTACT',

                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: isMobileLayout(context) ? 14 : 16,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 10),

                    _infoRow(Icons.email, 'khunbunhap@gmail.com'),
                    _infoRow(Icons.phone, '+855 89 996 989'),
                    _infoRow(
                      Icons.location_on,
                      'St 369, Preak Pra, Phnom Penh, Cambodia',
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () async {
                            final Uri telegramUrl = Uri.parse(
                              'https://github.com/KHUN-Bunhap',
                            );
                            if (!await launchUrl(
                              telegramUrl,
                              mode: LaunchMode
                                  .platformDefault, // Automatically works on web & mobile
                            )) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Could not open GitHub'),
                                ),
                              );
                            }
                          },
                          icon: Icon(Icons.code, color: Colors.black),
                        ),
                        IconButton(
                          onPressed: () async {
                            final Uri telegramUrl = Uri.parse(
                              'https://t.me/Khunbunhap',
                            );
                            if (!await launchUrl(
                              telegramUrl,
                              mode: LaunchMode
                                  .platformDefault, // Automatically works on web & mobile
                            )) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Could not open Telegram'),
                                ),
                              );
                            }
                          },
                          icon: Icon(Icons.telegram, color: Colors.blue[800]),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),
                    const Divider(thickness: 1),

                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'INFO',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: isMobileLayout(context) ? 14 : 16,
                        ),
                      ),
                    ),

                    const SizedBox(height: 10),

                    _infoRow(Icons.cake, 'Age: 22'),
                    _infoRow(Icons.school, 'Fourth Year'),
                    _infoRow(
                      Icons.engineering,
                      'Telecommunications & Networks',
                    ),
                  ],
                ),
              ),
            ),
          ),

          Expanded(
            flex: 3,
            child: DefaultTabController(
              length: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        right: BorderSide(color: Colors.black),
                        bottom: BorderSide(color: Colors.black),
                        top: BorderSide(color: Colors.black),
                      ),
                      color: Colors.teal[100],
                    ),
                    child: TabBar(
                      labelStyle: TextStyle(
                        fontSize: isMobileLayout(context) ? 14 : 16,
                      ),
                      tabs: [
                        Tab(
                          text: isMobileLayout(context) ? 'About' : 'About Me',
                        ),
                        Tab(
                          text: isMobileLayout(context) ? 'Edu' : 'Education',
                        ),
                        Tab(text: isMobileLayout(context) ? 'Skill' : 'Skills'),
                        Tab(
                          text: isMobileLayout(context) ? 'Exp' : 'Experience',
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        // About Me Tab
                        SingleChildScrollView(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '''
I am a fourth-year student at the Institute of Technology of Cambodia (ITC), major in Telecommunications and Networks Engineering (GTR). I have a strong interests in learning about technology innovations and I am eager to put my knowledge into the real-world scenarios.

Throughout my studies, I have gained hands-on experience with microcontrollers (Arduino), basic IoT systems (ESP32), and software development (Flutter). I particularly enjoy working on software-related projects, as they allow me to be creative and solve problems effectively.

I am enthusiastic about learning new things and taking on challenges that will help me to grow both personally and professionally.	
''',
                                style: TextStyle(
                                  fontSize: isMobileLayout(context) ? 14 : 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Education Tab
                        SingleChildScrollView(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  _timelineItem(
                                    context,
                                    icon: Icons.home_work,
                                    year: '2010 - 2019',
                                    title: 'HUN SEN PREAK PRA Secondary School',
                                    subtitle:
                                        'Primary School and Middle School',
                                  ),
                                  _timelineItem(
                                    context,
                                    icon: Icons.cast_for_education,
                                    year: '2020 - 2022',
                                    title: 'The Westline School',
                                    subtitle:
                                        'High School and Completed Baccalaureate Exam',
                                  ),
                                  _timelineItem(
                                    context,
                                    icon: Icons.school,
                                    year: '2022 - Present',
                                    title:
                                        'Institute of Technology of Cambodia',
                                    subtitle:
                                        'Telecommunications & Networks Engineering',
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        // Skill Tab
                        SingleChildScrollView(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Soft Skills',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Wrap(
                                spacing: 8,
                                runSpacing: 8,
                                children: [
                                  Chip(
                                    label: Text(
                                      'Flutter & Dart',
                                      style: TextStyle(
                                        fontSize: isMobileLayout(context)
                                            ? 14
                                            : 16,
                                      ),
                                    ),
                                    backgroundColor: Colors.teal[100],
                                  ),
                                  Chip(
                                    label: Text(
                                      'C/C++, Python, Java',
                                      style: TextStyle(
                                        fontSize: isMobileLayout(context)
                                            ? 14
                                            : 16,
                                      ),
                                    ),
                                    backgroundColor: Colors.teal[100],
                                  ),
                                  Chip(
                                    label: Text(
                                      'Time Management',
                                      style: TextStyle(
                                        fontSize: isMobileLayout(context)
                                            ? 14
                                            : 16,
                                      ),
                                    ),
                                    backgroundColor: Colors.teal[100],
                                  ),
                                  Chip(
                                    label: Text(
                                      'Problem Solving',
                                      style: TextStyle(
                                        fontSize: isMobileLayout(context)
                                            ? 14
                                            : 16,
                                      ),
                                    ),
                                    backgroundColor: Colors.teal[100],
                                  ),
                                  Chip(
                                    label: Text(
                                      'Analytical Thinking',
                                      style: TextStyle(
                                        fontSize: isMobileLayout(context)
                                            ? 14
                                            : 16,
                                      ),
                                    ),
                                    backgroundColor: Colors.teal[100],
                                  ),
                                  Chip(
                                    label: Text(
                                      'Data Structures',
                                      style: TextStyle(
                                        fontSize: isMobileLayout(context)
                                            ? 14
                                            : 16,
                                      ),
                                    ),
                                    backgroundColor: Colors.teal[100],
                                  ),
                                  Chip(
                                    label: Text(
                                      'MS Word',
                                      style: TextStyle(
                                        fontSize: isMobileLayout(context)
                                            ? 14
                                            : 16,
                                      ),
                                    ),
                                    backgroundColor: Colors.teal[100],
                                  ),
                                  Chip(
                                    label: Text(
                                      'MS Excel',
                                      style: TextStyle(
                                        fontSize: isMobileLayout(context)
                                            ? 14
                                            : 16,
                                      ),
                                    ),
                                    backgroundColor: Colors.teal[100],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),

                              Text(
                                'Hard Skills',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Wrap(
                                spacing: 8,
                                runSpacing: 8,
                                children: [
                                  Chip(
                                    label: Text(
                                      'Networking Fundamentals',
                                      style: TextStyle(
                                        fontSize: isMobileLayout(context)
                                            ? 14
                                            : 16,
                                      ),
                                    ),
                                    backgroundColor: Colors.teal[100],
                                  ),
                                  Chip(
                                    label: Text(
                                      'Network Components',
                                      style: TextStyle(
                                        fontSize: isMobileLayout(context)
                                            ? 14
                                            : 16,
                                      ),
                                    ),
                                    backgroundColor: Colors.teal[100],
                                  ),
                                  Chip(
                                    label: Text(
                                      'Protocols & Standards',
                                      style: TextStyle(
                                        fontSize: isMobileLayout(context)
                                            ? 14
                                            : 16,
                                      ),
                                    ),
                                    backgroundColor: Colors.teal[100],
                                  ),
                                  Chip(
                                    label: Text(
                                      'Microcontrollers',
                                      style: TextStyle(
                                        fontSize: isMobileLayout(context)
                                            ? 14
                                            : 16,
                                      ),
                                    ),
                                    backgroundColor: Colors.teal[100],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        // Experience Tab
                        SingleChildScrollView(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Projects & Experience',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 16),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Icon + Project Name Row
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.sensors,
                                        color: Colors.teal,
                                        size: isMobileLayout(context) ? 24 : 28,
                                      ),
                                      const SizedBox(width: 12),
                                      Expanded(
                                        child: Text(
                                          'IoT Project Innovation | ITC',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: isMobileLayout(context)
                                                ? 16
                                                : 18,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 8),

                                  // Card with project details
                                  Card(
                                    color: Colors.teal[50],
                                    elevation: 2,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      side: const BorderSide(
                                        color: Colors.black12,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          // Each detail as a row with icon bullet
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Icon(
                                                Icons.check_circle_outline,
                                                size: 16,
                                                color: Colors.teal,
                                              ),
                                              SizedBox(width: 8),
                                              Expanded(
                                                child: Text(
                                                  'Actively participating in a lab innovation project creating a sensor prototype that sends data to the cloud and can be controlled remotely.',
                                                  style: TextStyle(
                                                    fontSize:
                                                        isMobileLayout(context)
                                                        ? 14
                                                        : 18,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 6),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Icon(
                                                Icons.check_circle_outline,
                                                size: 16,
                                                color: Colors.teal,
                                              ),
                                              SizedBox(width: 8),
                                              Expanded(
                                                child: Text(
                                                  'Learning about cloud protocols (HTTP, MQTT) and wireless sensor networks.',
                                                  style: TextStyle(
                                                    fontSize:
                                                        isMobileLayout(context)
                                                        ? 14
                                                        : 18,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 6),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Icon(
                                                Icons.check_circle_outline,
                                                size: 16,
                                                color: Colors.teal,
                                              ),
                                              SizedBox(width: 8),
                                              Expanded(
                                                child: Text(
                                                  'Hands-on experience with sensor integration, cloud connectivity, and remote device control.',
                                                  style: TextStyle(
                                                    fontSize:
                                                        isMobileLayout(context)
                                                        ? 14
                                                        : 18,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),

                                  const SizedBox(height: 20),

                                  Row(
                                    children: [
                                      Icon(
                                        Icons.phone_android,
                                        color: Colors.teal,
                                        size: isMobileLayout(context) ? 24 : 28,
                                      ),
                                      const SizedBox(width: 12),
                                      Expanded(
                                        child: Text(
                                          'GTR App Development | Internship',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: isMobileLayout(context)
                                                ? 16
                                                : 18,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 8),

                                  Card(
                                    color: Colors.teal[50],
                                    elevation: 2,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      side: const BorderSide(
                                        color: Colors.black12,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          // Each detail as a row with icon bullet
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Icon(
                                                Icons.check_circle_outline,
                                                size: 16,
                                                color: Colors.teal,
                                              ),
                                              SizedBox(width: 8),
                                              Expanded(
                                                child: Text(
                                                  'Created the first testing version of GTR mobile app to help students access their academic information easily.',
                                                  style: TextStyle(
                                                    fontSize:
                                                        isMobileLayout(context)
                                                        ? 14
                                                        : 18,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 6),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Icon(
                                                Icons.check_circle_outline,
                                                size: 16,
                                                color: Colors.teal,
                                              ),
                                              SizedBox(width: 8),
                                              Expanded(
                                                child: Text(
                                                  'Using Flutter framework to build a cross-platform mobile application for both Android and iOS devices.',
                                                  style: TextStyle(
                                                    fontSize:
                                                        isMobileLayout(context)
                                                        ? 14
                                                        : 18,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 6),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Icon(
                                                Icons.check_circle_outline,
                                                size: 16,
                                                color: Colors.teal,
                                              ),
                                              SizedBox(width: 8),
                                              Expanded(
                                                child: Text(
                                                  'Using Firebase as the backend service to handle user authentication and data storage securely.',
                                                  style: TextStyle(
                                                    fontSize:
                                                        isMobileLayout(context)
                                                        ? 14
                                                        : 18,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 6),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
