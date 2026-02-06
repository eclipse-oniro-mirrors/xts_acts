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
import hilog from '@ohos.hilog';
import telAPI from 'libentry.so';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'
import data from '@ohos.telephony.data'
import radio from '@ohos.telephony.radio';

const CASE_INDEX_1 = 1;
const CASE_INDEX_2 = 2;
const CASE_INDEX_3 = 3;
const CASE_INDEX_4 = 4;
const CASE_INDEX_5 = 5;
const CASE_INDEX_6 = 6;
const CASE_INDEX_7 = 7;

const TELEPHONY_OK = 0;
// 参数错误。
const ERROR_CODE_401 = 401;
// 枚举值。
const ERROR_CODE_8300001 = 8300001;
const ERROR_CODE_8300002 = 8300002;
const ERROR_CODE_8300003 = 8300003;

export default function telephonyNdkTest() {
  describe('telephonyNdkTestSuit', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.name   testOHTelephonyGetDefaultCellularDataSlotId_0100
     * @tc.number SUB_TELEPHONY_CELLULAR_DATA_OHTELEPHONYGETDEFAULTCELLULARDATASLOTID_0100.
     * @tc.desc   Obtains the default cellular data slot id.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHTelephonyGetDefaultCellularDataSlotId_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let idNdk = telAPI.OHTelephonyGetDefaultCellularDataSlotId();
      console.info('====>testOHTelephonyGetDefaultCellularDataSlotId_0100 idNdk: ' + idNdk);
      let idTs = data.getDefaultCellularDataSlotIdSync();
      console.info('====>getDefaultCellularDataSlotIdSync idTs: ' + idTs);
      expect(idNdk).assertEqual(idTs);
      done();
    });

    /**
     * @tc.name   testOHTelephonyGetNetworkStateForSlot_0100
     * @tc.number SUB_TELEPHONY_CORE_SERVICE_OHTELEPHONYGETNETWORKSTATEFORSLOT_0100.
     * @tc.desc   Obtains the radio network state for given slot id.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHTelephonyGetNetworkStateForSlot_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result = telAPI.OHTelephonyGetNetworkStateForSlotParam(CASE_INDEX_1);
      console.info('====>testOHTelephonyGetNetworkStateForSlot_0100 result: ' + result);
      expect(result).assertEqual(ERROR_CODE_401);
      done();
    });

    /**
     * @tc.name   testOHTelephonyGetNetworkStateForSlot_0200
     * @tc.number SUB_TELEPHONY_CORE_SERVICE_OHTELEPHONYGETNETWORKSTATEFORSLOT_0200.
     * @tc.desc   Obtains the radio network state for given slot id.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHTelephonyGetNetworkStateForSlot_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result = telAPI.OHTelephonyGetNetworkStateForSlotParam(CASE_INDEX_2);
      console.info('====>testOHTelephonyGetNetworkStateForSlot_0200 result: ' + result);
      expect(result).assertEqual(ERROR_CODE_401);
      done();
    });

    /**
     * @tc.name   testOHTelephonyGetNetworkStateForSlot_0300
     * @tc.number SUB_TELEPHONY_CORE_SERVICE_OHTELEPHONYGETNETWORKSTATEFORSLOT_0300.
     * @tc.desc   Obtains the radio network state for given slot id.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHTelephonyGetNetworkStateForSlot_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result = telAPI.OHTelephonyGetNetworkStateForSlotParam(CASE_INDEX_3);
      console.info('====>testOHTelephonyGetNetworkStateForSlot_0300 result: ' + result);
      expect(result).assertEqual(ERROR_CODE_401);
      done();
    });

    /**
     * @tc.name   testOHTelephonyGetNetworkStateForSlot_0400
     * @tc.number SUB_TELEPHONY_CORE_SERVICE_OHTELEPHONYGETNETWORKSTATEFORSLOT_0400.
     * @tc.desc   Obtains the radio network state for given slot id.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHTelephonyGetNetworkStateForSlot_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = telAPI.OHTelephonyGetNetworkStateForSlotParam(CASE_INDEX_4);
      console.info('====>testOHTelephonyGetNetworkStateForSlot_0400 result: ' + result);
      expect(result).assertEqual(TELEPHONY_OK);
      done();
    });

    /**
     * @tc.name   testOHTelephonyGetNetworkStateForSlot_0500
     * @tc.number SUB_TELEPHONY_CORE_SERVICE_OHTELEPHONYGETNETWORKSTATEFORSLOT_0500.
     * @tc.desc   Obtains the radio network state for given slot id.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHTelephonyGetNetworkStateForSlot_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result = telAPI.OHTelephonyGetNetworkStateForSlotParam(CASE_INDEX_5);
      console.info('====>testOHTelephonyGetNetworkStateForSlot_0500 result: ' + result);
      expect(result).assertEqual(ERROR_CODE_401);
      done();
    });

    /**
     * @tc.name   testOHTelephonyGetNetworkStateForSlot_0600
     * @tc.number SUB_TELEPHONY_CORE_SERVICE_OHTELEPHONYGETNETWORKSTATEFORSLOT_0600.
     * @tc.desc   Obtains the radio network state for given slot id.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHTelephonyGetNetworkStateForSlot_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let slotid = data.getDefaultCellularDataSlotIdSync();
      console.info('====>testOHTelephonyGetNetworkStateForSlot_0600 slotid: ' + slotid);

      let stateNdk = telAPI.OHTelephonyGetNetworkStateForSlot(slotid);
      console.info('====>testOHTelephonyGetNetworkStateForSlot_0600 stateNdk: ', JSON.stringify(stateNdk));

      try {
        let stateArkts = await radio.getNetworkState(slotid);
        console.info('====>testOHTelephonyGetNetworkStateForSlot_0600 stateArkts: ', JSON.stringify(stateArkts));
        expect(stateNdk).assertDeepEquals(stateArkts);
      } catch(e) {
        console.info('====>testOHTelephonyGetNetworkStateForSlot_0600 error: ', JSON.stringify(e));
        expect(false).assertTrue()
      }

      done();
    });

    /**
     * @tc.name   testOHTelephonyGetNetworkStateForSlot_0700
     * @tc.number SUB_TELEPHONY_CORE_SERVICE_OHTELEPHONYGETNETWORKSTATEFORSLOT_0700.
     * @tc.desc   Obtains the radio network state for given slot id.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHTelephonyGetNetworkStateForSlot_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      for (let slotid = 0; slotid < 10; slotid++) {
        let stateNdk = telAPI.OHTelephonyGetNetworkStateForSlot(slotid);
        console.info('====>testOHTelephonyGetNetworkStateForSlot_0700 stateNdk: ', JSON.stringify(stateNdk));
        try {
          let stateArkts = await radio.getNetworkState(slotid);
          console.info('====>testOHTelephonyGetNetworkStateForSlot_0700 stateArkts: ', JSON.stringify(stateArkts));
          expect(stateNdk).assertDeepEquals(stateArkts);
        } catch(e) {
          console.info('====>testOHTelephonyGetNetworkStateForSlot_0700 error: ', JSON.stringify(e), 'slotid: ', slotid);
          break;
        }
      }

      done();
    });

    /**
    * @tc.name   testGetNetworkState_0601
    * @tc.number SUB_TELEPHONY_CORE_SERVICE_GetNetworkState_0601.
    * @tc.desc   Obtains the radio network state for given slot id.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL1
    */
    it('testGetNetworkState_0601', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let stateNdk = telAPI.GetNetworkState0601();
        console.info('====>testGetNetworkState_0601 stateNdk: ', JSON.stringify(stateNdk));
        expect(stateNdk).assertEqual(ERROR_CODE_8300001);
      } catch(e) {
        console.info('====>testGetNetworkState_0601 error: ', JSON.stringify(e));
      }

      done();
    });
    
    /**
    * @tc.name   testGetNetworkState_0701
    * @tc.number SUB_TELEPHONY_CORE_SERVICE_GetNetworkState_0701.
    * @tc.desc   Obtains the radio network state for given slot id.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL1
    */
    it('testGetNetworkState_0701', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let stateNdk = telAPI.GetNetworkState0701();
        console.info('====>testGetNetworkState_0701 stateNdk: ', JSON.stringify(stateNdk));
        expect(stateNdk).assertEqual(ERROR_CODE_8300002);
      } catch(e) {
        console.info('====>testGetNetworkState_0701 error: ', JSON.stringify(e));
      }

      done();
    });
    
    /**
    * @tc.name   testGetNetworkState_0801
    * @tc.number SUB_TELEPHONY_CORE_SERVICE_GetNetworkState_0801.
    * @tc.desc   Obtains the radio network state for given slot id.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL1
    */
    it('testGetNetworkState_0801', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let stateNdk = telAPI.GetNetworkState0801();
        console.info('====>testGetNetworkState_0801 stateNdk: ', JSON.stringify(stateNdk));
        expect(stateNdk).assertEqual(ERROR_CODE_8300003);
      } catch(e) {
        console.info('====>testGetNetworkState_0801 error: ', JSON.stringify(e));
      }

      done();
    });
    
    /**
     * @tc.name   testOHTelephonyGetNetworkState_0100
     * @tc.number SUB_TELEPHONY_CORE_SERVICE_OHTELEPHONYGETNETWORKSTATE_0100.
     * @tc.desc   Obtains the radio network state.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHTelephonyGetNetworkState_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result = telAPI.OHTelephonyGetNetworkStateParam(CASE_INDEX_1);
      console.info('====>testOHTelephonyGetNetworkState_0100 result: ' + result);
      expect(result).assertEqual(ERROR_CODE_401);
      done();
    });

    /**
     * @tc.name   testOHTelephonyGetNetworkState_0200
     * @tc.number SUB_TELEPHONY_CORE_SERVICE_OHTELEPHONYGETNETWORKSTATE_0200.
     * @tc.desc   Obtains the radio network state.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHTelephonyGetNetworkState_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result = telAPI.OHTelephonyGetNetworkStateParam(CASE_INDEX_2);
      console.info('====>testOHTelephonyGetNetworkState_0200 result: ' + result);
      expect(result).assertEqual(TELEPHONY_OK);
      done();
    });

    /**
     * @tc.name   testOHTelephonyGetNetworkState_0300
     * @tc.number SUB_TELEPHONY_CORE_SERVICE_OHTELEPHONYGETNETWORKSTATE_0300.
     * @tc.desc   Obtains the radio network state.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHTelephonyGetNetworkState_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let stateNdk = telAPI.OHTelephonyGetNetworkState();
      console.info('====>testOHTelephonyGetNetworkState_0300 stateNdk: ', JSON.stringify(stateNdk));
      
      try {
        let slotid = await radio.getPrimarySlotId();
        console.info('====>testOHTelephonyGetNetworkState_0300 slotid: ', slotid);

        let stateArkts = await radio.getNetworkState(slotid);
        console.info('====>testOHTelephonyGetNetworkState_0300 stateArkts: ', JSON.stringify(stateArkts));
        expect(stateNdk).assertDeepEquals(stateArkts);
      } catch(e) {
        console.info('====>testOHTelephonyGetNetworkState_0300 error: ', JSON.stringify(e));
        expect(false).assertTrue()
      }

      done();
    });
  })
}