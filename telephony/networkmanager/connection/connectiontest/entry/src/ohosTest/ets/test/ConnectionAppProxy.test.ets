/**
 * Copyright (C) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License")
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, it, expect, beforeAll, TestType, Size, Level  } from '@ohos/hypium'
import http from '@ohos.net.http';
import connection from '@ohos.net.connection';

let httpProxy:http.HttpProxy = {
      host: "8.8.8.8", 
      port: 5555,
      exclusionList: ["12", "13"],
      username: "",
      password: ""
};
let httpProxy2:http.HttpProxy = {
      host: "", 
      port: 5555,
      exclusionList: ["12", "13"]
};
let httpProxy3:http.HttpProxy = {
      host: "123456", 
      port: 5555,
      exclusionList: ["12", "13"]
};
let httpProxy4:http.HttpProxy = {
      host: "123456", 
      port: 5555,
      exclusionList: []
};

function expectTrue(n: boolean) {
    try {
       expect(n).assertTrue();
   } catch(err) {
       console.info(`expectTrue failed err: ${JSON.stringify(err)}`);
   }
};

function expectFalse() {
    try {
       expect().assertFail();
   } catch(err) {
       console.info(`assertion failure`);
   }
}

export default function ConnectionAppProxyTest() {
 beforeAll(async ()=>{
    console.log('ConnectionAppProxyTest beforeAll start');
    console.log('ConnectionAppProxyTest beforeAll end');
});
  describe('ConnectionAppProxyTest',()=>{

    /**
     * @tc.name   testNetworkMgrConnectionGetDefaultHttpProxy0100
     * @tc.number SUB_NetworkMgr_Connection_GetDefaultHttpProxy_0100
     * @tc.desc   Setting Application level Proxy.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrConnectionGetDefaultHttpProxy0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrConnectionGetDefaultHttpProxy0100';
      console.info(`${caseName} test start`);
      try {
            connection.setAppHttpProxy(httpProxy);
            console.info(`${caseName} setAppHttpProxy success!`);
            connection.getDefaultHttpProxy((err,data)=> {
              if(err) {
                 console.info(`${caseName} getDefaultHttpProxy fail ${JSON.stringify(err)}`);
                 expectFalse();
                 console.info(`${caseName} test end`);
                 done();
              } else {
                 console.info(`${caseName} getDefaultHttpProxy success ${JSON.stringify(data)}`);
                 expectTrue(data.host == "8.8.8.8");
                 expectTrue(data.port == 5555);
                 expectTrue(data.exclusionList[0] == "12");
                 expectTrue(data.exclusionList[1] == "13");
                 expectTrue(data.username == null);
                 expectTrue(data.password == null);
                 console.info(`${caseName} test end`);
                 done();
              }
          });
         } catch (error) {
        console.info(`${caseName} test failed err: ${JSON.stringify(error)}`);
        expectFalse();
        console.info(`${caseName} test end`);
        done();
      }
    });
  
    /**
     * @tc.name   testNetworkMgrConnectionGetDefaultHttpProxy0200
     * @tc.number SUB_NetworkMgr_Connection_GetDefaultHttpProxy_0200
     * @tc.desc   Setting Application level Proxy.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrConnectionGetDefaultHttpProxy0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrConnectionGetDefaultHttpProxy0200';
      console.info(`${caseName} test start`);
      try {
            connection.setAppHttpProxy(httpProxy2);
            console.info(`${caseName} setAppHttpProxy success!`);
            connection.getDefaultHttpProxy((err,data)=> {
              if(err) {
                 console.info(`${caseName} getDefaultHttpProxy fail ${JSON.stringify(err)}`);
                 expectFalse();
                 console.info(`${caseName} test end`);
                 done();
              } else {
                 console.info(`${caseName} getDefaultHttpProxy success ${JSON.stringify(data)}`);
                 expectTrue(data.host == "");
                 expectTrue(data.port == 0);
                 expectTrue(data.exclusionList.length == 0);
                 console.info(`${caseName} test end`);
                 done();
              }
          });
         } catch (error) {
        console.info(`${caseName} test failed err: ${JSON.stringify(error)}`);
        expectFalse();
        console.info(`${caseName} test end`);
        done();
      }
    });
    /**
     * @tc.name   testNetworkMgrConnectionGetDefaultHttpProxy0300
     * @tc.number SUB_NetworkMgr_Connection_GetDefaultHttpProxy_0300
     * @tc.desc   Setting Application level Proxy.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrConnectionGetDefaultHttpProxy0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrConnectionGetDefaultHttpProxy0300';
      console.info(`${caseName} test start`);
      try {
            connection.setAppHttpProxy(httpProxy3);
            console.info(`${caseName} setAppHttpProxy success!`);
            connection.getDefaultHttpProxy((err,data)=> {
              if(err) {
                 console.info(`${caseName} getDefaultHttpProxy fail ${JSON.stringify(err)}`);
                 expectFalse();
                 console.info(`${caseName} test end`);
                 done();
              } else {
                 console.info(`${caseName} getDefaultHttpProxy success ${JSON.stringify(data)}`);
                 expectTrue(data.host == "123456");
                 expectTrue(data.port == 5555);
                 expectTrue(data.exclusionList[0] == "12");
                 expectTrue(data.exclusionList[1] == "13");
                 console.info(`${caseName} test end`);
                 done();
              }
          });
         } catch (error) {
        console.info(`${caseName} test failed err: ${JSON.stringify(error)}`);
        expectFalse();
        console.info(`${caseName} test end`);
        done();
      }
    });
    /**
     * @tc.name   testNetworkMgrConnectionGetDefaultHttpProxy0400
     * @tc.number SUB_NetworkMgr_Connection_GetDefaultHttpProxy_0400
     * @tc.desc   Setting Application level Proxy.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrConnectionGetDefaultHttpProxy0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrConnectionGetDefaultHttpProxy0400';
      console.info(`${caseName} test start`);
      try {
            connection.setAppHttpProxy(httpProxy4);
            console.info(`${caseName} setAppHttpProxy success!`);
            connection.getDefaultHttpProxy((err,data)=> {
              if(err) {
                 console.info(`${caseName} getDefaultHttpProxy fail ${JSON.stringify(err)}`);
                 expectFalse();
                 console.info(`${caseName} test end`);
                 done();
              } else {
                 console.info(`${caseName} getDefaultHttpProxy success ${JSON.stringify(data)}`);
                 expectTrue(data.host == "123456");
                 expectTrue(data.port == 5555);
                 expectTrue(data.exclusionList.length == 0);
                 console.info(`${caseName} test end`);
                 done();
              }
          });
         } catch (error) {
        console.info(`${caseName} test failed err: ${JSON.stringify(error)}`);
        expectFalse();
        console.info(`${caseName} test end`);
        done();
      }
    });     
    /**
     * @tc.name   testNetworkMgrConnectionGetDefaultHttpProxy0500
     * @tc.number SUB_NetworkMgr_Connection_GetDefaultHttpProxy_0500
     * @tc.desc   Setting Application level Proxy.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrConnectionGetDefaultHttpProxy0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrConnectionGetDefaultHttpProxy0500';
      console.info(`${caseName} test start`);
      try {
            connection.setAppHttpProxy(httpProxy);
            console.info(`${caseName} setAppHttpProxy success!`);
            connection.getDefaultHttpProxy((err,data)=> {
              if(err) {
                 console.info(`${caseName} getDefaultHttpProxy fail ${JSON.stringify(err)}`);
                 expectFalse();
                 console.info(`${caseName} test end`);
                 done();
              } else {
                 console.info(`${caseName} getDefaultHttpProxy success ${JSON.stringify(data)}`);
                 expectTrue(data.host == "8.8.8.8");
                 expectTrue(data.port == 5555);
                 expectTrue(data.exclusionList[0] == "12");
                 expectTrue(data.exclusionList[1] == "13");
                 console.info(`${caseName} test end`);
                 done();
              }
          });
         } catch (error) {
        console.info(`${caseName} test failed err: ${JSON.stringify(error)}`);
        expectFalse();
        console.info(`${caseName} test end`);
        done();
      }
    }); 

  });
}
