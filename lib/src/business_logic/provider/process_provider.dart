import 'package:flutter/material.dart';

class ProcessProvider extends ChangeNotifier{
  String procesString="";
  List<String> pastProcessList=[];

  String readtoProcess(){
    return procesString;
  }

  void addtoProcess(String process){
    if(process=="<-")
    {
      if(pastProcessList.isNotEmpty)
      {
        String lastElement=pastProcessList.last;
        pastProcessList.remove(lastElement);
        int index=procesString.lastIndexOf(lastElement);
        procesString=procesString.substring(0,index);
      }
      else
      {
        procesString="";
      } 
      
    }
    else if(process=="C"){
      procesString="";
      pastProcessList=[];
    }
    else
    {
      pastProcessList.add(process);
      procesString+=process;
    }
    notifyListeners();
  }
}