/**
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
import { describe, beforeEach, it, beforeAll, TestType, Size, Level } from "@ohos/hypium";
import Utils from './Utils';
import router from '@ohos.router';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';

const EVENT_ID_SET_EMIT_KEY = 112331;
const driver = Driver.create();
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

let emitKey = "";

export default function WebViewContMicrophoneError() {
  describe('ActsAceWebViewContMicrophoneErrorTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebViewContMicrophoneError',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebViewContMicrophoneError state success " + JSON.stringify(pages));
        if (!("WebViewContMicrophoneError" == pages.name)) {
          console.info("get WebViewContMicrophoneError state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push WebViewContMicrophoneError page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebViewContMicrophoneError page error: " + err);
      }
      await driver.waitForComponent(ON.id("WebViewContMicrophoneErrorButton"), 10000);
      console.log("waitForComponent WebViewContMicrophoneError");
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("WebViewContMicrophoneError beforeEach start");
      done();
    })

    /**
     * @tc.name   testResumeMicrophone
     * @tc.number SUB_ACE_BASIC_ETS_RESUME MICROPHONE_0100
     * @tc.desc   test interface of zoom with not been associated with specific Web Components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEXT
     * @tc.level  LEVEL0
     */
    it('testResumeMicrophone', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitResumeMicrophone";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testResumeMicrophone", "17100001", 20241224, null);
      Utils.registerEvent("testResumeMicrophone", "Init error. The WebviewController must be associated with a Web component", 20241225, done);
      await Utils.waitAndClickComponent(driver, "WebViewContMicrophoneErrorButton");
    })
    /**
     * @tc.name   testPauseMicrophone
     * @tc.number SUB_ACE_BASIC_ETS_PAUSE MICROPHONE_0200
     * @tc.desc   test interface of zoom with not been enabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEXT
     * @tc.level  LEVEL0
     */
    it('testPauseMicrophone', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitPauseMicrophone";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testPauseMicrophone", "17100001", 20241226, null);
      Utils.registerEvent("testPauseMicrophone", "Init error. The WebviewController must be associated with a Web component", 20241227, done);
      await Utils.waitAndClickComponent(driver, "WebViewContMicrophoneErrorButton");
    })
    /**
     * @tc.name   testStopMicrophone
     * @tc.number SUB_ACE_BASIC_ETS_STOP MICROPHONE_0300
     * @tc.desc   test interface of searchAllAsync with not been associated with specific Web Components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEXT
     * @tc.level  LEVEL0
     */
    it('testStopMicrophone', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitStopMicrophone";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testStopMicrophone", "17100001", 20241228, null);
      Utils.registerEvent("testStopMicrophone", "Init error. The WebviewController must be associated with a Web component", 20241229, done);
      await Utils.waitAndClickComponent(driver, "WebViewContMicrophoneErrorButton");
    })

  })
}