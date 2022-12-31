import 'package:flutter/material.dart';
import 'package:myconcert/main.dart';
import 'package:myconcert/profile.dart';
import 'package:myconcert/mytickets.dart';
import 'package:myconcert/search.dart';
import 'package:myconcert/notifications.dart';

class TicketsWidget extends StatelessWidget {
  const TicketsWidget({Key? key, required this.event}) : super(key: key);

  final EventItem event;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'My Tickets',
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
        body: SingleChildScrollView(
            child: Column(children: <Widget>[
          ListTile(
              title: const Text('Ticket Information',
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
                  MaterialPageRoute(
                      builder: (context) => const MyticketsWidget()),
                  (Route<dynamic> route) => false,
                ),
              )),
          const Divider(),
          SizedBox(
              width: 410,
              height: 200,
              child: Ink.image(
                image: AssetImage(event.imagePath),
              )),
          SizedBox(
              width: 410,
              height: 680,
              child: Column(children: <Widget>[
                ListTile(
                  title: const Text('Event Name',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        letterSpacing: 1.0,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'FredokaOne',
                      )),
                  trailing: Text(event.title,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        letterSpacing: 1.0,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'FredokaOne',
                      )),
                ),
                const Divider(),
                ListTile(
                  title: const Text('Location',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        letterSpacing: 1.0,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'FredokaOne',
                      )),
                  trailing: Text(event.location,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        letterSpacing: 1.0,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'FredokaOne',
                      )),
                ),
                const Divider(),
                ListTile(
                  title: const Text('Date/Time',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        letterSpacing: 1.0,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'FredokaOne',
                      )),
                  trailing: Text(event.date + '/' + event.time,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        letterSpacing: 1.0,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'FredokaOne',
                      )),
                ),
                const Divider(),
                ListTile(
                  title: const Text('Ticket Price',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        letterSpacing: 1.0,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'FredokaOne',
                      )),
                  trailing: Text(event.price,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        letterSpacing: 1.0,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'FredokaOne',
                      )),
                ),
                const Divider(),
                const ListTile(
                  title: Text('Download Ticket PDF',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        letterSpacing: 1.0,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'FredokaOne',
                      )),
                  trailing: Icon(Icons.download),
                ),
                const Divider(),
                ListTile(
                  title: const Text('Ticket Count',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        letterSpacing: 1.0,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'FredokaOne',
                      )),
                  trailing: Text(ticketCount[event.concertID].toString(),
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        letterSpacing: 1.0,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'FredokaOne',
                      )),
                ),
                const Divider(),
                Image.asset('assets/images/QRcode.png', scale: 8.0)
              ]))
        ])));
  }
}
