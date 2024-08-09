import 'package:advanced_calculator/src/model/unique_converter.dart';
import 'package:advanced_calculator/src/view/screen/calculator_screen.dart';
import 'package:flutter/material.dart';

class ResultProvider extends ChangeNotifier{
  String senttoUniqueConverter="";
  String showtoScreenResultValue="0";
  List<String> pastUniqueConverterList=[];

  String readtoProcessResult(){
    return showtoScreenResultValue;
  }


  void addtoProcess(String process){

    if(process=="<-")
    {
      if(pastUniqueConverterList.isNotEmpty)
      {
        String lastElement=pastUniqueConverterList.last;
        pastUniqueConverterList.remove(lastElement);
        int index=senttoUniqueConverter.lastIndexOf(lastElement);
        senttoUniqueConverter=senttoUniqueConverter.substring(0,index);
      }
      else
      {
        senttoUniqueConverter="";
      } 
      
    }
    else if(process=="="){
      resultProcess();
    }
    else if(process=="C"){
      senttoUniqueConverter="";
      showtoScreenResultValue="0";
      pastUniqueConverterList=[];
      notifyListeners();
    }
    else
    {
      pastUniqueConverterList.add(process);
      senttoUniqueConverter+=process;
    }
  }

  void resultProcess()
  {
    showtoScreenResultValue=UniqueConverter.resultString(
    UniqueConverter.convertString(senttoUniqueConverter));
    notifyListeners();
  }
}