/**
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

export default function radioJsunit() {
  describe('ActsNetworkSearchTest', ()=> {

    const SLOT_0 = 0;

    /**
     * @tc.name   Telephony_NetworkSearch_getPrimarySlotId_Async_0200
     * @tc.number Telephony_NetworkSearch_getPrimarySlotId_Async_0200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Telephony_NetworkSearch_getPrimarySlotId_Async_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      radio.getPrimarySlotId((err, data) => {
        if (err) {
          console.log("Telephony_NetworkSearch_getPrimarySlotId_Async_0200 err:" + JSON.stringify(err));
          expect(false).assertTrue();
          done();
          return;
        }
        console.log("Telephony_NetworkSearch_getPrimarySlotId_Async_0200 data:" + JSON.stringify(data));
        expect(data == 0 || data == 1).assertTrue();
        done();
      });
    });

    /**
     * @tc.name   Telephony_NetworkSearch_getPrimarySlotId_Promise_0200
     * @tc.number Telephony_NetworkSearch_getPrimarySlotId_Async_0300
     * @tc.desc   Test getPrimarySlotId api by promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Telephony_NetworkSearch_getPrimarySlotId_Promise_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let data = await radio.getPrimarySlotId();
        console.log("Telephony_NetworkSearch_getPrimarySlotId_Promise_0200 data:" + JSON.stringify(data));
        expect(data == 0 || data == 1).assertTrue();
        done();
      } catch (err) {
        console.log("Telephony_NetworkSearch_getPrimarySlotId_Promise_0200 err:" + JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   Telephony_NetworkSearch_isNRSupported_Async_0100
     * @tc.number Telephony_NetworkSearch_isNRSupported_Async_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Telephony_NetworkSearch_isNRSupported_Async_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let CaseName = "Telephony_NetworkSearch_isNRSupported_Async_0100 ";
      try {
        let result = radio.isNRSupported();
        console.info("Result: " + result);
        let result0 = radio.isNRSupported(SLOT_0);
        console.info("Result0: " + result0);
        console.info(CaseName + "is complete!");
        done();
      } catch (err) {
        console.info(CaseName + "err " + JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
    });
  })
}