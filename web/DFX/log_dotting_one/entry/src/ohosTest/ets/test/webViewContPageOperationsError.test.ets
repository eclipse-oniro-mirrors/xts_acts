/**
 * Copyright (c) 2023 iSoftStone Information Technology (Group) Co.,Ltd.
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
import { describe, beforeEach, it, beforeAll, TestType, Size, Level } from "@ohos/hypium";
import Utils from './Utils';
import router from '@ohos.router';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';

const EVENT_ID_SET_EMIT_KEY = 111890;
const driver = Driver.create();
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
let emitKey = "";

export default function webViewContPageOperationsError() {
  describe('ActsAceWebDevWebViewContPageOperationsErrorTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/webViewContPageOperationsError',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webViewContPageOperationsError state success " + JSON.stringify(pages));
        if (!("webViewContPageOperationsError" == pages.name)) {
          console.info("get webViewContPageOperationsError state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push webViewContPageOperationsError page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webViewContPageOperationsError page error: " + err);
      }
      await driver.waitForComponent(ON.id("webViewContPageOperationsError"), 10000);
      console.log("waitForComponent webViewContPageOperationsError");
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("webViewContPageOperationsError beforeEach start");
      done();
    })

    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERROR_1600
     *tc.name testAccessForwardInitErr
     *tc.desc test interface of accessForward with not been associated with specific Web Components
     */
    it('testAccessForwardInitErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitAccessForwardInitErr";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testAccessForwardInitErr", "17100001", 111900, null);
      Utils.registerEvent("testAccessForwardInitErr", "Init error. The WebviewController must be associated with a Web component", 111910, done);
      await Utils.waitAndClickComponent(driver, "webViewContPageOperationsError");
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERROR_1700
     *tc.name testForwardInitErr
     *tc.desc test interface of forward with not been associated with specific Web Components
     */
    it('testForwardInitErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitForwardInitErr";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testForwardInitErr", "17100001", 111920, null);
      Utils.registerEvent("testForwardInitErr", "Init error. The WebviewController must be associated with a Web component", 111930, done);
      await Utils.waitAndClickComponent(driver, "webViewContPageOperationsError");
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERROR_1800
     *tc.name testAccessBackwardInitErr
     *tc.desc test interface of accessBackward with not been associated with specific Web Components
     */
    it('testAccessBackwardInitErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitAccessBackwardInitErr";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testAccessBackwardInitErr", "17100001", 111940, null);
      Utils.registerEvent("testAccessBackwardInitErr", "Init error. The WebviewController must be associated with a Web component", 111950, done);
      await Utils.waitAndClickComponent(driver, "webViewContPageOperationsError");
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERROR_1900
     *tc.name testBackwardInitErr
     *tc.desc test interface of backward with not been associated with specific Web Components
     */
    it('testBackwardInitErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitBackwardInitErr";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testBackwardInitErr", "17100001", 111960, null);
      Utils.registerEvent("testBackwardInitErr", "Init error. The WebviewController must be associated with a Web component", 111970, done);
      await Utils.waitAndClickComponent(driver, "webViewContPageOperationsError");
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERROR_2000
     *tc.name testOnActiveInitErr
     *tc.desc test interface of onActive with not been associated with specific Web Components
     */
    it('testOnActiveInitErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitOnActiveInitErr";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testOnActiveInitErr", "17100001", 111980, null);
      Utils.registerEvent("testOnActiveInitErr", "Init error. The WebviewController must be associated with a Web component", 111990, done);
      await Utils.waitAndClickComponent(driver, "webViewContPageOperationsError");
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERROR_2100
     *tc.name testOnInactiveInitErr
     *tc.desc test interface of onInactive with not been associated with specific Web Components
     */
    it('testOnInactiveInitErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitOnInactiveInitErr";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testOnInactiveInitErr", "17100001", 112000, null);
      Utils.registerEvent("testOnInactiveInitErr", "Init error. The WebviewController must be associated with a Web component", 112010, done);
      await Utils.waitAndClickComponent(driver, "webViewContPageOperationsError");
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERROR_2200
     *tc.name testRefreshInitErr
     *tc.desc test interface of refresh with not been associated with specific Web Components
     */
    it('testRefreshInitErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitRefreshInitErr";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testRefreshInitErr", "17100001", 112020, null);
      Utils.registerEvent("testRefreshInitErr", "Init error. The WebviewController must be associated with a Web component", 112030, done);
      await Utils.waitAndClickComponent(driver, "webViewContPageOperationsError");
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERROR_2300
     *tc.name testAccessStepInitErr
     *tc.desc test interface of accessStep with not been associated with specific Web Components
     */
    it('testAccessStepInitErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitAccessStepInitErr";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testAccessStepInitErr", "17100001", 112040, null);
      Utils.registerEvent("testAccessStepInitErr", "Init error. The WebviewController must be associated with a Web component", 112050, done);
      await Utils.waitAndClickComponent(driver, "webViewContPageOperationsError");
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERROR_2400
     *tc.name testClearHistoryInitErr
     *tc.desc test interface of clearHistory with not been associated with specific Web Components
     */
    it('testClearHistoryInitErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitClearHistoryInitErr";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testClearHistoryInitErr", "17100001", 112060, null);
      Utils.registerEvent("testClearHistoryInitErr", "Init error. The WebviewController must be associated with a Web component", 112070, done);
      await Utils.waitAndClickComponent(driver, "webViewContPageOperationsError");
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERROR_2500
     *tc.name testGetHitTestInitErr
     *tc.desc test interface of getHitTest with not been associated with specific Web Components
     */
    it('testGetHitTestInitErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitGetHitTestInitErr";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testGetHitTestInitErr", "17100001", 112080, null);
      Utils.registerEvent("testGetHitTestInitErr", "Init error. The WebviewController must be associated with a Web component", 112090, done);
      await Utils.waitAndClickComponent(driver, "webViewContPageOperationsError");
    })
  })
}