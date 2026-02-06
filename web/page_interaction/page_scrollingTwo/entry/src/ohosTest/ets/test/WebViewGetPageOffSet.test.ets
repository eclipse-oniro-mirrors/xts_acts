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

import { afterEach, beforeAll, beforeEach, describe, it , TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';
import { Driver, ON, MouseButton } from '@ohos.UiTest';
import { accessibility, config } from '@kit.AccessibilityKit';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

const EVENT_ID_SET_SUITE_KEY = 182201;
let driver = Driver.create();
let emitKey = ""
let tcName = ""

export default function WebViewEnumAndFontLibrary() {

  describe('WebViewWebViewGetPageOffSetTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebViewGetPageOffSet',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebViewWebViewGetPageOffSet state success " + JSON.stringify(pages));
        if (!("WebViewGetPageOffSet" == pages.name)) {
          console.info("get WebViewGetPageOffSet state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await driver.waitForComponent(ON.id("webgetPageOffsetButton"), 10000);
          console.info("push WebViewGetPageOffSet page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebViewGetPageOffSet page error: " + err);
      }
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
    * @tc.number     : SUB_WEB_EMITGETPAGEOFFSET_0100
    * @tc.name       : emitgetPageOffset001
    * @tc.desc       : emitgetPageOffset001
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('emitgetPageOffset001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'emitgetPageOffset001';
      tcName = 'emitgetPageOffset001'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, 150, 182210, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "webgetPageOffsetButton", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    /*
    * @tc.number     : SUB_WEB_EMITGETPAGEOFFSET_0200
    * @tc.name       : emitgetPageOffset002
    * @tc.desc       : emitgetPageOffset002
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('emitgetPageOffset002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'emitgetPageOffset002';
      tcName = 'emitgetPageOffset002'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, 0, 182220, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "webgetPageOffsetButton", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })
    /*
    * @tc.number     : SUB_WEB_EMITGETPAGEOFFSET_0300
    * @tc.name       : emitgetPageOffset003
    * @tc.desc       : emitgetPageOffset003
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('emitgetPageOffset003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'emitgetPageOffset003';
      tcName = 'emitgetPageOffset003'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, 200, 182230, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "webgetPageOffsetButton", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })




  })
}