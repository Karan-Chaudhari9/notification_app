import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  void _showSecondPage(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
      return Scaffold(
        body: Center(
          child: Hero(
            tag: 'Profile Picture',
            child: Image.asset('assets/images/Atmiya_Logo.png'),
          ),
        ),
      );
    }));
  }

  Widget _buildListItem(String title, {VoidCallback? onTap}) {
    return ListTile(
      title: Text(title),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(color: Colors.black, fontSize: 22),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 20.0),
            ListTile(
              leading: GestureDetector(
                onTap: () => _showSecondPage(context),
                child: const Hero(
                  tag: 'Profile Picture',
                  child: SizedBox(
                    height: 60,
                    width: 60,
                    child: CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/images/Atmiya_Logo.png'),
                    ),
                  ),
                ),
              ),
              title: const Text('Karan Chaudhary'),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 8.0, top: 28.0),
              child: Text(
                'MY ACCOUNT',
                style: TextStyle(
                  fontSize: 13.0,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                ),
              ),
            ),
            Column(
              children: [
                _buildListItem('Register History'),
                _buildListItem('Notification'),
                _buildListItem('Department'),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(left: 8.0, top: 20.0),
              child: Text(
                'EVENTS',
                style: TextStyle(
                  fontSize: 13.0,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                ),
              ),
            ),
            Column(
              children: [
                _buildListItem('Popular Events'),
                _buildListItem('Live Events'),
                _buildListItem('Recommended Events'),
                _buildListItem('Create Event'),
              ],
            ),
            _buildListItem('Liked Events'),
            const Padding(
              padding: EdgeInsets.only(left: 8, top: 20.0),
              child: Text(
                'ABOUT',
                style: TextStyle(
                  fontSize: 13.0,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                ),
              ),
            ),
            _buildListItem('About Us'),
            _buildListItem('Send Us Feedback'),
            _buildListItem('Need Help?'),
            const Padding(
              padding: EdgeInsets.only(left: 8, top: 20.0),
              child: Text(
                'LOGOUT',
                style: TextStyle(
                  fontSize: 13.0,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                ),
              ),
            ),
            _buildListItem('Logout'),
          ],
        ),
      ),
    );
  }
}
