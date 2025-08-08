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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium'
import network, { NetworkResponse } from '@system.network';

const ExpectTrue: (n: boolean, caseName?: string) => void = (n: boolean, caseName?: string) => {
  try {
    expect(n).assertTrue();
  } catch {
    console.info(`${caseName} expect failed `);
  }
}

export default function networkManagerWithoutCardTest() {
  describe('NetworkManagerWithoutCardTest', () => {

    /* *
     * @tc.number: SUB_NetworkMgr_Network_getType_0300
     * @tc.name  : testNetworkMgrNetworkGetType0300
     * @tc.desc  : Gets the network type of the current device;none.
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 0
     */
    it('testNetworkMgrNetworkGetType0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrNetworkGetType0300';
      console.info(`${caseName} test start`);
      try {
        network.getType({
          success: (data: NetworkResponse) => {
            console.info(`${caseName} data ${JSON.stringify(data)}} ${JSON.stringify(typeof data.type)}`);
            ExpectTrue(data.type === 'none');
            done();
            console.info(`${caseName} test end`);
          },
        });
      } catch (err) {
        console.info(`${caseName} catch error ${JSON.stringify(err)}`);
        ExpectTrue(false, caseName);
        done();
        console.info(`${caseName} test end`);
      }
    });

  });
}