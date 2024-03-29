import 'package:admin_panel/constants/controllers.dart';
import 'package:admin_panel/constants/style.dart';
import 'package:admin_panel/helpers/responsiveness.dart';
import 'package:admin_panel/view/authentication.dart';
import 'package:admin_panel/routing/routes.dart';
import 'package:admin_panel/widgets/custom_text.dart';
import 'package:admin_panel/widgets/side_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;

    return Container(
            color: light,
            child: ListView(
              children: [
                if(ResponsiveWidget.isSmallScreen(context))
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        SizedBox(width: _width / 48),
                        Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: Image.asset("assets/icons/logo.png",width: 30),
                        ),
                        Flexible(
                          child: CustomText(
                            text: "BookIt",
                            size: 20,
                            weight: FontWeight.bold,
                            color:blue,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
                    Divider(color: lightGrey.withOpacity(.1), ),

                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: sideMenuItems.map((itemName) => SideMenuItem(
                          itemName: itemName == AuthenticationPageRoute ? "Log Out": itemName,
                          onTap: () {
                            if (itemName == AuthenticationPageRoute){
                              Get.offAll(AuthenticationPage());
                            }
                            if (!menuController.isActive(itemName)){
                              menuController.changeActiveItemTo(itemName);
                              if(ResponsiveWidget.isSmallScreen(context))
                                Get.back();
                              navigationController.navigateTo(itemName);
                            }
                          }))
                      .toList(),
                )
              ],
            ),
          );
  }
}