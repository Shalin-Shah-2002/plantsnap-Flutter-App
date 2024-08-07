import 'dart:convert';
import 'package:http/http.dart' as http;

class AmazonApiClient {
  final String _apiKey = '770c5217aamsh4036dfd7808321dp197313jsnaf3d0399a3b3';
  final String _apiHost = 'real-time-amazon-data.p.rapidapi.com';

  Future<Map<String, dynamic>> searchProducts(String query, {int page = 1, String country = 'IN', String sortBy = 'RELEVANCE', String productCondition = 'ALL'}) async {
    final Uri url = Uri.https(_apiHost, '/search', {
      'query': query,
      'page': page.toString(),
      'country': country,
      'sort_by': sortBy,
      'product_condition': productCondition,
    });

    final response = await http.get(
      url,
      headers: {
        'X-Rapidapi-Key': _apiKey,
        'X-Rapidapi-Host': _apiHost,
      },
    );

    if (response.statusCode == 200) {
      return json.decode(response.body) as Map<String, dynamic>;
    } else {
      throw Exception('Failed to load products: ${response.statusCode}');
    }
  }
}

// void main() async {
//   final client = AmazonApiClient();

//   try {
//     final result = await client.searchProducts('plant pots');
//     print(result);
//   } catch (e) {
//     print(e);
//   }
// }
