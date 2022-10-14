import 'dart:convert';

import 'package:http/http.dart';

import '../../models/transaction.dart';
import '../webclient.dart';

class TransactionWebClient {
  Future<List<Transaction>?> findAll() async {
    try {
      final response = await client
          .get(Uri.parse(baseUrl))
          .timeout(const Duration(seconds: 5));
      final List<dynamic> decodedJson = jsonDecode(response.body);
      return decodedJson
          .map((dynamic json) => Transaction.fromJson(json))
          .toList();
    } catch (e) {
      // print(e);
      return null;
    }
    // return null;

    // print(response.body);
  }

  Future<Transaction?> save(Transaction transaction, String password) async {
    final String transactionJson = jsonEncode(transaction.toJson());

    final Response response = await client.post(
      Uri.parse(baseUrl),
      headers: {
        'Content-type': 'application/json',
        'password': password,
      },
      body: transactionJson,
    );

    if (response.statusCode == 200) {
      return Transaction.fromJson(jsonDecode(response.body));
    }
    throwHttpError(response.statusCode);
  }

  void throwHttpError(int statusCode) =>
      throw Exception(_statusCodeResponses[statusCode]);

  static final Map<int, String> _statusCodeResponses = {
    400: 'there was an error submitting transaction',
    401: 'authentication failed',
  };
}


  // List<Transaction> _toTransactions(Response response) {
  //   final List<dynamic> decodedJson = jsonDecode(response.body);

  //   // final List<Transaction> transactions = [];

  //   // for (Map<String, dynamic> transactionJson in decodedJson) {
  //   //   transactions.add(Transaction.fromJson(transactionJson));
  //   // }
  //   return transactions;
  // }