/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

import { describe, it, expect, Level } from '@ohos/hypium'
import WantAgent from '@ohos.app.ability.wantAgent'
let ERROR_CODE = 202;

export default function wantAgentTest() {
  describe('wantAgentTest', () => {

    /**
     * @tc.number: SUB_AA_OpenHarmony_Context_0100
     * @tc.name: callback form getWant system interface interception test
     * @tc.desc: Test the third-party application call getWant will be blocked
     * @tc.level 3
     */
    it('System_API_Test_WantAgent_Manager_0100', Level.LEVEL0, async (done: Function) => {
      let TAG = 'System_API_Test_WantAgent_Manager_0100';
      try {
        WantAgent.getWant(undefined, (error, data) => {
          console.info(TAG + " ==========================>getWantCallback=======================>");
        })
      } catch (error) {
        console.info(TAG + ` getWantCallback err: + ${error.code} + ${error.message}`);
        expect(error.code).assertEqual(ERROR_CODE);
        done();
      }
    })

    /**
     * @tc.number: SUB_AA_OpenHarmony_Context_0100
     * @tc.name: promise form getWant system interface interception test
     * @tc.desc: Test the third-party application call getWant will be blocked
     * @tc.level 3
     */
    it('System_API_Test_QuickFix_Manager_0200', Level.LEVEL0, async (done: Function) => {
      let TAG = 'System_API_Test_QuickFix_Manager_0200';
      try {
        WantAgent.getWant(undefined).then().catch();
      } catch (error) {
        console.info(TAG + ` getWantCallback err: + ${error.code} + ${error.message}`)
        expect(error.code).assertEqual(ERROR_CODE);
        done();
      }
    })
  })
}