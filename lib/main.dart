// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'ListView',
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Building List View'),
//           centerTitle: true,
//         ),
//         body: const BodyListView(),
//       ),
//     );
//   }
// }

// class BodyListView extends StatelessWidget {
//   const BodyListView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return _myListView();
//   }
// }

// Widget _myListView() {
//   final List<ListItem> items = List<ListItem>.generate(
//     100,
//     (i) => i % 6 == 0
//         ? HeadingItem('Heading $i')
//         : MessageItem('sender $i', 'MessageBody $i'),
//   );

//   return ListView.builder(
//     itemCount: items.length,
//     itemBuilder: (BuildContext context, int index) {
//       final item = items[index];

//       if (item is HeadingItem) {
//         return ListTile(
//           title: Text(
//             item.head,
//             style: Theme.of(context).textTheme.headlineMedium,
//           ),
//         );
//       } else if (item is MessageItem) {
//         return ListTile(
//           title: Text(item.sender),
//           subtitle: Text(item.body),
//           leading: Icon(Icons.insert_photo, color: Colors.red),
//           trailing: Icon(Icons.keyboard_arrow_right),
//         );
//       }
//       return null;
//     },
//   );
// }

// abstract class ListItem {}

// class HeadingItem implements ListItem {
//   final String head;
//   HeadingItem(this.head);
// }

// class MessageItem implements ListItem {
//   final String sender;
//   final String body;

//   MessageItem(this.sender, this.body);
// }

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Chats',
            style: TextStyle(fontSize: 40, fontWeight: FontWeight(500)),
          ),
          centerTitle: true,
        ),
        body: ChatsList(),
      ),
    );
  }
}

class ChatsList extends StatelessWidget {
  const ChatsList({super.key});

  @override
  Widget build(BuildContext context) {
    return _myListView();
  }
}

Widget _myListView() {
  final List<String> dates = [
    'Сегодня',
    'Вчера',
    '20.09.2026',
    '19.09.2026',
    '18.09.2026',
    '15.09.2026',
    '10.09.2026',
    '01.09.2026',
  ];

  final List<String> senders = [
    'Алексей',
    'Мария',
    'Иван',
    'Анна',
    'Елена',
    'Дмитрий',
    'Ольга',
    'Сергей',
    'Наталья',
    'Максим',
    'Екатерина',
    'Артем',
    'Светлана',
    'Михаил',
    'Виктория',
    'Павел',
    'Алина',
    'Роман',
    'Юлия',
    'Денис',
  ];

  final List<String> messages = [
    'Привет! Как дела?',
    'Отправил тебе файл.',
    'Созвонимся в 15:00?',
    'Спасибо за помощь!',
    'Жду ответа по макету.',
    'Документы готовы, проверяй.',
    'Отличная работа!',
    'Зайди в кабинет на минуту.',
    'Скинь ссылку на встречу.',
    'Когда планируешь релиз?',
    'Все правки внес.',
    'Перезвони, как освободишься.',
    'Проект успешно сдан!',
    'С днем рождения!',
    'Где лежит исходный код?',
    'Встреча переносится на завтра.',
    'Подтверди получение письма.',
    'Хороших выходных!',
    'Презентация готова к показу.',
    'Скоро буду на месте.',
  ];
  final List<String> avatars = [
    'https://i.pravatar.cc/150?img=1',
    'https://i.pravatar.cc/150?img=2',
    'https://i.pravatar.cc/150?img=3',
    'https://i.pravatar.cc/150?img=4',
    'https://i.pravatar.cc/150?img=5',
    'https://i.pravatar.cc/150?img=6',
    'https://i.pravatar.cc/150?img=7',
    'https://i.pravatar.cc/150?img=8',
    'https://i.pravatar.cc/150?img=9',
    'https://i.pravatar.cc/150?img=10',
    'https://i.pravatar.cc/150?img=11',
    'https://i.pravatar.cc/150?img=12',
    'https://i.pravatar.cc/150?img=13',
    'https://i.pravatar.cc/150?img=14',
    'https://i.pravatar.cc/150?img=15',
    'https://i.pravatar.cc/150?img=16',
    'https://i.pravatar.cc/150?img=17',
    'https://i.pravatar.cc/150?img=18',
    'https://i.pravatar.cc/150?img=19',
    'https://i.pravatar.cc/150?img=20',
  ];

  final List<ListItem> items = List<ListItem>.generate(
    20,
    (i) => i % 5 == 0
        ? Data(dates[(i ~/ 5) % dates.length])
        : Chat(
            senders[i % senders.length],
            messages[i % messages.length],
            avatars[i % avatars.length],
          ),
  );
  return ListView.builder(
    itemCount: items.length,
    itemBuilder: (BuildContext context, int index) {
      final item = items[index];

      if (item is Data) {
        return Container(
          padding: EdgeInsets.all(16),
          child: Text(
            item.date,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
              fontWeight: FontWeight(500),
            ),
          ),
        );
      } else if (item is Chat) {
        return ListTile(
          leading: CircleAvatar(backgroundImage: NetworkImage(item.avatars)),
          title: Text(item.chat, style: TextStyle(fontSize: 24)),
          subtitle: Text(item.message),
        );
      }
    },
  );
}

abstract class ListItem {}

class Data implements ListItem {
  final String date;
  Data(this.date);
}

class Chat implements ListItem {
  final String chat;
  final String message;
  final String avatars;
  Chat(this.chat, this.message, this.avatars);
}
