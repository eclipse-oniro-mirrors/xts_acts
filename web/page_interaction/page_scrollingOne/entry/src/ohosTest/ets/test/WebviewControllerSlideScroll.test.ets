/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under * Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with * License.
 * You may obtain a copy of * License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under * License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See * License for * specific language governing permissions and
 * limitations under * License.
 */
import { beforeAll, afterEach, beforeEach, describe, it , TestType, Size, Level } from '@ohos/hypium';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
import router from '@ohos.router';
import { Driver, ON } from '@kit.TestKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { accessibility, config } from '@kit.AccessibilityKit';
const driver = Driver.create();
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
const EVENT_ID_SET_SUITE_KEY = 154017;

let emitKey = "";

export default function WebviewControllerSlideScrollTest() {
  describe('WebviewControllerSlideScrollTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebviewControllerSlideScroll',
      }
      try {
        await Utils.sleep(1000);
        router.clear();
        let pages = router.getState();
        console.info("get WebviewControllerSlideScroll state success " + JSON.stringify(pages));
        if (!("WebviewControllerSlideScroll" == pages.name)) {
          console.info("get WebviewControllerSlideScroll state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push WebviewControllerSlideScroll page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebviewControllerSlideScroll page error: " + err);
      }
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("web beforeEach start");
      try {
        await driver.waitForComponent(ON.id("slideScrollClick"), 10000);
      } catch (e) {
        const error = e as BusinessError;
        console.error(`${emitKey} ErrorCode: ${error.code},  Message: ${error.message}`);
      }
      done();
    })

    afterEach(async (done: Function) => {
      console.info("web afterEach start:" + emitKey);
      done();
    })

    /**
     * @tc.name testSlideScrollVxNullVyNull
     * @tc.number SUB_WEB_WEBVIEW_CONTROLLER_SLIDE_SCROLL_VX_NULL_VY_NULL_001
     * @tc.desc Test slideScroll with vx=null, vy=null
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testSlideScrollVxNullVyNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        emitKey = 'testSlideScrollVxNullVyNull';
        let tcName = 'testSlideScrollVxNullVyNull';
        let isReturn = false;
        Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY);
        Utils.registerEvent(tcName, "error", 20260271, () => {
          isReturn = true
        });
        Utils.waitAndClickComponent(driver, "slideScrollClick", tcName);
        await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
        done();
      });

    /**
     * @tc.name testSlideScrollVxNullVyUndefined
     * @tc.number SUB_WEB_WEBVIEW_CONTROLLER_SLIDE_SCROLL_VX_NULL_VY_UNDEFINED_002
     * @tc.desc Test slideScroll with vx=null, vy=undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testSlideScrollVxNullVyUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        emitKey = 'testSlideScrollVxNullVyUndefined';
        let tcName = 'testSlideScrollVxNullVyUndefined';
        let isReturn = false;
        Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY);
        Utils.registerEvent(tcName, "error", 20260272, () => {
          isReturn = true
        });
        Utils.waitAndClickComponent(driver, "slideScrollClick", tcName);
        await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
        done();
      });

    /**
     * @tc.name testSlideScrollVxUndefinedVyNull
     * @tc.number SUB_WEB_WEBVIEW_CONTROLLER_SLIDE_SCROLL_VX_UNDEFINED_VY_NULL_003
     * @tc.desc Test slideScroll with vx=undefined, vy=null
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testSlideScrollVxUndefinedVyNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        emitKey = 'testSlideScrollVxUndefinedVyNull';
        let tcName = 'testSlideScrollVxUndefinedVyNull';
        let isReturn = false;
        Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY);
        Utils.registerEvent(tcName, "error", 20260273, () => {
          isReturn = true
        });
        Utils.waitAndClickComponent(driver, "slideScrollClick", tcName);
        await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
        done();
      });

    /**
     * @tc.name testSlideScrollVxUndefinedVyUndefined
     * @tc.number SUB_WEB_WEBVIEW_CONTROLLER_SLIDE_SCROLL_VX_UNDEFINED_VY_UNDEFINED_004
     * @tc.desc Test slideScroll with vx=undefined, vy=undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testSlideScrollVxUndefinedVyUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        emitKey = 'testSlideScrollVxUndefinedVyUndefined';
        let tcName = 'testSlideScrollVxUndefinedVyUndefined';
        let isReturn = false;
        Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY);
        Utils.registerEvent(tcName, "error", 20260274, () => {
          isReturn = true
        });
        Utils.waitAndClickComponent(driver, "slideScrollClick", tcName);
        await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
        done();
      });
  })
}
