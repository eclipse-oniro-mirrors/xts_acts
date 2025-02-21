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

import { describe, expect, it, afterEach, afterAll, beforeAll } from '@ohos/hypium';
import http from '@ohos.net.http';
import mdns from "@ohos.net.mdns";
import connection from "@ohos.net.connection";

let httpRequest = http.createHttp();
let address_baidu = "https://www.baidu.com";
let address_post = "https://httpbin.org/post";

let httpRequestOptions_post: http.HttpRequestOptions = {
  method: http.RequestMethod.POST,
  extraData: "MineMine",
  header: { 'Content-Type': 'application/json' },
  readTimeout: 60000,
  connectTimeout: 60000
};
let httpRequestOptions_get: http.HttpRequestOptions = {
  method: http.RequestMethod.GET,
  extraData: "MineMine ",
  header: { ' Content-Type': ' application/json' },
  readTimeout: 60000,
  connectTimeout: 60000
};

function dataSendProgress_on_callback(data: http. DataSendProgressInfo) {
  console.log("dataSendProgress_on_callback receive len: " + JSON.stringify(data));
  let sendSize = data.sendSize;
  let totalSize = data.totalSize;
  console.log("dataSendProgress_on_callback sendSize: " + JSON.stringify(sendSize) +
    " , dataSendProgress_on_callback totalSize: " + JSON.stringify(totalSize));
}
function dataReceiveProgress_on_callback (data: http . DataReceiveProgressInfo) {
  console.log("dataReceiveProgress_on_callback receive len: " + JSON.stringify(data));
  let receiveSize = data.receiveSize;
  let totalSize = data.totalSize;
  console.log("dataReceiveProgress_on_callback sendSize: " + JSON.stringify(receiveSize) +
    " ,dataReceiveProgress_on_callback totalSize: " + JSON.stringify(totalSize));
}
function netConnectionPropertiesChange_on_callback(data: connection.NetConnectionPropertyInfo) {
  console.log("netConnectionPropertiesChange_on_callback " + JSON.stringify(data));
  let netHandle = data.netHandle;
  let connectionProperties = data.connectionProperties;
  console.log("netConnectionPropertiesChange_on_callback netHandle: " + JSON.stringify(netHandle) +
    " ,netConnectionPropertiesChange_on_callback connectionProperties: " + JSON.stringify(connectionProperties));
}
function netBlockStatusChange_on_callback(data: connection.NetBlockStatusInfo) {
  console.log("netBlockStatusChange_on_callback " + JSON.stringify(data));
  let netHandle = data.netHandle;
  let blocked = data.blocked;
  console.log("netBlockStatusChange_on_callback netHandle: " + JSON.stringify(netHandle) +
    " ,netBlockStatusChange_on_callback blocked: " + JSON.stringify(blocked));
}
function stopSearching(data: mdns.DiscoveryEventInfo) {
  console.log("stopSearching_on_callback: " + JSON.stringify(data));
  let serviceInfo = data.serviceInfo;
  let errorCode = data.errorCode;
  console.log("stopSearching_on_callback serviceInfo: " + JSON.stringify(serviceInfo) +
    " , stopSearching_on_callback errorCode: " + JSON.stringify(errorCode));
}
function expectFalse() {
  try {
    expect().assertFail();
  } catch (err) {
    console.info('assertion failure');
  }
};

export default function NetworkManagerAddAPI11() {
  beforeAll(async () => {
    console.log('NetworkManagerAddAPI11 beforeAll start');
    console.log('NetworkManagerAddAPI11 beforeAll end');
  });
  describe("NetworkManagerAddAPI11", () => {
    /**
     * @tc.number SUB_Telephony_netstack_Http_Connection_Xts_0300
     * @tc.name connection::on
     * @tc.desc Test on property
     * @tc.level 1
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_Telephony_netstack_Http_Connection_Xts_0300", 0, async (done: Function) => {
      let caseName = "SUB_Telephony_netstack_Http_Connection_Xts_0300";
      let netConnect = connection.createNetConnection();
      netConnect.register((error) => {
        if (error) {
          console.log(`${caseName} register fail ${error}`);
          expectFalse();
          done();
        } else {
          console.log(`${caseName} register success`);
          expect(error == undefined).assertTrue();
          try {
            netConnect.on('netConnectionPropertiesChange', netConnectionPropertiesChange_on_callback);
          } catch (error) {
            console.log(`${caseName} on(netConnectionPropertiesChange) fail`);
            expectFalse();
            done();
          }
          setTimeout(() => {
            netConnect.unregister((error) => {
              if (error) {
                console.log(`${caseName} unregister fail ${error}`);
                expectFalse();
                done();
              } else {
                console.log(`${caseName} unregister success`);
                expect(error == undefined).assertTrue();
                done();
              }
            });
          }, 3000);
        }
      });
    });
    /**
     * @tc.number SUB_Telephony_netstack_Http_Connection_Xts_0400
     * @tc.name connection::on
     * @tc.desc Test on property
     * @tc.level 1
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_Telephony_netstack_Http_Connection_Xts_0400", 0, async (done: Function) => {
      let caseName = "SUB_Telephony_netstack_Http_Connection_Xts_0400";
      let netConnect = connection.createNetConnection();
      netConnect.register((error) => {
        if (error) {
          console.log(`${caseName} register fail ${error}`);
          expectFalse();
          done();
        } else {
          console.log(`${caseName} register success`);
          expect(error == undefined).assertTrue();
          try {
            netConnect.on('netBlockStatusChange', netBlockStatusChange_on_callback);
          } catch (error) {
            console.log(`${caseName} on(netBlockStatusChange) fail`);
            expectFalse();
            done();
          }
          setTimeout(() => {
            netConnect.unregister((error) => {
              if (error) {
                console.log(`${caseName} unregister fail ${error}`);
                expectFalse();
                done();
              } else {
                console.log(`${caseName} unregister success`);
                expect(error == undefined).assertTrue();
                done();
              }
            });
          }, 3000);
        }
      });
    });
  });
}