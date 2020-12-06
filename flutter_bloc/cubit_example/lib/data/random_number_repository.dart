import 'dart:convert';

import 'package:http/http.dart' as http;

class RandomNumberRepository {
  int _currentRandomValue = 0;

  Future<int> fetchNewRandom({int min: -20, int max: 20}) async {
    final response = await http.get(
        'https://www.random.org/integers/?num=1&min=$min&max=$max&format=plain&col=1&base=10');
    print(json.decode(response.body));
    return 1;
  }
}
