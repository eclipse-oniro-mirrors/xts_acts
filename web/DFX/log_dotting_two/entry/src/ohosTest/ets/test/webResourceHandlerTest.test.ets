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
import { beforeAll, beforeEach, describe, it, TestType, Size, Level  } from '@ohos/hypium';
import Utils from './Utils';
import router from '@ohos.router';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';

const EVENT_ID_SET_EMIT_KEY = 114990;
const driver = Driver.create();
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
let emitKey = ''

export default function webResourceHandlerTest() {
  describe('webResourceHandlerTest', () => {
      beforeAll(async (done: Function) => {
        let options: router.RouterOptions = {
          url: 'testability/pages/webResourceHandlerTest',
        }

        try {
          router.clear();
          let pages = router.getState();
          console.info("get webResourceHandlerTest state success " + JSON.stringify(pages));
          if (!("webResourceHandlerTest" == pages.name)) {
            console.info("get webResourceHandlerTest state success " + JSON.stringify(pages.name));
            let result = await router.pushUrl(options);
            console.info("push webResourceHandlerTest state success " + JSON.stringify(result));
          }
        } catch (err) {
          console.error("push webResourceHandlerTest page error:" + err);
        }
        await driver.waitForComponent(ON.id("webView"), 10000);
        console.log("waitForComponent webView");
        done()
      });

      beforeEach(async (done: Function) => {
        config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
          console.error(`failed to enable, ${err}`);
        })
        done();
      })

      /**
       * @tc.name   testWebView_didReceiveResponse_INVAILD
       * @tc.number SUB_ACE_WEB_didReceiveResponse_INVAILD_0100
       * @tc.desc   test WebView_didReceiveResponse_INVAILD
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testWebView_didReceiveResponse_INVAILD', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        emitKey = "emitWebView_didReceiveResponse_INVAILD"
        Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
        Utils.registerEvent("testWebView_didReceiveResponse_INVAILD", "17100021", 115000, done);
        await Utils.waitAndClickComponent(driver, "webView");
      })
      /**
       * @tc.name   testWebView_didReceiveResponseBody_INVALID
       * @tc.number SUB_ACE_WEB_didReceiveResponseBody_INVALID_0100
       * @tc.desc   test WebView_didReceiveResponseBody_INVALID
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testWebView_didReceiveResponseBody_INVALID', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        emitKey = "emitWebView_didReceiveResponseBody_INVALID"
        Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
        Utils.registerEvent("testWebView_didReceiveResponseBody_INVALID", "17100021", 115010, done);
        await Utils.waitAndClickComponent(driver, "webView");
      })

      /**
       * @tc.name   testWebView_didFinish_INVALID
       * @tc.number SUB_ACE_WEB_didFinish_INVALID_0100
       * @tc.desc   test WebView_didFinish_INVALID
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testWebView_didFinish_INVALID', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        emitKey = "emitWebView_didFinish_INVALID"
        Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
        Utils.registerEvent("testWebView_didFinish_INVALID", "17100021", 115020, done);
        await Utils.waitAndClickComponent(driver, "webView");
      })

      /**
       * @tc.name   testWebView_didFail_INVALID
       * @tc.number SUB_ACE_WEB_didFail_INVAILD_0100
       * @tc.desc   test WebView_didFail_INVALID
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testWebView_didFail_INVALID', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        emitKey = "emitWebView_didFail_INVALID"
        Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
        Utils.registerEvent("testWebView_didFail_INVALID", "17100021", 115030, done);
        await Utils.waitAndClickComponent(driver, "webView");
      })
    /**
     * @tc.name   testWebNavigationType001
     * @tc.number SUB_WEB_WEBNAVIGATIONTYPE_0100
     * @tc.desc   test webNavigationType MAIN_FRAME_NEW_ENTRY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebNavigationType001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebNavigationType001", EVENT_ID_SET_EMIT_KEY)
      Utils.registerEvent("testWebNavigationType001", true, 115040, done);
      await Utils.waitAndClickComponent(driver, "webView");
    })

    /**
     * @tc.name   testWebNavigationType002
     * @tc.number SUB_WEB_WEBNAVIGATIONTYPE_0200
     * @tc.desc   test webNavigationType MAIN_FRAME_EXISTING_ENTRY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebNavigationType002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebNavigationType002", EVENT_ID_SET_EMIT_KEY)
      Utils.registerEvent("testWebNavigationType002", true, 115050, done);
      await Utils.waitAndClickComponent(driver, "webView");
    })

    /**
     * @tc.name   testWebNavigationType003
     * @tc.number SUB_WEB_WEBNAVIGATIONTYPE_0300
     * @tc.desc   test webNavigationType NAVIGATION_TYPE_NEW_SUBFRAME
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebNavigationType003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebNavigationType003", EVENT_ID_SET_EMIT_KEY)
      Utils.registerEvent("testWebNavigationType003", true, 115060, done);
      await Utils.waitAndClickComponent(driver, "webView");
    })
 })
}