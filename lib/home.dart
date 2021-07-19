import 'package:flutter/material.dart';
import 'package:orders/order_card.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tabs',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Tabs Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                Icons.shopping_bag,
                color: Colors.brown.shade700,
              ),
              Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Orders',
                    style: TextStyle(color: Colors.black),
                  ))
            ],
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.filter_list,
                color: Colors.black,
                size: 25,
              ),
              onPressed: () {},
            )
          ],
          bottom: TabBar(
            isScrollable: true,
            labelPadding: EdgeInsets.only(left: 40, right: 40, bottom: 10),
            indicatorWeight: 2.0,
            indicatorColor: Colors.brown.shade700,
            tabs: [
              Text(
                "All",
                style: TextStyle(color: Colors.black),
              ),
              Text(
                "Pending",
                style: TextStyle(color: Colors.black),
              ),
              Text("In Progress", style: TextStyle(color: Colors.black)),
              Text("Cancelled", style: TextStyle(color: Colors.black)),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            _buildListViewOrders(),
            _buildListViewWithName('Pending'),
            _buildListViewWithName('In Progress'),
            _buildListViewWithName('Cancelledd'),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            // Add your onPressed code here!
          },
          label: const Text(
            'Add Order Request',
            style: TextStyle(color: Colors.brown),
          ),
          icon: const Icon(Icons.add, color: Colors.brown),
          backgroundColor: Colors.white,
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          selectedItemColor: Colors.brown.shade700,
          unselectedItemColor: Colors.grey[500],
          currentIndex: currentIndex,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              title: Text("Home"),
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag_outlined),
                title: Text(
                  "Orders",
                ),
                backgroundColor: Colors.black),
            BottomNavigationBarItem(
              icon: Icon(Icons.flight_takeoff_outlined),
              title: Text("Travel"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.message_outlined),
              title: Text("Inbox"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.store_outlined),
              title: Text("Market"),
            ),
          ],
        ),
      ),
    );
  }

  ListView _buildListViewWithName(String s) {
    return ListView.builder(
        itemBuilder: (context, index) => ListTile(
              title: Text(s + ' $index'),
            ));
  }

  ListView _buildListViewOrders() {
    return ListView.builder(
        itemCount: 5, itemBuilder: (context, index) => OrderCard());
  }
}
