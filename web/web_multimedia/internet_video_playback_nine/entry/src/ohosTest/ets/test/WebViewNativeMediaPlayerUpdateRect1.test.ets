/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under * Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with * License.
 * You may obtain a copy of * License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under * License is distributed on an "AS IS" BASIS,
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

const EVENT_ID_SET_EMIT_KEY = 361500;
const driver = Driver.create();
// @ts-nocheck
let emitKey = ""

export default function webViewNativeMediaPlayerUpdateRect1() {
  describe('ActsAceWebViewMediaPlayerUpdateRect1', () => {

    beforeAll(async (done: Function) => {
      let options : router.RouterOptions = {
        url: 'testability/pages/WebViewNativeMediaPlayerUpdateRect1',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webViewNativeMediaPlayerUpdateRect1 state success " + JSON.stringify(pages));
        if (!("WebViewNativeMediaPlayerUpdateRect1" == pages.name)) {
          console.info("get webViewNativeMediaPlayerUpdateRect1 state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push webViewNativeMediaPlayerUpdateRect1 state success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webViewNativeMediaPlayerUpdateRect1 page error:" + err);
      }
      console.log("waitForComponent webViewNativeMediaPlayerUpdateRect11");
      done()
    });

    beforeEach(async (done: Function) => {
      done();
    })

    /**
     * @tc.number SUB_ACE_WEB_NATIVEVIDEO_INTERFACE_3600
     * @tc.name testWebViewNativeMediaPlayerUpdateRectXNull
     * @tc.desc test NativeMediaPlayerUpdateRect with x=null
     * @tc.size MediumTest

     * @tc.type Function
     * @tc.level Level 1
     */
    it('testWebViewNativeMediaPlayerUpdateRectXNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewNativeMediaPlayerUpdateRectXNull"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebViewNativeMediaPlayerUpdateRectXNull", true, 361100, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "webViewNativeMediaPlayerUpdateRect11");
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /**
     * @tc.number SUB_ACE_WEB_NATIVEVIDEO_INTERFACE_3610
     * @tc.name testWebViewNativeMediaPlayerUpdateRectXUndefined
     * @tc.desc test NativeMediaPlayerUpdateRect with x=undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testWebViewNativeMediaPlayerUpdateRectXUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewNativeMediaPlayerUpdateRectXUndefined"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebViewNativeMediaPlayerUpdateRectXUndefined", true, 361101, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "webViewNativeMediaPlayerUpdateRect11");
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /**
     * @tc.number SUB_ACE_WEB_NATIVEVIDEO_INTERFACE_3620
     * @tc.name testWebViewNativeMediaPlayerUpdateRectYNull
     * @tc.desc test NativeMediaPlayerUpdateRect with y=null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testWebViewNativeMediaPlayerUpdateRectYNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewNativeMediaPlayerUpdateRectYNull"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebViewNativeMediaPlayerUpdateRectYNull", true, 361102, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "webViewNativeMediaPlayerUpdateRect11");
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /**
     * @tc.number SUB_ACE_WEB_NATIVEVIDEO_INTERFACE_3630
     * @tc.name testWebViewNativeMediaPlayerUpdateRectYUndefined
     * @tc.desc test NativeMediaPlayerUpdateRect with y=undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testWebViewNativeMediaPlayerUpdateRectYUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebViewNativeMediaPlayerUpdateRectYUndefined"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebViewNativeMediaPlayerUpdateRectYUndefined", true, 361103, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "webViewNativeMediaPlayerUpdateRect11");
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })
  })
}
