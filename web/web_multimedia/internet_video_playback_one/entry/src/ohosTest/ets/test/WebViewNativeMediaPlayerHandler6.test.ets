/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
.
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

const EVENT_ID_SET_EMIT_KEY = 361200;
const driver = Driver.create();
let emitKey = ""

export default function webViewNativeMediaPlayerHandler6() {
  describe('ActsAceWebViewMediaPlayerHandler6', () => {

    beforeAll(async (done: Function) => {
      let options : router.RouterOptions = {
        url: 'testability/pages/WebViewNativeMediaPlayerHandler6',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webViewNativeMediaPlayerHandler6 state success " + JSON.stringify(pages));
        if (!("WebViewNativeMediaPlayerHandler6" == pages.name)) {
          console.info("get webViewNativeMediaPlayerHandler6 state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push webViewNativeMediaPlayerHandler6 state success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webViewNativeMediaPlayerHandler6 page error:" + err);
      }
      await driver.waitForComponent(ON.id("webViewNativeMediaPlayerReadyStateHandler6"), 10000);
      console.log("waitForComponent webViewNativeMediaPlayerReadyStateHandler6");
      done()
    });

    beforeEach(async (done: Function) => {
      done();
    })

    /**
     * @tc.number SUB_ACE_WEB_NATIVEVIDEO_INTERFACE_3610
     * @tc.name testWebViewNativeMediaPlayerHandleReadyStateAll
     * @tc.desc test NativeMediaPlayerHandleReadyState with all states
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testWebViewNativeMediaPlayerHandleReadyStateAll', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewNativeMediaPlayerHandleReadyStateAll"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      let eventCount = 0;
      
      const checkAllEvents = () => {
        eventCount++;
        if (eventCount >= 4) {
          isReturn = true;
        }
      };
      
      Utils.registerEvent("testWebViewNativeMediaPlayerHandleReadyStateAll", true, 361070, checkAllEvents);
      Utils.registerEvent("testWebViewNativeMediaPlayerHandleReadyStateAll", true, 361071, checkAllEvents);
      Utils.registerEvent("testWebViewNativeMediaPlayerHandleReadyStateAll", true, 361072, checkAllEvents);
      Utils.registerEvent("testWebViewNativeMediaPlayerHandleReadyStateAll", true, 361073, checkAllEvents);
      
      await Utils.waitAndClickComponent(driver, "webViewNativeMediaPlayerReadyStateHandler6", emitKey);
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })
  })
}
