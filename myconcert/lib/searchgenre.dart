import 'package:flutter/material.dart';
import 'package:myconcert/main.dart';
import 'package:myconcert/profile.dart';
import 'package:myconcert/mytickets.dart';
import 'package:myconcert/Notifications.dart';
import 'package:myconcert/genre.dart';

class SearchGenreWidget extends StatefulWidget {
  const SearchGenreWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SearchGenreWidget();
}

class _SearchGenreWidget extends State<SearchGenreWidget> {
  List<GenreItem> _foundGenres = [];
  @override
  initState() {
    // at the beginning, all users are shown
    _foundGenres = dummyGenres;
    super.initState();
  }

  // This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    List<GenreItem> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all events
      results = dummyGenres;
    } else {
      results = dummyGenres
          .where((event) =>
              event.genre.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      _foundGenres = results;
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
                  'Genres',
                  style: TextStyle(fontFamily: 'FredokaOne', fontSize: 24.0),
                )),
                trailing: IconButton(
                  icon: Image.asset('assets/images/redx.png'),
                  splashRadius: 30.0,
                  onPressed: () => Navigator.of(context).pop(),
                )),
            TextField(
              onChanged: (value) => _runFilter(value),
              decoration: const InputDecoration(
                  labelText: 'Search', suffixIcon: Icon(Icons.search)),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: _foundGenres.isNotEmpty
                  ? ListView.builder(
                      itemCount: _foundGenres.length,
                      itemBuilder: (context, index) =>
                          _buildRow(_foundGenres[index]))
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

  Widget _buildRow(GenreItem gen) {
    final alreadySavedGenre = savedGenres.contains(gen);

    return Card(
        key: ValueKey(gen),
        color: Colors.white,
        elevation: 4,
        child: TextButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => GenreWidget(curGenre: gen)));
          },
          child: ListTile(
            leading: Text(
              gen.genre,
              style: const TextStyle(fontFamily: 'FredokaOne', fontSize: 22),
            ),
            title: Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                splashRadius: 25.0,
                icon: alreadySavedGenre
                    ? const Icon(Icons.remove)
                    : const Icon(Icons.add),
                onPressed: () {
                  setState(() {
                    if (alreadySavedGenre) {
                      savedGenres.remove(gen);
                    } else {
                      savedGenres.add(gen);
                      for (var i = 0; i < dummyGenreNotifications.length; i++) {
                        if (gen.genre ==
                            dummyGenreNotifications[i].eventN.genre) {
                          notificationList.add(dummyGenreNotifications[i]);
                        }
                      }
                    }
                  });
                },
              ),
            ),
          ),
        ));
  }
}
