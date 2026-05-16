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

const EVENT_ID_SET_EMIT_KEY = 361300;
const driver = Driver.create();
// @ts-nocheck
let emitKey = ""

export default function webViewNativeMediaPlayerHandler9() {
  describe('ActsAceWebViewMediaPlayerHandler9', () => {

    beforeAll(async (done: Function) => {
      let options : router.RouterOptions = {
        url: 'testability/pages/WebViewNativeMediaPlayerHandler9',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webViewNativeMediaPlayerHandler9 state success " + JSON.stringify(pages));
        if (!("WebViewNativeMediaPlayerHandler9" == pages.name)) {
          console.info("get webViewNativeMediaPlayerHandler9 state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push webViewNativeMediaPlayerHandler9 state success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webViewNativeMediaPlayerHandler9 page error:" + err);
      }
      await driver.waitForComponent(ON.id("webViewNativeMediaPlayerSuspendPlayer9"), 10000);
      console.log("waitForComponent webViewNativeMediaPlayerSuspendPlayer9");
      done()
    });

    beforeEach(async (done: Function) => {
      done();
    })

    /**
     * @tc.number SUB_ACE_WEB_NATIVEVIDEO_INTERFACE_3500
     * @tc.name testWebViewNativeMediaPlayerSuspendPlayerEnterBackForwardCache
     * @tc.desc test NativeMediaPlayerSuspendPlayer with ENTER_BACK_FORWARD_CACHE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testWebViewNativeMediaPlayerSuspendPlayerEnterBackForwardCache', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewNativeMediaPlayerSuspendPlayerEnterBackForwardCache"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebViewNativeMediaPlayerSuspendPlayerEnterBackForwardCache", true, 361080, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "webViewNativeMediaPlayerSuspendPlayer9", emitKey);
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /**
     * @tc.number SUB_ACE_WEB_NATIVEVIDEO_INTERFACE_3510
     * @tc.name testWebViewNativeMediaPlayerSuspendPlayerEnterBackground
     * @tc.desc test NativeMediaPlayerSuspendPlayer with ENTER_BACKGROUND
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testWebViewNativeMediaPlayerSuspendPlayerEnterBackground', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewNativeMediaPlayerSuspendPlayerEnterBackground"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebViewNativeMediaPlayerSuspendPlayerEnterBackground", true, 361081, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "webViewNativeMediaPlayerSuspendPlayer9", emitKey);
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })
  })
}
