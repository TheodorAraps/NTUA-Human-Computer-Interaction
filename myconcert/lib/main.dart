import 'package:flutter/material.dart';
import 'package:myconcert/profile.dart';
import 'package:myconcert/mytickets.dart';
import 'package:myconcert/search.dart';
import 'package:myconcert/notifications.dart';
import 'package:myconcert/nearme.dart';
import 'package:myconcert/thisweek.dart';
import 'package:myconcert/youmightlike.dart';

//Global Variables
double counter = 0.0;

final savedArtists = <ArtistItem>{};
final savedGenres = <GenreItem>{};
final savedEvents = <EventItem>{};
final boughtTicket = <EventItem>{};
late List<FriendItem> leaderboard;
final notificationList = <NotificationItem>{};

final ticketCount = {
  0: 0,
  1: 0,
  2: 0,
  3: 0,
  4: 1,
  5: 1,
  6: 0,
  7: 0,
  8: 0,
  9: 0,
};

class FriendItem {
  final String name;
  final String badge;
  final int points;

  const FriendItem({
    required this.name,
    required this.badge,
    required this.points,
  });
}

Set<FriendItem> dummyFriends = {
  const FriendItem(
    name: 'Friend 1',
    badge: 'gold',
    points: 78,
  ),
  const FriendItem(
    name: 'Friend 2',
    badge: 'nothing',
    points: 4,
  ),
  const FriendItem(
    name: 'Friend 3',
    badge: 'silver',
    points: 60,
  ),
  const FriendItem(
    name: 'Friend 4',
    badge: 'bronze',
    points: 31,
  ),
  const FriendItem(
    name: 'Friend 5',
    badge: 'nothing',
    points: 12,
  ),
  const FriendItem(
    name: 'Friend 6',
    badge: 'silver',
    points: 43,
  ),
};

class ArtistItem {
  final String artist;
  final String genre;

  const ArtistItem({
    required this.artist,
    required this.genre,
  });
}

class NotificationItem {
  final String title;
  final EventItem eventN;

  const NotificationItem({
    required this.title,
    required this.eventN,
  });
}

List<NotificationItem> dummyArtistNotifications = [
  NotificationItem(
      title: 'Artist1 has a new concert coming up!', eventN: dummyConcerts1[0]),
  NotificationItem(
      title: 'See Artist2 live in "Pop Culure"', eventN: dummyConcerts1[1]),
  NotificationItem(
      title: 'Artist5 is back with a new concert! Check it out',
      eventN: dummyConcerts1[4]),
  NotificationItem(
    title: 'Artist6 is coming to Technopolis Gazi. Book your tickets now!',
    eventN: dummyConcerts1[6],
  )
];

List<NotificationItem> dummyEventNotifications = [
  NotificationItem(
      title: '"Party n Paint" tickets has been released!',
      eventN: dummyConcerts1[2]),
  NotificationItem(
      title: '"Jazz Heaven" tickets almost sold out! Book yours now',
      eventN: dummyConcerts1[3]),
  NotificationItem(
    title: 'Book your RockWave Festival ticketS NOW!',
    eventN: dummyConcerts1[7],
  )
];

List<NotificationItem> dummyGenreNotifications = [
  NotificationItem(
      title: 'Do you like Pop? Book your "Pop Culure" tickets NOW!',
      eventN: dummyConcerts1[1]),
  NotificationItem(
      title: 'Are you a Rock fan? Book your tickets for "RockWell Festival"',
      eventN: dummyConcerts1[0]),
  NotificationItem(
    title: 'Check out this Country festival',
    eventN: dummyConcerts1[5],
  )
];

class GenreItem {
  final String genre;

  const GenreItem({
    required this.genre,
  });
}

List<GenreItem> dummyGenres = [
  const GenreItem(
    genre: 'Rock',
  ),
  const GenreItem(
    genre: 'Pop',
  ),
  const GenreItem(
    genre: 'Hip Hop',
  ),
  const GenreItem(
    genre: 'Rhythym and Blues',
  ),
  const GenreItem(
    genre: 'Soul',
  ),
  const GenreItem(
    genre: 'Raggae',
  ),
  const GenreItem(
    genre: 'R&B',
  ),
  const GenreItem(
    genre: 'Jazz',
  ),
  const GenreItem(
    genre: 'Country',
  ),
  const GenreItem(
    genre: 'Folk',
  ),
];

List<ArtistItem> dummyArtists = [
  const ArtistItem(
    artist: 'Artist 1',
    genre: 'Rock',
  ),
  const ArtistItem(
    artist: 'Artist 2',
    genre: 'Pop',
  ),
  const ArtistItem(
    artist: 'Artist 5',
    genre: 'Hip Hop',
  ),
  const ArtistItem(
    artist: 'Artist 15',
    genre: 'Rhythym and Blues',
  ),
  const ArtistItem(
    artist: 'Artist 16',
    genre: 'Soul',
  ),
  const ArtistItem(
    artist: 'Artist 7',
    genre: 'Reggae',
  ),
  const ArtistItem(
    artist: 'Artist 3',
    genre: 'R&B',
  ),
  const ArtistItem(
    artist: 'Artist 4',
    genre: 'Jazz',
  ),
  const ArtistItem(
    artist: 'Artist 6',
    genre: 'Country',
  ),
  const ArtistItem(
    artist: 'Artist 8',
    genre: 'Rock',
  ),
  const ArtistItem(
    artist: 'Artist 9',
    genre: 'Pop',
  ),
  const ArtistItem(
    artist: 'Artist 10',
    genre: 'R&B',
  ),
  const ArtistItem(
    artist: 'Artist 11',
    genre: 'Jazz',
  ),
  const ArtistItem(
    artist: 'Artist 12',
    genre: 'Hip Hop',
  ),
  const ArtistItem(
    artist: 'Artist 13',
    genre: 'Country',
  ),
  const ArtistItem(
    artist: 'Artist 14',
    genre: 'Reggae',
  ),
  const ArtistItem(
    artist: 'Artist 3',
    genre: 'R&B',
  ),
  const ArtistItem(
    artist: 'Artist 17',
    genre: 'Folk',
  ),
  const ArtistItem(
    artist: 'Artist 18',
    genre: 'Soul',
  ),
  const ArtistItem(
    artist: 'Artist 19',
    genre: 'Folk',
  ),
  const ArtistItem(
    artist: 'Artist 20',
    genre: 'Rhythym and Blues',
  ),
];

class EventItem {
  final String imagePath;
  final String title;
  final String location;
  final String date;
  final String time;
  final String price;
  final String genre;
  final String artist;
  final int concertID;

  const EventItem({
    required this.imagePath,
    required this.title,
    required this.location,
    required this.date,
    required this.time,
    required this.price,
    required this.genre,
    required this.artist,
    required this.concertID,
  });
}

List<EventItem> dummyConcerts1 = [
  const EventItem(
    imagePath: 'assets/images/Concert1.jpg',
    title: 'RockWell Festival',
    location: 'Arena',
    date: '03/04/2022',
    time: '19:00',
    price: '45.00€',
    genre: 'Rock',
    artist: 'Artist 1',
    concertID: 0,
  ),
  const EventItem(
    imagePath: 'assets/images/Concert2.jpg',
    title: 'Pop Culure',
    location: 'National Park',
    date: '04/04/2022',
    time: '21:00',
    price: '50.00€',
    genre: 'Pop',
    artist: 'Artist 2',
    concertID: 1,
  ),
  const EventItem(
    imagePath: 'assets/images/Concert3.jpg',
    title: 'Party n Paint',
    location: 'Club',
    date: '05/04/2022',
    time: '20:00',
    price: '25.00€',
    genre: 'R&B',
    artist: 'Artist 3',
    concertID: 2,
  ),
  const EventItem(
    imagePath: 'assets/images/Concert4.jpg',
    title: 'Jazz Heaven',
    location: 'Fox Tucson Theater',
    date: '13/08/2022',
    time: '18:00',
    price: '20.00€',
    genre: 'Jazz',
    artist: 'Artist 4',
    concertID: 3,
  ),
  const EventItem(
    imagePath: 'assets/images/Concert7.jpg',
    title: 'Hip Hop Madness',
    location: 'AnClub',
    date: '8/10/2022',
    time: '21:00',
    price: '15.00€',
    genre: 'Hip Hop',
    artist: 'Artist 5',
    concertID: 8,
  ),
  const EventItem(
    imagePath: 'assets/images/Concert8.jpg',
    title: 'Country Concert',
    location: 'National Park',
    date: '25/7/2022',
    time: '19:00',
    price: '25.00€',
    genre: 'Country',
    artist: 'Artist 6',
    concertID: 9,
  ),
  const EventItem(
    imagePath: 'assets/images/Concert9.jpg',
    title: 'Boom Reggae Festival',
    location: 'Techopoli Gazi',
    date: '20/9/2022',
    time: '20:00',
    price: '25.00€',
    genre: 'Reggae',
    artist: 'Artist 7',
    concertID: 6,
  ),
  const EventItem(
    imagePath: 'assets/images/Concert10.jpg',
    title: 'RockWave Festival',
    location: 'Malakasa',
    date: '10/6/2022',
    time: '20:00',
    price: '40.00€',
    genre: 'Rock',
    artist: 'Artist 1',
    concertID: 7,
  )
];

List<EventItem> passedEvents = [
  const EventItem(
    imagePath: 'assets/images/Concert5.jpg',
    title: 'Another RockYou Situation',
    location: 'Stadium',
    date: '03/11/2021',
    time: '18:00',
    price: '25.00€',
    genre: 'Rock',
    artist: 'Artist 5',
    concertID: 4,
  ),
  const EventItem(
    imagePath: 'assets/images/Concert6.jpg',
    title: 'Pop History',
    location: 'Main Square',
    date: '13/10/2020',
    time: '21:00',
    price: '33.00€',
    genre: 'Pop',
    artist: 'Artist 2',
    concertID: 5,
  ),
];

void main() => runApp(const MyConcert());

class MyConcert extends StatelessWidget {
  const MyConcert({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyConcert',
      routes: <String, WidgetBuilder>{
        '/search': (BuildContext context) => const SearchWidget(),
        // ExtractArgumentsScreen.routeName: (context) =>
        //     const ExtractArgumentsScreen(),
        //'/artist' : (BuildContext context) => ArtistWidget(artistGenre: '',artistName: '',)
      },
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.red,
      ),
      home: const HomeWidget(),
    );
  }
}

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
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
        body: SingleChildScrollView(
            child: Column(children: <Widget>[
          //Near me Button
          SizedBox(
            height: 65.0,
            width: double.infinity,
            child: TextButton(
              style: TextButton.styleFrom(
                alignment: const Alignment(-0.9, 0),
              ),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const NearMeWidget()));
              },
              child: const Text('Near me',
                  style: TextStyle(
                    color: Colors.black,
                    letterSpacing: 1.0,
                    fontSize: 24,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'FredokaOne',
                  )),
            ),
          ),
          //1st Horizontal List
          SizedBox(
            height: 230.0,
            child: ListView.separated(
              // padding: EdgeInsets.all(2),
              scrollDirection: Axis.horizontal,
              itemCount: dummyConcerts1.length,
              separatorBuilder: (context, _) => const SizedBox(width: 10),
              itemBuilder: (context, index) =>
                  buildCard(event: dummyConcerts1[index]),
            ),
          ),
          //This week Button
          SizedBox(
            height: 65.0,
            width: double.infinity,
            child: TextButton(
              style: TextButton.styleFrom(
                alignment: const Alignment(-0.9, 0),
              ),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ThisWeekWidget()));
              },
              child: const Text('This week',
                  style: TextStyle(
                    color: Colors.black,
                    letterSpacing: 1.0,
                    fontSize: 24,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'FredokaOne',
                  )),
            ),
          ),
          //2nd Horizontal List
          SizedBox(
            height: 230.0,
            child: ListView.separated(
              // padding: EdgeInsets.all(2),
              scrollDirection: Axis.horizontal,
              itemCount: dummyConcerts1.length,
              separatorBuilder: (context, _) => const SizedBox(width: 10),
              itemBuilder: (context, index) =>
                  buildCard(event: dummyConcerts1[index]),
            ),
          ),
          //You might like Button
          SizedBox(
            height: 65.0,
            width: double.infinity,
            child: TextButton(
              style: TextButton.styleFrom(
                alignment: const Alignment(-0.9, 0),
              ),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const YouMightLikeWidget()));
              },
              child: const Text('You might like',
                  style: TextStyle(
                    color: Colors.black,
                    letterSpacing: 1.0,
                    fontSize: 24,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'FredokaOne',
                  )),
            ),
          ),
          //3rd Horizontal List
          SizedBox(
            height: 230.0,
            child: ListView.separated(
              // padding: EdgeInsets.all(2),
              scrollDirection: Axis.horizontal,
              itemCount: dummyConcerts1.length,
              separatorBuilder: (context, _) => const SizedBox(width: 10),
              itemBuilder: (context, index) =>
                  buildCard(event: dummyConcerts1[index]),
            ),
          ),
        ])));
  }

  Widget buildCard({required EventItem event}) {
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
                                                    event.price +
                                                    '?',
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
