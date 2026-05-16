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

import { describe, beforeAll, it, expect, Level } from '@ohos/hypium'
import common from '@ohos.app.ability.common';

let ERROR_CODE = 202;
let context: common.UIAbilityContext;

export default function contextTest() {
  describe('contextTest', () => {
    beforeAll(() => {
      context = globalThis.abilityContext;
    })

    /**
     * @tc.name   System_API_Test_Context_0100
     * @tc.number System_API_Test_Context_0100
     * @tc.desc   Test the third-party application call createBundleContext will be blocked
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('System_API_Test_Context_0100', Level.LEVEL0, (done: Function) => {
      let TAG = 'System_API_Test_Context_0100';
      console.log(`${TAG} context : ${context}`);
      try {
        let bundleName = "aaa";
        context.createBundleContext(bundleName);
      } catch (error) {
        console.log(TAG + " error: " + error.code + ", " + error.message);
        expect(error.code).assertEqual(ERROR_CODE);
        done();
      }
    })

    /**
     * @tc.name   System_API_Test_Context_0200
     * @tc.number System_API_Test_Context_0200
     * @tc.desc   Test the third-party application call createBundleContext will be blocked
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('System_API_Test_Context_0200', Level.LEVEL0, (done: Function) => {
      let TAG = 'System_API_Test_Context_0200';
      try {
        let bundleName = "aaa";
        let moduleName = "aaa";
        context.createModuleContext(bundleName, moduleName);
      } catch (error) {
        console.log(TAG + " error: " + error.code + ", " + error.message);
        expect(error.code).assertEqual(ERROR_CODE);
        done();
      }
    })
  })
}