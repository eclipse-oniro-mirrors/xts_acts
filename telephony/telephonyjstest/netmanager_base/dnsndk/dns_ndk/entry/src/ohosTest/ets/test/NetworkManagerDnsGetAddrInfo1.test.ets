/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import { describe, expect, it, afterEach, afterAll, Level, Size, TestType } from '@ohos/hypium';
import testNapi from 'libtestDnsNdk.so'


function expectFalse() {
  try {
    expect().assertFail();
  } catch (err) {
    console.info('assertion failure');
  }
};

export default function NetworkManagerDnsGetAddrInfo1Test() {
  describe("NetworkManagerDnsGetAddrInfo1Test", () => {
    let hostaddr_valid = 'www.baidu.com'
    let hostaddr_invalid = ''
    let serv = ''
    let netid_default = 0
    let netid_valid = 100
    let netid_invalid = 10
    let netid_unreachable = 99999
    let function_valid = 0
    let function_null = 1

    /* *
    * @tc.number  NETWORKMANAGER_DNS_GETADDRINFO_0200
    * @tc.name    getAddrInfo
    * @tc.desc    check get DNS result
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level 2
    */
    it("NetworkManager_Dns_GetAddrInfo_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = "NetworkManager_Dns_GetAddrInfo_0200"
      let status = testNapi.getaddrinfo(hostaddr_invalid, serv, netid_default);
      if (status != 401) {
        console.log(`${caseName} failed, err: ${JSON.stringify(status)}`);
        expectFalse();
        done();
      } else {
        console.log(`${caseName} success, data: ${JSON.stringify(status)}`);
        expect(status).assertEqual(401);
        done();
      }
    });

    /* *
    * @tc.number  NETWORKMANAGER_DNS_GETADDRINFO_0300
    * @tc.name    getAddrInfo
    * @tc.desc    check get DNS result
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level 0
    */
    it("NetworkManager_Dns_GetAddrInfo_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = "NetworkManager_Dns_GetAddrInfo_0300"
      let status = testNapi.getaddrinfo(hostaddr_valid, serv, netid_invalid);
      if (status != 401) {
        console.log(`${caseName} failed, err: ${JSON.stringify(status)}`);
        expectFalse();
        done();
      } else {
        console.log(`${caseName} success, data: ${JSON.stringify(status)}`);
        expect(status).assertEqual(401);
        done();
      }
    });

    /* *
    * @tc.number  NETWORKMANAGER_DNS_GETADDRINFO_0400
    * @tc.name    getAddrInfo
    * @tc.desc    check get DNS result
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level 2
    */
    it("NetworkManager_Dns_GetAddrInfo_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = "NetworkManager_Dns_GetAddrInfo_0400"
      let status = testNapi.getaddrinfo(hostaddr_valid, serv, netid_unreachable);
      if (status != 2100003) {
        console.log(`${caseName} failed, err: ${JSON.stringify(status)}`);
        expectFalse();
        done();
      } else {
        console.log(`${caseName} success, data: ${JSON.stringify(status)}`);
        expect(status).assertEqual(2100003);
        done();
      }
    });

    /* *
    * @tc.number  NetworkManager_Dns_RegisterDnsResolver_0100
    * @tc.name    registerdnsresolver
    * @tc.desc    check register dns resolver
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level 0
    */
    it("NetworkManager_Dns_RegisterDnsResolver_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = "NetworkManager_Dns_RegisterDnsResolver_0100"
      let status = testNapi.registerdnsresolver(function_valid);
      if (status != 0) {
        console.log(`${caseName} failed, err: ${JSON.stringify(status)}`);
        expectFalse();
        done();
      } else {
        console.log(`${caseName} success, data: ${JSON.stringify(status)}`);
        expect(status).assertEqual(0);
        done();
      }
    });

    /* *
    * @tc.number  NetworkManager_Dns_RegisterDnsResolver_0200
    * @tc.name    registerdnsresolver
    * @tc.desc    check register dns resolver
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level 2
    */
    it("NetworkManager_Dns_RegisterDnsResolver_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = "NetworkManager_Dns_RegisterDnsResolver_0200"
      let status = testNapi.registerdnsresolver(function_null);
      if (status != 401) {
        console.log(`${caseName} failed, err: ${JSON.stringify(status)}`);
        expectFalse();
        done();
      } else {
        console.log(`${caseName} success, data: ${JSON.stringify(status)}`);
        expect(status).assertEqual(401);
        done();
      }
    });
  })
}
