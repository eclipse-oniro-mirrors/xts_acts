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
          await Utils.sleep(2000);
          console.info("push WebViewGetPageOffSet page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebViewGetPageOffSet page error: " + err);
      }
      let driver: Driver = Driver.create();
      await driver.waitForComponent(ON.id("webgetPageOffsetButton"),10000);
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
      console.info("WebViewGetPageOffSet afterEach start");
      await Utils.sleep(2000);
      console.info("WebViewGetPageOffSet afterEach end");
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
      Utils.emitEvent("emitgetPageOffset001", 10)
      Utils.registerEvent("emitgetPageOffset001", 150, 20250710, done);
      sendEventByKey('webgetPageOffsetButton', 10, '');
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
      Utils.emitEvent("emitgetPageOffset002", 10)
      Utils.registerEvent("emitgetPageOffset002", 0, 20250711, done);
      sendEventByKey('webgetPageOffsetButton', 10, '');
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
      Utils.emitEvent("emitgetPageOffset003", 10)
      Utils.registerEvent("emitgetPageOffset003", 200, 20250712, done);
      sendEventByKey('webgetPageOffsetButton', 10, '');
    })




  })
}