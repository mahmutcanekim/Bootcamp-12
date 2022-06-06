import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:refika_app/firebase_helper.dart';
import 'package:refika_app/pages/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

var loginUser = FirebaseAuth.instance.currentUser;
final storeMessage = FirebaseFirestore.instance;
final auth = FirebaseAuth.instance;

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  Service service = Service();
  final user = auth.currentUser;

  TextEditingController msg = TextEditingController();

  getCurrentUser() {
    if (user != null) {
      loginUser = user;
    }
  }

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Chat",
          style: TextStyle(fontSize: 25),
        ),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () async {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ));
                //bruada emaili geri alıcaz
                SharedPreferences pref = await SharedPreferences.getInstance();
                pref.remove("email");
                //tıkladğında kullancı emailini geri alacak
              },
              icon: const Icon(Icons.arrow_back_outlined))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              //display messages
              //mesaj ekranını bu yükseklilkte tam yaptım
              Container(
                  height: 724.0371,
                  child: const SingleChildScrollView(
                      physics: ScrollPhysics(),
                      reverse: true,
                      child: ShowMessages())),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                          border: Border(
                              top: BorderSide(
                        width: 0.2,
                      ))),
                      child: TextField(
                        controller: msg,
                        decoration: const InputDecoration(
                            hintText: "Enter messages..."),
                      ),
                    ),
                  ),
                  //burada mesaja tıkladığın zaman mesaj veritabanına gidiyor
                  IconButton(
                      onPressed: () async {
                        if (msg.text.toString().isNotEmpty) {
                          storeMessage.collection("Messages").doc().set({
                            "messages": msg.text.trim(),
                            "user": loginUser!.email.toString(),
                            "time": DateTime.now()
                          });
// mesaj yazdığın butondaki mesajın atıldıktan sonra silinmesini sağlıyor
                          msg.clear();
                        }
                      },
                      icon: const Icon(
                        Icons.send,
                        color: Colors.tealAccent,
                      ))
                ],
              ),
            ]),
      ),
    );
  }
}

class ShowMessages extends StatelessWidget {
  const ShowMessages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection("Messages")
            .orderBy("time")
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              shrinkWrap: true,
              primary: true,
              physics: const ScrollPhysics(),
              itemBuilder: (context, i) {
                QueryDocumentSnapshot x = snapshot.data!.docs[i];
                return ListTile(
                  title: Column(
                    crossAxisAlignment: loginUser!.email == x["user"]
                        ? CrossAxisAlignment.end
                        : CrossAxisAlignment.start,
                    children: [
                      Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          decoration: BoxDecoration(
                              color: loginUser!.email == x["user"]

                                  //burası kutuların rengini ayarladğımız kısım
                                  ? Colors.blue.withOpacity(0.2)
                                  : Colors.amber.withOpacity(0.6),

                              //borderelr kutuyu yuvarlatır sayısına bakarak ayarlanır
                              borderRadius: BorderRadius.circular(15)),
                          child: Column(
                            children: [
                              Text(x["messages"]),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                "User:" + x["user"],
                                style: const TextStyle(
                                    fontSize: 16, color: Colors.purple),
                              )
                            ],
                          )),
                    ],
                  ),
                );
              });
        });
  }
}
