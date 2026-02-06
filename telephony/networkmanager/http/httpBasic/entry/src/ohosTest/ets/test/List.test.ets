import NetworkManagerCaPathTest from './HttpCaPathTest.test';
import HttpUsingProtocolTest from './HttpUsingProtocolTest.test';
import HttpCacheTest from './HttpCacheTest.test';
import HttpRequestInStreamTest from './HttpRequestOnDataTest.test';
import HttpBasicTest from './HttpBasicTest.test';

import connection from '@ohos.net.connection';
import EmptyTest from './Empty.test';

let netHandle = connection.getDefaultNetSync();
export default function testsuite() {

  if(netHandle.netId !=0 && canIUse("SystemCapability.Communication.NetStack")){
    NetworkManagerCaPathTest();
    HttpUsingProtocolTest();
    HttpCacheTest();
    HttpRequestInStreamTest();
    HttpBasicTest();
  }else {
    EmptyTest();
  }

}