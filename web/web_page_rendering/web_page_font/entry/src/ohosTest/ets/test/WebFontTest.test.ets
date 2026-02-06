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
import { Driver, ON } from '@kit.TestKit';

const driver = Driver.create();
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
export default function webFontTest() {

  describe('WebFontTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/WebFontTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebFontTest state success " + JSON.stringify(pages));
        if (!("WebFontTest" == pages.name)) {
          console.info("get WebFontTest state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push WebFontTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebFontTest page error: " + err);
      }
      await driver.waitForComponent(ON.id("WebFontTestButton"), 10000);
      console.log("waitForComponent WebFontTestButton");
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
    * @tc.number      : SUB_WEB_WEBSTANDARDFONT_0100
    * @tc.name        : testWebStandardFont001
    * @tc.desc        : test WebStandardFont
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testWebStandardFont001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebStandardFont001", 150140)
      Utils.registerEvent("testWebStandardFont001", '"serif"', 150150, done);
      let component = await driver.findComponent(ON.id("WebFontTestButton"));
      await component.click();
    })

    /*
    * @tc.number      : SUB_WEB_WEBSTANDARDFONT_0200
    * @tc.name        : testWebStandardFont002
    * @tc.desc        : test WebStandardFont
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testWebStandardFont002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebStandardFont002", 150140)
      Utils.registerEvent("testWebStandardFont002", '"monospace"', 150160, done);
      let component = await driver.findComponent(ON.id("WebFontTestButton"));
      await component.click();
    })

    /*
    * @tc.number      : SUB_WEB_WEBSTANDARDFONT_0300
    * @tc.name        : testWebStandardFont003
    * @tc.desc        : test WebStandardFont
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testWebStandardFont003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebStandardFont003", 150140)
      Utils.registerEvent("testWebStandardFont003", '"Helvetica"', 150170, done);
      let component = await driver.findComponent(ON.id("WebFontTestButton"));
      await component.click();
    })

    /*
    * @tc.number      : SUB_WEB_WEBSTANDARDFONT_0400
    * @tc.name        : testWebStandardFont004
    * @tc.desc        : test WebStandardFont
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testWebStandardFont004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebStandardFont004", 150140)
      Utils.registerEvent("testWebStandardFont004", '"Arial"', 150180, done);
      let component = await driver.findComponent(ON.id("WebFontTestButton"));
      await component.click();
    })

    /*
    * @tc.number      : SUB_WEB_WEBSTANDARDFONT_0500
    * @tc.name        : testWebStandardFont005
    * @tc.desc        : test WebStandardFont
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testWebStandardFont005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebStandardFont005", 150140)
      Utils.registerEvent("testWebStandardFont005", '"\\"sans serif\\""', 150190, done);
      let component = await driver.findComponent(ON.id("WebFontTestButton"));
      await component.click();
    })

  })
}
