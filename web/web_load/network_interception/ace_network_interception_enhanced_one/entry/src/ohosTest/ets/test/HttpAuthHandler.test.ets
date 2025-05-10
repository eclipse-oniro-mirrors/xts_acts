/*
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

import { beforeAll, beforeEach, describe, it , TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function httpAuthHandler() {

  describe('HttpAuthHandlerTestSuite', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/httpAuthHandler',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get httpAuthHandler state success " + JSON.stringify(pages));
        if (!("httpAuthHandler" == pages.name)) {
          console.info("get httpAuthHandler state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push httpAuthHandler page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push httpAuthHandler page error: " + err);
      }
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      await Utils.sleep(2000);
      console.info("httpAuthHandler beforeEach start");
      done();
    })

    /*
    * @tc.number     : SUB_WEB_HTTPAUTHHANDLER_CANCEL_0100
    * @tc.name       : testHttpAuthHandlerCancel001
    * @tc.desc       : test HttpAuthHandler cancel
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testHttpAuthHandlerCancel001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testHttpAuthHandlerCancel001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testHttpAuthHandlerCancel001", 401, 32041, done);
      sendEventByKey('HttpAuthHandlerButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_HTTPAUTHHANDLER_CONFIRM_0100
    * @tc.name       : testHttpAuthHandlerConfirm001
    * @tc.desc       : test HttpAuthHandler confirm
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testHttpAuthHandlerConfirm001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testHttpAuthHandlerConfirm001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testHttpAuthHandlerConfirm001", true, 32040, done);
      sendEventByKey('HttpAuthHandlerButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_HTTPAUTHHANDLER_ISHTTPAUTHINFOSAVED_0100
    * @tc.name       : testHttpAuthHandlerIsHttpAuthInfoSaved001
    * @tc.desc       : test HttpAuthHandler isHttpAuthInfoSaved
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testHttpAuthHandlerIsHttpAuthInfoSaved001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testHttpAuthHandlerIsHttpAuthInfoSaved001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testHttpAuthHandlerIsHttpAuthInfoSaved001", false, 32042, done);
      sendEventByKey('HttpAuthHandlerButton', 10, '');
    })

  })
}
