import 'dart:convert';

import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';

import '../models/contact.dart';
import '../models/transaction.dart';

class LoggingInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    print("Request");
    print("url: ${data.baseUrl}");
    print("headers: ${data.headers}");
    print("body: ${data.body}");
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    print("Response");
    print("headers: ${data.headers}");
    print("status code: ${data.statusCode}");
    print("body: ${data.body}");
    return data;
  }
}

Future<List<Transaction>?> findAll() async {
  final Client client = InterceptedClient.build(
    interceptors: [
      LoggingInterceptor(),
    ],
  );

  try {
    final response = await client
        .get(Uri.parse('http://192.168.0.3:8080/transactions'))
        .timeout(const Duration(seconds: 5));

    final List<dynamic> decodedJson = jsonDecode(response.body);

    final List<Transaction> transactions = [];

    for (Map<String, dynamic> transactionJson in decodedJson) {
      final Map<String, dynamic> contactJson = transactionJson['contact'];
      final Transaction transaction = Transaction(
        transactionJson['value'],
        Contact(
          0,
          contactJson['name'],
          contactJson['accountNumber'],
        ),
      );

      transactions.add(transaction);
    }
    return transactions;
  } catch (e) {
    // print(e);
    return null;
  }

  // print(response.body);
}
