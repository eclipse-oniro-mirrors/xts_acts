/*
 * Copyright (c) 2022-2025 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import common from '@ohos.app.ability.common';
import EnvironmentCallback from '@ohos.app.ability.EnvironmentCallback';
import { BusinessError } from '@ohos.base';

let isUpdated = false;
let update_language = "";
let callbackid_NA = 100
let callbackid_errorNum = -1
let callbackid_errorType = "test"
let callNum = 0;
let fontSizeScale = 0;
let fontWeightScale = 0;
let gSetTimeout = 1000
let TAG: string = '';

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

export default function ContextEnvironmentTest(applicationContext: common.ApplicationContext) {
  describe('ContextEnvironmentTest', () => {

    beforeEach(async (done: Function) => {
      isUpdated = false;
      setTimeout(() => {
        done();
      }, gSetTimeout);
    })

    afterEach(async (done: Function) => {
      isUpdated = false;
      setTimeout(() => {
        done();
      }, gSetTimeout);
    })

    /**
     * @tc.name   SUB_AA_AMS_Context_EnvironmentTest_0400
     * @tc.number SUB_AA_AMS_Context_EnvironmentTest_0400
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AA_AMS_Context_EnvironmentTest_0400', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_AA_AMS_Context_EnvironmentTest_0400 ==== ';
      console.info(TAG, `begin`);
      let envCallback: EnvironmentCallback = {
        onConfigurationUpdated(config) {
          console.info(TAG, `envCallback onConfigurationUpdated success: ${JSON.stringify(config)}`);
          update_language = config.language as string;
          isUpdated = true;
        },
        onMemoryLevel(level) {
          console.log('onMemoryLevel level: ${level}');
        }
      }

      for (let i = 0; i < 5; i++) {
        // registerEnvironmentCallback
        let callbackId: number = applicationContext.on('environment', envCallback);
        let code: number;
        console.info(TAG + "callbackId = " + callbackId + " callNum = " + callNum);

        await sleep(300)
        // unregisterEnvironmentCallback
        applicationContext.off('environment', callbackId, (error, data) => {
          console.info(TAG + "unregisterEnvironmentCallback first err is : " + JSON.stringify(error) + ", data is : " + JSON.stringify(data));
          code = error?.code;
        })

        await sleep(300);
        expect(callbackId).assertEqual(callNum);
        expect(code!).assertEqual(undefined);
        callNum++;
      }
      done();
      console.info(TAG, `end`);
    })

    /**
     * @tc.name   SUB_AA_AMS_Context_EnvironmentTest_0500
     * @tc.number SUB_AA_AMS_Context_EnvironmentTest_0500
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AA_AMS_Context_EnvironmentTest_0500', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_AA_AMS_Context_EnvironmentTest_0500 ==== ';
      console.info(TAG, `begin`);

      applicationContext.off('environment', callbackid_NA, (error, data) => {
        console.info(TAG + "unregisterEnvironmentCallback err is : " + JSON.stringify(error) + ", data is : " + JSON.stringify(data));
        try{
          expect(error?.code).assertEqual(401);
        }catch{
          console.info(TAG + "unregisterEnvironmentCallback catch is : " + JSON.stringify(error));
        }
        console.info(TAG, `end`);
        done();
      })
    })

    /**
     * @tc.name   SUB_AA_AMS_Context_EnvironmentTest_0600
     * @tc.number SUB_AA_AMS_Context_EnvironmentTest_0600
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AA_AMS_Context_EnvironmentTest_0600', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_AA_AMS_Context_EnvironmentTest_0600 ==== ';
      console.info(TAG, `begin`);

      applicationContext.off('environment', callbackid_errorNum, (error, data) => {
        console.info(TAG + "unregisterEnvironmentCallback err is : " + JSON.stringify(error) + ", data is : " + JSON.stringify(data));
        try{
          expect(error?.code).assertEqual(401);
        }catch{
          console.info(TAG + "unregisterEnvironmentCallback catch is : " + JSON.stringify(error));
        }
        console.info(TAG, `end`);
        done();
      })
    })
  })
}
