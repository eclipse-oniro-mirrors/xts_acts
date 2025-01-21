/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

import { describe, it, expect } from '@ohos/hypium'
import network, { NetworkResponse } from '@system.network';

const ExpectTrue: (n: boolean, caseName?: string) => void = (n: boolean, caseName?: string) => {
  try {
    expect(n).assertTrue();
  } catch {
    console.info(`${caseName} expect failed `);
  }
}

export default function networkManagerWithWifiTest() {
  describe('NetworkManagerWithWifiTest', () => {

    /* *
   * @tc.number: SUB_NetworkMgr_Network_Subscribe_0600
   * @tc.name  : testNetworkMgrNetworkSubscribe0600
   * @tc.desc  : Subscribe to the network connection status of the current device;wifi.
   * @tc.size  : MediumTest
   * @tc.type  : Function
   * @tc.level : level 3
   */
    it('testNetworkMgrNetworkSubscribe0600', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrNetworkSubscribe0600';
      console.info(`${caseName} test start`);
      try {
        network.subscribe({
          success: (data: NetworkResponse) => {
            console.info(`${caseName} data1 ${JSON.stringify(data)}`);
            ExpectTrue(data.type === 'WiFi');
          },
          fail: (data: Object, code: number) => {
            console.info(`${caseName} fail data1 ${JSON.stringify(data)} ${JSON.stringify(code)}`);
            ExpectTrue(false);
            done();
            console.info(`${caseName} test end`);
          },
        });
        network.subscribe({
          success: (data: NetworkResponse) => {
            console.info(`${caseName} data2 ${JSON.stringify(data)}`);
            ExpectTrue(data.type === 'WiFi');
            done();
            console.info(`${caseName} test end`);
          },
          fail: (data: Object, code: number) => {
            console.info(`${caseName} fail data2 ${JSON.stringify(data)} ${JSON.stringify(code)}`);
            ExpectTrue(false);
            done();
            console.info(`${caseName} test end`);
          },
        });
        network.unsubscribe();
        done();
      } catch (err) {
        console.info(`${caseName} catch error ${JSON.stringify(err)}`);
        ExpectTrue(err.code == 2101007, caseName);
        done();
        console.info(`${caseName} test end`);
      }
    });

    /* *
* @tc.number: SUB_NetworkMgr_Network_Unsubscribe_0200
* @tc.name  : testNetworkMgrNetworkUnsubscribe0200
* @tc.desc  : Unsubscribe to the network connection status of the device;wifi.
* @tc.size  : MediumTest
* @tc.type  : Function
* @tc.level : level 3
*/
    it('testNetworkMgrNetworkUnsubscribe0200', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrNetworkUnsubscribe0200';
      console.info(`${caseName} test start`);
      try {
        network.subscribe({
          success: (data: NetworkResponse) => {
            console.info(`${caseName} data ${JSON.stringify(data)}`);
            ExpectTrue(data.type === 'WiFi');
            done();
            console.info(`${caseName} test end`);
          },
          fail: (data: Object, code: number) => {
            console.info(`${caseName} fail data ${JSON.stringify(data)} ${JSON.stringify(code)}`);
            ExpectTrue(false);
            done();
            console.info(`${caseName} test end`);
          },
        });
        network.unsubscribe();
        done();
      } catch (err) {
        console.info(`${caseName} catch error ${JSON.stringify(err)}`);
        ExpectTrue(err.code == 2101007, caseName);
        done();
        console.info(`${caseName} test end`);
      }
    });

    /* *
    * @tc.number: SUB_NetworkMgr_Network_Subscribe_0400
    * @tc.name  : testNetworkMgrNetworkSubscribe0400
    * @tc.desc  : Subscribe to the network connection status of the current device;wifi.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('testNetworkMgrNetworkSubscribe0400', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrNetworkSubscribe0400';
      console.info(`${caseName} test start`);
      try {
        network.subscribe({
          success: (data: NetworkResponse) => {
            console.info(`${caseName} data1 ${JSON.stringify(data)}`);
          },
          fail: (data: Object, code: number) => {
            console.info(`${caseName} fail data1 ${JSON.stringify(data)} ${JSON.stringify(code)}`);
            console.info(`${caseName} test end`);
          },
        });
        network.subscribe({
          success: (data: NetworkResponse) => {
            console.info(`${caseName} data2 ${JSON.stringify(data)}`);
            ExpectTrue(data.type === 'WiFi');
            done();
            console.info(`${caseName} test end`);
          },
          fail: (data: Object, code: number) => {
            console.info(`${caseName} fail data2 ${JSON.stringify(data)} ${JSON.stringify(code)}`);
            ExpectTrue(false);
            done();
            console.info(`${caseName} test end`);
          },
        });
        done();
      } catch (err) {
        console.info(`${caseName} catch error ${JSON.stringify(err)}`);
        ExpectTrue(false, caseName);
        done();
        console.info(`${caseName} test end`);
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Network_getType_0200
     * @tc.name  : testNetworkMgrNetworkGetType0200
     * @tc.desc  : Gets the network type of the current device;wifi.
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testNetworkMgrNetworkGetType0200', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrNetworkGetType0200';
      console.info(`${caseName} test start`);
      try {
        network.getType({
          success: (data: NetworkResponse) => {
            console.info(`${caseName} data ${JSON.stringify(data)}}`);
            ExpectTrue(data.type === 'WiFi',caseName);
            done();
            console.info(`${caseName} test end`);
          },
          fail: (data: Object, code: number) => {
            console.info(`${caseName} fail ${JSON.stringify(data)} ${JSON.stringify(code)}`);
            ExpectTrue(false);
            done();
            console.info(`${caseName} test end`);
          },
        });
        done();
      } catch (err) {
        console.info(`${caseName} catch error ${JSON.stringify(err)}`);
        ExpectTrue(false, caseName);
        done();
        console.info(`${caseName} test end`);
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Network_Unsubscribe_0300
     * @tc.name  : testNetworkMgrNetworkUnsubscribe0300
     * @tc.desc  : Unsubscribe to the network connection status of the device;wifi.
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testNetworkMgrNetworkUnsubscribe0300', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrNetworkUnsubscribe0300';
      console.info(`${caseName} test start`);
      try {
        network.subscribe({
          success: (data: NetworkResponse) => {
            console.info(`${caseName} data ${JSON.stringify(data)}`);
            ExpectTrue(data.type === 'WiFi');
            done();
            console.info(`${caseName} test end`);
          },
          fail: (data: Object, code: number) => {
            console.info(`${caseName} fail data ${JSON.stringify(data)} ${JSON.stringify(code)}`);
            ExpectTrue(false);
            done();
            console.info(`${caseName} test end`);
          },
        });
        network.unsubscribe();
        done();
      } catch (err) {
        console.info(`${caseName} catch error ${JSON.stringify(err)}`);
        ExpectTrue(err.code == 2101007, caseName);
        done();
        console.info(`${caseName} test end`);
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Network_Subscribe_0200
     * @tc.name  : testNetworkMgrNetworkSubscribe0200
     * @tc.desc  : Subscribe to the network connection status of the current device;wifi.
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testNetworkMgrNetworkSubscribe0200', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrNetworkSubscribe0200';
      console.info(`${caseName} test start`);
      try {
        network.subscribe({
          success: (data: NetworkResponse) => {
            console.info(`${caseName} data ${JSON.stringify(data)}`);
            ExpectTrue(data.type === 'WiFi');
            done();
            console.info(`${caseName} test end`);
          },
          fail: (data: Object, code: number) => {
            console.info(`${caseName} fail data ${JSON.stringify(data)} ${JSON.stringify(code)}`);
            ExpectTrue(false);
            done();
            console.info(`${caseName} test end`);
          },
        });
        done();
      } catch (err) {
        console.info(`${caseName} catch error ${JSON.stringify(err)}`);
        ExpectTrue(false, caseName);
        done();
        console.info(`${caseName} test end`);
      }
    });

  });
}


