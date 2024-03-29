import 'package:admin_panel/constants/controllers.dart';
import 'package:admin_panel/constants/style.dart';
import 'package:admin_panel/helpers/responsiveness.dart';
import 'package:admin_panel/widgets/custom_text.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VendorPage extends StatelessWidget {
  VendorPage({Key key}) : super(key: key);

  final List<Map<String, String>> vendorinfo = [
    {"id": "001", "name": "arun", "noofcar": "3", "models": "innova,kia,duster"}
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
            children: [buildVendorsTable()],
          )),
        ],
      ),
    );
  }

  buildVendorsTable() {
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
            DataColumn(label: Text("Name")),
            DataColumn(label: Text("Number of Cars")),
            DataColumn(label: Text("Models")),
          ],
          rows: vendorinfo
              .map((e) => DataRow(cells: [
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
                      text: (e["noofcar"]),
                      weight: FontWeight.normal,
                      size: 12,
                      color: Colors.black,
                    )),
                    DataCell(CustomText(
                      text: (e["models"]),
                      weight: FontWeight.normal,
                      size: 12,
                      color: Colors.black,
                    )),
                  ]))
              .toList()),
    );
  }
}
