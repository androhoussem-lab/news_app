import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:news_app/models/author.dart';//contain functions for converting json objects
import 'package:news_app/utilities/api_utilities.dart';
/*
* TODO:get response from api
* create package api
* create class for author api like this class
* add http & convert libraries
* create model of response in this app is author
* save url in two String for change it on future wen request this "in other file in utilities package"
* create method for fetch data from api, this method request async and return Future of List of request data in this state is author
* create var for source url
* us http librarie with as http for easy use
* get request like await http.get(url) and save it in var response
*
* */




class AuthorsApi{

  Future < List<Author> > fetchAllAuthors() async{
    String allAuthorsApi = base_api + all_authors_api;//url
    List<Author> authors = List<Author>();//preparation of authors list
    var response = await http.get(allAuthorsApi);//save the response in response variable : var = http.Response
    if(response.statusCode == 200){ // check if response is success code = 200
      var jsonData = jsonDecode(response.body);//convert String response to json 'Map'
      var data = jsonData['data']; //fetch the json array content with key 'data' in this state
      for(var item in data){
        Author author = Author(item['id'].toString(), item['name'], item['email'].toString(),item['avatar'].toString() ); //prepare model 
        authors.add(author);//save model to the list

      }
    }
    return authors;
  }
}
