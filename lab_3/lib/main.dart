import 'package:flutter/material.dart';
import 'dart:math'; // Для математичних констант (pi) у вкладці Calls

void main() {
  runApp(const WhatsAppClone());
}

class WhatsAppClone extends StatelessWidget {
  const WhatsAppClone({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WhatsApp Clone',
      theme: ThemeData(
        primaryColor: const Color(0xFF075E54),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: const Color(0xFF25D366),
        ),
      ),
      home: const HomePage(),
    );
  }
}

// ГОЛОВНИЙ ЕКРАН
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              title: const Text("WhatsApp", style: TextStyle(color: Colors.white)),
              backgroundColor: const Color(0xFF075E54),
              floating: true,
              pinned: true,
              actions: [
                const Icon(Icons.camera_alt_outlined, color: Colors.white),
                const SizedBox(width: 15),
                const Icon(Icons.search, color: Colors.white),
                const SizedBox(width: 15),
                const Icon(Icons.more_vert, color: Colors.white),
                const SizedBox(width: 10),
              ],
              bottom: TabBar(
                controller: tabController,
                indicatorColor: Colors.white,
                labelColor: Colors.white,
                unselectedLabelColor: Colors.white70,
                tabs: const [
                  Tab(text: "Chats"),
                  Tab(text: "Status"),
                  Tab(text: "Calls"),
                ],
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: tabController,
          children: const [
            ChatList(),
            StatusList(),
            CallList(),
          ],
        ),
      ),
    );
  }
}

// ВКЛАДКА CHATS
class ChatList extends StatelessWidget {
  const ChatList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      padding: const EdgeInsets.symmetric(vertical: 0),
      itemBuilder: (context, index) {
        return ListTile(
          leading: const CircleAvatar(
            backgroundColor: Colors.grey,
            child: Icon(Icons.person, color: Colors.white),
          ),
          title: const Text("Name", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          subtitle: const Text("Hey!", style: TextStyle(fontSize: 14, color: Colors.grey)),
          trailing: const Text("2:23 pm", style: TextStyle(fontSize: 12, color: Colors.grey)),
          onTap: () {
            // Тут міг би бути перехід на екран конкретного чату
          },
        );
      },
    );
  }
}

// ВКЛАДКА STATUS
class StatusList extends StatelessWidget {
  const StatusList({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: ListTile(
            leading: Stack(
              clipBehavior: Clip.none,
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(Icons.person, color: Colors.white),
                ),
                Positioned(
                  bottom: -2,
                  right: -2,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color(0xFF25D366),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.add, color: Colors.white, size: 18),
                  ),
                )
              ],
            ),
            title: const Text("My Status", style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: const Text("Tap to add status update"),
          ),
        ),
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Text("Recent updates", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return const ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.blueGrey,
                  child: Icon(Icons.person, color: Colors.white),
                ),
                title: Text("Name", style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text("Today, 12:20pm"),
              );
            },
            childCount: 4,
          ),
        ),
      ],
    );
  }
}

// ВКЛАДКА CALLS
class CallList extends StatelessWidget {
  const CallList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 15,
      itemBuilder: (context, index) {
        if (index == 0) {
          return ListTile(
            leading: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: const Color(0xFF128C7E),
              ),
              child: Transform.rotate(
                angle: 135 * pi / 180, 
                child: const Icon(Icons.link_outlined, color: Colors.white, size: 28),
              ),
            ),
            title: const Text("Create call link", style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: const Text("Share a link for your WhatsApp call"),
          );
        }
        return ListTile(
          leading: const CircleAvatar(
            backgroundColor: Colors.grey,
            child: Icon(Icons.person, color: Colors.white),
          ),
          title: const Text("Name", style: TextStyle(fontWeight: FontWeight.bold)),
          subtitle: const Row(
            children: [
              Icon(Icons.call_made, color: Colors.green, size: 16),
              SizedBox(width: 5),
              Text("Today, 2:22pm"),
            ],
          ),
          trailing: const Icon(Icons.call, color: Color(0xFF075E54)),
        );
      },
    );
  }
}