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

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

let emitKey = "";
const EVENT_ID_SET_SUITE_KEY = 179801;
let driver: Driver = Driver.create();

export default function webViewController() {

  describe('WebViewControllerTestSuite', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/webViewController',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webViewController state success " + JSON.stringify(pages));
        if (!("webViewController" == pages.name)) {
          console.info("get webViewController state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await driver.waitForComponent(ON.id("WebViewControllerButton"), 10000);
          console.info("push webViewController page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webViewController page error: " + err);
      }
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("webViewController beforeEach start");
      done();
    })

    /*
    * @tc.number     : SUB_WEB_ONSCROLL_0100
    * @tc.name       : testOnScroll001
    * @tc.desc       : test onScroll
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testOnScroll001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'testOnScroll001';
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(emitKey, true, 179810, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebViewControllerButton", emitKey);
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 1000);
      done();
    })

    /*
    * @tc.number     : SUB_WEB_ONSCROLL_0200
    * @tc.name       : testOnScroll002
    * @tc.desc       : test onScroll
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testOnScroll002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'testOnScroll002';
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(emitKey, true, 179820, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebViewControllerButton", emitKey);
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 1000);
      done();
    })

    /*
    * @tc.number     : SUB_WEB_ONSCROLL_0300
    * @tc.name       : testOnScroll003
    * @tc.desc       : test onScroll
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testOnScroll003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'testOnScroll003';
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(emitKey, true, 179830, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebViewControllerButton", emitKey);
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 1000);
      done();
    })
    /*
    * @tc.number     : SUB_WEB_ONOVERSCROLL_0100
    * @tc.name       : testOnOverScroll001
    * @tc.desc       : test onOverScroll
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testOnOverScroll001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'testOnOverScroll001';
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(emitKey, true, 179840, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebViewControllerButton", emitKey);
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 1000);
      done();
    })

    /*
    * @tc.number     : SUB_WEB_ONOVERSCROLL_0200
    * @tc.name       : testOnOverScroll002
    * @tc.desc       : test onOverScroll
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testOnOverScroll002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'testOnOverScroll002';
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(emitKey, true, 179850, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebViewControllerButton", emitKey);
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 1000);
      done();
    })

    /*
    * @tc.number     : SUB_WEB_ONOVERSCROLL_0300
    * @tc.name       : testOnOverScroll003
    * @tc.desc       : test onOverScroll
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testOnOverScroll003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'testOnOverScroll003';
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(emitKey, true, 179860, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebViewControllerButton", emitKey);
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 1000);
      done();
    })

    /*
    * @tc.number     : SUB_WEB_ONOVERSCROLL_0400
    * @tc.name       : testOnOverScroll004
    * @tc.desc       : test onOverScroll
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testOnOverScroll004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'testOnOverScroll004';
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(emitKey, true, 179870, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebViewControllerButton", emitKey);
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 1000);
      done();
    })
  })
}
