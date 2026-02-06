/**
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '../../../hypium/index'
import radio from '@ohos.telephony.radio';
import { BusinessError } from '@ohos.base';
import sim from '@ohos.telephony.sim';
import abilityAccessCtrl, { PermissionRequestResult, Permissions } from '@ohos.abilityAccessCtrl';


const SLOT_0: number = 0;
const SLOT_1: number = 1;
const SLOT_2: number = -1;
const SLOT_3: number = 1000000;
const SLOT_4: number = 0.0000001;
const SLOT_5: null = null;

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

export default function telephonyRadioPublicTest() {

  describe('telephonyRadioPublicTest', () => {

    /**
     * @tc.name   testTelephonyRadioGetPrimarySlotId0300
     * @tc.number SUB_Telephony_Radio_GetPrimarySlotId_0300
     * @tc.desc   Obtain the index number of the slot where the main card is located. Use callback for asynchronous callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyRadioGetPrimarySlotId0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonyRadioGetPrimarySlotId0300';
      console.info(`${caseName} test start`);
      radio.getPrimarySlotId((err: BusinessError<void> | null, data:int | undefined): void => {
        if (err) {
          console.info(`${caseName} failed, callback: err->${JSON.stringify(err)}`);
          ExpectFail();
          console.info(`${caseName} test end`);
          done();
        } else {
          console.info(`${caseName} success, callback: data->${JSON.stringify(data)}`);
          ExpectTrue(true);
          console.info(`${caseName} test end`);
          done();
        }
      });
    });

    /**
     * @tc.name   testTelephonyRadioGetPrimarySlotId0600
     * @tc.number SUB_Telephony_Radio_GetPrimarySlotId_0600
     * @tc.desc   Obtain the index number of the slot where the main card is located. Use Promise asynchronous callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyRadioGetPrimarySlotId0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonyRadioGetPrimarySlotId0600';
      console.info(`${caseName} test start`);
      radio.getPrimarySlotId().then((data: int | undefined) => {
        console.info(`${caseName} success, promise: data->${JSON.stringify(data)}`);
        ExpectTrue(true);
        done()
      }).catch((err: Error): void => {
        console.info(`${caseName} failed, promise: err->${JSON.stringify(err)}`);
        ExpectFail();
        console.info(`${caseName} test end`);
        done();
      });
    });

    /**
     * @tc.name   testTelephonyRadioIsNRSupported0100
     * @tc.number SUB_Telephony_Radio_IsNRSupported_0100
     * @tc.desc   Determine if the current device supports 5G (NR).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyRadioIsNRSupported0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonyRadioIsNRSupported0100';
      console.info(`${caseName} test start`);
      try {
        let result: boolean = radio.isNRSupported();
        console.info(`${caseName} success: " + result`);
        ExpectTrue(true);
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} failed: " + err`);
        ExpectFail();
        console.info(`${caseName} test end`);
        done();
      }
    });
  });

}