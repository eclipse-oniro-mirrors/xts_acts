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
import { beforeAll, beforeEach, describe, it } from '@ohos/hypium';
import Utils from './Utils';
import { Driver, ON } from '@ohos.UiTest';
import router from '@ohos.router';

export default function setAndClearWebSchemeHandler() {

  describe('setAndClearWebSchemeHandler', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/setAndClearWebSchemeHandler',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get setAndClearWebSchemeHandler state success " + JSON.stringify(pages));
        if (!("setAndClearWebSchemeHandler" == pages.name)) {
          console.info("get setAndClearWebSchemeHandler state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push setAndClearWebSchemeHandler page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push setAndClearWebSchemeHandler page error: " + err);
      }
      done()
    });
    beforeEach(async (done: Function) => {
      await Utils.sleep(2000);
      console.info("web beforeEach start");
      done();
    })

    /*
    * @tc.number     : SUB_WEB_SETANDCLEARWEBSCHEMEHANDLER_0100
    * @tc.name       : testsetAndClearWebSchemeHandler0100
    * @tc.desc       : test setAndClearWebSchemeHandler
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('setAndClearWebSchemeHandler0100', 0, async (done: Function) => {
      Utils.emitEvent("setAndClearWebSchemeHandler0100", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("setAndClearWebSchemeHandler0100", "https://www.baidu.com/", 8822, done);
      Utils.registerEvent("setAndClearWebSchemeHandler0100", "GET", 8824, done);
      Utils.registerEvent("setAndClearWebSchemeHandler0100", "", 8826, done);
      Utils.registerEvent("setAndClearWebSchemeHandler0100", false, 8830, done);
      await Utils.sleep(2000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("setAndClearWebSchemeHandler"));
      await StartModel.click();
      await driver.delayMs(1000);
    })

    /*
    * @tc.number     : SUB_WEB_SETANDCLEARWEBSCHEMEHANDLER_0200
    * @tc.name       : testsetAndClearWebSchemeHandler0200
    * @tc.desc       : test setAndClearWebSchemeHandler
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('setAndClearWebSchemeHandler0200', 0, async (done: Function) => {
      Utils.emitEvent("setAndClearWebSchemeHandler0200", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("setAndClearWebSchemeHandler0200", "lock", 8832, done);
      Utils.registerEvent("setAndClearWebSchemeHandler0200", "lock", 8834, done);
      Utils.registerEvent("setAndClearWebSchemeHandler0200", "lock", 8836, done);
      Utils.registerEvent("setAndClearWebSchemeHandler0200", false, 8838, done);
      Utils.registerEvent("setAndClearWebSchemeHandler0200", true, 8840, done);
      await Utils.sleep(2000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("setAndClearWebSchemeHandler"));
      await StartModel.click();
      await driver.delayMs(1000);
    })

    /*
    * @tc.number     : SUB_WEB_SETANDCLEARWEBSCHEMEHANDLER_0300
    * @tc.name       : testsetAndClearWebSchemeHandler0300
    * @tc.desc       : test setAndClearWebSchemeHandler
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('setAndClearWebSchemeHandler0300', 0, async (done: Function) => {
      Utils.emitEvent("setAndClearWebSchemeHandler0300", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("setAndClearWebSchemeHandler0300", "https://www.baidu.com/", 8842, done);
      Utils.registerEvent("setAndClearWebSchemeHandler0300", "GET", 8844, done);
      Utils.registerEvent("setAndClearWebSchemeHandler0300", "", 8846, done);
      Utils.registerEvent("setAndClearWebSchemeHandler0300", false, 8850, done);
      await Utils.sleep(2000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("setAndClearWebSchemeHandler"));
      await StartModel.click();
      await driver.delayMs(1000);
    })
  })
}
