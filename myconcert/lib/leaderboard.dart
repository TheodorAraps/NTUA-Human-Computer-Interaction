import 'package:flutter/material.dart';
import 'package:myconcert/main.dart';
import 'package:myconcert/profile.dart';
import 'package:myconcert/mytickets.dart';
import 'package:myconcert/search.dart';
import 'package:myconcert/notifications.dart';

class LeaderboardWidget extends StatefulWidget {
  const LeaderboardWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LeaderboardWidget();
}

class _LeaderboardWidget extends State<LeaderboardWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Leaderboard',
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
      body: Column(children: <Widget>[
        ListTile(
            title: const Text("Who has the most points?",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  letterSpacing: 1.0,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'FredokaOne',
                )),
            trailing: IconButton(
              icon: Image.asset('assets/images/redx.png'),
              splashRadius: 30.0,
              onPressed: () => Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const ProfileWidget()),
                (Route<dynamic> route) => false,
              ),
            )),
        const Divider(),
        Expanded(
          child: ListView.builder(
              itemCount: leaderboard.length,
              itemBuilder: (context, index) => ListTile(
                    leading: Image.asset('assets/images/user.png'),
                    trailing: Wrap(
                      spacing: 10, // space between two icons
                      children: <Widget>[
                        Text(leaderboard.elementAt(index).points.toString(),
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 35,
                              letterSpacing: 1.0,
                              fontWeight: FontWeight.normal,
                              fontFamily: 'FredokaOne',
                            )), // icon-1
                        Image.asset(
                          'assets/images/' +
                              leaderboard.elementAt(index).badge +
                              '.png',
                          height: 45,
                        ),
                      ],
                    ),
                    title: Text(leaderboard.elementAt(index).name,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          letterSpacing: 1.0,
                          fontWeight: FontWeight.normal,
                          fontFamily: 'FredokaOne',
                        )),
                    contentPadding: const EdgeInsets.only(
                      left: 15.0,
                      top: 19.0,
                      bottom: 19.0,
                      right: 35.0,
                    ),
                  )),
        ),
      ]),
    );
  }
}
