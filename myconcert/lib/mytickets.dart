import 'package:flutter/material.dart';
import 'package:myconcert/main.dart';
import 'package:myconcert/profile.dart';
import 'package:myconcert/notifications.dart';
import 'package:myconcert/ticket.dart';

class MyticketsWidget extends StatefulWidget {
  const MyticketsWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyticketsWidget();
}

class _MyticketsWidget extends State<MyticketsWidget> {
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
      body: SingleChildScrollView(
          child: Column(children: <Widget>[
        SizedBox(
          height: 65.0,
          width: double.infinity,
          child: Container(
              padding: const EdgeInsets.fromLTRB(33, 18, 0.0, 0.0),
              child: const Text('Upcoming Events',
                  style: TextStyle(
                    color: Colors.black,
                    letterSpacing: 1.0,
                    fontSize: 24,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'FredokaOne',
                  ))),
        ),
        //1st Horizontal List
        SizedBox(
          height: 230.0,
          child: ListView.separated(
            // padding: EdgeInsets.all(2),
            scrollDirection: Axis.horizontal,
            itemCount: boughtTicket.length,
            separatorBuilder: (context, _) => const SizedBox(width: 10),
            itemBuilder: (context, index) =>
                buildCard(event: boughtTicket.elementAt(index)),
          ),
        ),
        SizedBox(
          height: 65.0,
          width: double.infinity,
          child: Container(
              padding: const EdgeInsets.fromLTRB(33, 18, 0.0, 0.0),
              child: const Text('Passed Events',
                  style: TextStyle(
                    color: Colors.black,
                    letterSpacing: 1.0,
                    fontSize: 24,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'FredokaOne',
                  ))),
        ),
        //2nd Horizontal List
        SizedBox(
          height: 230.0,
          child: ListView.separated(
            // padding: EdgeInsets.all(2),
            scrollDirection: Axis.horizontal,
            itemCount: passedEvents.length,
            separatorBuilder: (context, _) => const SizedBox(width: 10),
            itemBuilder: (context, index) =>
                buildCardPassed(event: passedEvents[index]),
          ),
        ),
        SizedBox(
          height: 65.0,
          width: double.infinity,
          child: Container(
              padding: const EdgeInsets.fromLTRB(33, 18, 0.0, 0.0),
              child: const Text('Bookmarked Events',
                  style: TextStyle(
                    color: Colors.black,
                    letterSpacing: 1.0,
                    fontSize: 24,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'FredokaOne',
                  ))),
        ),
        //3rd Horizontal List
        SizedBox(
          height: 230.0,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: savedEvents.length,
            separatorBuilder: (context, _) => const SizedBox(width: 10),
            itemBuilder: (context, index) =>
                buildnormalCard(event: savedEvents.elementAt(index)),
          ),
        ),
      ])),
    );
  }

  Widget buildCard({required EventItem event}) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: SizedBox(
            width: 410,
            // ignore: deprecated_member_use
            child: RaisedButton(
                color: Colors.grey.shade200,
                padding: const EdgeInsets.all(0.0),
                onPressed: () => Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TicketsWidget(event: event)),
                      (Route<dynamic> route) => false,
                    ),
                child: Column(children: [
                  SizedBox(
                    width: 410,
                    height: 160,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Material(
                        child: Ink.image(
                          image: AssetImage(event.imagePath),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            margin:
                                const EdgeInsets.fromLTRB(12.0, 0.0, 0.0, 0.0),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    event.title,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'Locations: ' +
                                        event.location +
                                        '\n' +
                                        'Date: ' +
                                        event.date,
                                    style: const TextStyle(
                                      fontSize: 15,
                                      color: Colors.black26,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  )
                                ])),
                        Row(children: <Widget>[
                          Container(
                            margin:
                                const EdgeInsets.fromLTRB(0.0, 0.0, 12.0, 0.0),
                            child: IconButton(
                              padding: const EdgeInsets.all(0.0),
                              onPressed: () {
                                showDialog<void>(
                                  context: context,
                                  barrierDismissible:
                                      false, // user must tap button!
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      backgroundColor: Colors.red.shade400,
                                      title: const Text('Delete Ticket',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold)),
                                      content: SingleChildScrollView(
                                        child: ListBody(
                                          children: const <Widget>[
                                            Text(
                                                'Do you want to delete one ticket for this event?',
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
                                                  fontWeight: FontWeight.bold)),
                                          onPressed: () {
                                            ticketCount[event.concertID] =
                                                ticketCount[event.concertID]! -
                                                    1;
                                            if (ticketCount[event.concertID] ==
                                                0) boughtTicket.remove(event);
                                            Navigator.of(context).pop();
                                            setState(() {});
                                          },
                                        ),
                                        TextButton(
                                          child: const Text('CANCEL',
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
                              icon: Image.asset(
                                'assets/images/black_bin.png',
                              ),
                              tooltip: 'Delete ticket',
                            ),
                          ),
                        ])
                      ])
                ]))));
  }

  Widget buildCardPassed({required EventItem event}) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: SizedBox(
            width: 410,
            // ignore: deprecated_member_use
            child: RaisedButton(
                color: Colors.grey.shade200,
                padding: const EdgeInsets.all(0.0),
                onPressed: () => Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TicketsWidget(event: event)),
                      (Route<dynamic> route) => false,
                    ),
                child: Column(children: [
                  SizedBox(
                    width: 410,
                    height: 160,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Material(
                        child: Ink.image(
                          image: AssetImage(event.imagePath),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            margin:
                                const EdgeInsets.fromLTRB(12.0, 0.0, 0.0, 0.0),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    event.title,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'Locations: ' +
                                        event.location +
                                        '\n' +
                                        'Date: ' +
                                        event.date,
                                    style: const TextStyle(
                                      fontSize: 15,
                                      color: Colors.black26,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  )
                                ])),
                      ])
                ]))));
  }

  Widget buildnormalCard({required EventItem event}) {
    final alreadySavedEvent = savedEvents.contains(event);
    return ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: SizedBox(
            width: 410,
            // ignore: deprecated_member_use
            child: RaisedButton(
                color: Colors.grey.shade200,
                padding: const EdgeInsets.all(0.0),
                onPressed: () {
                  showDialog<void>(
                      context: context,
                      barrierDismissible: true, // user must tap button!
                      builder: (BuildContext context) {
                        return AlertDialog(actions: <Widget>[
                          StatefulBuilder(builder:
                              (BuildContext context, StateSetter dialogState) {
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Container(
                                                margin:
                                                    const EdgeInsets.fromLTRB(
                                                        15.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  event.title,
                                                  style: const TextStyle(
                                                    fontSize: 22,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                )),
                                            ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                                child: SizedBox(
                                                    width: 70.0,
                                                    height: 70.0,
                                                    child: TextButton(
                                                      child: savedEvents
                                                              .contains(event)
                                                          ? Image.asset(
                                                              'assets/images/bookmark_on.png')
                                                          : Image.asset(
                                                              'assets/images/bookmark_black.png'),
                                                      onPressed: () {
                                                        if (savedEvents
                                                            .contains(event)) {
                                                          savedEvents
                                                              .remove(event);
                                                        } else {
                                                          savedEvents
                                                              .add(event);
                                                          for (var i = 0;
                                                              i <
                                                                  dummyEventNotifications
                                                                      .length;
                                                              i++) {
                                                            if (event
                                                                    .concertID ==
                                                                dummyEventNotifications[
                                                                        i]
                                                                    .eventN
                                                                    .concertID) {
                                                              notificationList.add(
                                                                  dummyEventNotifications[
                                                                      i]);
                                                            }
                                                          }
                                                        }
                                                        dialogState(() {});
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
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Container(
                                                margin:
                                                    const EdgeInsets.fromLTRB(
                                                        20.0, 9.0, 20.0, 0.0),
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
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                ),
                                              ),
                                              Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: <Widget>[
                                                    Container(
                                                        height: 45.0,
                                                        margin: const EdgeInsets
                                                                .fromLTRB(
                                                            6.0, 0, 0, 6.0),
                                                        child: TextButton(
                                                            onPressed: () {
                                                              showDialog<void>(
                                                                context:
                                                                    context,
                                                                barrierDismissible:
                                                                    false, // user must tap button!
                                                                builder:
                                                                    (BuildContext
                                                                        context) {
                                                                  return AlertDialog(
                                                                    backgroundColor:
                                                                        Colors
                                                                            .red
                                                                            .shade400,
                                                                    title: const Text(
                                                                        'Confirm Your In-App Purchase',
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.white,
                                                                            fontWeight: FontWeight.bold)),
                                                                    content:
                                                                        SingleChildScrollView(
                                                                      child:
                                                                          ListBody(
                                                                        children: <
                                                                            Widget>[
                                                                          Text(
                                                                              'Do you want to buy one ticket for ' + event.price,
                                                                              style: const TextStyle(color: Colors.white)),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    actions: <
                                                                        Widget>[
                                                                      TextButton(
                                                                        child: const Text(
                                                                            'BUY',
                                                                            style:
                                                                                TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                                                                        onPressed:
                                                                            () {
                                                                          ticketCount[event.concertID] =
                                                                              ticketCount[event.concertID]! + 1;
                                                                          boughtTicket
                                                                              .add(event);
                                                                          counter +=
                                                                              1.0;
                                                                          Navigator.of(context)
                                                                              .pop();
                                                                          setState(
                                                                              () {});
                                                                        },
                                                                      ),
                                                                      TextButton(
                                                                        child: const Text(
                                                                            'CANCEL',
                                                                            style:
                                                                                TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                                                                        onPressed:
                                                                            () {
                                                                          Navigator.of(context)
                                                                              .pop();
                                                                        },
                                                                      ),
                                                                    ],
                                                                  );
                                                                },
                                                              );
                                                            },
                                                            child: Row(
                                                                children: const <
                                                                    Widget>[
                                                                  SizedBox(
                                                                      width:
                                                                          35.0,
                                                                      height:
                                                                          35.0,
                                                                      child:
                                                                          Image(
                                                                        image: AssetImage(
                                                                            'assets/images/purchase_ticket.png'),
                                                                        fit: BoxFit
                                                                            .cover,
                                                                        //child: InkWell(onTap: () => showOverlay())
                                                                      )),
                                                                  Text(
                                                                      ' BUY TICKET',
                                                                      style:
                                                                          TextStyle(
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize:
                                                                            24,
                                                                      ))
                                                                ]))),
                                                    Container(
                                                        height: 45.0,
                                                        margin: const EdgeInsets
                                                                .fromLTRB(
                                                            0, 0, 6.0, 6.0),
                                                        child: TextButton(
                                                          onPressed: () {
                                                            showDialog<void>(
                                                              context: context,
                                                              barrierDismissible:
                                                                  false, // user must tap button!
                                                              builder:
                                                                  (BuildContext
                                                                      context) {
                                                                return AlertDialog(
                                                                  backgroundColor:
                                                                      Colors.red
                                                                          .shade400,
                                                                  title: const Text(
                                                                      'Open Browser',
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .white,
                                                                          fontWeight:
                                                                              FontWeight.bold)),
                                                                  content:
                                                                      SingleChildScrollView(
                                                                    child:
                                                                        ListBody(
                                                                      children: const <
                                                                          Widget>[
                                                                        Text(
                                                                            'Open Browser and visit link to a page which contains information about the event?',
                                                                            style:
                                                                                TextStyle(color: Colors.white)),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  actions: <
                                                                      Widget>[
                                                                    TextButton(
                                                                      child: const Text(
                                                                          'YES',
                                                                          style: TextStyle(
                                                                              color: Colors.white,
                                                                              fontWeight: FontWeight.bold)),
                                                                      onPressed:
                                                                          () {
                                                                        Navigator.of(context)
                                                                            .pop();
                                                                      },
                                                                    ),
                                                                    TextButton(
                                                                      child: const Text(
                                                                          'CANCEL',
                                                                          style: TextStyle(
                                                                              color: Colors.white,
                                                                              fontWeight: FontWeight.bold)),
                                                                      onPressed:
                                                                          () {
                                                                        Navigator.of(context)
                                                                            .pop();
                                                                      },
                                                                    ),
                                                                  ],
                                                                );
                                                              },
                                                            );
                                                          },
                                                          child: const Text(
                                                              'MORE...',
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 24,
                                                              )),
                                                        ))
                                                  ])
                                            ]))
                                  ],
                                ));
                          })
                        ]);
                      });
                },
                child: Column(children: [
                  SizedBox(
                    width: 410,
                    height: 160,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Material(
                        child: Ink.image(
                          image: AssetImage(event.imagePath),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            margin:
                                const EdgeInsets.fromLTRB(12.0, 0.0, 0.0, 0.0),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    event.title,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "Location: " +
                                        event.location +
                                        '\nDate: ' +
                                        event.date,
                                    style: const TextStyle(
                                      fontSize: 15,
                                      color: Colors.black26,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  )
                                ])),
                        Row(children: <Widget>[
                          Container(
                            margin:
                                const EdgeInsets.fromLTRB(0.0, 0.0, 12.0, 0.0),
                            child: IconButton(
                              padding: const EdgeInsets.all(0.0),
                              onPressed: () {
                                showDialog<void>(
                                  context: context,
                                  barrierDismissible:
                                      false, // user must tap button!
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      backgroundColor: Colors.red.shade400,
                                      title: const Text(
                                          'Confirm Your In-App Purchase',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold)),
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
                                                  fontWeight: FontWeight.bold)),
                                          onPressed: () {
                                            counter += 1.0;
                                            ticketCount[event.concertID] =
                                                ticketCount[event.concertID]! +
                                                    1;
                                            boughtTicket.add(event);
                                            Navigator.of(context).pop();
                                            setState(() {});
                                          },
                                        ),
                                        TextButton(
                                          child: const Text('CANCEL',
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
                              icon: Image.asset(
                                'assets/images/purchase_ticket.png',
                              ),
                              tooltip: 'Buy ticket',
                            ),
                          ),
                          Container(
                              margin: const EdgeInsets.fromLTRB(
                                  0.0, 0.0, 12.0, 0.0),
                              child: IconButton(
                                padding: const EdgeInsets.all(0.0),
                                onPressed: () {
                                  setState(() {
                                    if (alreadySavedEvent) {
                                      savedEvents.remove(event);
                                    } else {
                                      savedEvents.add(event);
                                      for (var i = 0;
                                          i < dummyEventNotifications.length;
                                          i++) {
                                        if (event.concertID ==
                                            dummyEventNotifications[i]
                                                .eventN
                                                .concertID) {
                                          notificationList
                                              .add(dummyEventNotifications[i]);
                                        }
                                      }
                                    }
                                  });
                                },
                                icon: alreadySavedEvent
                                    ? Image.asset(
                                        'assets/images/bookmark_on.png')
                                    : Image.asset(
                                        'assets/images/bookmark_off.png'),
                                tooltip: 'Bookmark',
                              ))
                        ])
                      ])
                ]))));
  }
}
