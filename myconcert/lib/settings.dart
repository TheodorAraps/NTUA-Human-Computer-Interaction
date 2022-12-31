import 'package:flutter/material.dart';
import 'package:myconcert/main.dart';
import 'package:myconcert/profile.dart';
import 'package:myconcert/mytickets.dart';
import 'package:myconcert/search.dart';
import 'package:myconcert/notifications.dart';

class SettingsWidget extends StatefulWidget {
  const SettingsWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SettingsWidget();
}

class _SettingsWidget extends State<SettingsWidget> {
  bool switch1 = false;
  bool switch2 = false;

  void toggleSwitch1(bool value) {
    if (switch1 == false) {
      setState(() {
        switch1 = true;
      });
    } else {
      setState(() {
        switch1 = false;
      });
    }
  }

  void toggleSwitch2(bool value) {
    if (switch2 == false) {
      setState(() {
        switch2 = true;
      });
    } else {
      setState(() {
        switch2 = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Settings',
          style: TextStyle(
            letterSpacing: 1.0,
            fontSize: 24,
            fontWeight: FontWeight.normal,
            fontFamily: 'FredokaOne',
          ),
        ),
        backgroundColor: const Color(0xFF9C0707),
        foregroundColor: Colors.white,
        actions: [
          //Search Button
          Container(
              margin: const EdgeInsets.only(right: 5.0),
              child: IconButton(
                icon: Image.asset('assets/images/search_off.png'),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const SearchWidget()));
                },
                tooltip: 'Search',
              )),
          //Notifications button
          Container(
              margin: const EdgeInsets.only(right: 13.0),
              child: IconButton(
                icon: Image.asset('assets/images/notifications_off.png'),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const NotificationsWidget()));
                },
                tooltip: 'Notifications',
              ))
        ],
      ),
      drawer: Drawer(
          backgroundColor: const Color(0xFFCA3D3D),
          child: ListView(
            children: <Widget>[
              ListTile(
                leading: IconButton(
                  icon: Image.asset('assets/images/menu_close.png'),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
              Container(
                height: 140,
              ),
              ListTile(
                leading: Image.asset('assets/images/menu_home.png'),
                title: const Text('Home',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      letterSpacing: 1.0,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'FredokaOne',
                    )),
                contentPadding: const EdgeInsets.only(
                  left: 45.0,
                  top: 13.0,
                  bottom: 13.0,
                ),
                onTap: () => Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeWidget()),
                  (Route<dynamic> route) => false,
                ),
              ),
              ListTile(
                leading: Image.asset('assets/images/menu_profile.png'),
                title: const Text('Profile',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      letterSpacing: 1.0,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'FredokaOne',
                    )),
                contentPadding: const EdgeInsets.only(
                  left: 45.0,
                  top: 13.0,
                  bottom: 13.0,
                ),
                onTap: () => Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ProfileWidget()),
                  (Route<dynamic> route) => false,
                ),
              ),
              ListTile(
                leading: Image.asset('assets/images/menu_ticket.png'),
                title: const Text('My Tickets',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      letterSpacing: 1.0,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'FredokaOne',
                    )),
                contentPadding: const EdgeInsets.only(
                  left: 45.0,
                  top: 13.0,
                  bottom: 13.0,
                ),
                onTap: () => Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MyticketsWidget()),
                  (Route<dynamic> route) => false,
                ),
              )
            ],
          )),
      body: ListView(children: <Widget>[
        ListTile(
            trailing: IconButton(
          icon: Image.asset('assets/images/redx.png'),
          splashRadius: 30.0,
          onPressed: () => Navigator.of(context).pop(),
        )),
        const Divider(),
        ListTile(
            title: const Text(
              'Location Access',
              style: TextStyle(
                letterSpacing: 1.0,
                fontSize: 24,
                fontWeight: FontWeight.normal,
                fontFamily: 'FredokaOne',
              ),
            ),
            trailing: Switch(
              onChanged: toggleSwitch1,
              value: switch1,
            )),
        const Divider(),
        ListTile(
            title: const Text(
              'Push Notifications',
              style: TextStyle(
                letterSpacing: 1.0,
                fontSize: 24,
                fontWeight: FontWeight.normal,
                fontFamily: 'FredokaOne',
              ),
            ),
            trailing: Switch(
              onChanged: toggleSwitch2,
              value: switch2,
            )),
        const Divider(),
        ListTile(
          title: const Text(
            'Terms and Services',
            style: TextStyle(
              letterSpacing: 1.0,
              fontSize: 24,
              fontWeight: FontWeight.normal,
              fontFamily: 'FredokaOne',
            ),
          ),
          trailing: Container(
              margin: const EdgeInsets.only(right: 5.0),
              child:
                  Image.asset('assets/images/terms&services.png', scale: 5.0)),
        ),
        const Divider(),
        ListTile(
          title: const Text(
            'Log Out',
            style: TextStyle(
              letterSpacing: 1.0,
              fontSize: 24,
              fontWeight: FontWeight.normal,
              fontFamily: 'FredokaOne',
            ),
          ),
          trailing: Image.asset('assets/images/logout.png'),
        ),
        const Divider(),
      ]),
    );
  }
}
