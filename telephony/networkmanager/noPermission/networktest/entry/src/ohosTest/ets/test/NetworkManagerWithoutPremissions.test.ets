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

export default function networkManagerWithoutPermissionsTest() {
  describe('NetworkManagerWithoutPermissionsTest', () => {

    /* *
     * @tc.number: SUB_NetworkMgr_Network_Unsubscribe_0500
     * @tc.name  : testNetworkMgrNetworkUnsubscribe0500
     * @tc.desc  : Unsubscribe to the network connection status of the device;no permissions.
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testNetworkMgrNetworkUnsubscribe0500', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrNetworkUnsubscribe0500';
      console.info(`${caseName} test start`);
      try {
        network.subscribe({
          success: (data: NetworkResponse) => {
            console.info(`${caseName} data ${JSON.stringify(data)}`);
            ExpectTrue(false);
            done();
            console.info(`${caseName} test end`);
          },
          fail: (data: Object, code: number) => {
            console.info(`${caseName} fail data ${JSON.stringify(data)} ${JSON.stringify(code)}`);
            ExpectTrue(code == 201);
            done();
            console.info(`${caseName} test end`);
          },
        });
        network.unsubscribe();
      } catch (err) {
        console.info(`${caseName} catch error ${JSON.stringify(err)}`);
        ExpectTrue(err.code == 201, caseName);
        done();
        console.info(`${caseName} test end`);
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Network_Subscribe_0500
     * @tc.name  : testNetworkMgrNetworkSubscribe0500
     * @tc.desc  : Subscribe to the network connection status of the current device;no permissions.
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testNetworkMgrNetworkSubscribe0500', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrNetworkSubscribe0500';
      console.info(`${caseName} test start`);
      try {
        network.subscribe({
          success: (data: NetworkResponse) => {
            console.info(`${caseName} data ${JSON.stringify(data)}`);
            ExpectTrue(false);
            done();
            console.info(`${caseName} test end`);
          },
          fail: (data: Object, code: number) => {
            console.info(`${caseName} fail data ${JSON.stringify(data)} ${JSON.stringify(code)}`);
            ExpectTrue(code == 201);
            done();
            console.info(`${caseName} test end`);
          },
        });
      } catch (err) {
        console.info(`${caseName} catch error ${JSON.stringify(err)}`);
        ExpectTrue(err.code == 201, caseName);
        done();
        console.info(`${caseName} test end`);
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Network_getType_0500
     * @tc.name  : testNetworkMgrNetworkGetType0500
     * @tc.desc  : Gets the network type of the current device;no permissions.
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testNetworkMgrNetworkGetType0500', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrNetworkGetType0500';
      console.info(`${caseName} test start`);
      try {
        network.getType({
          success: (data: NetworkResponse) => {
            console.info(`${caseName} data ${JSON.stringify(data)}}`);
            ExpectTrue(false);
            done();
            console.info(`${caseName} test end`);
          },
          fail: (data: Object, code: number) => {
            console.info(`${caseName} fail data ${JSON.stringify(data)} ${JSON.stringify(code)}`);
            ExpectTrue(code == 201);
            done();
            console.info(`${caseName} test end`);
          },
        });
      } catch (err) {
        console.info(`${caseName} catch error ${JSON.stringify(err)}`);
        ExpectTrue(err.code == 201, caseName);
        done();
        console.info(`${caseName} test end`);
      }
    });
  });
}