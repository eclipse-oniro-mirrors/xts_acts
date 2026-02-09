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

export default function ActsAceWebViewOnCameraCaptureStateChangeCase() {

  describe('ActsAceWebViewOnCameraCaptureStateChangeTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebViewOnCameraCaptureStateChange',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebViewOnCameraCaptureStateChange state success " + JSON.stringify(pages));
        if (!("WebViewOnCameraCaptureStateChange" == pages.name)) {
          console.info("get WebViewOnCameraCaptureStateChange state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000)
          console.info("push WebViewOnCameraCaptureStateChange page success " + JSON.stringify(result));
          await driver.waitForComponent(ON.id("webViewOnCameraCaptureStateChangeButton"), 10000)
        }
      } catch (err) {
        console.error("push WebViewOnCameraCaptureStateChange page error: " + err);
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
     * @tc.name   testOnCameraCaptureStateChange001
     * @tc.number SUB_ACE_WEBVIEW_ONCAMERACAPTURESTATECHANGE_0001
     * @tc.desc   onCameraCaptureStateChange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEXT
     * @tc.level  LEVEL0
     */
    it('testOnCameraCaptureStateChange001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitOnCameraCaptureStateChange001", 300758)
      Utils.registerEvent("testOnCameraCaptureStateChange001", true, 20260201, done);
      sendEventByKey('webViewOnCameraCaptureStateChangeButton', 10, '');
      Utils.waitAndClickComponent(driver, "webViewOnCameraCaptureStateChangeButton");
    })


    /**
     * @tc.name   testOnCameraCaptureStateChange002
     * @tc.number SUB_ACE_WEBVIEW_ONCAMERACAPTURESTATECHANGE_0002
     * @tc.desc   onCameraCaptureStateChange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEXT
     * @tc.level  LEVEL2
     */
    it('testOnCameraCaptureStateChange002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitOnCameraCaptureStateChange002", 300758)
      Utils.registerEvent("testOnCameraCaptureStateChange002", CameraCaptureState.PAUSED, 20260202, done);
      Utils.waitAndClickComponent(driver, "webViewOnCameraCaptureStateChangeButton");
    })


    /**
     * @tc.name   testOnCameraCaptureStateChange003
     * @tc.number SUB_ACE_WEBVIEW_ONCAMERACAPTURESTATECHANGE_API_0003
     * @tc.desc   onCameraCaptureStateChange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEXT
     * @tc.level  LEVEL2
     */
    it('testOnCameraCaptureStateChange003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitOnCameraCaptureStateChange003", 300758)
      Utils.registerEvent("testOnCameraCaptureStateChange003", CameraCaptureState.ACTIVE, 20260203, done);
      Utils.waitAndClickComponent(driver, "webViewOnCameraCaptureStateChangeButton");
    })

    /**
     * @tc.name   testOnCameraCaptureStateChange004
     * @tc.number SUB_ACE_WEBVIEW_ONCAMERACAPTURESTATECHANGE_API_0004
     * @tc.desc   onCameraCaptureStateChange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEXT
     * @tc.level  LEVEL2
     */
    it('testOnCameraCaptureStateChange004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitOnCameraCaptureStateChange004", 300758)
      Utils.registerEvent("testOnCameraCaptureStateChange004", CameraCaptureState.NONE, 20260204, done);
      Utils.waitAndClickComponent(driver, "webViewOnCameraCaptureStateChangeButton");
    })

  })
}