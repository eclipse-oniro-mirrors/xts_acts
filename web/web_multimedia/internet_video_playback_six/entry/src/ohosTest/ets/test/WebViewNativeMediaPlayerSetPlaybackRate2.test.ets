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

const EVENT_ID_SET_EMIT_KEY = 361710;
const driver = Driver.create();
let emitKey = ""

export default function webViewNativeMediaPlayerSetPlaybackRate2() {
  describe('ActsAceWebViewMediaPlayerSetPlaybackRate2', () => {

    beforeAll(async (done: Function) => {
      let options : router.RouterOptions = {
        url: 'testability/pages/WebViewNativeMediaPlayerSetPlaybackRate2',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webViewNativeMediaPlayerSetPlaybackRate2 state success " + JSON.stringify(pages));
        if (!("WebViewNativeMediaPlayerSetPlaybackRate2" == pages.name)) {
          console.info("get webViewNativeMediaPlayerSetPlaybackRate2 state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push webViewNativeMediaPlayerSetPlaybackRate2 state success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webViewNativeMediaPlayerSetPlaybackRate2 page error:" + err);
      }
      await driver.waitForComponent(ON.id("webViewNativeMediaPlayerSetPlaybackRate2Button"), 10000);
      console.log("waitForComponent webViewNativeMediaPlayerSetPlaybackRate2");
      done()
    });

    beforeEach(async (done: Function) => {
      done();
    })

    /**
     * @tc.number SUB_ACE_WEB_NATIVEVIDEO_INTERFACE_3703
     * @tc.name testWebViewNativeMediaPlayerSetPlaybackRateWithUndefined
     * @tc.desc test NativeMediaPlayerBridge setPlaybackRate with undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testWebViewNativeMediaPlayerSetPlaybackRateWithUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewNativeMediaPlayerSetPlaybackRateWithUndefined"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebViewNativeMediaPlayerSetPlaybackRateWithUndefined", true, 20260308, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "webViewNativeMediaPlayerSetPlaybackRate2Button");
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })
  })
}