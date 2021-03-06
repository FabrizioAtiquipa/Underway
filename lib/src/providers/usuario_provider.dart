import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:proyectounderway/src/preferencias_usuario/preferencias_usuario.dart';
import 'package:proyectounderway/src/utils/global_arguments.dart';

class UsuarioProvider {
  final String _firebaseToken = 'AIzaSyDDJx5rAms7z3WJqJtG7fChf9821c7y-3I';
  final _prefs = new PreferenciasUsuario();
  GlobalArguments _globalArguments = GlobalArguments();

  Future<Map<String, dynamic>> login(String email, String password) async {
    final authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true
    };
    final resp = await http.post(
        Uri.parse(
            'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=$_firebaseToken'),
        body: json.encode(authData));
    Map<String, dynamic> decodedResp = json.decode(resp.body);
    print(decodedResp);
    if (decodedResp.containsKey('idToken')) {
      _prefs.token = decodedResp['idToken'];
      _globalArguments.setUid(decodedResp['localId']);
      return {'ok': true, 'token': decodedResp['idToken']};
    } else {
      return {'ok': false, 'mensaje': decodedResp['error']['message']};
    }
  }

  Future<Map<String, dynamic>> nuevoUsuario(
      String email, String password) async {
    final authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true
    };

    final resp = await http.post(
      Uri.parse(
          'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=$_firebaseToken'),
      body: json.encode(authData));
    Map<String, dynamic> decodedResp = json.decode(resp.body);
    print(decodedResp);

    final resp_database = await http.put(
      Uri.https('underway-105f6-default-rtdb.firebaseio.com', 'usuarios/${decodedResp['localId']}.json'),
      body: json.encode(authData));

    if (decodedResp.containsKey('idToken')) {
      _prefs.token = decodedResp['idToken'];
      _globalArguments.setUid(decodedResp['localId']);
      return {'ok': true, 'token': decodedResp['idToken']};
    } else {
      return {'ok': false, 'mensaje': decodedResp['error']['message']};
    }
  }
}
