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
import { WebNetErrorList } from '@ohos.web.netErrorList'
import { accessibility, config } from '@kit.AccessibilityKit';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
export default function WebCameraApiNoCrash() {

  describe('WebCameraApiNoCrash', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebCameraApiNoCrash',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebCameraApiNoCrash state success " + JSON.stringify(pages));
        if (!("WebCameraApiNoCrash" == pages.name)) {
          console.info("get WebCameraApiNoCrash state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push WebCameraApiNoCrash page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebCameraApiNoCrash page error: " + err);
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
    * @tc.number     : SUB_WEB_WEBCAMERAAPINOCRASH_100
    * @tc.name       : testWebCameraApiNoCrash0100
    * @tc.desc       : test WebCameraApiNoCrash
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 0
    */
    it('WebCameraApiNoCrash0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("WebCameraApiNoCrash0100", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("WebCameraApiNoCrash0100", true, 1401, done);
      await Utils.sleep(2000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebCameraApiNoCrash"));
      await StartModel.click();
      await driver.delayMs(1000);
    })

    /*
    * @tc.number     : SUB_WEB_WEBCAMERAAPINOCRASH_200
    * @tc.name       : testWebCameraApiNoCrash0200
    * @tc.desc       : test WebCameraApiNoCrash
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('WebCameraApiNoCrash0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebCameraApiNoCrash0200", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("WebCameraApiNoCrash0200", true, 1402, done);
      await Utils.sleep(2000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebCameraApiNoCrash"));
      await StartModel.click();
      await driver.delayMs(1000);
    })

    /*
    * @tc.number     : SUB_WEB_WEBCAMERAAPINOCRASH_300
    * @tc.name       : testWebCameraApiNoCrash0300
    * @tc.desc       : test WebCameraApiNoCrash
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('WebCameraApiNoCrash0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebCameraApiNoCrash0300", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("WebCameraApiNoCrash0300", true, 1403, done);
      await Utils.sleep(2000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebCameraApiNoCrash"));
      await StartModel.click();
      await driver.delayMs(1000);
    })

    /*
    * @tc.number     : SUB_WEB_WEBCAMERAAPINOCRASH_400
    * @tc.name       : testWebCameraApiNoCrash0400
    * @tc.desc       : test WebCameraApiNoCrash
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('WebCameraApiNoCrash0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebCameraApiNoCrash0400", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("WebCameraApiNoCrash0400", true, 1404, done);
      await Utils.sleep(2000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebCameraApiNoCrash"));
      await StartModel.click();
      await driver.delayMs(1000);
    })

    /*
    * @tc.number     : SUB_WEB_WEBCAMERAAPINOCRASH_500
    * @tc.name       : testWebCameraApiNoCrash0500
    * @tc.desc       : test WebCameraApiNoCrash
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('WebCameraApiNoCrash0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebCameraApiNoCrash0500", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("WebCameraApiNoCrash0500", true, 1405, done);
      await Utils.sleep(2000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebCameraApiNoCrash"));
      await StartModel.click();
      await driver.delayMs(1000);
    })

    /*
    * @tc.number     : SUB_WEB_WEBCAMERAAPINOCRASH_600
    * @tc.name       : testWebCameraApiNoCrash0600
    * @tc.desc       : test WebCameraApiNoCrash
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('WebCameraApiNoCrash0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebCameraApiNoCrash0600", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("WebCameraApiNoCrash0600", true, 1406, done);
      await Utils.sleep(2000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebCameraApiNoCrash"));
      await StartModel.click();
      await driver.delayMs(1000);
    })

    /*
    * @tc.number     : SUB_WEB_WEBCAMERAAPINOCRASH_700
    * @tc.name       : testWebCameraApiNoCrash0700
    * @tc.desc       : test WebCameraApiNoCrash
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('WebCameraApiNoCrash0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebCameraApiNoCrash0700", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("WebCameraApiNoCrash0700", true, 1407, done);
      await Utils.sleep(2000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebCameraApiNoCrash"));
      await StartModel.click();
      await driver.delayMs(1000);
    })

    /*
    * @tc.number     : SUB_WEB_WEBCAMERAAPINOCRASH_800
    * @tc.name       : testWebCameraApiNoCrash0800
    * @tc.desc       : test WebCameraApiNoCrash
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('WebCameraApiNoCrash0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebCameraApiNoCrash0800", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("WebCameraApiNoCrash0800", true, 1408, done);
      await Utils.sleep(2000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebCameraApiNoCrash"));
      await StartModel.click();
      await driver.delayMs(1000);
    })

    /*
    * @tc.number     : SUB_WEB_WEBCAMERAAPINOCRASH_900
    * @tc.name       : testWebCameraApiNoCrash0900
    * @tc.desc       : test WebCameraApiNoCrash
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('WebCameraApiNoCrash0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebCameraApiNoCrash0900", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("WebCameraApiNoCrash0900", true, 1409, done);
      await Utils.sleep(2000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebCameraApiNoCrash"));
      await StartModel.click();
      await driver.delayMs(1000);
    })

    /*
    * @tc.number     : SUB_WEB_WEBCAMERAAPINOCRASH_1000
    * @tc.name       : testWebCameraApiNoCrash1000
    * @tc.desc       : test WebCameraApiNoCrash
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('WebCameraApiNoCrash1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebCameraApiNoCrash1000", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("WebCameraApiNoCrash1000", true, 1410, done);
      await Utils.sleep(2000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebCameraApiNoCrash"));
      await StartModel.click();
      await driver.delayMs(1000);
    })
  })
}
