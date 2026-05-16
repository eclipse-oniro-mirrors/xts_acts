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


import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'
import osAccountNdk from 'libosaccountndk.so'

const OS_ACCOUNT_ERR_OK = 0;

export default function ActsTelephonyNdk20Test() {
  describe('ActsTelephonyNdk20Test', () => {
    /**
     * @tc.name   testOHTelephonyGetNetworkState2
     * @tc.number SUB_TELEPHONY_CORE_SERVICE_OH_Telephony_GetNetworkState2
     * @tc.desc   test no Permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHTelephonyGetNetworkState2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====>testOHTelephonyGetNetworkState2 start====");
          let result = osAccountNdk.OH_Telephony_GetNetworkState2();
          console.info("====>testOHTelephonyGetNetworkState2 result: " + result);
          expect(201).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>testOHTelephonyGetNetworkState2 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
          done()
        }
      })
    /**
     * @tc.name   testOHTelephonyGetNetworkStateForSlot1
     * @tc.number SUB_TELEPHONY_CORE_SERVICE_OH_Telephony_GetNetworkStateForSlot1
     * @tc.desc   test no Permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHTelephonyGetNetworkStateForSlot1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====>testOHTelephonyGetNetworkStateForSlot1 start====");
          let result = osAccountNdk.OH_Telephony_GetNetworkStateForSlot1();
          console.info("====>testOHTelephonyGetNetworkStateForSlot1 result: " + result);
          expect(201).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>testOHTelephonyGetNetworkStateForSlot1 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
          done()
        }
      })
    /**
     * @tc.name   testTelRadio0100
     * @tc.number SUB_TELEPHONY_CORE_SERVICE_TelRadio0100
     * @tc.desc   test no Permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTelRadio0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>testTelRadio0100 start====");
        let result = osAccountNdk.TelRadio0100();
        console.info("====>testTelRadio0100 result: " + result);
        expect(201).assertEqual(result);
        done()
      } catch (err) {
        console.error("====>testTelRadio0100 catch err: " + err);
        expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        done()
      }
    })
  })
}
