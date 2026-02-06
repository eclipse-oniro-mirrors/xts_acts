/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { afterEach, beforeAll, beforeEach, describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils.test';
import events_emitter from '@ohos.events.emitter';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';
import { waitForExist} from './WaitTest.test';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

const EVENT_ID_SET_SUITE_KEY = 300752;
const driver = Driver.create();

export default function ActsAceWebViewOnMicrophoneCaptureStateChangeTest() {

  describe('ActsAceWebViewOnMicrophoneCaptureStateChange', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebViewOnMicrophoneCaptureStateChange',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webViewOnMicrophoneCaptureStateChange state success " + JSON.stringify(pages));
        if (!("WebViewOnMicrophoneCaptureStateChange" == pages.name)) {
          console.info("get webViewOnMicrophoneCaptureStateChange state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000)
          console.info("push webViewOnMicrophoneCaptureStateChange page success " + JSON.stringify(result));
          await driver.waitForComponent(ON.id("webViewOnMicrophoneCaptureStateChangeButton"), 10000)
        }
      } catch (err) {
        console.error("push WebViewContextMenuMediaType page error: " + err);
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


    /**
     * @tc.name   testOnMicrophoneCaptureStateChange001
     * @tc.number SUB_ACE_WEBVIEW_ONMICROPHONECAPTURESTATECHANGE_0001
     * @tc.desc   test OnMicrophoneCaptureStateChange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEXT
     * @tc.level  LEVEL0
     */
    it('testOnMicrophoneCaptureStateChange001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitOnMicrophoneCaptureStateChange001", 300752)
      Utils.registerEvent("testOnMicrophoneCaptureStateChange001", true, 20260101, done);
      sendEventByKey('webViewOnMicrophoneCaptureStateChangeButton', 10, '');
      Utils.waitAndClickComponent(driver, "webViewOnMicrophoneCaptureStateChangeButton");
    })


    /**
     * @tc.name   testOnMicrophoneCaptureStateChange002
     * @tc.number SUB_ACE_WEBVIEW_ONMICROPHONECAPTURESTATECHANGE_0002
     * @tc.desc   test OnMicrophoneCaptureStateChange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEXT
     * @tc.level  LEVEL2
     */
    it('testOnMicrophoneCaptureStateChange002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitOnMicrophoneCaptureStateChange002", 300752)
      Utils.registerEvent("testOnMicrophoneCaptureStateChange002", MicrophoneCaptureState.PAUSED, 20251229, done);
      Utils.waitAndClickComponent(driver, "webViewOnMicrophoneCaptureStateChangeButton");
    })


    /**
     * @tc.name   testOnMicrophoneCaptureStateChange003
     * @tc.number SUB_ACE_WEBVIEW_ONMICROPHONECAPTURESTATECHANGE_API_0003
     * @tc.desc   test OnMicrophoneCaptureStateChange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEXT
     * @tc.level  LEVEL2
     */
    it('testOnMicrophoneCaptureStateChange003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitOnMicrophoneCaptureStateChange003", 300752)
      Utils.registerEvent("testOnMicrophoneCaptureStateChange003", MicrophoneCaptureState.ACTIVE, 20251230, done);
      Utils.waitAndClickComponent(driver, "webViewOnMicrophoneCaptureStateChangeButton");
    })

    /**
     * @tc.name   testOnMicrophoneCaptureStateChange004
     * @tc.number SUB_ACE_WEBVIEW_ONMICROPHONECAPTURESTATECHANGE_API_0004
     * @tc.desc   test OnMicrophoneCaptureStateChange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEXT
     * @tc.level  LEVEL2
     */
    it('testOnMicrophoneCaptureStateChange004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitOnMicrophoneCaptureStateChange004", 300752)
      Utils.registerEvent("testOnMicrophoneCaptureStateChange004", MicrophoneCaptureState.NONE, 20251231, done);
      Utils.waitAndClickComponent(driver, "webViewOnMicrophoneCaptureStateChangeButton");
    })

  })
}