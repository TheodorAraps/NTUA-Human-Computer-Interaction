import 'package:flutter/material.dart';
import 'package:myconcert/main.dart';
import 'package:myconcert/profile.dart';
import 'package:myconcert/mytickets.dart';
import 'package:myconcert/Notifications.dart';

class SearchEventWidget extends StatefulWidget {
  const SearchEventWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SearchEventWidget();
}

class _SearchEventWidget extends State<SearchEventWidget> {
  List<EventItem> _foundEvents = [];
  @override
  initState() {
    // at the beginning, all users are shown
    _foundEvents = dummyConcerts1;
    super.initState();
  }

  // This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    List<EventItem> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all events
      results = dummyConcerts1;
    } else {
      results = dummyConcerts1
          .where((event) =>
              event.title.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      _foundEvents = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Search',
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
                icon: Image.asset('assets/images/search_on.png'),
                onPressed: () => Navigator.of(context).pop(),
                tooltip: 'Search',
              )),
          //Notifications button
          Container(
              margin: const EdgeInsets.only(right: 13.0),
              child: IconButton(
                icon: Image.asset('assets/images/notifications_off.png'),
                onPressed: () {
                  Navigator.of(context).pop();
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
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            ListTile(
                title: const Align(
                    child: Text(
                  'Events',
                  style: TextStyle(fontFamily: 'FredokaOne', fontSize: 24.0),
                )),
                trailing: IconButton(
                  icon: Image.asset('assets/images/redx.png'),
                  splashRadius: 30.0,
                  onPressed: () => Navigator.of(context).pop(),
                )),
            const SizedBox(
              height: 0,
            ),
            TextField(
              onChanged: (value) => _runFilter(value),
              decoration: const InputDecoration(
                  labelText: 'Search', suffixIcon: Icon(Icons.search)),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: _foundEvents.isNotEmpty
                  ? ListView.builder(
                      itemCount: _foundEvents.length,
                      itemBuilder: (context, index) => Card(
                        key: ValueKey(_foundEvents[index]),
                        color: Colors.white,
                        elevation: 4,
                        child: TextButton(
                            onPressed: () {
                              showDialog<void>(
                                  context: context,
                                  barrierDismissible:
                                      true, // user must tap button!
                                  builder: (BuildContext context) {
                                    return AlertDialog(actions: <Widget>[
                                      StatefulBuilder(builder:
                                          (BuildContext context,
                                              StateSetter dialogState) {
                                        return Container(
                                            alignment: Alignment.center,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                Container(
                                                    height: 70.0,
                                                    width: 400.0,
                                                    color: Colors.white,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: <Widget>[
                                                        Container(
                                                            margin:
                                                                const EdgeInsets
                                                                        .fromLTRB(
                                                                    15.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                            child: Text(
                                                              _foundEvents[
                                                                      index]
                                                                  .title,
                                                              style:
                                                                  const TextStyle(
                                                                fontSize: 22,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            )),
                                                        ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100),
                                                            child: SizedBox(
                                                                width: 70.0,
                                                                height: 70.0,
                                                                child:
                                                                    TextButton(
                                                                  child: savedEvents.contains(
                                                                          _foundEvents[
                                                                              index])
                                                                      ? Image.asset(
                                                                          'assets/images/bookmark_on.png')
                                                                      : Image.asset(
                                                                          'assets/images/bookmark_black.png'),
                                                                  onPressed:
                                                                      () {
                                                                    if (savedEvents
                                                                        .contains(
                                                                            _foundEvents[index])) {
                                                                      savedEvents
                                                                          .remove(
                                                                              _foundEvents[index]);
                                                                    } else {
                                                                      savedEvents.add(
                                                                          _foundEvents[
                                                                              index]);
                                                                      for (var i =
                                                                              0;
                                                                          i < dummyEventNotifications.length;
                                                                          i++) {
                                                                        if (_foundEvents[index].concertID ==
                                                                            dummyEventNotifications[i].eventN.concertID) {
                                                                          notificationList
                                                                              .add(dummyEventNotifications[i]);
                                                                        }
                                                                      }
                                                                    }
                                                                    dialogState(
                                                                        () {});
                                                                    setState(
                                                                        () {});
                                                                  },
                                                                ))),
                                                      ],
                                                    )),
                                                SizedBox(
                                                    height: 200.0,
                                                    width: 400.0,
                                                    child: Image(
                                                      image: AssetImage(
                                                          _foundEvents[index]
                                                              .imagePath),
                                                      fit: BoxFit.cover,
                                                    )),
                                                Container(
                                                    height: 140.0,
                                                    width: 400.0,
                                                    color: Colors.white,
                                                    child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: <Widget>[
                                                          Container(
                                                            margin:
                                                                const EdgeInsets
                                                                        .fromLTRB(
                                                                    20.0,
                                                                    9.0,
                                                                    20.0,
                                                                    0.0),
                                                            height: 80.0,
                                                            width: 360.0,
                                                            child: Text(
                                                              "Location: " +
                                                                  _foundEvents[
                                                                          index]
                                                                      .location +
                                                                  '\n' +
                                                                  "Date: " +
                                                                  _foundEvents[
                                                                          index]
                                                                      .date +
                                                                  '\n' +
                                                                  _foundEvents[
                                                                          index]
                                                                      .price +
                                                                  '\nOther important information',
                                                              style:
                                                                  const TextStyle(
                                                                fontSize: 15,
                                                                color: Colors
                                                                    .black45,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                            ),
                                                          ),
                                                          Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .end,
                                                              children: <
                                                                  Widget>[
                                                                Container(
                                                                    height:
                                                                        45.0,
                                                                    margin: const EdgeInsets
                                                                            .fromLTRB(
                                                                        6.0,
                                                                        0,
                                                                        0,
                                                                        6.0),
                                                                    child: TextButton(
                                                                        onPressed: () {
                                                                          showDialog<
                                                                              void>(
                                                                            context:
                                                                                context,
                                                                            barrierDismissible:
                                                                                false, // user must tap button!
                                                                            builder:
                                                                                (BuildContext context) {
                                                                              return AlertDialog(
                                                                                backgroundColor: Colors.red.shade400,
                                                                                title: const Text('Confirm Your In-App Purchase', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                                                                                content: SingleChildScrollView(
                                                                                  child: ListBody(
                                                                                    children: <Widget>[
                                                                                      Text('Do you want to buy one ticket for ' + _foundEvents[index].price, style: const TextStyle(color: Colors.white)),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                                actions: <Widget>[
                                                                                  TextButton(
                                                                                    child: const Text('BUY', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                                                                                    onPressed: () {
                                                                                      ticketCount[_foundEvents[index].concertID] = ticketCount[_foundEvents[index].concertID]! + 1;
                                                                                      boughtTicket.add(_foundEvents[index]);
                                                                                      counter += 1.0;
                                                                                      Navigator.of(context).pop();
                                                                                    },
                                                                                  ),
                                                                                  TextButton(
                                                                                    child: const Text('CANCEL', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
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
                                                                                image: AssetImage('assets/images/purchase_ticket.png'),
                                                                                fit: BoxFit.cover,
                                                                                //child: InkWell(onTap: () => showOverlay())
                                                                              )),
                                                                          Text(
                                                                              ' BUY TICKET',
                                                                              style: TextStyle(
                                                                                color: Colors.black,
                                                                                fontSize: 24,
                                                                              ))
                                                                        ]))),
                                                                Container(
                                                                    height:
                                                                        45.0,
                                                                    margin: const EdgeInsets
                                                                            .fromLTRB(
                                                                        0,
                                                                        0,
                                                                        6.0,
                                                                        6.0),
                                                                    child:
                                                                        TextButton(
                                                                      onPressed:
                                                                          () {
                                                                        showDialog<
                                                                            void>(
                                                                          context:
                                                                              context,
                                                                          barrierDismissible:
                                                                              false, // user must tap button!
                                                                          builder:
                                                                              (BuildContext context) {
                                                                            return AlertDialog(
                                                                              backgroundColor: Colors.red.shade400,
                                                                              title: const Text('Open Browser', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                                                                              content: SingleChildScrollView(
                                                                                child: ListBody(
                                                                                  children: const <Widget>[
                                                                                    Text('Open Browser and visit link to a page which contains information about the event?', style: TextStyle(color: Colors.white)),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              actions: <Widget>[
                                                                                TextButton(
                                                                                  child: const Text('YES', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                                                                                  onPressed: () {
                                                                                    Navigator.of(context).pop();
                                                                                  },
                                                                                ),
                                                                                TextButton(
                                                                                  child: const Text('CANCEL', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                                                                                  onPressed: () {
                                                                                    Navigator.of(context).pop();
                                                                                  },
                                                                                ),
                                                                              ],
                                                                            );
                                                                          },
                                                                        );
                                                                      },
                                                                      child: const Text(
                                                                          'MORE...',
                                                                          style:
                                                                              TextStyle(
                                                                            color:
                                                                                Colors.black,
                                                                            fontSize:
                                                                                24,
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
                            child: ListTile(
                                leading: Text(
                                  _foundEvents[index].title.toString(),
                                  style: const TextStyle(
                                      fontFamily: 'FredokaOne', fontSize: 22),
                                ),
                                title: Align(
                                  alignment: Alignment.topRight,
                                  child: Text(
                                      _foundEvents[index].location +
                                          '\n' +
                                          _foundEvents[index].date,
                                      style: const TextStyle(fontSize: 13)),
                                ),
                                subtitle: Align(
                                  alignment: Alignment.bottomRight,
                                  child: Text(
                                      'Genre: ' + _foundEvents[index].genre),
                                ))),
                      ),
                    )
                  : const Text(
                      'No results found',
                      style: TextStyle(fontSize: 24),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
