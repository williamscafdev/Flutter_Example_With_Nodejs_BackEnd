import 'package:flutter/material.dart';
import 'package:salesapp_ca/utils/colors_constants.dart';

class AppBarPersonalize extends StatefulWidget {
  const AppBarPersonalize({
    Key? key,
    this.onlogout,
    this.value,
    this.title,
    //this.searchController,
    //this.onChange,
    this.valor,
  }) : super(key: key);
  final Function()? onlogout;
  final int? value;
  final String? title;
  //final TextEditingController? searchController;
  //final Function(String)? onChange;
  final int? valor;

  @override
  _AppBarPersonalizeState createState() => _AppBarPersonalizeState();
}

class _AppBarPersonalizeState extends State<AppBarPersonalize> {
  int valorbotton = 0;

  appBar() {
    switch (widget.value) {
      case 0:
        return Text(
          'Sales App',
          style: TextStyle(
              fontFamily: 'Oswald',
              color: gray,
              fontSize: 15,
              fontWeight: FontWeight.bold),
        );
      case 1:
        if (widget.valor == 1) {
          return valorbotton == 0
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                      Text(
                        'Lista ${widget.title}',
                        style: TextStyle(
                            fontFamily: 'Oswald',
                            color: gray,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                        padding: EdgeInsets.all(0),
                        splashRadius: 20.0,
                        icon: Icon(Icons.search),
                        onPressed: () {
                          setState(() {
                            valorbotton = 2;
                          });
                        },
                      ),
                    ])
              : TextFormField(
                  autofocus: true,
                  //  controller: widget.searchController,
                  //   onChanged: widget.onChange,
                  decoration: InputDecoration(
                    hintText: 'Buscar ${widget.title}',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: InputBorder.none,
                    suffixIcon: IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () {
                        setState(() {
                          valorbotton = 0;
                        });
                      },
                    ),
                  ),
                );
        }
        break;
      case 2:
        if (widget.valor == 1) {
          return valorbotton == 0
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                      Text(
                        'Lista ${widget.title}',
                        style: TextStyle(
                            fontFamily: 'Oswald',
                            color: gray,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () {
                          setState(() {
                            valorbotton = 2;
                          });
                        },
                      ),
                    ])
              : TextFormField(
                  autofocus: true,
                  //    controller: widget.searchController,
                  //     onChanged: widget.onChange,
                  decoration: InputDecoration(
                    hintText: 'Buscar ${widget.title}',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: InputBorder.none,
                    suffixIcon: IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () {
                        setState(() {
                          valorbotton = 0;
                        });
                      },
                    ),
                  ),
                );
        }
        break;
      case 3:
        if (widget.valor == 1) {
          return valorbotton == 0
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                      Text(
                        'Lista de ${widget.title}',
                        style: TextStyle(
                            fontFamily: 'Oswald',
                            color: gray,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () {
                          setState(() {
                            valorbotton = 2;
                          });
                        },
                      ),
                    ])
              : TextFormField(
                  autofocus: true,
                  //  controller: widget.searchController,
                  // onChanged: widget.onChange,
                  decoration: InputDecoration(
                    hintText: 'Buscar ${widget.title}',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: InputBorder.none,
                    suffixIcon: IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () {
                        setState(() {
                          valorbotton = 0;
                        });
                      },
                    ),
                  ),
                );
        }
        break;
      case 4:
        return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Lista de ${widget.title}',
                style: TextStyle(
                    fontFamily: 'Oswald',
                    color: gray,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            ]);

      case 5:
        return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Lista de ${widget.title}',
                style: TextStyle(
                    fontFamily: 'Oswald',
                    color: gray,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            ]);
      case 6:
        return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Lista de ${widget.title}',
                style: TextStyle(
                    fontFamily: 'Oswald',
                    color: gray,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            ]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: white,
      title: appBar(),
      actions: [
        SizedBox(
          width: 10.0,
        ),
        Icon(
          Icons.add_alert_rounded,
          color: gray,
        ),
        SizedBox(
          width: 10.0,
        ),
        GestureDetector(
          onTap: widget.onlogout,
          child: Icon(
            Icons.logout,
            color: Colors.red,
          ),
        ),
        SizedBox(
          width: 5.0,
        ),
      ],
      iconTheme: IconThemeData(color: gray),
    );
  }
}
