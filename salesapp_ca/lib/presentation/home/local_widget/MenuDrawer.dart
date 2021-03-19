import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:salesapp_ca/utils/colors_constants.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({
    Key? key,
    this.nameSeller = 'Vendedor Prueba 1',
    this.route = '1001',
    this.date = '27/02/2021',
    this.warehouse = '01',
    this.guide = 'T001-00001',
    this.typeSale = 'Preventa',
    required this.onPressedClient,
    required this.onPressedOrders,
    required this.onPressedArticles,
    required this.onPressedSetting,
    required this.onPressedInformation,
    required this.stateColorClient,
    required this.stateColorOrders,
    required this.stateColorArticle,
    required this.stateColorSetting,
    required this.stateColorInformation,
    required this.onPressedReports,
    required this.stateColorReport,
  }) : super(key: key);

  final String nameSeller;
  final String route;
  final String date;
  final String warehouse;
  final String guide;
  final String typeSale;
  final Function() onPressedClient;
  final Function() onPressedOrders;
  final Function() onPressedArticles;
  final Function() onPressedReports;
  final Function() onPressedSetting;
  final Function() onPressedInformation;
  final bool stateColorClient;
  final bool stateColorOrders;
  final bool stateColorArticle;
  final bool stateColorReport;
  final bool stateColorSetting;
  final bool stateColorInformation;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DrawerHeader(
          margin: EdgeInsets.all(0),
          padding: EdgeInsets.only(top: 0, left: 10, right: 10, bottom: 0),
          //decoration: BoxDecoration(color: white),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.centerLeft - Alignment(0.0, 0.20),
                child: CircleAvatar(
                  backgroundColor: gray,
                  radius: 40.0,
                  child: Text(
                    'W',
                    style: TextStyle(
                      fontFamily: 'Oswald',
                      color: white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    CupertinoIcons.xmark_circle,
                    color: gray,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight + Alignment(0, .3),
                child: Text(
                  nameSeller,
                  style: TextStyle(
                    fontFamily: 'Oswald',
                    color: gray,
                    fontSize: 16,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight + Alignment(0, .6),
                child: Text(
                  'Ruta: $route',
                  style: TextStyle(
                    fontFamily: 'Oswald',
                    color: gray,
                    fontSize: 14,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight + Alignment(0, 0.9),
                child: Text(
                  'Fecha: $date',
                  style: TextStyle(
                    fontFamily: 'Oswald',
                    color: gray,
                    fontSize: 14,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight + Alignment(0, 1.2),
                child: Text(
                  'Almacen: $warehouse',
                  style: TextStyle(
                    fontFamily: 'Oswald',
                    color: gray,
                    fontSize: 16,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight + Alignment(0, 1.5),
                child: Text(
                  'Guia: $guide',
                  style: TextStyle(
                    fontFamily: 'Oswald',
                    color: gray,
                    fontSize: 16,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft + Alignment(0, 1.9),
                child: Text(
                  '$typeSale',
                  style: TextStyle(
                    fontFamily: 'Oswald',
                    color: gray,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          //color: white,
          child: Padding(
            padding: EdgeInsets.only(top: 0.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20.0,
                ),
                ListTile(
                  onTap: onPressedClient,
                  leading: Icon(CupertinoIcons.person_3_fill,
                      color: stateColorClient ? Colors.blue : gray),
                  title: Text(
                    'Clientes',
                    style: TextStyle(
                      fontFamily: 'Oswald',
                      color: stateColorClient ? Colors.blue : gray,
                      fontSize: 16,
                    ),
                  ),
                ),
                ListTile(
                  onTap: onPressedOrders,
                  leading: Icon(CupertinoIcons.cart_badge_plus,
                      color: stateColorOrders ? Colors.blue : gray),
                  title: Text(
                    'Pedidos',
                    style: TextStyle(
                      fontFamily: 'Oswald',
                      color: stateColorOrders ? Colors.blue : gray,
                      fontSize: 16,
                    ),
                  ),
                ),
                ListTile(
                  onTap: onPressedArticles,
                  leading: Icon(CupertinoIcons.square_stack_3d_down_right,
                      color: stateColorArticle ? Colors.blue : gray),
                  title: Text(
                    'Articulos',
                    style: TextStyle(
                      fontFamily: 'Oswald',
                      color: stateColorArticle ? Colors.blue : gray,
                      fontSize: 16,
                    ),
                  ),
                ),
                ListTile(
                  onTap: onPressedReports,
                  leading: Icon(Icons.info,
                      color: stateColorReport ? Colors.blue : gray),
                  title: Text(
                    'Reportes',
                    style: TextStyle(
                      fontFamily: 'Oswald',
                      color: stateColorReport ? Colors.blue : gray,
                      fontSize: 16,
                    ),
                  ),
                ),
                ListTile(
                  onTap: onPressedSetting,
                  leading: Icon(Icons.app_settings_alt_sharp,
                      color: stateColorSetting ? Colors.blue : gray),
                  title: Text(
                    'Configuración',
                    style: TextStyle(
                      fontFamily: 'Oswald',
                      color: stateColorSetting ? Colors.blue : gray,
                      fontSize: 16,
                    ),
                  ),
                ),
                ListTile(
                  onTap: onPressedInformation,
                  leading: Icon(Icons.info,
                      color: stateColorInformation ? Colors.blue : gray),
                  title: Text(
                    'Información',
                    style: TextStyle(
                      fontFamily: 'Oswald',
                      color: stateColorInformation ? Colors.blue : gray,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
