import 'package:admin_panel/constants/style.dart';
import 'package:admin_panel/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuController extends GetxController {
  static MenuController instance = Get.find();
  var activeItem = OverviewPageRoute.obs;

  var hoverItem = "".obs;

  changeActiveItemTo(String itemName) {
    activeItem.value = itemName;
  }

  onHover(String itemName) {
    if (!isActive(itemName)) hoverItem.value = itemName;
  }

  isHovering(String itemName) => hoverItem.value == itemName;

  isActive(String itemName) => activeItem.value == itemName;

  Widget returnIconFor(String itemName) {
    switch (itemName) {
      case OverviewPageRoute:
        return _customIcon(Icons.trending_up, itemName);
      case ClientPageRoute:
        return _customIcon(Icons.person_outline_outlined, itemName);
      case DriversPageRoute:
        return _customIcon(Icons.drive_eta, itemName);
      case UsersPageRoute:
        return _customIcon(Icons.people_alt_outlined, itemName);
      case RideRequestPageRoute:
        return _customIcon(Icons.announcement_outlined, itemName);
      case ProgressRidePageRoute:
        return _customIcon(Icons.loop_rounded, itemName);
      case CompletedRidePageRoute:
        return _customIcon(Icons.check_circle_outlined , itemName);
      case CancelledRidePageRoute:
        return _customIcon(Icons.cancel_outlined, itemName);
      case ScheduledRidePageRoute:
        return _customIcon(Icons.schedule_rounded, itemName);
      case LocationPageRoute:
        return _customIcon(Icons.location_on_outlined, itemName);
      case RideHistoryPageRoute:
        return _customIcon(Icons.history, itemName);
      case AuthenticationPageRoute:
        return _customIcon(Icons.exit_to_app, itemName);
      default:
        return _customIcon(Icons.exit_to_app, itemName);
    }
  }

  Widget _customIcon(IconData icon, String itemName) {
    if (isActive(itemName)) return Icon(icon, size: 22, color: blue);

    return Icon(icon, color: isHovering(itemName) ? dark : lightGrey,);
  }
}
