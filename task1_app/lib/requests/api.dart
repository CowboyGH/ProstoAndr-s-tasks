import 'package:http/http.dart' as http;
import 'dart:convert';

Future<Map<String, dynamic>> getNasaData() async {
  Uri url = Uri.parse('https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/' +
  'photos?sol=1000&api_key=TeTyyXab9bb1VMe1u07f6O7dQuBedg47KQ4iOzag');

  final response = await http.get(url);

  if (response.statusCode == 200) 
  {
    return json.decode(response.body);
  } 
  else {
    throw Exception('Error: ${response.reasonPhrase}');
  }
}