import 'dart:core';

import 'package:flutter/cupertino.dart';

class Config{
  String authUri = "http://10.174.18.254:4777";
  String coreUri = "http://10.174.18.254:5550";
}

/*
Auth:

mutation{
  login(login: "login", password: "pass"){
    token
    refreshToken
      user{
    id
    login
    email
    phone
    name
    role
    banned
    countIncorrects
    createdAt
    updatedAt
  }
  }
}

 */

/*
get configurations

query{
  allGasMeterConfigurations( perPage: 1000, filter: {q: "260"}){
    id
    name
    description
    deleted
    status
    type
    ns
    parameterSet
    functionalGroupSet
    protocolSet
    schedulerSet
    scadaSet
    converterSet
    metaTemplate
  }
}
 */