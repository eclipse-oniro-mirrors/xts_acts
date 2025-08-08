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
import { describe, beforeEach, afterEach, it, expect, beforeAll , TestType, Size, Level } from "@ohos/hypium";
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
// import router from '@system.router';
import router from '@ohos.router';
import { accessibility, config } from '@kit.AccessibilityKit';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
let emitKey = "emitAccessForwardInitErr";

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
          await Utils.sleep(2000);
          console.info("push webViewContPageOperationsError page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webViewContPageOperationsError page error: " + err);
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
      console.info("webViewContPageOperationsError beforeEach start");
      done();
    })
    afterEach(async (done: Function) => {
      console.info("webViewContPageOperationsError afterEach start:" + emitKey);
      try {
        let backData: events_emitter.EventData = {
          data: {
            "ACTION": emitKey
          }
        }
        let backEvent: events_emitter.InnerEvent = {
          eventId: 10,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("start send emitKey");
        events_emitter.emit(backEvent, backData);
      } catch (err) {
        console.info("emit emitKey  err: " + JSON.stringify(err));
      }
      await Utils.sleep(2000);
      done();
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERROR_1600
     *tc.name testAccessForwardInitErr
     *tc.desc test interface of accessForward with not been associated with specific Web Components
     */
    it('testAccessForwardInitErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitForwardInitErr";
      Utils.registerEvent("testAccessForwardInitErr", "17100001", 630, done);
      Utils.registerEvent("testAccessForwardInitErr", "Init error. The WebviewController must be associated with a Web component", 631, done);
      sendEventByKey('webViewContPageOperationsError', 10, '');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERROR_1700
     *tc.name testForwardInitErr
     *tc.desc test interface of forward with not been associated with specific Web Components
     */
    it('testForwardInitErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitAccessBackwardInitErr";
      Utils.registerEvent("testForwardInitErr", "17100001", 632, done);
      Utils.registerEvent("testForwardInitErr", "Init error. The WebviewController must be associated with a Web component", 633, done);
      sendEventByKey('webViewContPageOperationsError', 10, '');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERROR_1800
     *tc.name testAccessBackwardInitErr
     *tc.desc test interface of accessBackward with not been associated with specific Web Components
     */
    it('testAccessBackwardInitErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitBackwardInitErr";
      Utils.registerEvent("testAccessBackwardInitErr", "17100001", 634, done);
      Utils.registerEvent("testAccessBackwardInitErr", "Init error. The WebviewController must be associated with a Web component", 635, done);
      sendEventByKey('webViewContPageOperationsError', 10, '');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERROR_1900
     *tc.name testBackwardInitErr
     *tc.desc test interface of backward with not been associated with specific Web Components
     */
    it('testBackwardInitErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitOnActiveInitErr";
      Utils.registerEvent("testBackwardInitErr", "17100001", 636, done);
      Utils.registerEvent("testBackwardInitErr", "Init error. The WebviewController must be associated with a Web component", 637, done);
      sendEventByKey('webViewContPageOperationsError', 10, '');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERROR_2000
     *tc.name testOnActiveInitErr
     *tc.desc test interface of onActive with not been associated with specific Web Components
     */
    it('testOnActiveInitErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitOnInactiveInitErr";
      Utils.registerEvent("testOnActiveInitErr", "17100001", 638, done);
      Utils.registerEvent("testOnActiveInitErr", "Init error. The WebviewController must be associated with a Web component", 639, done);
      sendEventByKey('webViewContPageOperationsError', 10, '');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERROR_2100
     *tc.name testOnInactiveInitErr
     *tc.desc test interface of onInactive with not been associated with specific Web Components
     */
    it('testOnInactiveInitErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitRefreshInitErr";
      Utils.registerEvent("testOnInactiveInitErr", "17100001", 640, done);
      Utils.registerEvent("testOnInactiveInitErr", "Init error. The WebviewController must be associated with a Web component", 641, done);
      sendEventByKey('webViewContPageOperationsError', 10, '');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERROR_2200
     *tc.name testRefreshInitErr
     *tc.desc test interface of refresh with not been associated with specific Web Components
     */
    it('testRefreshInitErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitAccessStepInitErr";
      Utils.registerEvent("testRefreshInitErr", "17100001", 642, done);
      Utils.registerEvent("testRefreshInitErr", "Init error. The WebviewController must be associated with a Web component", 643, done);
      sendEventByKey('webViewContPageOperationsError', 10, '');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERROR_2300
     *tc.name testAccessStepInitErr
     *tc.desc test interface of accessStep with not been associated with specific Web Components
     */
    it('testAccessStepInitErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitClearHistoryInitErr";
      Utils.registerEvent("testAccessStepInitErr", "17100001", 644, done);
      Utils.registerEvent("testAccessStepInitErr", "Init error. The WebviewController must be associated with a Web component", 645, done);
      sendEventByKey('webViewContPageOperationsError', 10, '');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERROR_2400
     *tc.name testClearHistoryInitErr
     *tc.desc test interface of clearHistory with not been associated with specific Web Components
     */
    it('testClearHistoryInitErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitGetHitTestInitErr";
      Utils.registerEvent("testClearHistoryInitErr", "17100001", 646, done);
      Utils.registerEvent("testClearHistoryInitErr", "Init error. The WebviewController must be associated with a Web component", 647, done);
      sendEventByKey('webViewContPageOperationsError', 10, '');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERROR_2500
     *tc.name testGetHitTestInitErr
     *tc.desc test interface of getHitTest with not been associated with specific Web Components
     */
    it('testGetHitTestInitErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitGetHitTestInitErr";
      Utils.registerEvent("testGetHitTestInitErr", "17100001", 648, done);
      Utils.registerEvent("testGetHitTestInitErr", "Init error. The WebviewController must be associated with a Web component", 649, done);
      sendEventByKey('webViewContPageOperationsError', 10, '');
    })
  })
}