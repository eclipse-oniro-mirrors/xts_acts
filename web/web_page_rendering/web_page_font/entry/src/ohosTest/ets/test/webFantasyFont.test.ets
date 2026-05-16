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
export default function webFantasyFont() {

  describe('webFantasyFont', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/webFantasyFont',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webFantasyFont state success " + JSON.stringify(pages));
        if (!("webTwo" == pages.name)) {
          console.info("get webFantasyFont state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push webFantasyFont page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webFantasyFont page error: " + err);
      }
      await driver.waitForComponent(ON.id("WebFantasyFontButton"), 10000);
      console.log("waitForComponent WebFantasyFontButton");
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
     * @tc.name   emitWebFantasyFont001
     * @tc.number emitWebFantasyFont001
     * @tc.desc   test minLogicalFontSize
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('emitWebFantasyFont001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitWebFantasyFont001", 150120)
      Utils.registerEvent("emitWebFantasyFont001", 0, 150130, done);
      let component = await driver.findComponent(ON.id("WebFantasyFontButton"));
      await component.click();
    })

    /**
     * @tc.name   emitWebFantasyFont002
     * @tc.number emitWebFantasyFont002
     * @tc.desc   test minLogicalFontSize
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('emitWebFantasyFont002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitWebFantasyFont002", 150120)
      Utils.registerEvent("emitWebFantasyFont002", 0, 121000, done);
      let component = await driver.findComponent(ON.id("WebFantasyFontButton"));
      await component.click();
    })

    /**
     * @tc.name   emitWebFantasyFont003
     * @tc.number emitWebFantasyFont003
     * @tc.desc   test minLogicalFontSize
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('emitWebFantasyFont003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitWebFantasyFont003", 150120)
      Utils.registerEvent("emitWebFantasyFont003", true, 121010, done);
      let component = await driver.findComponent(ON.id("WebFantasyFontButton"));
      await component.click();
    })

    /**
     * @tc.name   emitWebFantasyFont004
     * @tc.number emitWebFantasyFont004
     * @tc.desc   test minLogicalFontSize
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('emitWebFantasyFont004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitWebFantasyFont004", 150120)
      Utils.registerEvent("emitWebFantasyFont004", true, 121020, done);
      let component = await driver.findComponent(ON.id("WebFantasyFontButton"));
      await component.click();
    })

    /**
     * @tc.name   emitWebCursiveFont005
     * @tc.number emitWebCursiveFont005
     * @tc.desc   test minLogicalFontSize
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('emitWebCursiveFont005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitWebCursiveFont005", 150120)
      Utils.registerEvent("emitWebCursiveFont005", true, 121030, done);
      let component = await driver.findComponent(ON.id("WebFantasyFontButton"));
      await component.click();
    })

    /**
     * @tc.name   emitWebCursiveFont006
     * @tc.number emitWebCursiveFont006
     * @tc.desc   test minLogicalFontSize
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('emitWebCursiveFont006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitWebCursiveFont006", 150120)
      Utils.registerEvent("emitWebCursiveFont006", true, 121040, done);
      let component = await driver.findComponent(ON.id("WebFantasyFontButton"));
      await component.click();
    })

    /**
     * @tc.name   emitWebCursiveFont007
     * @tc.number emitWebCursiveFont007
     * @tc.desc   test minLogicalFontSize
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('emitWebCursiveFont007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitWebCursiveFont007", 150120)
      Utils.registerEvent("emitWebCursiveFont007", true, 121050, done);
      let component = await driver.findComponent(ON.id("WebFantasyFontButton"));
      await component.click();
    })

    /**
     * @tc.name   emitWebCursiveFont008
     * @tc.number emitWebCursiveFont008
     * @tc.desc   test minLogicalFontSize
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('emitWebCursiveFont008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitWebCursiveFont008", 150120)
      Utils.registerEvent("emitWebCursiveFont008", true, 121060, done);
      let component = await driver.findComponent(ON.id("WebFantasyFontButton"));
      await component.click();
    })

    /**
     * @tc.name   emitWebCursiveFont009
     * @tc.number emitWebCursiveFont009
     * @tc.desc   test minLogicalFontSize
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('emitWebCursiveFont009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitWebCursiveFont009", 150120)
      Utils.registerEvent("emitWebCursiveFont009", true, 121070, done);
      let component = await driver.findComponent(ON.id("WebFantasyFontButton"));
      await component.click();
    })
  })
}
