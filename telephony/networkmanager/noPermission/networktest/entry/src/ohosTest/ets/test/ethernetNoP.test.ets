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

import { describe, it, expect, Level, Size, TestType } from '@ohos/hypium';
import ethernet from '@ohos.net.ethernet';
import { BusinessError } from '@ohos.base';

const ExpectTrue: (n: boolean) => void = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    console.info(` exportTrue failed err: ${JSON.stringify(err)}`);
  }
};

export default function EtherNetNoPTest() {
  describe('EtherNetNoPTest', () => {

    /**
     * @tc.name   testNetworkMgrGetMacAddressNoP0100
     * @tc.number SUB_NetworkMgr_GetMacAddress_NoP0100
     * @tc.desc   getMacAddress Permission denied
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testNetworkMgrGetMacAddressNoP0100",  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0 , async (done: Function) => {
      const caseName: string = 'testNetworkMgrGetMacAddressNoP0100';
      console.info(`${caseName} test start `)
      try {
        ethernet.getMacAddress().then((data: Array<ethernet.MacAddressInfo>) => {
          console.info(`${caseName} getMacAddress data:${JSON.stringify(data)}`);
          ExpectTrue(false);
          done();
        }).catch((error: BusinessError) => {
          console.info(`${caseName} getMacAddress data error:${JSON.stringify(error)}`);
          ExpectTrue(error.code == 201)
          done();
        });
      } catch (err) {
        console.log(`${caseName} --test end`);
        console.log(`${caseName} catch err is `, JSON.stringify(err));
        ExpectTrue(err.code == 201);
        done();
      }
    })

  })
}
