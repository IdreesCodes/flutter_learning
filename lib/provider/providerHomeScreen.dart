import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learning/provider/count_provider.dart';
import 'package:flutter_learning/provider/geoLocator.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import '../model/weatherModel/NewDataModel.dart';


class ProviderHomeScreen extends StatefulWidget {
  const ProviderHomeScreen({super.key});
  @override
  State<ProviderHomeScreen> createState() => _ProviderHomeScreenState();
}
class _ProviderHomeScreenState extends State<ProviderHomeScreen> {
  double latitude= 0;
  double longitude=0;
  final myController = TextEditingController();
  bool _isSearching = false;
  final TextEditingController _searchController = TextEditingController();
  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
  void _toggleSearch() {
    setState(() {
      _isSearching = !_isSearching;
      if (!_isSearching) {
        _searchController.clear();
      }
    });
  }


  @override
  void initState() {
    super.initState();

    getUserLocation();
    Provider.of<CountProvider>(context, listen: false).getPostData(context);
   // Provider.of<CountProvider>(context, listen: false).newGetPostData(context, longitude, longitude);
  }
  @override


  @override
  Widget build(BuildContext context) {


    final counterProvider = Provider.of<CountProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
            elevation: 0,

          title:  _isSearching
        ? TextField(
        controller: _searchController,
        onChanged: (value) {
          // Perform search operations here based on the value
        },
        autofocus: true,
        decoration: InputDecoration(
          hintText: 'Search...',
          border: InputBorder.none,
          suffixIcon: IconButton(
            icon: const Icon(Icons.done),
            onPressed: () {
              setState(() {
                counterProvider.newGetSearchData(context, 'karachi');
                counterProvider.newGetSearchData(context, _searchController);

              });
            },
          ),
        ),
      )
            : const Text('Testing App'),

        actions:  [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: _toggleSearch,
          ),
      const SizedBox(width: 10,),
      const Icon(
        CupertinoIcons.ellipsis_vertical
      ),

        ],
      ),
      body: FutureBuilder<NewDataModel?>(
        future: counterProvider.newGetSearchData(context,_searchController ),
        builder: (context, snapshot)  {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error fetching data'));
          } else {
            final data = snapshot.data;
            if (data != null) {

              return  Column(
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  Center(
                    child: Text(counterProvider.data2!.name.toString(), style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w200,
                    ),),

                  ),
                  Text(counterProvider.data!.weatherdes.toString()),
                  const SizedBox(
                      height: 180,
                      width: 180,
                      child: Image(image: AssetImage('assets/sun.png'))),
                  Text(counterProvider.data2!.main!.temp.toString(), style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w100,

                  ),),
                  const SizedBox(
                    height: 20,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 30.0, right: 30, top: 0, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('Humidity Level', style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w300,

                        ),),
                        SizedBox(
                          width: 20,
                        ),
                        Text('Wind Speed', style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w300,

                        ),),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0, right: 30, top: 0, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 25.0),
                          child: Text(counterProvider.data2!.main!.humidity.toString(), style: const TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w100,

                          ),),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(counterProvider.data2!.wind!.speed.toString(), style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w100,

                        ),),
                      ],
                    ),
                  ),
                ],
              );
            } else {
              return const Center(child: Text('No data available'));

                // ListView.builder(
                //   itemCount: 4,
                //   itemBuilder: (context, index) {
                //     final post = data.humidity;
                //     return Text(counterProvider.data!.humidity.toString());
                //
                //   },
                // );
            }
          }
        },
      ),
      floatingActionButton: FloatingActionButton(

        onPressed: () async{
          counterProvider.newGetSearchData(context, 'karachi');
      //    await getUserLocation();
        //  await counterProvider.newGetPostData(context, latitude, longitude);
        //  counterProvider.getUserLocation();
         // counterProvider.getPostData(context);
        },
        child: const Icon(Icons.refresh),
      ),
    );

  }
  Future getUserLocation() async {

    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      print('Latitude: ${position.latitude}, Longitude: ${position.longitude}');
      latitude = position.latitude;
      longitude = position.longitude;


    } catch (e) {
      print('Error: $e');
    }
  }
}
