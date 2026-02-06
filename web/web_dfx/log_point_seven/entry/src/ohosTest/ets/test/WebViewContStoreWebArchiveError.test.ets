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
import { describe, beforeEach, it, beforeAll, TestType, Size, Level } from "@ohos/hypium";
import Utils from './Utils.test';
import router from '@ohos.router';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';

const EVENT_ID_SET_EMIT_KEY = 112090;
const driver = Driver.create();
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

let emitKey = "";

export default function webViewContStoreWebArchiveError() {
  describe('ActsAceWebDevWebViewContStoreWebArchiveErrorTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebViewContStoreWebArchiveError',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get webViewContStoreWebArchiveError state success ' + JSON.stringify(pages));
        if (!("WebViewContStoreWebArchiveError" == pages.name)) {
          console.info('get webViewContStoreWebArchiveError state success ' + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info('push webViewContStoreWebArchiveError page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push webViewContStoreWebArchiveError page error: ' + err);
      }
      await driver.waitForComponent(ON.id("webViewContStoreWebArchiveError"), 10000);
      console.log('waitForComponent webViewContStoreWebArchiveError');
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info('webViewContStoreWebArchiveError beforeEach start');
      done();
    })
   /**
    * @tc.number     SUB_ACE_BASIC_ETS_WEBVIEWERROR_5100
    * @tc.name       teststoreWebArchiveInitErr
    * @tc.desc       test interface of storeWebArchive with not been associated with specific Web Components
    * @tc.size       MEDIUM
    * @tc.type       Function
    * @tc.level      Level 0
    */
    it('teststoreWebArchiveInitErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitStoreWebArchiveCallBackInitErr";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("teststoreWebArchiveInitErr", "17100001", 112100, null);
      Utils.registerEvent("teststoreWebArchiveInitErr", "Init error. The WebviewController must be associated with a Web component", 112110, done);
      await Utils.waitAndClickComponent(driver, "webViewContStoreWebArchiveError");
    })
   /**
    * @tc.number     SUB_ACE_BASIC_ETS_WEBVIEWERROR_5200
    * @tc.name       testStoreWebArchiveCallBackPathErr
    * @tc.desc       test interface of storeWebArchive with wrong resource path
    * @tc.size       MEDIUM
    * @tc.type       Function
    * @tc.level      Level 0
    */
    it('testStoreWebArchiveCallBackPathErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitStoreWebArchiveCallBackPathErr";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testStoreWebArchiveCallBackPathErr", 17100003, 112120, null);
      Utils.registerEvent("testStoreWebArchiveCallBackPathErr", "Invalid resource path or file type", 112130, done);
      await Utils.waitAndClickComponent(driver, "webViewContStoreWebArchiveError");
    })
   /**
    * @tc.number     SUB_ACE_BASIC_ETS_WEBVIEWERROR_5300
    * @tc.name       testStoreWebArchiveCallBackUnAccessErr
    * @tc.desc       test interface of storeWebArchive with resource path cannot access
    * @tc.size       MEDIUM
    * @tc.type       Function
    * @tc.level      Level 0
    */
    it('testStoreWebArchiveCallBackUnAccessErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitStoreWebArchiveCallBackUnAccessErr";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testStoreWebArchiveCallBackUnAccessErr", 17100003, 112140, null);
      Utils.registerEvent("testStoreWebArchiveCallBackUnAccessErr", "Invalid resource path or file type", 112150, done);
      await Utils.waitAndClickComponent(driver, "webViewContStoreWebArchiveError");
    })
   /**
    * @tc.number     SUB_ACE_BASIC_ETS_WEBVIEWERROR_5400
    * @tc.name       testStoreWebArchivePromiseInitErr
    * @tc.desc       test interface of storeWebArchive promise with not been associated with specific Web Components
    * @tc.size       MEDIUM
    * @tc.type       Function
    * @tc.level      Level 0
    */
    it('testStoreWebArchivePromiseInitErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitStoreWebArchivePromiseInitErr";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testStoreWebArchivePromiseInitErr", "17100001", 112160, null);
      Utils.registerEvent("testStoreWebArchivePromiseInitErr", "Init error. The WebviewController must be associated with a Web component", 112170, done);
      await Utils.waitAndClickComponent(driver, "webViewContStoreWebArchiveError");
    })
   /**
    * @tc.number     SUB_ACE_BASIC_ETS_WEBVIEWERROR_5500
    * @tc.name       testStoreWebArchivePromisePathErr
    * @tc.desc       test interface of storeWebArchive promise with wrong resource path
    * @tc.size       MEDIUM
    * @tc.type       Function
    * @tc.level      Level 0
    */
    it('testStoreWebArchivePromisePathErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitStoreWebArchivePromisePathErr";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testStoreWebArchivePromisePathErr", 17100003, 112180, null);
      Utils.registerEvent("testStoreWebArchivePromisePathErr", "Invalid resource path or file type", 112190, done);
      await Utils.waitAndClickComponent(driver, "webViewContStoreWebArchiveError");
    })
   /**
    * @tc.number     SUB_ACE_BASIC_ETS_WEBVIEWERROR_5600
    * @tc.name       testStoreWebArchivePromiseUnAccessErr
    * @tc.desc       test interface of storeWebArchive promise with resource path cannot access
    * @tc.size       MEDIUM
    * @tc.type       Function
    * @tc.level      Level 0
    */
    it('testStoreWebArchivePromiseUnAccessErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitStoreWebArchivePromiseUnAccessErr";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testStoreWebArchivePromiseUnAccessErr", 17100003, 112200, null);
      Utils.registerEvent("testStoreWebArchivePromiseUnAccessErr", "Invalid resource path or file type", 112210, done);
      await Utils.waitAndClickComponent(driver, "webViewContStoreWebArchiveError");
    })
  })
}