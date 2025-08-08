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
import { Driver, ON } from '@ohos.UiTest';
import resourceManager from '@ohos.resourceManager';
import { accessibility, config } from '@kit.AccessibilityKit';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
export default function webViewControllerResumeAllTimers() {

 describe('webViewControllerResumeAllTimers', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebViewControllerResumeAllTimers',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebViewControllerResumeAllTimers state success " + JSON.stringify(pages));
        if (!("webViewControllerResumeAllTimers" == pages.name)) {
          console.info("get WebViewControllerResumeAllTimers state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push WebViewControllerResumeAllTimers page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebViewControllerResumeAllTimers page error: " + err);
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
    * @tc.number     : SUB_WEB_RESUMEALLTIMERS_0100
    * @tc.name       : testResumeAllTimers001
    * @tc.desc       : test ResumeAllTimers
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
      it('resumeAllTimers0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("resumeAllTimers0100", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("resumeAllTimers0100", true, 501, done);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebViewControllerResumeAllTimers"));
      await StartModel.click();
      await driver.delayMs(1000);
    })

    /*
    * @tc.number     : SUB_WEB_RESUMEALLTIMERS_0200
    * @tc.name       : testResumeAllTimers002
    * @tc.desc       : test ResumeAllTimers
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('resumeAllTimers0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("resumeAllTimers0200", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("resumeAllTimers0200", true, 502, done);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebViewControllerResumeAllTimers"));
      await StartModel.click();
      await driver.delayMs(1000);
    })

    /*
    * @tc.number     : SUB_WEB_RESUMEALLTIMERS_0300
    * @tc.name       : testResumeAllTimers003
    * @tc.desc       : test ResumeAllTimers
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('resumeAllTimers0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("resumeAllTimers0300", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("resumeAllTimers0300", true, 503, done);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebViewControllerResumeAllTimers"));
      await StartModel.click();
      await driver.delayMs(1000);
    })

    /*
    * @tc.number     : SUB_WEB_RESUMEALLTIMERS_0400
    * @tc.name       : testResumeAllTimers004
    * @tc.desc       : test ResumeAllTimers
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('resumeAllTimers0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("resumeAllTimers0400", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("resumeAllTimers0400", true, 504, done);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebViewControllerResumeAllTimers"));
      await StartModel.click();
      await driver.delayMs(1000);
    })

    /*
    * @tc.number     : SUB_WEB_RESUMEALLTIMERS_0500
    * @tc.name       : testResumeAllTimers005
    * @tc.desc       : test ResumeAllTimers
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('resumeAllTimers0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("resumeAllTimers0500", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("resumeAllTimers0500", true, 505, done);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebViewControllerResumeAllTimers"));
      await StartModel.click();
      await driver.delayMs(1000);
    })

    /*
    * @tc.number     : SUB_WEB_RESUMEALLTIMERS_0600
    * @tc.name       : testResumeAllTimers006
    * @tc.desc       : test ResumeAllTimers
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('resumeAllTimers0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("resumeAllTimers0600", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("resumeAllTimers0600", true, 506, done);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebViewControllerResumeAllTimers"));
      await StartModel.click();
      await driver.delayMs(1000);
    })

    /*
    * @tc.number     : SUB_WEB_RESUMEALLTIMERS_0700
    * @tc.name       : testResumeAllTimers007
    * @tc.desc       : test ResumeAllTimers
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('resumeAllTimers0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("resumeAllTimers0700", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("resumeAllTimers0700", true, 507, done);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebViewControllerResumeAllTimers"));
      await StartModel.click();
      await driver.delayMs(1000);
    })
  })
}
