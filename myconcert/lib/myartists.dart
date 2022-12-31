import 'package:flutter/material.dart';
import 'package:myconcert/main.dart';
import 'package:myconcert/profile.dart';
import 'package:myconcert/mytickets.dart';
import 'package:myconcert/notifications.dart';
import 'package:myconcert/artist.dart';

class MyartistsWidget extends StatefulWidget {
  const MyartistsWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyartistsWidget();
}

class _MyartistsWidget extends State<MyartistsWidget> {
  bool editMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'My Artists',
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
                  Navigator.of(context)
                      .pushNamed('/search')
                      .then((value) => setState(() {}));
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
            leading: TextButton(
                child: const Text(
                  'Edit',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    letterSpacing: 1.0,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'FredokaOne',
                  ),
                ),
                onPressed: () {
                  editMode = !editMode;
                  setState(() {});
                }),
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
            child: savedArtists.isNotEmpty
                ? (editMode ? _buildEditModeOn() : _buildEditModeOff())
                : const Text(
                    'No results found',
                    style: TextStyle(
                      letterSpacing: 1.0,
                      fontSize: 24,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'FredokaOne',
                    ),
                  )),
      ]),
    );
  }

  Widget _buildEditModeOff() {
    return ListView.builder(
        itemCount: savedArtists.length,
        itemBuilder: (context, index) => ListTile(
              contentPadding: const EdgeInsets.only(
                left: 10.0,
                top: 10.0,
                bottom: 10.0,
              ),
              leading: Text(
                savedArtists.elementAt(index).artist,
                style: const TextStyle(
                  letterSpacing: 1.0,
                  fontSize: 24,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'FredokaOne',
                ),
              ),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(
                        builder: (context) => ArtistWidget(
                            curArtist: savedArtists.elementAt(index))))
                    .then((value) => setState(() {}));
              },
            ));
  }

  Widget _buildEditModeOn() {
    return ListView.builder(
        itemCount: savedArtists.length,
        itemBuilder: (context, index) => ListTile(
              contentPadding: const EdgeInsets.only(
                left: 10.0,
                top: 10.0,
                bottom: 10.0,
              ),
              trailing: Container(
                  margin: const EdgeInsets.only(right: 20.0),
                  child: IconButton(
                      onPressed: () {
                        setState(() {
                          savedArtists.remove(savedArtists.elementAt(index));
                        });
                      },
                      icon: Image.asset('assets/images/black_bin.png'))),
              leading: Text(
                savedArtists.elementAt(index).artist,
                style: const TextStyle(
                  letterSpacing: 1.0,
                  fontSize: 24,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'FredokaOne',
                ),
              ),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(
                        builder: (context) => ArtistWidget(
                            curArtist: savedArtists.elementAt(index))))
                    .then((value) => setState(() {}));
              },
            ));
  }
}
