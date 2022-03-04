import 'package:admin_panel/constants/controllers.dart';
import 'package:admin_panel/constants/style.dart';
import 'package:admin_panel/helpers/responsiveness.dart';
import 'package:admin_panel/widgets/custom_text.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UsersPage extends StatelessWidget {
  UsersPage({Key key}) : super(key: key);

  final List<Map<String, String>> usersinfo = [
    {
      "id": "001",
      "name": "nivy",
      "email": "nivy@gmail.com",
      "phone": "6382136565",
      "location": "thiruvarur",
      "rating": "4.5",
      "wallet": "2000",
      "action": "block"
    },
    {
      "id": "002",
      "name": "priya",
      "email": "priya@gmail.com",
      "phone": "7867997754",
      "location": "coimbatore",
      "rating": "4.7",
      "wallet": "2500",
      "action": "block"
    },
    {
      "id": "003",
      "name": "arun",
      "email": "arun@gmail.com",
      "phone": "6382136556",
      "location": "cbe",
      "rating": "4.3",
      "wallet": "1000",
      "action": "block"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Obx(
            () => Row(
              children: [
                Container(
                    margin: EdgeInsets.only(
                        top: ResponsiveWidget.isSmallScreen(context) ? 56 : 6),
                    child: CustomText(
                      text: menuController.activeItem.value,
                      size: 20,
                      weight: FontWeight.bold,
                      color: green,
                    )),
              ],
            ),
          ),
          Expanded(
              child: ListView(
            children: [buildClientsTable()],
          )),
        ],
      ),
    );
  }

  buildClientsTable() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: active.withOpacity(.4), width: .5),
        boxShadow: [
          BoxShadow(
              offset: const Offset(0, 6),
              color: lightGrey.withOpacity(.1),
              blurRadius: 12)
        ],
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 30),
      child: DataTable2(
          columnSpacing: 12,
          horizontalMargin: 12,
          minWidth: 600,
          columns: const [
            DataColumn(label: Text("ID")),
            DataColumn(
              label: Text("Name"),
            ),
            DataColumn(label: Text("Email")),
            DataColumn(label: Text("Phone Number")),
            DataColumn(
              label: Text('Location'),
            ),
            DataColumn(
              label: Text('Rating'),
            ),
            DataColumn(
              label: Text('Wallet'),
            ),
            DataColumn(
              label: Text('Action'),
            ),
          ],
          rows: usersinfo.map((e) => DataRow(cells: [
                    DataCell(CustomText(
                      text: (e["id"]),
                      weight: FontWeight.normal,
                      size: 12,
                      color: Colors.black,
                    )),
                    DataCell(CustomText(
                      text: (e["name"]),
                      weight: FontWeight.normal,
                      size: 12,
                      color: Colors.black,
                    )),
                    DataCell(CustomText(
                      text: (e["email"]),
                      weight: FontWeight.normal,
                      size: 12,
                      color: Colors.black,
                    )),
                    DataCell(CustomText(
                      text: (e["phone"]),
                      weight: FontWeight.normal,
                      size: 12,
                      color: Colors.black,
                    )),
                    DataCell(CustomText(
                      text: (e["location"]),
                      weight: FontWeight.normal,
                      size: 12,
                      color: Colors.black,
                    )),
                    DataCell(Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.deepOrange,
                          size: 15,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        CustomText(
                          text: (e["rating"]),
                          weight: FontWeight.normal,
                          size: 12,
                          color: Colors.black,
                        )
                      ],
                    )),
                    DataCell(CustomText(
                      text: (e["rating"]),
                      weight: FontWeight.normal,
                      size: 12,
                      color: Colors.black,
                    )),
                    DataCell(Container(
                        decoration: BoxDecoration(
                          color: light,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: active, width: .5),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 6),
                        child: CustomText(
                          text: (e["action"]),
                          color: active.withOpacity(.7),
                          weight: FontWeight.bold,
                          size: 12,
                        ))),
                  ])).toList()),
    );
  }
}
