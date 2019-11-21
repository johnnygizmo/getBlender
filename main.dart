import 'dart:core';
import 'dart:io';
import 'package:http/http.dart' as http;

void  main(List<String> args) async{

  String url = "https://builder.blender.org/download/";
  String version = "";
  String dlloc = "";

  if(args.length < 2){
    print( "Usage: getBlender version location");
    print( "\tversion: numeric version (e.g. 2.82)");
    print( "\tlocation: local location and filename (e.g. c:\download\blender.zip)");
    return;
  }

  if(args.length == 2){
    version = args[0];
    dlloc = args[1];
  } 

  version.replaceAll(".", "\.");
  String regex = "blender-"+version+".+?-windows64.zip";  
  RegExp exp = new RegExp(regex);
  http.Response r = await http.get(url);
  String file = exp.stringMatch(r.body);
     
  print("\n\nGetting file "+file);

  http.Response dl = await http.get(url+file);
  print("Writing file: "+dlloc);
  new File(dlloc).writeAsBytes(dl.bodyBytes);
 }
