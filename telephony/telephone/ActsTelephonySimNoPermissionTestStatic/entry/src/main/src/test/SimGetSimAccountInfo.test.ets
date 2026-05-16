/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '../../../hypium/index';
import { BusinessError } from '@ohos.base';
import sim from '@ohos.telephony.sim';

const ExpectTrue = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    console.info("expectInfo", `test failed`);
  }
}
const ExpectFail = () => {
  try {
    expect().assertFail();
  } catch (err) {
    console.info("expectInfo", `test failed`);
  }
}

export default function SimGetSimAccountInfo () {
  describe('SimGetSimAccountInfo ', () => {

    let TRUE_SLOT_ID_0: int = 0;
    let simAmount: int = 0;
    beforeAll(async() => {
      let result0: boolean = true;
      try {
        result0 = await sim.isSimActive(0);
      } catch (err) {
        console.info('isSimActive simCard0 Run failed');
      }
      if (result0 == true) {
        TRUE_SLOT_ID_0 = 0;
        simAmount = 1;
      }  
      console.info(`beforeAll, slotId: ${TRUE_SLOT_ID_0}, simAmount: ${simAmount}`);
    });

    /**
     * @tc.number SUB_Telephony_DualSim_getSimAccountInfo_Async_0600
     * @tc.name   testTelephonyDualSimGetSimAccountInfoAsync0600
     * @tc.desc   Test getSimAccountInfo(Async) no permission
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('testTelephonyDualSimGetSimAccountInfoAsync0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const caseName: string = 'testTelephonyDualSimGetSimAccountInfoAsync0600';
      console.info(`${caseName} test start`);
      const recursive = async (n: int) => {
        if (n <= 0) {
          console.info(`${caseName} test finish`);
          done();
          return;
        }
      }
      sim.getSimAccountInfo(0, (err: BusinessError | null, data: sim.IccAccountInfo | undefined) => {
        if (data) {
          console.info(`${caseName} getSimAccountInfo nopermission test success, data: ${JSON.stringify(data)}`);
          ExpectTrue((data?.iccId === ""));
          done();
        } else {
          console.info(`${caseName} getSimAccountInfo nopermission test fail, err: ${JSON.stringify(err)}`);
          ExpectFail();
          done();
          return;  
        }
      });
      recursive(simAmount);
    });

    /**
     * @tc.number SUB_Telephony_DualSim_getSimAccountInfo_Promise_0600
     * @tc.name   testTelephonyDualSimGetSimAccountInfoPromise0600
     * @tc.desc   Test getSimAccountInfo(Promise) no permission
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('testTelephonyDualSimGetSimAccountInfoPromise0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const caseName: string = 'testTelephonyDualSimGetSimAccountInfoPromise0600';
      console.info(`${caseName} test start`);
      const recursive = async (n: int) => {
        if (n <= 0) {
          console.info(`${caseName} test finish`);
          done();
          return;
        }
      }
      sim.getSimAccountInfo(0).then((data: sim.IccAccountInfo | undefined) => {
        console.info(`${caseName} getSimAccountInfo nopermission value, data: ${JSON.stringify(data)}`);
        ExpectTrue((data?.iccId === ""));
        done();
      }).catch ((err: Error) => {
        console.info(`${caseName} getSimAccountInfo nopermission test fail, err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      });
      recursive(simAmount);
    });
  });
}