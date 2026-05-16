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
export default function webCursiveFont() {

  describe('webCursiveFont', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/WebCursiveFont',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webCursiveFont state success " + JSON.stringify(pages));
        if (!("WebCursiveFont" == pages.name)) {
          console.info("get webCursiveFont state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push webCursiveFont page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webCursiveFont page error: " + err);
      }
      await driver.waitForComponent(ON.id("WebCursiveFontButton"), 10000);
      console.log("waitForComponent WebCursiveFontButton");
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
     * @tc.name   testWebCursiveFontCursive001
     * @tc.number SUB_WEB_WEBCURSIVEFONT_CURSIVE_001
     * @tc.desc   test webCursiveFont with 'cursive' font family
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebCursiveFontCursive001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebCursiveFontCursive001", 150204)
      Utils.registerEvent("testWebCursiveFontCursive001", '\"sans-serif\"', 20260311, done);
      let component = await driver.findComponent(ON.id("WebCursiveFontButton"));
      await component.click();
    })

    /**
     * @tc.name   testWebCursiveFontFantasy002
     * @tc.number SUB_WEB_WEBCURSIVEFONT_FANTASY_002
     * @tc.desc   test webCursiveFont with 'fantasy' font family
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebCursiveFontFantasy002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebCursiveFontFantasy002", 150204)
      Utils.registerEvent("testWebCursiveFontFantasy002", '\"sans-serif\"', 20260312, done);
      let component = await driver.findComponent(ON.id("WebCursiveFontButton"));
      await component.click();
    })

    /**
     * @tc.name   testWebCursiveFontCustom003
     * @tc.number SUB_WEB_WEBCURSIVEFONT_CUSTOM_003
     * @tc.desc   test webCursiveFont with custom cursive font family
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebCursiveFontCustom003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebCursiveFontCustom003", 150204)
      Utils.registerEvent("testWebCursiveFontCustom003", '\"sans-serif\"', 20260313, done);
      let component = await driver.findComponent(ON.id("WebCursiveFontButton"));
      await component.click();
    })

    /**
     * @tc.name   testWebCursiveFontEmpty004
     * @tc.number SUB_WEB_WEBCURSIVEFONT_EMPTY_004
     * @tc.desc   test webCursiveFont with empty font family
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebCursiveFontEmpty004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebCursiveFontEmpty004", 150204)
      Utils.registerEvent("testWebCursiveFontEmpty004", "default", 20260314, done);
      let component = await driver.findComponent(ON.id("WebCursiveFontButton"));
      await component.click();
    })

    /**
     * @tc.name   testWebCursiveFontInvalid005
     * @tc.number SUB_WEB_WEBCURSIVEFONT_INVALID_005
     * @tc.desc   test webCursiveFont with invalid font family
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebCursiveFontInvalid005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebCursiveFontInvalid005", 150204)
      Utils.registerEvent("testWebCursiveFontInvalid005", "default", 20260315, done);
      let component = await driver.findComponent(ON.id("WebCursiveFontButton"));
      await component.click();
    })

    /**
     * @tc.name   testWebCursiveFontSerif006
     * @tc.number SUB_WEB_WEBCURSIVEFONT_SERIF_006
     * @tc.desc   test webCursiveFont with 'serif' font family
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebCursiveFontSerif006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebCursiveFontSerif006", 150204)
      Utils.registerEvent("testWebCursiveFontSerif006", '\"sans-serif\"', 20260316, done);
      let component = await driver.findComponent(ON.id("WebCursiveFontButton"));
      await component.click();
    })

  })
}