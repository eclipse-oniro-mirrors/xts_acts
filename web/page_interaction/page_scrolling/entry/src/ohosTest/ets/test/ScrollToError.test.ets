/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { beforeAll, beforeEach, describe, it, TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

const EVENT_ID_SET_SUITE_KEY = 179550;
let driver: Driver = Driver.create();

export default function scrollToError() {
  describe('scrollToErrorTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/ScrollToError',
      };
      try {
        router.clear();
        let pages = router.getState();
        console.info("get scrollToError state success " + JSON.stringify(pages));
        if (!("ScrollToError" == pages.name)) {
          console.info("get scrollToError state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await driver.waitForComponent(ON.id("scrollToErrorButton"), 10000);
          console.info("push scrollToError page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push scrollToError page error: " + err);
      }
      done();
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
     * @tc.name   testScrollToXNull
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_SCROLLTO_ERROR_001
     * @tc.desc   WebviewController scrollTo x null test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testScrollToXNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testScrollToXNull", EVENT_ID_SET_SUITE_KEY)
      let isReturn = 0;
      Utils.registerEvent("testScrollToXNull", "401", 179551, ()=> {isReturn = 1});
      await Utils.waitAndClickComponent(driver, "scrollToErrorButton","testScrollToXNull");
      await Utils.waitForExist(()=>isReturn, "testScrollToXNull", 1, 1000);
      done();
    })

    /**
     * @tc.name   testScrollToXUndefined
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_SCROLLTO_ERROR_002
     * @tc.desc   WebviewController scrollTo x undefined test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testScrollToXUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testScrollToXUndefined", EVENT_ID_SET_SUITE_KEY);
      Utils.registerEvent("testScrollToXUndefined", "401", 179552, done);
      sendEventByKey('scrollToErrorButton', 10, '');
    })

    /**
     * @tc.name   testScrollToYNull
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_SCROLLTO_ERROR_003
     * @tc.desc   WebviewController scrollTo y null test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testScrollToYNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testScrollToYNull", EVENT_ID_SET_SUITE_KEY);
      Utils.registerEvent("testScrollToYNull", "401", 179553, done);
      sendEventByKey('scrollToErrorButton', 10, '');
    })

    /**
     * @tc.name   testScrollToYUndefined
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_SCROLLTO_ERROR_004
     * @tc.desc   WebviewController scrollTo y undefined test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testScrollToYUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testScrollToYUndefined", EVENT_ID_SET_SUITE_KEY);
      Utils.registerEvent("testScrollToYUndefined", "401", 179554, done);
      sendEventByKey('scrollToErrorButton', 10, '');
    })

    /**
     * @tc.name   testScrollToDurationNull
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_SCROLLTO_ERROR_005
     * @tc.desc   WebviewController scrollTo duration null test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testScrollToDurationNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testScrollToDurationNull", EVENT_ID_SET_SUITE_KEY);
      Utils.registerEvent("testScrollToDurationNull", "401", 179555, done);
      sendEventByKey('scrollToErrorButton', 10, '');
    })

    /**
     * @tc.name   testScrollToDurationUndefined
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_SCROLLTO_ERROR_006
     * @tc.desc   WebviewController scrollTo duration undefined test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testScrollToDurationUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testScrollToDurationUndefined", EVENT_ID_SET_SUITE_KEY);
      Utils.registerEvent("testScrollToDurationUndefined", "401", 179556, done);
      sendEventByKey('scrollToErrorButton', 10, '');
    })
  })
}
