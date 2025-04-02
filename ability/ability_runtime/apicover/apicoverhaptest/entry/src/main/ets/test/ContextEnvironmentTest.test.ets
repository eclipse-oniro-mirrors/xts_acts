// @ts-nocheck
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import common from '@ohos.app.ability.common';
import EnvironmentCallback from '@ohos.app.ability.EnvironmentCallback';
import { BusinessError } from '@ohos.base';

let TAG: string = '';
let envCallback: EnvironmentCallback = {
  onConfigurationUpdated(config) {
    console.info(TAG, `envCallback onConfigurationUpdated success: ${JSON.stringify(config)}`)
    update_language = config.language;
    isUpdated = true;
    fontSizeScale = config.fontSizeScale;
    fontWeightScale = config.fontWeightScale;
  }
}



function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

export default function ContextEnvironmentTest(applicationContext: common.ApplicationContext) {
  describe('ContextEnvironmentTest', () => {
    let isUpdated = false;
    let update_language = "";
    let callbackid_NA = 100
    let callbackid_errorNum = -1
    let callbackid_errorType = "test"
    let callNum = 0;
    let fontSizeScale = 0;
    let fontWeightScale = 0;
    let gSetTimeout = 1000

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

    /*
     * @tc.number  SUB_AA_AMS_Context_EnvironmentTest_0400
     * @tc.name    Multiple registrations and deregistration.
     * @tc.desc    Function test
     * @tc.level   3
     */
    it('SUB_AA_AMS_Context_EnvironmentTest_0400', 0, async (done: Function) => {
      TAG = 'SUB_AA_AMS_Context_EnvironmentTest_0400 ==== ';
      console.info(TAG, `begin`);
      let envCallback: EnvironmentCallback = {
        onConfigurationUpdated(config) {
          console.info(TAG, `envCallback onConfigurationUpdated success: ${JSON.stringify(config)}`);
          update_language = config.language;
          isUpdated = true;
        },
        onMemoryLevel(level) {
          console.log('onMemoryLevel level: ${level}');
        }
      }

      for (let i = 0; i < 5; i++) {
        // registerEnvironmentCallback
        let callbackId: number = applicationContext.registerEnvironmentCallback(envCallback);
        let code: number;
        console.info(TAG + "callbackId = " + callbackId + " callNum = " + callNum);

        await sleep(700)
        // unregisterEnvironmentCallback
        applicationContext.unregisterEnvironmentCallback(callbackId, (error, data) => {
          console.info(TAG + "unregisterEnvironmentCallback first err is : " + JSON.stringify(error) + ", data is : " + JSON.stringify(data));
          code = error.code;
        })

        await sleep(700);
        expect(callbackId).assertEqual(callNum);
        expect(code).assertEqual(0);
        callNum++;
      }
      done();
      console.info(TAG, `end`);
    })

    /*
     * @tc.number  SUB_AA_AMS_Context_EnvironmentTest_0500
     * @tc.name    unregisterEnvironmentCallback interface input parameter is a nonexistent ID.
     * @tc.desc    Function test
     * @tc.level   3
     */
    it('SUB_AA_AMS_Context_EnvironmentTest_0500', 0, async (done: Function) => {
      TAG = 'SUB_AA_AMS_Context_EnvironmentTest_0500 ==== ';
      console.info(TAG, `begin`);

      applicationContext.unregisterEnvironmentCallback(callbackid_NA, (error, data) => {
        console.info(TAG + "unregisterEnvironmentCallback err is : " + JSON.stringify(error) + ", data is : " + JSON.stringify(data));
        expect(error.code).assertEqual(1);
        console.info(TAG, `end`);
        done();
      })
    })

    /*
     * @tc.number  SUB_AA_AMS_Context_EnvironmentTest_0600
     * @tc.name    unregisterEnvironmentCallback interface input parameter is negative.
     * @tc.desc    Function test
     * @tc.level   3
     */
    it('SUB_AA_AMS_Context_EnvironmentTest_0600', 0, async (done: Function) => {
      TAG = 'SUB_AA_AMS_Context_EnvironmentTest_0600 ==== ';
      console.info(TAG, `begin`);

      applicationContext.unregisterEnvironmentCallback(callbackid_errorNum, (error, data) => {
        console.info(TAG + "unregisterEnvironmentCallback err is : " + JSON.stringify(error) + ", data is : " + JSON.stringify(data));
        expect(error.code).assertEqual(1);
        console.info(TAG, `end`);
        done();
      })
    })

    /*
    * @tc.number  SUB_AA_AMS_Context_EnvironmentTest_0700
    * @tc.name    unregisterEnvironmentCallback interface input parameter is of wrong type.
    * @tc.desc    Function test
    * @tc.level   3
    */
    it('SUB_AA_AMS_Context_EnvironmentTest_0700', 0, async (done: Function) => {
      TAG = 'SUB_AA_AMS_Context_EnvironmentTest_0700 ==== ';
      console.info(TAG, `begin`);

      applicationContext.unregisterEnvironmentCallback(callbackid_errorType, (error, data) => {
        console.info(TAG + "unregisterEnvironmentCallback err is : " + JSON.stringify(error) + ", data is : " + JSON.stringify(data));
        expect(error.code).assertEqual(1);

        console.info(TAG, `end`);
        done();
      })
    })

    /*
    * @tc.number  SUB_AA_AMS_Context_EnvironmentTest_0800
    * @tc.name    unregisterEnvironmentCallback interface input parameter is undefined.
    * @tc.desc    Function test
    * @tc.level   3
    */
    it('SUB_AA_AMS_Context_EnvironmentTest_0800', 0, async (done: Function) => {
      TAG = 'SUB_AA_AMS_Context_EnvironmentTest_0800 ==== ';
      console.info(TAG, `begin`);

      await applicationContext.unregisterEnvironmentCallback(undefined)
        .then((data) => {
          console.info(TAG + "unregisterEnvironmentCallback data is : " + JSON.stringify(data));
          expect().assertFail();
        })
        .catch((error: BusinessError) => {
          console.info(TAG + "unregisterEnvironmentCallback err is : " + JSON.stringify(error));
          expect(error.code).assertEqual(1);
        })

      console.info(TAG, `end`);
      done();
    })
  })
}
