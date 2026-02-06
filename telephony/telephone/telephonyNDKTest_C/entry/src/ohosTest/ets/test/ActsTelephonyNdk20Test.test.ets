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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium'
import osAccountNdk from 'libosaccountndk.so'

const OS_ACCOUNT_ERR_OK = 0;

export default function ActsTelephonyNdk20Test() {
  describe('ActsTelephonyNdk20Test', () => {
    /**
     * @tc.name   testOHTelephonyGetNetworkState0100
     * @tc.number SUB_TELEPHONY_CORE_SERVICE_OHTELEPHONYGETNETWORKSTATE0100
     * @tc.desc   Obtains the radio network state for given slot id.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHTelephonyGetNetworkState0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>OH_Telephony_GetNetworkState3 start====");
          let result = osAccountNdk.OH_Telephony_GetNetworkState3();
          console.info("====>OH_Telephony_GetNetworkState3 result: " + result);
          expect(0).assertEqual(result);
          done();
        } catch (err) {
          console.error("====>OH_Telephony_GetNetworkState3 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
          done();
        }
      });

    /**
     * @tc.name   testOH_Telephony_GetNetworkStateForSlot0101
     * @tc.number SUB_TELEPHONY_CORE_SERVICE_OH_TELEPHONY_GETNETWORKSTATEFORSLOT0101
     * @tc.desc   Obtains the radio network state for a specific slot id.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOH_Telephony_GetNetworkStateForSlot0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>OH_Telephony_GetNetworkStateForSlot2 start====");
          let result = osAccountNdk.OH_Telephony_GetNetworkStateForSlot2();
          console.info("====>OH_Telephony_GetNetworkStateForSlot2 result: " + result);
          expect(0).assertEqual(result);
          done();
        } catch (err) {
          console.error("====>OH_Telephony_GetNetworkStateForSlot2 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
          done();
        }
      });

    /**
     * @tc.name   testTelRadio0101
     * @tc.number SUB_TELEPHONY_CORE_SERVICE_TELRADIO0101
     * @tc.desc   Tests radio-related functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTelRadio0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TelRadio0101 start====");
        let result = osAccountNdk.TelRadio0101();
        console.info("====>TelRadio0101 result: " + result);
        expect(0).assertEqual(result);
        done();
      } catch (err) {
        console.error("====>TelRadio0101 catch err: " + err);
        expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        done();
      }
    });

    /**
     * @tc.name   testTelRegState0100
     * @tc.number SUB_TELEPHONY_CORE_SERVICE_TELREGSTATE0100
     * @tc.desc   Tests network registration state (case 0100).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTelRegState0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TelRegState0100 start====");
        let result = osAccountNdk.TelRegState0100();
        console.info("====>TelRegState0100 result: " + result);
        expect(0).assertEqual(result);
        done();
      } catch (err) {
        console.error("====>TelRegState0100 catch err: " + err);
        expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        done();
      }
    });

    /**
     * @tc.name   testTelRegState0101
     * @tc.number SUB_TELEPHONY_CORE_SERVICE_TELREGSTATE0101
     * @tc.desc   Tests network registration state (case 0101).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTelRegState0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TelRegState0101 start====");
        let result = osAccountNdk.TelRegState0101();
        console.info("====>TelRegState0101 result: " + result);
        expect(0).assertEqual(result);
        done();
      } catch (err) {
        console.error("====>TelRegState0101 catch err: " + err);
        expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        done();
      }
    });

    /**
     * @tc.name   testTelRegState0102
     * @tc.number SUB_TELEPHONY_CORE_SERVICE_TELREGSTATE0102
     * @tc.desc   Tests network registration state (case 0102).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTelRegState0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TelRegState0102 start====");
        let result = osAccountNdk.TelRegState0102();
        console.info("====>TelRegState0102 result: " + result);
        expect(0).assertEqual(result);
        done();
      } catch (err) {
        console.error("====>TelRegState0102 catch err: " + err);
        expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        done();
      }
    });

    /**
     * @tc.name   testTelRegState0103
     * @tc.number SUB_TELEPHONY_CORE_SERVICE_TELREGSTATE0103
     * @tc.desc   Tests network registration state (case 0103).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTelRegState0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TelRegState0103 start====");
        let result = osAccountNdk.TelRegState0103();
        console.info("====>TelRegState0103 result: " + result);
        expect(0).assertEqual(result);
        done();
      } catch (err) {
        console.error("====>TelRegState0103 catch err: " + err);
        expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        done();
      }
    });

    /**
     * @tc.name   testTelRadioTechnology0100
     * @tc.number SUB_TELEPHONY_CORE_SERVICE_TELRADIO TECHNOLOGY0100
     * @tc.desc   Tests radio technology type (case 0100).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTelRadioTechnology0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TelRadioTechnology0100 start====");
        let result = osAccountNdk.TelRadioTechnology0100();
        console.info("====>TelRadioTechnology0100 result: " + result);
        expect(0).assertEqual(result);
        done();
      } catch (err) {
        console.error("====>TelRadioTechnology0100 catch err: " + err);
        expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        done();
      }
    });

    /**
     * @tc.name   testTelRadioTechnology0101
     * @tc.number SUB_TELEPHONY_CORE_SERVICE_TELRADIO TECHNOLOGY0101
     * @tc.desc   Tests radio technology type (case 0101).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTelRadioTechnology0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TelRadioTechnology0101 start====");
        let result = osAccountNdk.TelRadioTechnology0101();
        console.info("====>TelRadioTechnology0101 result: " + result);
        expect(0).assertEqual(result);
        done();
      } catch (err) {
        console.error("====>TelRadioTechnology0101 catch err: " + err);
        expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        done();
      }
    });

    /**
     * @tc.name   testTelRadioTechnology0102
     * @tc.number SUB_TELEPHONY_CORE_SERVICE_TELRADIO TECHNOLOGY0102
     * @tc.desc   Tests radio technology type (case 0102).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTelRadioTechnology0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TelRadioTechnology0102 start====");
        let result = osAccountNdk.TelRadioTechnology0102();
        console.info("====>TelRadioTechnology0102 result: " + result);
        expect(0).assertEqual(result);
        done();
      } catch (err) {
        console.error("====>TelRadioTechnology0102 catch err: " + err);
        expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        done();
      }
    });

    /**
     * @tc.name   testTelRadioTechnology0103
     * @tc.number SUB_TELEPHONY_CORE_SERVICE_TELRADIO TECHNOLOGY0103
     * @tc.desc   Tests radio technology type (case 0103).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTelRadioTechnology0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TelRadioTechnology0103 start====");
        let result = osAccountNdk.TelRadioTechnology0103();
        console.info("====>TelRadioTechnology0103 result: " + result);
        expect(0).assertEqual(result);
        done();
      } catch (err) {
        console.error("====>TelRadioTechnology0103 catch err: " + err);
        expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        done();
      }
    });

    /**
     * @tc.name   testTelRadioTechnology0104
     * @tc.number SUB_TELEPHONY_CORE_SERVICE_TELRADIO TECHNOLOGY0104
     * @tc.desc   Tests radio technology type (case 0104).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTelRadioTechnology0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TelRadioTechnology0104 start====");
        let result = osAccountNdk.TelRadioTechnology0104();
        console.info("====>TelRadioTechnology0104 result: " + result);
        expect(0).assertEqual(result);
        done();
      } catch (err) {
        console.error("====>TelRadioTechnology0104 catch err: " + err);
        expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        done();
      }
    });

    /**
     * @tc.name   testTelRadioTechnology0105
     * @tc.number SUB_TELEPHONY_CORE_SERVICE_TELRADIO TECHNOLOGY0105
     * @tc.desc   Tests radio technology type (case 0105).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTelRadioTechnology0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TelRadioTechnology0105 start====");
        let result = osAccountNdk.TelRadioTechnology0105();
        console.info("====>TelRadioTechnology0105 result: " + result);
        expect(0).assertEqual(result);
        done();
      } catch (err) {
        console.error("====>TelRadioTechnology0105 catch err: " + err);
        expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        done();
      }
    });

    /**
     * @tc.name   testTelRadioTechnology0106
     * @tc.number SUB_TELEPHONY_CORE_SERVICE_TELRADIO TECHNOLOGY0106
     * @tc.desc   Tests radio technology type (case 0106).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTelRadioTechnology0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TelRadioTechnology0106 start====");
        let result = osAccountNdk.TelRadioTechnology0106();
        console.info("====>v result: " + result);
        expect(0).assertEqual(result);
        done();
      } catch (err) {
        console.error("====>TelRadioTechnology0106 catch err: " + err);
        expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        done();
      }
    });

    /**
     * @tc.name   testTelRadioTechnology0107
     * @tc.number SUB_TELEPHONY_CORE_SERVICE_TELRADIO TECHNOLOGY0107
     * @tc.desc   Tests radio technology type (case 0107).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTelRadioTechnology0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TelRadioTechnology0107 start====");
        let result = osAccountNdk.TelRadioTechnology0107();
        console.info("====>TelRadioTechnology0107 result: " + result);
        expect(0).assertEqual(result);
        done();
      } catch (err) {
        console.error("====>TelRadioTechnology0107 catch err: " + err);
        expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        done();
      }
    });

    /**
     * @tc.name   testTelRadioTechnology0108
     * @tc.number SUB_TELEPHONY_CORE_SERVICE_TELRADIO TECHNOLOGY0108
     * @tc.desc   Tests radio technology type (case 0108).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTelRadioTechnology0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TelRadioTechnology0108 start====");
        let result = osAccountNdk.TelRadioTechnology0108();
        console.info("====>TelRadioTechnology0108 result: " + result);
        expect(0).assertEqual(result);
        done();
      } catch (err) {
        console.error("====>TelRadioTechnology0108 catch err: " + err);
        expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        done();
      }
    })
    /**
     * @tc.name   testTelRadioTechnology0109
     * @tc.number SUB_TELEPHONY_CORE_SERVICE_TELRADIO_TECHNOLOGY0109
     * @tc.desc   Tests radio technology type (case 0109).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTelRadioTechnology0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TelRadioTechnology0109 start====");
        let result = osAccountNdk.TelRadioTechnology0109();
        console.info("====>TelRadioTechnology0109 result: " + result);
        expect(0).assertEqual(result);
        done();
      } catch (err) {
        console.error("====>TelRadioTechnology0109 catch err: " + err);
        expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        done();
      }
    });

    /**
     * @tc.name   testTelRadioTechnology0110
     * @tc.number SUB_TELEPHONY_CORE_SERVICE_TELRADIO_TECHNOLOGY0110
     * @tc.desc   Tests radio technology type (case 0110).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTelRadioTechnology0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TelRadioTechnology0110 start====");
        let result = osAccountNdk.TelRadioTechnology0110();
        console.info("====>TelRadioTechnology0110 result: " + result);
        expect(0).assertEqual(result);
        done();
      } catch (err) {
        console.error("====>TelRadioTechnology0110 catch err: " + err);
        expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        done();
      }
    });

    /**
     * @tc.name   testTelRadioTechnology0111
     * @tc.number SUB_TELEPHONY_CORE_SERVICE_TELRADIO_TECHNOLOGY0111
     * @tc.desc   Tests radio technology type (case 0111).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTelRadioTechnology0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TelRadioTechnology0111 start====");
        let result = osAccountNdk.TelRadioTechnology0111();
        console.info("====>TelRadioTechnology0111 result: " + result);
        expect(0).assertEqual(result);
        done();
      } catch (err) {
        console.error("====>TelRadioTechnology0111 catch err: " + err);
        expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        done();
      }
    });

    /**
     * @tc.name   testTelRadioTechnology0112
     * @tc.number SUB_TELEPHONY_CORE_SERVICE_TELRADIO_TECHNOLOGY0112
     * @tc.desc   Tests radio technology type (case 0112).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTelRadioTechnology0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TelRadioTechnology0112 start====");
        let result = osAccountNdk.TelRadioTechnology0112();
        console.info("====>TelRadioTechnology0112 result: " + result);
        expect(0).assertEqual(result);
        done();
      } catch (err) {
        console.error("====>TelRadioTechnology0112 catch err: " + err);
        expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        done();
      }
    });

    /**
     * @tc.name   testTelNsaState0100
     * @tc.number SUB_TELEPHONY_CORE_SERVICE_TELNSA_STATE0100
     * @tc.desc   Tests NSA (Non-Standalone) network state (case 0100).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTelNsaState0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TelNsaState0100 start====");
        let result = osAccountNdk.TelNsaState0100();
        console.info("====>TelNsaState0100 result: " + result);
        expect(0).assertEqual(result);
        done();
      } catch (err) {
        console.error("====>TelNsaState0100 catch err: " + err);
        expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        done();
      }
    });

    /**
     * @tc.name   testTelNsaState0101
     * @tc.number SUB_TELEPHONY_CORE_SERVICE_TELNSA_STATE0101
     * @tc.desc   Tests NSA (Non-Standalone) network state (case 0101).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTelNsaState0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TelNsaState0101 start====");
        let result = osAccountNdk.TelNsaState0101();
        console.info("====>TelNsaState0101 result: " + result);
        expect(0).assertEqual(result);
        done();
      } catch (err) {
        console.error("====>TelNsaState0101 catch err: " + err);
        expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        done();
      }
    });

    /**
     * @tc.name   testTelNsaState0102
     * @tc.number SUB_TELEPHONY_CORE_SERVICE_TELNSA_STATE0102
     * @tc.desc   Tests NSA (Non-Standalone) network state (case 0102).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTelNsaState0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TelNsaState0102 start====");
        let result = osAccountNdk.TelNsaState0102();
        console.info("====>TelNsaState0102 result: " + result);
        expect(0).assertEqual(result);
        done();
      } catch (err) {
        console.error("====>TelNsaState0102 catch err: " + err);
        expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        done();
      }
    });

    /**
     * @tc.name   testTelNsaState0103
     * @tc.number SUB_TELEPHONY_CORE_SERVICE_TELNSA_STATE0103
     * @tc.desc   Tests NSA (Non-Standalone) network state (case 0103).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTelNsaState0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TelNsaState0103 start====");
        let result = osAccountNdk.TelNsaState0103();
        console.info("====>TelNsaState0103 result: " + result);
        expect(0).assertEqual(result);
        done();
      } catch (err) {
        console.error("====>TelNsaState0103 catch err: " + err);
        expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        done();
      }
    });

    /**
     * @tc.name   testTelNsaState0104
     * @tc.number SUB_TELEPHONY_CORE_SERVICE_TELNSA_STATE0104
     * @tc.desc   Tests NSA (Non-Standalone) network state (case 0104).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTelNsaState0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TelNsaState0104 start====");
        let result = osAccountNdk.TelNsaState0104();
        console.info("====>TelNsaState0104 result: " + result);
        expect(0).assertEqual(result);
        done();
      } catch (err) {
        console.error("====>TelNsaState0104 catch err: " + err);
        expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        done();
      }
    });

    /**
     * @tc.name   testTelNsaState0105
     * @tc.number SUB_TELEPHONY_CORE_SERVICE_TELNSA_STATE0105
     * @tc.desc   Tests NSA (Non-Standalone) network state (case 0105).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTelNsaState0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>TelNsaState0105 start====");
        let result = osAccountNdk.TelNsaState0105();
        console.info("====>TelNsaState0105 result: " + result);
        expect(0).assertEqual(result);
        done();
      } catch (err) {
        console.error("====>TelNsaState0105 catch err: " + err);
        expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        done();
      }
    });
  })
}
