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

import { afterEach, beforeAll, beforeEach, describe, it , TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function webHitTestTypeEnumTest() {

  describe('webKeyboardControllerEnumTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/webKeyboardController',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webKeyboardController state success " + JSON.stringify(pages));
        if (!("webKeyboardController" == pages.name)) {
          console.info("get webKeyboardController state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push webKeyboardController page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webKeyboardController page error: " + err);
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
      console.info("web beforeEach start");
      done();
    })

    afterEach(async (done: Function) => {
      console.info("webKeyboardController afterEach start");
      await Utils.sleep(1000);
      console.info("webKeyboardController afterEach end");
      done();
    })

    /*
    * @tc.number      : SUB_WEB_WEBHITTESTTYPE_ENUM_0100
    * @tc.name        : testWebHitTestTypeEnum001
    * @tc.desc        : test the value of WebHitTestType.EditText is 0
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('webKeyboardController001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testwebKeyboardController001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("webKeyboardController001", 0, 20250321, done);
      sendEventByKey('WebwebKeyboardControllerButton', 10, '');
    })


  })
}
