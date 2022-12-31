import 'package:flutter/material.dart';
import 'package:myconcert/main.dart';
import 'package:myconcert/search.dart';
import 'package:myconcert/notifications.dart';
import 'package:myconcert/profile.dart';
import 'package:myconcert/mytickets.dart';

class NearMeWidget extends StatefulWidget {
  const NearMeWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _NearMeWidget();
}

class _NearMeWidget extends State<NearMeWidget> {
  @override
  Widget build(BuildContext constext) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Home',
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
              title: const Align(
                  alignment: Alignment.center,
                  child: Text('Near Me',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 40,
                        letterSpacing: 1.0,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'FredokaOne',
                      ))),
              contentPadding: const EdgeInsets.only(left: 25.0),
              trailing: IconButton(
                icon: Image.asset('assets/images/redx.png'),
                splashRadius: 30.0,
                onPressed: () => Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeWidget()),
                  (Route<dynamic> route) => false,
                ),
              )),
          SizedBox(
              height: 800.0,
              width: double.infinity,
              child: ListView.separated(
                scrollDirection: Axis.vertical,
                itemCount: dummyConcerts1.length,
                separatorBuilder: (context, _) => const SizedBox(height: 10),
                itemBuilder: (context, index) =>
                    buildC(event: dummyConcerts1[index]),
              ))
        ]));
  }

  Widget buildC({
    required EventItem event,
  }) {
    return Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                height: 70.0,
                width: 400.0,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                        margin: const EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
                        child: Text(
                          event.title,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                    ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: SizedBox(
                            width: 70.0,
                            height: 70.0,
                            child: TextButton(
                              child: savedEvents.contains(event)
                                  ? Image.asset('assets/images/bookmark_on.png')
                                  : Image.asset(
                                      'assets/images/bookmark_black.png'),
                              onPressed: () {
                                if (savedEvents.contains(event)) {
                                  savedEvents.remove(event);
                                } else {
                                  savedEvents.add(event);
                                }
                                setState(() {});
                              },
                            ))),
                  ],
                )),
            SizedBox(
                height: 200.0,
                width: 400.0,
                child: Image(
                  image: AssetImage(event.imagePath),
                  fit: BoxFit.cover,
                )),
            Container(
                height: 140.0,
                width: 400.0,
                color: Colors.white,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.fromLTRB(20.0, 9.0, 20.0, 0.0),
                        height: 80.0,
                        width: 360.0,
                        child: Text(
                          "Location: " +
                              event.location +
                              '\n' +
                              "Date: " +
                              event.date +
                              '\n' +
                              event.price +
                              '\nOther important information',
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.black45,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Container(
                                height: 45.0,
                                margin:
                                    const EdgeInsets.fromLTRB(6.0, 0, 0, 6.0),
                                child: TextButton(
                                    onPressed: () {
                                      showDialog<void>(
                                        context: context,
                                        barrierDismissible:
                                            false, // user must tap button!
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            backgroundColor:
                                                Colors.red.shade400,
                                            title: const Text(
                                                'Confirm Your In-App Purchase',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            content: SingleChildScrollView(
                                              child: ListBody(
                                                children: <Widget>[
                                                  Text(
                                                      'Do you want to buy one ticket for ' +
                                                          event.price,
                                                      style: const TextStyle(
                                                          color: Colors.white)),
                                                ],
                                              ),
                                            ),
                                            actions: <Widget>[
                                              TextButton(
                                                child: const Text('BUY',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                                onPressed: () {
                                                  ticketCount[event.concertID] =
                                                      ticketCount[event
                                                              .concertID]! +
                                                          1;
                                                  boughtTicket.add(event);
                                                  counter += 1.0;
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                              TextButton(
                                                child: const Text('CANCEL',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                    child: Row(children: const <Widget>[
                                      SizedBox(
                                          width: 35.0,
                                          height: 35.0,
                                          child: Image(
                                            image: AssetImage(
                                                'assets/images/purchase_ticket.png'),
                                            fit: BoxFit.cover,
                                            //child: InkWell(onTap: () => showOverlay())
                                          )),
                                      Text(' BUY TICKET',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 24,
                                          ))
                                    ]))),
                            Container(
                                height: 45.0,
                                margin:
                                    const EdgeInsets.fromLTRB(0, 0, 6.0, 6.0),
                                child: TextButton(
                                  onPressed: () {
                                    showDialog<void>(
                                      context: context,
                                      barrierDismissible:
                                          false, // user must tap button!
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          backgroundColor: Colors.red.shade400,
                                          title: const Text('Open Browser',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold)),
                                          content: SingleChildScrollView(
                                            child: ListBody(
                                              children: const <Widget>[
                                                Text(
                                                    'Open Browser and visit link to a page which contains information about the event?',
                                                    style: TextStyle(
                                                        color: Colors.white)),
                                              ],
                                            ),
                                          ),
                                          actions: <Widget>[
                                            TextButton(
                                              child: const Text('YES',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                            TextButton(
                                              child: const Text('CANCEL',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  child: const Text('MORE...',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 24,
                                      )),
                                ))
                          ])
                    ]))
          ],
        ));
  }
}
