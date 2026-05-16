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

const EVENT_ID_SET_EMIT_KEY = 112330;
const driver = Driver.create();
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

let emitKey = "";

export default function webViewContZoomAndOthersError() {
  describe('ActsAceWebDevWebViewContZoomAndOthersErrorTest', () => {
    beforeAll(async (done: Function) => {
      await driver.waitForComponent(ON.id("webViewContZoomAndOthersError"), 10000);
      console.log('waitForComponent webViewContZoomAndOthersError');
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info('webViewContZoomAndOthersError beforeEach start');
      done();
    })
   /**
    * @tc.number     SUB_ACE_BASIC_ETS_WEBVIEWERROR_3300
    * @tc.name       testZoomInitErr
    * @tc.desc       test interface of zoom with not been associated with specific Web Components
    * @tc.size       MediumTest
    * @tc.type       Function
    * @tc.level      Level 1
    */
    it('testZoomInitErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitZoomInitErr";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testZoomInitErr", "17100001", 112340, null);
      Utils.registerEvent("testZoomInitErr", "Init error. The WebviewController must be associated with a Web component", 112350, done);
      await Utils.waitAndClickComponent(driver, "webViewContZoomAndOthersError");
    })
   /**
    * @tc.number     SUB_ACE_BASIC_ETS_WEBVIEWERROR_3400
    * @tc.name       testZoomEnableErr
    * @tc.desc       test interface of zoom with not been enabled
    * @tc.size       MediumTest
    * @tc.type       Function
    * @tc.level      Level 1
    */
    it('testZoomEnableErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitZoomEnableErr";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testZoomEnableErr", "17100004", 112360, null);
      Utils.registerEvent("testZoomEnableErr", "Function not enabled.", 112370, done);
      await Utils.waitAndClickComponent(driver, "webViewContZoomAndOthersError");
    })
   /**
    * @tc.number     SUB_ACE_BASIC_ETS_WEBVIEWERROR_3500
    * @tc.name       testSearchAllAsyncInitErr
    * @tc.desc       test interface of searchAllAsync with not been associated with specific Web Components
    * @tc.size       MediumTest
    * @tc.type       Function
    * @tc.level      Level 1
    */
    it('testSearchAllAsyncInitErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitSearchAllAsyncInitErr";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testSearchAllAsyncInitErr", "17100001", 112380, null);
      Utils.registerEvent("testSearchAllAsyncInitErr", "Init error. The WebviewController must be associated with a Web component", 112390, done);
      await Utils.waitAndClickComponent(driver, "webViewContZoomAndOthersError");
    })
   /**
    * @tc.number     SUB_ACE_BASIC_ETS_WEBVIEWERROR_3600
    * @tc.name       testClearMatchesInitErr
    * @tc.desc       test interface of clearMatches with not been associated with specific Web Components
    * @tc.size       MediumTest
    * @tc.type       Function
    * @tc.level      Level 1
    */
    it('testClearMatchesInitErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitClearMatchesInitErr";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testClearMatchesInitErr", "17100001", 112400, null);
      Utils.registerEvent("testClearMatchesInitErr", "Init error. The WebviewController must be associated with a Web component", 112410, done);
      await Utils.waitAndClickComponent(driver, "webViewContZoomAndOthersError");
    })
   /**
    * @tc.number     SUB_ACE_BASIC_ETS_WEBVIEWERROR_3700
    * @tc.name       testSearchNextInitErr
    * @tc.desc       test interface of searchNext with not been associated with specific Web Components
    * @tc.size       MediumTest
    * @tc.type       Function
    * @tc.level      Level 1
    */
    it('testSearchNextInitErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitSearchNextInitErr";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testSearchNextInitErr", "17100001", 112420, null);
      Utils.registerEvent("testSearchNextInitErr", "Init error. The WebviewController must be associated with a Web component", 112430, done);
      await Utils.waitAndClickComponent(driver, "webViewContZoomAndOthersError");
    })
   /**
    * @tc.number     SUB_ACE_BASIC_ETS_WEBVIEWERROR_3800
    * @tc.name       testClearSslCacheInitErr
    * @tc.desc       test interface of clearSslCache with not been associated with specific Web Components
    * @tc.size       MediumTest
    * @tc.type       Function
    * @tc.level      Level 1
    */
    it('testClearSslCacheInitErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitClearSslCacheInitErr";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testClearSslCacheInitErr", "17100001", 112440, null);
      Utils.registerEvent("testClearSslCacheInitErr", "Init error. The WebviewController must be associated with a Web component", 112450, done);
      await Utils.waitAndClickComponent(driver, "webViewContZoomAndOthersError");
    })
   /**
    * @tc.number     SUB_ACE_BASIC_ETS_WEBVIEWERROR_3900
    * @tc.name       testClearClientAuthenticationCacheInitErr
    * @tc.desc       test interface of clearClientAuthenticationCache with not been associated with specific Web Components
    * @tc.size       MediumTest
    * @tc.type       Function
    * @tc.level      Level 1
    */
    it('testClearClientAuthenticationCacheInitErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitClearClientAuthenticationCacheInitErr";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testClearClientAuthenticationCacheInitErr", "17100001", 112460, null);
      Utils.registerEvent("testClearClientAuthenticationCacheInitErr", "Init error. The WebviewController must be associated with a Web component", 112470, done);
      await Utils.waitAndClickComponent(driver, "webViewContZoomAndOthersError");
    })
   /**
    * @tc.number     SUB_ACE_BASIC_ETS_WEBVIEWERROR_4000
    * @tc.name       testCreateWebMessagePortsInitErr
    * @tc.desc       test interface of createWebMessagePorts with not been associated with specific Web Components
    * @tc.size       MediumTest
    * @tc.type       Function
    * @tc.level      Level 1
    */
    it('testCreateWebMessagePortsInitErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitCreateWebMessagePortsInitErr";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testCreateWebMessagePortsInitErr", "17100001", 112480, null);
      Utils.registerEvent("testCreateWebMessagePortsInitErr", "Init error. The WebviewController must be associated with a Web component", 112490, done);
      await Utils.waitAndClickComponent(driver, "webViewContZoomAndOthersError");
    })
   /**
    * @tc.number     SUB_ACE_BASIC_ETS_WEBVIEWERROR_4100
    * @tc.name       testRequestFocusInitErr
    * @tc.desc       test interface of requestFocus with not been associated with specific Web Components
    * @tc.size       MediumTest
    * @tc.type       Function
    * @tc.level      Level 1
    */
    it('testRequestFocusInitErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitRequestFocusInitErr";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testRequestFocusInitErr", "17100001", 112500, null);
      Utils.registerEvent("testRequestFocusInitErr", "Init error. The WebviewController must be associated with a Web component", 112510, done);
      await Utils.waitAndClickComponent(driver, "webViewContZoomAndOthersError");
    })
   /**
    * @tc.number     SUB_ACE_BASIC_ETS_WEBVIEWERROR_4200
    * @tc.name       testZoomInInitErr
    * @tc.desc       test interface of zoomIn with not been associated with specific Web Components
    * @tc.size       MediumTest
    * @tc.type       Function
    * @tc.level      Level 1
    */
    it('testZoomInInitErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitZoomInInitErr";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testZoomInInitErr", "17100001", 112520, null);
      Utils.registerEvent("testZoomInInitErr", "Init error. The WebviewController must be associated with a Web component", 112530, done);
      await Utils.waitAndClickComponent(driver, "webViewContZoomAndOthersError");
    })
   /**
    * @tc.number     SUB_ACE_BASIC_ETS_WEBVIEWERROR_4300
    * @tc.name       testZoomInEnableErr
    * @tc.desc       test interface of zoomIn with not been enabled
    * @tc.size       MediumTest
    * @tc.type       Function
    * @tc.level      Level 1
    */
    it('testZoomInEnableErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitZoomInEnableErr";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testZoomInEnableErr", "17100004", 112540, null);
      Utils.registerEvent("testZoomInEnableErr", "Function not enabled.", 112550, done);
      await Utils.waitAndClickComponent(driver, "webViewContZoomAndOthersError");
    })
   /**
    * @tc.number     SUB_ACE_BASIC_ETS_WEBVIEWERROR_4400
    * @tc.name       testZoomOutInitErr
    * @tc.desc       test interface of zoomOut with not been associated with specific Web Components
    * @tc.size       MediumTest
    * @tc.type       Function
    * @tc.level      Level 1
    */
    it('testZoomOutInitErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitZoomOutInitErr";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testZoomOutInitErr", "17100001", 112560, null);
      Utils.registerEvent("testZoomOutInitErr", "Init error. The WebviewController must be associated with a Web component", 112570, done);
      await Utils.waitAndClickComponent(driver, "webViewContZoomAndOthersError");
    })
   /**
    * @tc.number     SUB_ACE_BASIC_ETS_WEBVIEWERROR_4500
    * @tc.name       testZoomOutEnableErr
    * @tc.desc       test interface of zoomOut with not been enabled
    * @tc.size       MediumTest
    * @tc.type       Function
    * @tc.level      Level 1
    */
    it('testZoomOutEnableErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitZoomOutEnableErr";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testZoomOutEnableErr", "17100004", 112580, null);
      Utils.registerEvent("testZoomOutEnableErr", "Function not enabled.", 112590, done);
      await Utils.waitAndClickComponent(driver, "webViewContZoomAndOthersError");
    })
   /**
    * @tc.number     SUB_ACE_BASIC_ETS_WEBVIEWERROR_4600
    * @tc.name       testGetHitTestValueInitErr
    * @tc.desc       test interface of getHitTestValue with not been associated with specific Web Components
    * @tc.size       MediumTest
    * @tc.type       Function
    * @tc.level      Level 1
    */
    it('testGetHitTestValueInitErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitGetHitTestValueInitErr";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testGetHitTestValueInitErr", "17100001", 112600, null);
      Utils.registerEvent("testGetHitTestValueInitErr", "Init error. The WebviewController must be associated with a Web component", 112610, done);
      await Utils.waitAndClickComponent(driver, "webViewContZoomAndOthersError");
    })
   /**
    * @tc.number     SUB_ACE_BASIC_ETS_WEBVIEWERROR_4700
    * @tc.name       testGetWebIdInitErr
    * @tc.desc       test interface of getWebId with not been associated with specific Web Components
    * @tc.size       MediumTest
    * @tc.type       Function
    * @tc.level      Level 1
    */
    it('testGetWebIdInitErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitGetWebIdInitErr";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testGetWebIdInitErr", "17100001", 112620, null);
      Utils.registerEvent("testGetWebIdInitErr", "Init error. The WebviewController must be associated with a Web component", 112630, done);
      await Utils.waitAndClickComponent(driver, "webViewContZoomAndOthersError");
    })
   /**
    * @tc.number     SUB_ACE_BASIC_ETS_WEBVIEWERROR_4800
    * @tc.name       testGetUserAgentInitErr
    * @tc.desc       test interface of getUserAgent with not been associated with specific Web Components
    * @tc.size       MediumTest
    * @tc.type       Function
    * @tc.level      Level 1
    */
    it('testGetUserAgentInitErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitGetUserAgentInitErr";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testGetUserAgentInitErr", "17100001", 112640, null);
      Utils.registerEvent("testGetUserAgentInitErr", "Init error. The WebviewController must be associated with a Web component", 112650, done);
      await Utils.waitAndClickComponent(driver, "webViewContZoomAndOthersError");
    })
   /**
    * @tc.number     SUB_ACE_BASIC_ETS_WEBVIEWERROR_4900
    * @tc.name       testGetTitleInitErr
    * @tc.desc       test interface of getTitle with not been associated with specific Web Components
    * @tc.size       MediumTest
    * @tc.type       Function
    * @tc.level      Level 1
    */
    it('testGetTitleInitErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitGetTitleInitErr";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testGetTitleInitErr", "17100001", 112660, null);
      Utils.registerEvent("testGetTitleInitErr", "Init error. The WebviewController must be associated with a Web component", 112670, done);
      await Utils.waitAndClickComponent(driver, "webViewContZoomAndOthersError");
    })
   /**
    * @tc.number     SUB_ACE_BASIC_ETS_WEBVIEWERROR_5000
    * @tc.name       testGetPageHeightInitErr
    * @tc.desc       test interface of getPageHeight with not been associated with specific Web Components
    * @tc.size       MediumTest
    * @tc.type       Function
    * @tc.level      Level 1
    */
    it('testGetPageHeightInitErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitGetPageHeightInitErr";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testGetPageHeightInitErr", "17100001", 112680, null);
      Utils.registerEvent("testGetPageHeightInitErr", "Init error. The WebviewController must be associated with a Web component", 112690, done);
      await Utils.waitAndClickComponent(driver, "webViewContZoomAndOthersError");
    })
  })
}