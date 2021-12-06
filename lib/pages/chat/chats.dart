import 'package:flutter/material.dart';
import 'package:tep_app/recources/recources.dart';

class ChatsPage extends StatefulWidget {
  const ChatsPage({Key? key}) : super(key: key);

  @override
  _ChatsPageState createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {
  @override
  Widget build(BuildContext context) {
    var displaySize = MediaQuery.of(context).size;
    Widget _doctor(Doctor doctor) {
      return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, 'chat_page');
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          height: displaySize.height / 100 * 15,
          margin: const EdgeInsets.only(bottom: 10, left: 16, right: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(width: 0.6, color: SystemColors.secondColor),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade300,
                offset: const Offset(1, 4),
                blurRadius: 1,
              )
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    doctor.name,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const Text('Ish vaqti'),
                  const Text('9:00-17:00'),
                ],
              ),
              Center(
                child: CircleAvatar(
                  radius: displaySize.width / 100 * 10,
                  backgroundImage: NetworkImage(doctor.image),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.teal,
        title: const Text(
          'Chats',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          _doctor(listDoctors[0]),
        ],
      ),
    );
  }
}
