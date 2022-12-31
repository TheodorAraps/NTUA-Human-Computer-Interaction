import 'package:flutter/material.dart';
import 'package:myconcert/main.dart';
import 'package:myconcert/mytickets.dart';
import 'package:myconcert/myartists.dart';
import 'package:myconcert/mygenres.dart';
import 'package:myconcert/myfriends.dart';
import 'package:myconcert/leaderboard.dart';
import 'package:myconcert/settings.dart';
import 'package:myconcert/search.dart';
import 'package:myconcert/notifications.dart';

//Global variables
String badge = 'nothing';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ProfileWidget();
}

class _ProfileWidget extends State<ProfileWidget> {
  //late means that the value will be declared later
  late double morepoints;
  late double divider;
  late String needmore;
  String prompt = '';
  String badgeprompt = '';
  @override
  Widget build(BuildContext context) {
    if (counter < 25.0) {
      morepoints = 25.0 - counter;
      divider = counter / 25.0;
      needmore = 'Need ' +
          morepoints.toInt().toString() +
          ' more points for a bronze badge!';
      prompt = 'no';
      badgeprompt = 'No Badge';
    } else if (counter < 50.0) {
      morepoints = 50.0 - counter;
      divider = (counter - 25.0) / 25.0;
      badge = 'bronze';
      needmore = 'Need ' +
          morepoints.toInt().toString() +
          ' more points for a silver badge!';
      prompt = '5%';
      badgeprompt = 'Bronze Badge';
    } else if (counter < 75.0) {
      morepoints = 75.0 - counter;
      divider = (counter - 50.0) / 25.0;
      badge = 'silver';
      needmore = 'Need ' +
          morepoints.toInt().toString() +
          ' more points for a gold badge!';
      prompt = '10%';
      badgeprompt = 'Silver Badge';
    } else {
      morepoints = 0.0;
      divider = 1.0;
      badge = 'gold';
      needmore = "You're awesome!";
      prompt = '20%';
      badgeprompt = 'Gold Badge';
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Profile',
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
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: Image.asset('assets/images/user.png'),
            title: const Text('Username',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  letterSpacing: 1.0,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'FredokaOne',
                )),
            contentPadding: const EdgeInsets.only(
              left: 25.0,
              top: 8.0,
              bottom: 8.0,
            ),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Total Points',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  letterSpacing: 1.0,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'FredokaOne',
                )),
            contentPadding: const EdgeInsets.only(
              left: 35.0,
              top: 15.0,
              bottom: 9.0,
              right: 35.0,
            ),
            trailing: Text(
              counter.toInt().toString(),
              style: const TextStyle(
                color: Colors.black,
                fontSize: 45,
                letterSpacing: 1.0,
                fontWeight: FontWeight.normal,
                fontFamily: 'FredokaOne',
              ),
            ),
          ),
          Container(
              margin: const EdgeInsets.fromLTRB(35.0, 0.0, 35.0, 0.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: LinearProgressIndicator(
                  minHeight: 10.0,
                  value: divider,
                  semanticsLabel: 'Linear progress indicator',
                ),
              )),
          Container(
            margin: const EdgeInsets.fromLTRB(35.0, 0.0, 0.0, 0.0),
            child: Text(
              needmore,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 15,
                letterSpacing: 1.0,
                fontWeight: FontWeight.normal,
                fontFamily: 'FredokaOne',
              ),
            ),
          ),
          ListTile(
            trailing: Image.asset('assets/images/' + badge + '.png'),
            title: const Text('Current Badge',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  letterSpacing: 1.0,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'FredokaOne',
                )),
            contentPadding: const EdgeInsets.only(
              left: 35.0,
              top: 19.0,
              bottom: 19.0,
              right: 35.0,
            ),
            onTap: () {
              showDialog<void>(
                context: context,
                barrierDismissible: false, // user must tap button!
                builder: (BuildContext context) {
                  return AlertDialog(
                    backgroundColor: Colors.red.shade400,
                    title: Text(badgeprompt,
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                    content: SingleChildScrollView(
                      child: ListBody(
                        children: <Widget>[
                          Text('You currently have ' + prompt + ' discount!',
                              style: const TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                    actions: <Widget>[
                      TextButton(
                        child: const Text('GOT IT',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
          ListTile(
            trailing: Image.asset('assets/images/my_artists.png'),
            title: const Text('My Artists',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  letterSpacing: 1.0,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'FredokaOne',
                )),
            contentPadding: const EdgeInsets.only(
              left: 35.0,
              top: 19.0,
              bottom: 19.0,
              right: 35.0,
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const MyartistsWidget()));
            },
          ),
          ListTile(
            trailing: Image.asset('assets/images/mygenres.png'),
            title: const Text('My Genres',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  letterSpacing: 1.0,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'FredokaOne',
                )),
            contentPadding: const EdgeInsets.only(
              left: 35.0,
              top: 19.0,
              bottom: 19.0,
              right: 35.0,
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const MygenresWidget()));
            },
          ),
          ListTile(
            trailing: Image.asset('assets/images/myfriends.png'),
            title: const Text('My Friends',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  letterSpacing: 1.0,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'FredokaOne',
                )),
            contentPadding: const EdgeInsets.only(
              left: 35.0,
              top: 19.0,
              bottom: 19.0,
              right: 35.0,
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const MyfriendsWidget()));
            },
          ),
          ListTile(
            trailing: Image.asset('assets/images/leaderboard.png'),
            title: const Text('Leaderboard',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  letterSpacing: 1.0,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'FredokaOne',
                )),
            contentPadding: const EdgeInsets.only(
              left: 35.0,
              top: 19.0,
              bottom: 19.0,
              right: 35.0,
            ),
            onTap: () {
              int ctr = counter.toInt();
              //Add current state of profile
              var myval = FriendItem(
                name: 'You',
                badge: badge,
                points: ctr,
              );
              final listSet = dummyFriends.toList();
              listSet.add(myval);
              listSet.sort((a, b) => a.points.compareTo(b.points));
              leaderboard = listSet.reversed.toList();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const LeaderboardWidget()));
            },
          ),
          ListTile(
            trailing: Image.asset('assets/images/settings.png'),
            title: const Text('Settings',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  letterSpacing: 1.0,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'FredokaOne',
                )),
            contentPadding: const EdgeInsets.only(
              left: 35.0,
              top: 19.0,
              bottom: 18.5,
              right: 35.0,
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const SettingsWidget()));
            },
          ),
        ],
      ),
    );
  }
}
