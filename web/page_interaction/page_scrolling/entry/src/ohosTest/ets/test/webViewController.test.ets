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
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

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
          await Utils.sleep(2000);
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
      await Utils.sleep(2000);
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
      Utils.emitEvent("testOnScroll001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testOnScroll001", true, 31022, done);
      sendEventByKey('WebViewControllerButton', 10, '');
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
      Utils.emitEvent("testOnScroll002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testOnScroll002", true, 100068, done);
      sendEventByKey('WebViewControllerButton', 10, '');
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
      Utils.emitEvent("testOnScroll003", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testOnScroll002", true, 100069, done);
      sendEventByKey('WebViewControllerButton', 10, '');
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
      Utils.emitEvent("testOnOverScroll001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testOnOverScroll001", true, 31038, done);
      sendEventByKey('WebViewControllerButton', 10, '');
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
      Utils.emitEvent("testOnOverScroll002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testOnOverScroll002", true, 100034, done);
      sendEventByKey('WebViewControllerButton', 10, '');
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
      Utils.emitEvent("testOnOverScroll003", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testOnOverScroll003", true, 100035, done);
      sendEventByKey('WebViewControllerButton', 10, '');
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
      Utils.emitEvent("testOnOverScroll004", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testOnOverScroll004", true, 100036, done);
      sendEventByKey('WebViewControllerButton', 10, '');
    })
  })
}
