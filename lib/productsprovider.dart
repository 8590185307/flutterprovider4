import 'dart:convert';

import 'package:flutterprovider4/Products.dart';

class TodosProvider with ChangeNotifier{
  List<Products>listtodos=[];


  Future<List<Products>> fetchtodos()  async {
    final response = await http.get(Uri.parse("https://dummyjson.com/todos"));
    if (response.statusCode == 200) {
      var gettodosData = json.decode(response.body.toString());
      var res=RespMain.fromJson(gettodosData);
      listtodos =res.todos ;
      notifyListeners();
      return listtodos;
    } else {
      throw Exception('Failed to load quotes');
    }
  }
}