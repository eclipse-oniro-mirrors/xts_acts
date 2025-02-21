/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import router from '@ohos.router';
import Utils from './Utils';

export default function webJsGeolocationInvoke() {
  describe('WebJsGeolocationInvokeTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/WebJsGeolocationInvoke',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebJsGeolocationInvoke state success " + JSON.stringify(pages));
        if (!("WebJsGeolocationInvoke" == pages.name)) {
          console.info("get WebJsGeolocationInvoke state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push WebJsGeolocationInvoke page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebJsGeolocationInvoke page error: " + err);
      }
      done()
    });
    beforeEach(async (done: Function) => {
      await Utils.sleep(2000);
      console.info("web beforeEach start");
      done();
    })

    afterEach(async (done: Function) => {
      console.info("WebJsGeolocationInvokeTest afterEach start");
      await Utils.sleep(2000);
      console.info("WebJsGeolocationInvokeTest afterEach end");
      done();
    })

    /*
    * @tc.number      : SUB_WEB_JSGEOLOCATIONINVOKE_0100
    * @tc.name        : testJsGeolocationInvoke001
    * @tc.desc        : test JsGeolocation.invoke(event.origin, true, true)
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testJsGeolocationInvoke001', 0, async (done: Function) => {
      Utils.emitEvent("emitJsGeolocationInvoke001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testJsGeolocationInvoke001", true, 70027, done);
      sendEventByKey('WebJsGeolocationInvokeTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_JSGEOLOCATIONINVOKE_0200
    * @tc.name        : testJsGeolocationInvoke002
    * @tc.desc        : test JsGeolocation.invoke(event.origin, true, false)
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testJsGeolocationInvoke002', 0, async (done: Function) => {
      Utils.emitEvent("emitJsGeolocationInvoke002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testJsGeolocationInvoke002", true, 70029, done);
      sendEventByKey('WebJsGeolocationInvokeTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_JSGEOLOCATIONINVOKE_0300
    * @tc.name        : testJsGeolocationInvoke003
    * @tc.desc        : test JsGeolocation.invoke(event.origin, false, true)
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testJsGeolocationInvoke003', 0, async (done: Function) => {
      Utils.emitEvent("emitJsGeolocationInvoke003", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testJsGeolocationInvoke003", true, 70031, done);
      sendEventByKey('WebJsGeolocationInvokeTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_JSGEOLOCATIONINVOKE_0400
    * @tc.name        : testJsGeolocationInvoke004
    * @tc.desc        : test JsGeolocation.invoke(event.origin, false, false)
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testJsGeolocationInvoke004', 0, async (done: Function) => {
      Utils.emitEvent("emitJsGeolocationInvoke004", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testJsGeolocationInvoke004", true, 70033, done);
      sendEventByKey('WebJsGeolocationInvokeTestButton', 10, '');
    })

  })
}