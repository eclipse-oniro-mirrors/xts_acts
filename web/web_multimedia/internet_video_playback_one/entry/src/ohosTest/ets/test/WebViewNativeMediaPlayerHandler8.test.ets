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
import { afterEach, beforeAll, beforeEach, describe, it, expect , TestType, Size, Level } from '@ohos/hypium';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils.test';
import router from '@ohos.router';
import emitter from '@ohos.events.emitter';
import { Driver, ON } from '@kit.TestKit';

const EVENT_ID_SET_EMIT_KEY = 361400;
const driver = Driver.create();
let emitKey = ""

export default function webViewNativeMediaPlayerHandler8() {
  describe('ActsAceWebViewMediaPlayerHandler8', () => {

    beforeAll(async (done: Function) => {
      let options : router.RouterOptions = {
        url: 'testability/pages/WebViewNativeMediaPlayerHandler8',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webViewNativeMediaPlayerHandler8 state success " + JSON.stringify(pages));
        if (!("WebViewNativeMediaPlayerHandler8" == pages.name)) {
          console.info("get webViewNativeMediaPlayerHandler8 state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push webViewNativeMediaPlayerHandler8 state success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webViewNativeMediaPlayerHandler8 page error:" + err);
      }
      await driver.waitForComponent(ON.id("webViewNativeMediaPlayerFullscreenHandler8"), 10000);
      console.log("waitForComponent webViewNativeMediaPlayerFullscreenHandler8");
      done()
    });

    beforeEach(async (done: Function) => {
      done();
    })

    /**
     * @tc.number SUB_ACE_WEB_NATIVEVIDEO_INTERFACE_3710
     * @tc.name testWebViewNativeMediaPlayerHandleFullscreenToggle
     * @tc.desc test NativeMediaPlayerHandleFullscreen with toggle (true and false)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testWebViewNativeMediaPlayerHandleFullscreenToggle', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewNativeMediaPlayerHandleFullscreenToggle"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      let eventCount = 0;
      
      const checkAllEvents = () => {
        eventCount++;
        if (eventCount >= 2) {
          isReturn = true;
        }
      };
      
      Utils.registerEvent("testWebViewNativeMediaPlayerHandleFullscreenToggle", true, 361090, checkAllEvents);
      Utils.registerEvent("testWebViewNativeMediaPlayerHandleFullscreenToggle", true, 361091, checkAllEvents);
      
      await Utils.waitAndClickComponent(driver, "webViewNativeMediaPlayerFullscreenHandler8", emitKey);
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })
  })
}
