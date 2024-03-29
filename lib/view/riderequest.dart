import 'package:admin_panel/constants/controllers.dart';
import 'package:admin_panel/constants/style.dart';
import 'package:admin_panel/helpers/responsiveness.dart';
import 'package:admin_panel/widgets/custom_text.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RideRequestPage extends StatelessWidget {
  RideRequestPage({Key key}) : super(key: key);

  final List<Map<String, String>> rideinfo = [
    {
      "date": "31/05/2021",
      "userid": "001",
      "driverid": "002",
      "pickup": "coimbatore",
      "drop": "thiruvarur",
      "payment": "UPI"
    },
    {
      "date": "07/08/2021",
      "userid": "010",
      "driverid": "001",
      "pickup": "coimbatore",
      "drop": "sivagiri",
      "payment": "Cash"
    },
    {
      "date": "31/12/2021",
      "userid": "003",
      "driverid": "010",
      "pickup": "saibaba colony",
      "drop": "gandhipuram",
      "payment": "Net banking"
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
            children: [buildRideRequestTable()],
          )),
        ],
      ),
    );
  }

  buildRideRequestTable() {
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
            DataColumn(label: Text("Date")),
            DataColumn(label: Text("User ID")),
            DataColumn(label: Text("Driver ID")),
            DataColumn(label: Text("Pickup Location")),
            DataColumn(label: Text('Drop Location')),
            DataColumn(label: Text('Payment Method')),
          ],
          rows: rideinfo.map((e) => DataRow(cells: [
                    DataCell(CustomText(
                      text: (e["date"]),
                      weight: FontWeight.normal,
                      size: 12,
                      color: Colors.black,
                    )),
                    DataCell(CustomText(
                      text: (e["userid"]),
                      weight: FontWeight.normal,
                      size: 12,
                      color: Colors.black,
                    )),
                    DataCell(CustomText(
                      text: (e["driverid"]),
                      weight: FontWeight.normal,
                      size: 12,
                      color: Colors.black,
                    )),
                    DataCell(CustomText(
                      text: (e["pickup"]),
                      weight: FontWeight.normal,
                      size: 12,
                      color: Colors.black,
                    )),
                    DataCell(CustomText(
                      text: (e["drop"]),
                      weight: FontWeight.normal,
                      size: 12,
                      color: Colors.black,
                    )),
                    DataCell(CustomText(
                      text: (e["payment"]),
                      weight: FontWeight.normal,
                      size: 12,
                      color: Colors.black,
                    )),
                  ])).toList()),
    );
  }
}
