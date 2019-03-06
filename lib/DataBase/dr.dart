class DriverDBAdd{

  String _DriverName;
  String _DriverLiID;
  int _Phoneno;
  String _Adders;
  int _Mobno;
  String _VehicalID;
  String _med;
  String _PoliceVeri;
  int _Exp;
  String _date;

DriverDBAdd(this._DriverName,this._Phoneno,this._Adders,this._Mobno,this._VehicalID,this._med,this._PoliceVeri,this._Exp,this._DriverLiID,this._date);

  String get DriverName =>_DriverName;
  String get DriverLiID =>_DriverLiID;
  int get Phoneno=>_Phoneno;
  String get Adders =>_Adders;
  String get VehicalID =>_VehicalID;
  String get PoliceVeri =>_PoliceVeri;
  String get medical =>_med;
  int get Mobno=>_Mobno;
  int get Exp=>_Exp;
  String get date => _date;

  set date(String newDate) {
    _date = newDate;
  }
  set DriverName(String newID){
    if(newID.length>0){
      this._DriverName=newID;
    }
  }
  set DriverLiID(String newID){
  if(newID.length>0){
    this._DriverLiID=newID;
  }
  }
  set Phoneno(int newPhoneno){
  if(newPhoneno>0&&newPhoneno<11){
    this._Phoneno=newPhoneno;
  }
  }
  set Adders(String newAdders){
  if(newAdders.length>0){
    this._Adders=newAdders;
  }
  }
set VehicalID(String newVehicalID){
  if(newVehicalID.length>0){
    this._VehicalID=newVehicalID;
  }
}
set PoliceVeri(String newPoliceVeri){
  if(newPoliceVeri.length>0){
    this._PoliceVeri=newPoliceVeri;
  }
}
set medical(String newmedical){
  if(newmedical.length>0){
    this._med=newmedical;
  }
}
  set Mobno(int newMobno){
  if(newMobno>0&&newMobno<11){
    this._Mobno=newMobno;
  }
}
  set Exp(int newExp){
  if(newExp<2){
    this._Exp=newExp;
  }
}
 Map<String,dynamic>toMap(){
   var map=Map<String,dynamic>();
   map['DriverName']=_DriverName;
   map['DriverLiID']=_DriverLiID;
   map['Exp']=_Exp;
   map['Mobno']=_Mobno;
   map['medical']=_med;
   map['PoliceVeri']=_PoliceVeri;
   map['Adders']=_Adders;
   map['Phoneno']=_Phoneno;
   return map;
 }
DriverDBAdd.fromMapObject(dynamic map){
  this._DriverName=map['DriverName'];
  this._DriverLiID=map['DriverLiID'];
   this._Exp=map['Exp'];
   this._Mobno=map['Mobno'];
   this._med=map['medical'];
   this._PoliceVeri=map['PoliceVeri'];
   this._Adders=map['Adders'];
   this._Phoneno= map['Phoneno'];
 }
}