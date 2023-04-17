// import 'package:counter_app/controller/todo_controller.dart';
// import 'package:counter_app/widget/alert_page.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class EditPage extends StatelessWidget {
//   EditPage({super.key, required this.index});
//   static const nameRoute = '/editPage';
//   final int index;
//   final DataController dc = Get.find();

//   @override
//   Widget build(BuildContext context) {
//     // final TextEditingController titleController =
//     //     TextEditingController(text: dc.datas[index]["title"]);
//     final TextEditingController descriptioController =
//         TextEditingController(text: dc.datas[index]["description"]);
//     return Scaffold(
//       appBar: AppBar(title: const Text("Edit Details")),
//       body: SafeArea(
//         child: Container(
//           margin: const EdgeInsets.all(20),
//           child: Column(
//             children: [
//               TextField(
//                 controller: titleController,
//                 decoration: const InputDecoration(
//                   border: OutlineInputBorder(),
//                   label: Text('Title'),
//                 ),
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               TextFormField(
//                 controller: descriptioController,
//                 decoration: const InputDecoration(
//                   border: OutlineInputBorder(),
//                   label: Text("Description"),
//                 ),
//               ),

//               ElevatedButton(
//                   onPressed: () => showDialog(
//                       context: context,
//                       builder: (ctx) => saveAlertDialog(
//                             navigation: () {
//                               dc.edit(
//                                   title: titleController.text,
//                                   description: descriptioController.text,
//                                   index: index,
//                                   isFavourite: dc.datas[index]['isFavourite']);

//                               Get.back();
//                               Get.back();
//                             },
//                           )),
//                   child: const Text("Save")),
//               //button :edit or cancel
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
