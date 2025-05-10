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

export default function webOnFirstMeaningfulPaint() {
  describe('WebOnFirstMeaningfulPaint', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebOnFirstMeaningfulPaint',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebOnFirstMeaningfulPaint state success " + JSON.stringify(pages));
        if (!("WebOnFirstMeaningfulPaint" == pages.name)) {
          console.info("get WebOnFirstMeaningfulPaint state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push WebOnFirstMeaningfulPaint page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebOnFirstMeaningfulPaint page error: " + err);
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
    * @tc.number     : SUB_WEB_WEBONFIRSTMEANINGFULPAINT_0100
    * @tc.name       : testWebOnFirstMeaningfulPaint001
    * @tc.desc       : test WebOnFirstMeaningfulPaint
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('OnFirstMeaningfulPaint0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("OnFirstMeaningfulPaint0100", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("OnFirstMeaningfulPaint0100", true, 701, done);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebOnFirstMeaningfulPaint"));
      await StartModel.click();
      await driver.delayMs(1000);
    })

    /*
    * @tc.number     : SUB_WEB_WEBONFIRSTMEANINGFULPAINT_0200
    * @tc.name       : testWebOnFirstMeaningfulPaint002
    * @tc.desc       : test WebOnFirstMeaningfulPaint
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('OnFirstMeaningfulPaint0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("OnFirstMeaningfulPaint0200", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("OnFirstMeaningfulPaint0200", true, 702, done);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebOnFirstMeaningfulPaint"));
      await StartModel.click();
      await driver.delayMs(1000);
    })
  })
}
