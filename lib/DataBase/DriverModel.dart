class DriverDB{

  int _driverID;
  String _driverName;
  int _mobno;
  String _address;
  String _vehicalID;
  String _med;
  String _policeVeri;
  int _exp;
  String _date;
  String _expiry;
  String _leave;



  DriverDB(this._driverName,this._mobno,this._address,this._vehicalID,this._med,this._policeVeri,this._exp,this._date,this._expiry,this._leave);
  DriverDB.withID(this._driverID,this._mobno,this._driverName,this._address,this._vehicalID,this._med,this._policeVeri,this._exp,this._date,this._expiry
      ,this._leave);

  String get driverName =>_driverName;
  int get driverID =>_driverID;
  String get adders =>_address;
  String get vehicalID =>_vehicalID;
  String get policeVeri =>_policeVeri;
  String get medical =>_med;
  int get mobno=>_mobno;
  int get exp=>_exp;
  String get date => _date;
  String get expiry => _expiry;
  String get leave => _leave;


  set date(String newDate) {
    _date = newDate;
  }
  set driverName(String newID){
    if(newID.length>0){
      this._driverName=newID;
    }
  }
  set driverID(int newID){
    if(newID>0){
      this._driverID=newID;
    }
  }
  set adders(String newAdders){
    if(newAdders.length>0){
      this._address=newAdders;
    }
  }
  set vehicalID(String newVehicalID){
    if(newVehicalID.length>0){
      this._vehicalID=newVehicalID;
    }
  }
  set policeVeri(String newPoliceVeri){
    if(newPoliceVeri.length>0){
      this._policeVeri=newPoliceVeri;
    }
  }
  set medical(String newmedical){
    if(newmedical.length>0){
      this._med=newmedical;
    }
  }
  set leave(String newleave){
    if(newleave.length>0){
      this._med=newleave;
    }
  }
  set expiry(String newexpiry){
    if(newexpiry.length>0){
      this._expiry=newexpiry;
    }
  }
  set mobno(int newMobno){
    if(newMobno>0&&newMobno<11){
      this._mobno=newMobno;
    }
  }
  set exp(int newExp){
    if(newExp<2){
      this._exp=newExp;
    }
  }
  Map<String,dynamic>toMap(){
    var map=Map<String,dynamic>();
    if(driverID != null){
      map['ID'] = _driverID;
    }
    map['driverName']=_driverName;
    map['driverID']=_driverID;
    map['exp']=_exp;
    map['mobno']=_mobno;
    map['medical']=_med;
    map['policeVeri']=_policeVeri;
    map['address']=_address;
    map['expiry']=_expiry;
    map['leave']=_leave;
    return map;
  }
  DriverDB.fromMapObject(dynamic map){
    this._driverName=map['driverName'];
    this._driverID=map['driverID'];
    this._exp=map['exp'];
    this._mobno=map['mobno'];
    this._med=map['medical'];
    this._policeVeri=map['policeVeri'];
    this._address=map['address'];
    this._expiry=map['expiry'];
    this._leave=map['leave'];
  }





}