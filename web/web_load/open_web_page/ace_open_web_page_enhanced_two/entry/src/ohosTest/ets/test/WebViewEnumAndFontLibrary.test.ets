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

import { beforeAll, beforeEach, describe, it, TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';

const EVENT_ID_SET_EMIT_KEY = 201200;
const driver = Driver.create();
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function WebViewEnumAndFontLibrary() {

  describe('WebViewEnumAndFontLibraryTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebViewEnumAndFontLibrary',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebViewEnumAndFontLibrary state success " + JSON.stringify(pages));
        if (!("WebViewEnumAndFontLibrary" == pages.name)) {
          console.info("get WebViewEnumAndFontLibrary state success " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          console.info("push WebViewEnumAndFontLibrary page success");
        }
      } catch (err) {
        console.error("push WebViewEnumAndFontLibrary page error: " + err);
      }
      await driver.waitForComponent(ON.id("buttonEnumAndFontLibrary"), 10000);
      console.log("waitForComponent buttonEnumAndFontLibrary");
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("web beforeEach start");
      done();
    })

    /*
    * @tc.number     : SUB_WEB_MIXEDMODENONE_0100
    * @tc.name       : testMixedModeNone001
    * @tc.desc       : test MixedModeNone
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testMixedModeNone001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitMixedModeNone", EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testMixedModeNone001", 4, 201210, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "buttonEnumAndFontLibrary");
      if (await Utils.waitForExist(() => isReturn, 'testMixedModeNone001' + '_returnCheck', true, 1000)) {
        done();
      }
    })

    /*
    * @tc.number     : SUB_WEB_MIXEDMODEALL_0100
    * @tc.name       : testMixedModeAll001
    * @tc.desc       : test MixedModeAll
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testMixedModeAll001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitMixedModeAll", EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testMixedModeAll001", 3, 201220, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "buttonEnumAndFontLibrary");
      if (await Utils.waitForExist(() => isReturn, 'testMixedModeAll001' + '_returnCheck', true, 1000)) {
        done();
      }
    })
  })
}