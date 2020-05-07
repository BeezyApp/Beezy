import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'contact.dart';

Contact g_currentUser =
    Contact(Key("Tim_Zheng"), "Tim Zheng", false, "images/people_tim.jpg", LatLng(40.744710, -74.025802));

Map<Key, Contact> g_people = {
  Key("Grace_Be"):Contact(Key("Grace_Be"), "Grace Be", false, "images/people_grace.png", LatLng(40.745457, -74.028302)),
  Key("Rebecca_Zhang"): Contact(Key("Rebecca_Zhang"), "Rebecca Zhang", false, "images/people_rebecca.png", LatLng(40.746213, -74.025424)),
  Key("Berry_E"):  Contact(Key("Berry_E"), "Berry E", false, "images/people_berry.png", LatLng(40.744392, -74.025579)),
  Key("Chris_E"): Contact(Key("Chris_E"), "Chris E", false, "images/people_chris.png", LatLng(40.745238, -74.026067)),
  Key("Tim_Zheng"):Contact(Key("Tim_Zheng"), "Tim Zheng", false, "images/people_tim.jpg", LatLng(40.744710, -74.025802)),
  Key("Aaron_B"):Contact(Key("Aaron_B"), "Aaron B", false, "images/people_aaron.png", LatLng(40.744669, -74.028667)),
  Key("Library_Chat"): Contact(Key("Library_Chat"), "Library Chat", true, "images/group_library.jpg", LatLng(0,0)),
  Key("SCSC"):Contact(Key("SCSC"), "Stevens Computer Science Club", true, "images/group_scsc.jpg", LatLng(0,0)),
  Key("Dana_Z"):Contact(Key("Dana_Z"), "Dana Z", false, "images/people_dana.png", LatLng(40.746353, -74.026999)),
  Key("Evan_Y"): Contact(Key("Evan_Y"), "Evan Y", false, "images/people_evan.png", LatLng(40.744134, -74.027707)),
  Key("CS545"): Contact( Key("CS545"), "CS545 Discussion Group", true, "images/group_hci.jpg", LatLng(40.744134, -74.027707)),
  Key("Python_CWI"): Contact(Key("Python_CWI"), "Python CWI", true, "images/people_python.png", LatLng(0,0)),
  Key("Flutter_Google"): Contact(Key("Flutter_Google"), "Flutter Google", true,"images/people_flutter.png", LatLng(0,0)),
};


