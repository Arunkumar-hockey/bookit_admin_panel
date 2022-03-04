import 'package:admin_panel/view/Vendor.dart';
import 'package:admin_panel/view/cancelledride.dart';
import 'package:admin_panel/view/completedride.dart';
import 'package:admin_panel/view/progressride.dart';
import 'package:admin_panel/view/ridehistory.dart';
import 'package:admin_panel/view/scheduledride.dart';
import 'package:admin_panel/view/users.dart';
import 'package:admin_panel/view/drivers.dart';
import 'package:admin_panel/view/location.dart';
import 'package:admin_panel/view/overview.dart';
import 'package:admin_panel/routing/routes.dart';
import 'package:admin_panel/view/riderequest.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings){
  switch (settings.name) {
    case OverviewPageRoute:
      return _getPageRoute(OverviewPage());
    case ClientPageRoute:
      return _getPageRoute(VendorPage());
    case DriversPageRoute:
      return _getPageRoute(DriversPage());
    case UsersPageRoute:
      return _getPageRoute( UsersPage());
    case RideRequestPageRoute:
      return _getPageRoute(RideRequestPage());
    case ProgressRidePageRoute:
      return _getPageRoute(RideInProgress());
    case CompletedRidePageRoute:
      return _getPageRoute(CompletedRides());
    case CancelledRidePageRoute:
      return _getPageRoute(CancelledRides());
    case ScheduledRidePageRoute:
      return _getPageRoute(ScheduledRides());
    case LocationPageRoute:
      return _getPageRoute(const LocationPage());
    case RideHistoryPageRoute:
      return _getPageRoute(RideHistory());
    default:
      return _getPageRoute(OverviewPage());

  }
}

PageRoute _getPageRoute(Widget child){
  return MaterialPageRoute(builder: (context) => child);
}