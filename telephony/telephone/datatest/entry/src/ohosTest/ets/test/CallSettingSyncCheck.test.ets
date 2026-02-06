/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License")
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

import { describe, beforeAll, afterAll, it, expect, TestType,Size, Level} from '@ohos/hypium';
import data from '@ohos.telephony.data';

export default function CallUXUsabilityOptimizationTest() {
  describe('CallUXUsabilityOptimizationTest', () => {

     /**
     * @tc.number : SUB_Telephony_Data_IsCellularDataRoamingEnabledSync_0100
     * @tc.name   : testTelephonyDataIsCellularDataEnabledSync0100
     * @tc.desc   : Sync checks if cellular data roaming service is enabled.
     * @tc.level  : Level 2
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testTelephonyDataIsCellularDataEnabledSync0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      let caseName: string = 'testTelephonyDataIsCellularDataEnabledSync0100';
      console.info(`${caseName} test start `);
      try {
        let isEnabled: boolean = data.isCellularDataEnabledSync();
        console.info(`${caseName} cardSlot`);
        expect(isEnabled).assertTrue();
        done();
      } catch (error) {
        console.info(`${caseName} catchError`);
        expect(false).assertFalse();
        done();
      }
      console.info(`${caseName} test end `);
    });

     /**
     * @tc.number : SUB_Telephony_Data_IsCellularDataRoamingEnabledSync_0100
     * @tc.name   : testTelephonyDataIsCellularDataRoamingEnabledSync0100
     * @tc.desc   : Sync checks if cellular data roaming service is enabled.
     * @tc.level  : Level 2
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */

    it('testTelephonyDataIsCellularDataRoamingEnabledSync0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      let caseName: string = 'testTelephonyDataIsCellularDataRoamingEnabledSync0100';
      console.info(`${caseName} test start `);
      try {
        let isEnabled: boolean = data.isCellularDataRoamingEnabledSync(0);
        console.info(`${caseName} success`);
        expect(isEnabled).assertFalse();
        done();
      } catch (error) {
        console.info(`${caseName} fall`);
        expect(false).assertFalse();
        done();
      }
      console.info(`${caseName} test end `);
    });
  })
}