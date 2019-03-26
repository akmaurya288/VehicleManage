class DriverDB{

  int _driverID;
  String _driverName;
  String _driverImage;
  int _mobno;
  String _address;
  int _vehicleID;
  String _med;
  String _policeVeri;
  String _licence;
  int _exp;
  String _date;
  String _expiry;
  String _leave;
  //vehcal
  String _plateno;
  String _type;
  String _lastFilledDate;
  int _distanceCovered;
  int _average;
  int _fuelCost;
  int _insuranceCost;
  String _insuranceDuedate;
  String _insurancecompany;
  String _serviceType;
  int _serviceCost;
  String _serviceDate;
  String _serviceWhat;
  String _serviceWhere;
  String _fitnesslast;
  String _fitnessNextDate;
  int _fitnessCost;
  String _pollutionlast;
  String _pollutionNextDate;
  int _pollutionCost;
  String _taxType;
  int _taxCost;
  String _taxDate;
  String _taxNextdate;
  String _taxWhy;



  DriverDB(this._mobno,this._driverName,this._driverImage,this._address,this._vehicleID,this._med,this._policeVeri,this._licence,this._exp,this._date,this._expiry
      ,this._leave,this._plateno,this._type,this._distanceCovered,this._lastFilledDate,this._average,this._fuelCost,
      this._insuranceCost,this._insurancecompany,this._insuranceDuedate,this._serviceType,this._serviceCost,
      this._serviceDate,this._serviceWhat,this._serviceWhere,this._fitnessCost,this._fitnesslast,this._fitnessNextDate,
      this._pollutionCost,this._pollutionlast,this._pollutionNextDate,this._taxCost,this._taxDate,this._taxNextdate,
      this._taxType,this._taxWhy);
  DriverDB.withID(this._driverID,this._mobno,this._driverName,this._driverImage,this._address,this._vehicleID,this._med,this._policeVeri,this._licence,this._exp,this._date,this._expiry
      ,this._leave,this._plateno,this._type,this._distanceCovered,this._lastFilledDate,this._average,this._fuelCost,
  this._insuranceCost,this._insurancecompany,this._insuranceDuedate,this._serviceType,this._serviceCost,
  this._serviceDate,this._serviceWhat,this._serviceWhere,this._fitnessCost,this._fitnesslast,this._fitnessNextDate,
  this._pollutionCost,this._pollutionlast,this._pollutionNextDate,this._taxCost,this._taxDate,this._taxNextdate,
  this._taxType,this._taxWhy);

  String get driverName =>_driverName;
  String get driverImage =>_driverImage;
  int get driverID =>_driverID;
  String get adders =>_address;
  int get vehicleID =>_vehicleID;
  String get policeVeri =>_policeVeri;
  String get licence => _licence;
  String get medical =>_med;
  int get mobno=>_mobno;
  int get exp=>_exp;
  String get date => _date;
  String get expiry => _expiry;
  String get leave => _leave;
  //vehical
  String get plateno =>_plateno;
  String get type =>_type;
  int get distanceCovered =>_distanceCovered;
  String get lastFilledDate =>_lastFilledDate;
  int get average =>_average;
  int get fuelCost =>_fuelCost;
  int get insuranceCost =>_insuranceCost;
  String get insuranceComapny => _insurancecompany;
  String get insuranceDueDate => _insuranceDuedate;
  String get serviceType => _serviceType;
  int get serviceCost => _serviceCost;
  String get servicedate => _serviceDate;
  String get serviceWhat => _serviceWhat;
  String get serviceWhere => _serviceWhere;
  int get fitnessCost => _fitnessCost;
  String get fitnesslast => _fitnesslast;
  String get fitnessNextDate => _fitnessNextDate;
  int get pollutionCost => _pollutionCost;
  String get pollutionlast => _pollutionlast;
  String get pollutionNextDate => _pollutionNextDate;
  int get taxCost => _taxCost;
  String get taxDate => _taxDate;
  String get taxNextDate => _taxNextdate;
  String get taxType => _taxType;
  String get taxWhy => _taxWhy;


  set date(String newDate) {
    _date = newDate;
  }
  set driverName(String newID){
    if(newID.length>0){
      this._driverName=newID;
    }
  }
  set driverImage(String newID){
    if(newID.length>0){
      this._driverImage=newID;
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
  set vehicleID(int newVehicleID){
    if(newVehicleID>0){
      this._vehicleID=newVehicleID;
    }
  }
  set policeVeri(String newPoliceVeri){
    if(newPoliceVeri.length>0){
      this._policeVeri=newPoliceVeri;
    }
  }
  set licence(String newPoliceVeri){
    if(newPoliceVeri.length>0){
      this._licence=newPoliceVeri;
    }
  }
  set medical(String newmedical){
    if(newmedical.length>0){
      this._med=newmedical;
    }
  }
  set leave(String newleave){
    if(newleave.length>0){
      this._leave=newleave;
    }
  }
  set expiry(String newexpiry){
    if(newexpiry.length>0){
      this._expiry=newexpiry;
    }
  }
  set mobno(int newMobno){
    if(newMobno>0){
      this._mobno=newMobno;
    }
  }
  set exp(int newExp){
    if(newExp<50){
      this._exp=newExp;
    }
  }
  //vehical
  set plateno(String newtype){
    if(newtype.length>0){
      this._plateno=newtype;
    }
  }
  set type(String newtype){
    if(newtype.length>0){
      this._type=newtype;
    }
  }
  set distanceCovered(int newdc){
  
      this._distanceCovered=newdc;
    
  }
  set lastFilledDate(String newfd){
    if(newfd.length>0){
      this._lastFilledDate=newfd;
    }
  }
  set average(int newaverage){
    
    this._average= newaverage;
    
  }
  set fuelCost(int newfc){
    if(newfc>0){
      this._fuelCost=newfc;
    }
  }
  set insuranceCost(int newic){
    
      this._insuranceCost=newic;
    
  }
  set insuranceCompany(String newico){
    
      this._insurancecompany=newico;
    
  }
  set insuranceDueDate(String newidd){
 
    this._insuranceDuedate=newidd;
    
  }
  set serviceType(String newst){
    
    this._serviceType=newst;
    
  }
   set serviceCost(int newsc){
    
    this._serviceCost=newsc;
    
  }
   set servicedate(String newsd){
    
    this._serviceDate=newsd;
    
  }
   set serviceWhat(String newsw){
    
    this._serviceWhat=newsw;
    
  }
   set serviceWhere(String newsw){
    
    this._serviceWhere=newsw;
    
  }
   set fitnessCost(int newfc){
    
    this._fitnessCost=newfc;
    
  }
   set fitnesslast(String newfl){
    
    this._fitnesslast=newfl;
    
  }
   set fitnessNextDate(String newnd){
    
    this._fitnessNextDate=newnd;
    
  }
   set pollutionCost(int newpc){
    
    this._pollutionCost=newpc;
    
  } set pollutionlast(String newfl){
    
    this._pollutionlast=newfl;
    
  }
  set pollutionNextDate(String newnd){
    
    this._pollutionNextDate=newnd;
    
  }
  set taxDate(String newtd){
    
    this._taxDate=newtd;
    
  }
  set taxCost(int newtc){
    
    this._taxCost=newtc;
    
  }
  set taxNextDate(String newnd){
    
    this._taxNextdate=newnd;
    
  }
  set taxType(String newtp){
    
    this._taxType=newtp;
    
  }
   set taxWhy(String newtw){
    
    this._taxWhy=newtw;
    
  }
  Map<String,dynamic>toDriverMap(){
    var map=Map<String,dynamic>();
    if(driverID != null){
      map['driverID'] = _driverID;
    }
    map['driverName']=_driverName;
    map['driverImage']=_driverImage;
    map['driverID']=_driverID;
    map['exp']=_exp;
    map['mobno']=_mobno;
    map['medical']=_med;
    map['policeVeri']=_policeVeri;
    map['licence']=_licence;
    map['address']=_address;
    map['expiry']=_expiry;
    map['leave']=_leave;
    map['vehicleID']=vehicleID;
    return map;
  }
  DriverDB.fromVehicleList(dynamic map){
    this._plateno=map['plateno'] ;
  }
  DriverDB.fromDriverMapObject(dynamic map){
    this._driverName=map['driverName'];
    this._driverImage=map['driverImage'];
    this._driverID=map['driverID'];
    this._exp=map['exp'];
    this._mobno=map['mobno'];
    this._med=map['medical'];
    this._policeVeri=map['policeVeri'];
    this._licence=map['licence'];
    this._address=map['address'];
    this._expiry=map['expiry'];
    this._leave=map['leave'];
    this._vehicleID=map['vehicleID'];
  }
  Map<String,dynamic>toVehicleMap(){
    var map=Map<String,dynamic>();
    if(vehicleID != null){
      map['vehicleID'] = _vehicleID;
    }
    map['plateno']=_plateno;
    map['type']=_type;
    map['distanceCovered']=_distanceCovered;
    map['lastFilledDate']=_lastFilledDate;
    map['average']=_average;
    map['fuelCost']=_fuelCost;
    map['insuranceCost']=_insuranceCost;
    map['insuranceCompany']=_insurancecompany;
    map['insuranceDueDate']=_insuranceDuedate;
    map['serviceType']=_serviceType;
    map['serviceCost']=_serviceCost;
    map['serviceWhat']=_serviceWhat;
    map['serviceWhere']=_serviceWhere;
    map['fitnessCost']=_fitnessCost;
    map['fitnesslast']=_fitnesslast;
    map['fitnessNextDate']=_fitnessNextDate;
    map['pollutionCost']= _pollutionCost;
    map['pollutionlast']=_pollutionlast;
    map['pollutionNextDate']=_pollutionNextDate;
    map['taxNextDate']= _taxNextdate;
    map['taxCost']= _taxCost;
    map['taxType']= _taxType;
    map['taxWhy']= _taxWhy;
    map['taxDate']= _taxDate;
    return map;
  }
  DriverDB.fromVehicleMapObject(dynamic map){
    this._vehicleID=map['vehicleID'];
    this._plateno=map['plateno'];
    this._type=map['type'];
    this._distanceCovered=  map['distanceCovered'];
    this._lastFilledDate=map['lastFilledDate'];
    this._average=map['average'];
    this._fuelCost=map['fuelCost'];
    this._insuranceCost= map['insuranceCost'];
    this._insurancecompany=map['insuranceCompany'];
    this._insuranceDuedate=map['insuranceDueDate'];
    this._serviceType= map['serviceType'];
    this._serviceCost=map['serviceCost'];
    this._serviceWhat=map['serviceWhat'];
    this._serviceWhere=map['serviceWhere'];
    this._fitnessCost=map['fitnessCost'];
    this._fitnesslast=map['fitnesslast'];
    this._fitnessNextDate= map['fitnessNextDate'];
    this. _pollutionCost= map['pollutionCost'];
    this._pollutionlast=map['pollutionlast'];
    this._pollutionNextDate=  map['pollutionNextDate'];
    this. _taxNextdate= map['taxNextDate'];
    this. _taxCost=map['taxCost'];
    this._taxType=map['taxType'];
    this._taxWhy= map['taxWhy'];
    this._taxDate=map['taxDate'];
  }
  DriverDB.fromVehicleListMapObject(dynamic map){
    this._plateno=map['plateno'];
    this._vehicleID=map['vehicleID'];
  }
}