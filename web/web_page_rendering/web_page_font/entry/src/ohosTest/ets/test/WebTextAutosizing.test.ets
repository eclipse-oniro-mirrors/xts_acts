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
import Utils from './Utils';
import { Driver, ON } from '@ohos.UiTest';
import router from '@ohos.router';
import { accessibility, config } from '@kit.AccessibilityKit';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
export default function webTextAutosizing() {

  describe('WebTextAutosizing', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/WebTextAutosizing',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebTextAutosizing state success " + JSON.stringify(pages));
        if (!("WebTextAutosizing" == pages.name)) {
          console.info("get WebTextAutosizing state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push WebTextAutosizing page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebTextAutosizing page error: " + err);
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

    /*
    * @tc.number     : SUB_WEB_WEBTEXTAUTOSIZING_0100
    * @tc.name       : testWebTextAutosizing001
    * @tc.desc       : test WebTextAutosizing
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('TextAutosizing0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("TextAutosizing0100", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("TextAutosizing0100", true, 4350, done);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebTextAutosizing"));
      await StartModel.click();
      await driver.delayMs(1000);
    })

    /*
    * @tc.number     : SUB_WEB_WEBTEXTAUTOSIZING_0200
    * @tc.name       : testWebTextAutosizing002
    * @tc.desc       : test WebTextAutosizing
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('TextAutosizing0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("TextAutosizing0200", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("TextAutosizing0200", true, 4352, done);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebTextAutosizing"));
      await StartModel.click();
      await driver.delayMs(1000);
    })

      /*
    * @tc.number     : SUB_WEB_WEBTEXTAUTOSIZING_0300
    * @tc.name       : testWebTextAutosizing003
    * @tc.desc       : test WebTextAutosizing
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('TextAutosizing0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("TextAutosizing0300", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("TextAutosizing0300", true, 4354, done);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebTextAutosizing"));
      await StartModel.click();
      await driver.delayMs(1000);
    })

    /*
    * @tc.number     : SUB_WEB_WEBTEXTAUTOSIZING_0400
    * @tc.name       : testWebTextAutosizing004
    * @tc.desc       : test WebTextAutosizing
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('TextAutosizing0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("TextAutosizing0400", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("TextAutosizing0400", true, 4356, done);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebTextAutosizing"));
      await StartModel.click();
      await driver.delayMs(1000);
    })
  })
}
