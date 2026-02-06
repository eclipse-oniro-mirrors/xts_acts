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
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@ohos.UiTest';

const driver = Driver.create();
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
export default function WebViewEnumAndFontLibrary() {

  describe('WebViewEnumAndFontLibraryTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/WebViewEnumAndFontLibrary',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebViewEnumAndFontLibrary state success " + JSON.stringify(pages));
        if (!("WebViewEnumAndFontLibrary" == pages.name)) {
          console.info("get WebViewEnumAndFontLibrary state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push WebViewEnumAndFontLibrary page success " + JSON.stringify(result));
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


    /**
     * @tc.name   testDefaultFontSize001
     * @tc.number SUB_WEB_DEFAULTFONTSIZE_0100
     * @tc.desc   test defaultFontSize
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDefaultFontSize001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitDefaultFontSize", 150350)
      Utils.registerEvent("testDefaultFontSize001", '"13px"', 150360, done);
      let StartModel = await driver.findComponent(ON.id("buttonEnumAndFontLibrary"));
      await StartModel.click();
    })

    /**
     * @tc.name   testDefaultFontSize002
     * @tc.number SUB_WEB_DEFAULTFONTSIZE_0200
     * @tc.desc   test defaultFontSize
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDefaultFontSize002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitDefaultFontSizeMax", 150350)
      Utils.registerEvent("testDefaultFontSize002", '"72px"', 150370, done);
      let StartModel = await driver.findComponent(ON.id("buttonEnumAndFontLibrary"));
      await StartModel.click();
    })

    /**
     * @tc.name   testDefaultFontSize003
     * @tc.number SUB_WEB_DEFAULTFONTSIZE_0300
     * @tc.desc   test defaultFontSize
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDefaultFontSize003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitDefaultFontSizeMin", 150350)
      Utils.registerEvent("testDefaultFontSize003", '"13px"', 150380, done);
      let StartModel = await driver.findComponent(ON.id("buttonEnumAndFontLibrary"));
      await StartModel.click();
    })

    /**
     * @tc.name   testMinFontSize001
     * @tc.number SUB_WEB_MINFONTSIZE_0100
     * @tc.desc   test minFontSize
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinFontSize001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitMinFontSize", 150350)
      Utils.registerEvent("testMinFontSize001", 18, 150390, done);
      let StartModel = await driver.findComponent(ON.id("buttonEnumAndFontLibrary"));
      await StartModel.click();
    })
  })
}
