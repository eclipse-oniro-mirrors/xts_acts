/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
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

import { describe, expect, it, afterEach, afterAll, beforeAll, TestType, Size, Level  } from '@ohos/hypium';
import http from '@ohos.net.http';
import connection from '@ohos.net.connection';

let httpProxy:http.HttpProxy = {
  host: "8.8.8.8",
  port: 5555,
  exclusionList: ["12", "13"],
  username: "",
  password: ""
};
let httpProxy1:http.HttpProxy = {
  host: "9.9.9.9",
  port: 8888,
  exclusionList: ["15", "16"]
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

function expectFalse() {
  try {
    expect().assertFail();
  } catch (err) {
    console.info('assertion failure');
  }
};

export default function NetworkManagerAppProxyTest() {
  beforeAll(async ()=>{
    console.log('NetworkManagerAppProxyTest beforeAll start');
    console.log('NetworkManagerAppProxyTest beforeAll end');
  });

  describe("NetworkManagerAppProxyTest", ()=> {
    /**
     * @tc.number: SUB_Telephony_netstack_App_Proxy_Xts_0100
     * @tc.name: testTelephonynetstackAppProxyXts0100
     * @tc.desc: Setting Application-Level Proxy.
     * @tc.level 0
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("testTelephonynetstackAppProxyXts0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let caseName = "testTelephonynetstackAppProxyXts0100";
      let result = connection.setAppHttpProxy(httpProxy);
      if (result != undefined) {
        console.log(`${caseName} setAppHttpProxy fail ${JSON.stringify(result)}`);
        expectFalse();
        done();
      }else {
        console.log(`${caseName} setAppHttpProxy success ${JSON.stringify(result)}`);
        expect(result == undefined).assertTrue();
        done();
      }
    });
    /**
     * @tc.number: SUB_Telephony_netstack_App_Proxy_Xts_0200
     * @tc.name: testTelephonynetstackAppProxyXts0200
     * @tc.desc: Setting Application-Level Proxy.
     * @tc.level 0
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("testTelephonynetstackAppProxyXts0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let caseName = "testTelephonynetstackAppProxyXts0200";
      let result = connection.setAppHttpProxy(httpProxy2);
      if (result != undefined) {
        console.log(`${caseName} setAppHttpProxy fail ${JSON.stringify(result)}`);
        expectFalse();
        done();
      }else {
        console.log(`${caseName} setAppHttpProxy success ${JSON.stringify(result)}`);
        expect(result == undefined).assertTrue();
        done();
      }
    });
    /**
     * @tc.number: SUB_Telephony_netstack_App_Proxy_Xts_0300
     * @tc.name: testTelephonynetstackAppProxyXts0300
     * @tc.desc: Setting Application-Level Proxy.
     * @tc.level 0
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("testTelephonynetstackAppProxyXts0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let caseName = "testTelephonynetstackAppProxyXts0300";
      let result = connection.setAppHttpProxy(httpProxy3);
      if (result != undefined) {
        console.log(`${caseName} setAppHttpProxy fail ${JSON.stringify(result)}`);
        expectFalse();
        done();
      }else {console.log(`${caseName} setAppHttpProxy success ${JSON.stringify(result)}`);
        expect(result == undefined).assertTrue();
        done();
      }
    });
    /**
     * @tc.number: SUB_Telephony_netstack_App_Proxy_Xts_0400
     * @tc.name: testTelephonynetstackAppProxyXts0400
     * @tc.desc: Setting Application-Level Proxy.
     * @tc.level 0
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("testTelephonynetstackAppProxyXts0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let caseName = "testTelephonynetstackAppProxyXts0400";
      let result = connection.setAppHttpProxy(httpProxy4);
      if (result != undefined) {
        console.log(`${caseName} setAppHttpProxy fail ${JSON.stringify(result)}`);
        expectFalse();
        done();
      }else {console.log(`${caseName} setAppHttpProxy success ${JSON.stringify(result)}`);
        expect(result == undefined).assertTrue();
        done();
      }
    });
    /**
     * @tc.number: SUB_Telephony_netstack_App_Proxy_Xts_0500
     * @tc.name: Setting Application-Level Proxy.
     * @tc.desc: Function test
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_Telephony_netstack_App_Proxy_Xts_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function)=> {
      let caseName = "SUB_Telephony_netstack_App_Proxy_Xts_0500";
      connection.setAppHttpProxy(httpProxy);
      connection.getDefaultHttpProxy((err,data)=> {
        if (err) {
          console.log(`${caseName} getDefaultHttpProxy fail ${JSON.stringify(err)}`);
          expectFalse();
          done();
        }else {
          console.log(`${caseName} getDefaultHttpProxy success ${JSON.stringify(data)}`);
          expect(data.host).assertEqual("8.8.8.8");
          expect(data.port).assertEqual(5555);
          expect(data.exclusionList[0]).assertEqual("12");
          expect(data.exclusionList[1]).assertEqual("13");
          done();
        }
      });
    });
  });
}
