/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import { afterEach, beforeAll, beforeEach, describe, it } from '@ohos/hypium';
import { Constants } from './Constants';
import router from '@ohos.router';
import Utils from './Utils';

export default function webJsGeolocationInvokeTest() {

  describe('WebJsGeolocationInvokeTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/WebJsGeolocationInvokeTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebJsGeolocationInvokeTest state success " + JSON.stringify(pages));
        if (!("WebJsGeolocationInvokeTest" == pages.name)) {
          console.info("get WebJsGeolocationInvokeTest state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push WebJsGeolocationInvokeTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebJsGeolocationInvokeTest page error: " + err);
      }
      done()
    });

    beforeEach(async (done: Function) => {
      console.info("WebJsGeolocationInvokeTest beforeEach start");
      done();
    })

    afterEach(async (done: Function) => {
      console.info("WebJsGeolocationInvokeTest afterEach start");
      await Utils.sleep(2000);
      console.info("WebJsGeolocationInvokeTest afterEach Begin");
      done();
    })

    /*
    * @tc.number      : SUB_WEB_STRESS_WEB_JSGEOLOCATIONINVOKE_0100
    * @tc.name        : testWebJsGeolocationInvoke001
    * @tc.desc        : stress testing JsGeolocation.invoke(event.origin, true, true)
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 2
    */
    it('testWebJsGeolocationInvoke001', 0, async (done: Function) => {
      Utils.doIt("testWebJsGeolocationInvoke001", 100500, Constants.DEFAULT_STRESS_TIMES,
        Constants.WEB_JS_GEOLOCATION_INVOKE_BUTTON_KEY,
        (testCaseName: string, callBackId: number) => {
          Utils.registerEvent(testCaseName, true, callBackId, done);
        })
    });

    /*
    * @tc.number      : SUB_WEB_STRESS_WEB_JSGEOLOCATIONINVOKE_0200
    * @tc.name        : testWebJsGeolocationInvoke002
    * @tc.desc        : stress testing JsGeolocation.invoke(event.origin, true, false)
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 2
    */
    it('testWebJsGeolocationInvoke002', 0, async (done: Function) => {
      Utils.doIt("testWebJsGeolocationInvoke002", 100520, Constants.DEFAULT_STRESS_TIMES,
        Constants.WEB_JS_GEOLOCATION_INVOKE_BUTTON_KEY,
        (testCaseName: string, callBackId: number) => {
          Utils.registerEvent(testCaseName, true, callBackId, done);
        })
    });

    /*
    * @tc.number      : SUB_WEB_STRESS_WEB_JSGEOLOCATIONINVOKE_0300
    * @tc.name        : testWebJsGeolocationInvoke003
    * @tc.desc        : stress testing JsGeolocation.invoke(event.origin, false, true)
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 2
    */
    it('testWebJsGeolocationInvoke003', 0, async (done: Function) => {
      Utils.doIt("testWebJsGeolocationInvoke003", 100540, Constants.DEFAULT_STRESS_TIMES,
        Constants.WEB_JS_GEOLOCATION_INVOKE_BUTTON_KEY,
        (testCaseName: string, callBackId: number) => {
          Utils.registerEvent(testCaseName, true, callBackId, done);
        })
    });

    /*
    * @tc.number      : SUB_WEB_STRESS_WEB_JSGEOLOCATIONINVOKE_0400
    * @tc.name        : testWebJsGeolocationInvoke004
    * @tc.desc        : stress testing JsGeolocation.invoke(event.origin, false, false)
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 2
    */
    it('testWebJsGeolocationInvoke004', 0, async (done: Function) => {
      Utils.doIt("testWebJsGeolocationInvoke004", 100560, Constants.DEFAULT_STRESS_TIMES,
        Constants.WEB_JS_GEOLOCATION_INVOKE_BUTTON_KEY,
        (testCaseName: string, callBackId: number) => {
          Utils.registerEvent(testCaseName, true, callBackId, done);
        })
    });

  })
}
