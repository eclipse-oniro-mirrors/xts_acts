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
import { describe, beforeEach, it, beforeAll,  TestType, Size, Level } from "@ohos/hypium";
import Utils from './Utils';
import router from '@ohos.router';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';

const EVENT_ID_SET_EMIT_KEY = 110650;
const driver = Driver.create();
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function webViewContCreatePdfAndOthersError() {
  describe('ActsAceWebDevWebViewContCreatePdfAndOthersErrorTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/webViewContCreatePdfAndOthersError',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webViewContCreatePdfAndOthersError state success " + JSON.stringify(pages));
        if (!("webViewContCreatePdfAndOthersError" == pages.name)) {
          console.info("get webViewContCreatePdfAndOthersError state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push webViewContCreatePdfAndOthersError page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webViewContCreatePdfAndOthersError page error: " + err);
      }
      await driver.waitForComponent(ON.id("webViewContCreatePdfAndOthersError"), 10000);
      console.log("waitForComponent webViewContCreatePdfAndOthersError");
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("webViewContCreatePdfAndOthersError beforeEach start");
      done();
    })
    /**
     * @tc.name   testCreatePdfCallbackInitErr
     * @tc.number testCreatePdfCallbackInitErr
     * @tc.desc   test interface of CreatePdf with not been associated with specific Web Components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreatePdfCallbackInitErr',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitCreatePdfCallbackInitErr", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testCreatePdfCallbackInitErr", "17100001", 110660, null);
      Utils.registerEvent("testCreatePdfCallbackInitErr", "Init error. The WebviewController must be associated with a Web component", 110670, done);
      await Utils.waitAndClickComponent(driver, "webViewContCreatePdfAndOthersError");
    })
    /**
     * @tc.name   testCreatePdfPromiseInitErr
     * @tc.number testCreatePdfPromiseInitErr
     * @tc.desc   test interface of CreatePdf with not been associated with specific Web Components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreatePdfPromiseInitErr',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitCreatePdfPromiseInitErr", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testCreatePdfPromiseInitErr", "17100001", 110680, null);
      Utils.registerEvent("testCreatePdfPromiseInitErr", "Init error. The WebviewController must be associated with a Web component", 110690, done);
      await Utils.waitAndClickComponent(driver, "webViewContCreatePdfAndOthersError");
    })
    /**
     * @tc.name   testPrefetchPageInitErr
     * @tc.number testPrefetchPageInitErr
     * @tc.desc   test interface of prefetchPage with not been associated with specific Web Components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPrefetchPageInitErr',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitPrefetchPageInitErr", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testPrefetchPageInitErr", "17100001", 110700, null);
      Utils.registerEvent("testPrefetchPageInitErr", "Init error. The WebviewController must be associated with a Web component", 110710, done);
      await Utils.waitAndClickComponent(driver, "webViewContCreatePdfAndOthersError");
    })
    /**
     * @tc.name   testCreateWebPrintDocumentAdapterInitErr
     * @tc.number testCreateWebPrintDocumentAdapterInitErr
     * @tc.desc   test interface of createWebPrintDocumentAdapter with not been associated with specific Web Components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateWebPrintDocumentAdapterInitErr',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitCreateWebPrintDocumentAdapterInitErr", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testCreateWebPrintDocumentAdapterInitErr", "17100001", 110720, null);
      Utils.registerEvent("testCreateWebPrintDocumentAdapterInitErr", "Init error. The WebviewController must be associated with a Web component", 110730, done);
      await Utils.waitAndClickComponent(driver, "webViewContCreatePdfAndOthersError");
    })
    /**
     * @tc.name   testSetScrollableInitErr
     * @tc.number testSetScrollableInitErr
     * @tc.desc   test interface of setScrollable with not been associated with specific Web Components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetScrollableInitErr',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitSetScrollableInitErr", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testSetScrollableInitErr", "17100001", 110740, null);
      Utils.registerEvent("testSetScrollableInitErr", "Init error. The WebviewController must be associated with a Web component", 110750, done);
      await Utils.waitAndClickComponent(driver, "webViewContCreatePdfAndOthersError");
    })
    /**
     * @tc.name   testGetScrollableInitErr
     * @tc.number testGetScrollableInitErr
     * @tc.desc   test interface of getScrollable with not been associated with specific Web Components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetScrollableInitErr',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitGetScrollableInitErr", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testGetScrollableInitErr", "17100001", 110760, null);
      Utils.registerEvent("testGetScrollableInitErr", "Init error. The WebviewController must be associated with a Web component", 110770, done);
      await Utils.waitAndClickComponent(driver, "webViewContCreatePdfAndOthersError");
    })
    /**
     * @tc.name   testSetPrintBackgroundInitErr
     * @tc.number testSetPrintBackgroundInitErr
     * @tc.desc   test interface of setPrintBackground with not been associated with specific Web Components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetPrintBackgroundInitErr',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitSetPrintBackgroundInitErr", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testSetPrintBackgroundInitErr", "17100001", 110780, null);
      Utils.registerEvent("testSetPrintBackgroundInitErr", "Init error. The WebviewController must be associated with a Web component", 110790, done);
      await Utils.waitAndClickComponent(driver, "webViewContCreatePdfAndOthersError");
    })
    /**
     * @tc.name   testGetPrintBackgroundInitErr
     * @tc.number testGetPrintBackgroundInitErr
     * @tc.desc   test interface of getPrintBackground with not been associated with specific Web Components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetPrintBackgroundInitErr',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitGetPrintBackgroundInitErr", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testGetPrintBackgroundInitErr", "17100001", 110800, null);
      Utils.registerEvent("testGetPrintBackgroundInitErr", "Init error. The WebviewController must be associated with a Web component", 110810, done);
      await Utils.waitAndClickComponent(driver, "webViewContCreatePdfAndOthersError");
    })
    /**
     * @tc.name   testStartCameraInitErr
     * @tc.number testStartCameraInitErr
     * @tc.desc   test interface of startCamera with not been associated with specific Web Components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStartCameraInitErr',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitStartCameraInitErr", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testStartCameraInitErr", "17100001", 110820, null);
      Utils.registerEvent("testStartCameraInitErr", "Init error. The WebviewController must be associated with a Web component", 110830, done);
      await Utils.waitAndClickComponent(driver, "webViewContCreatePdfAndOthersError");
    })
    /**
     * @tc.name   testStopCameraInitErr
     * @tc.number testStopCameraInitErr
     * @tc.desc   test interface of stopCamera with not been associated with specific Web Components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStopCameraInitErr',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitStopCameraInitErr", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testStopCameraInitErr", "17100001", 110840, null);
      Utils.registerEvent("testStopCameraInitErr", "Init error. The WebviewController must be associated with a Web component", 110850, done);
      await Utils.waitAndClickComponent(driver, "webViewContCreatePdfAndOthersError");
    })
    /**
     * @tc.name   testCloseCameraInitErr
     * @tc.number testCloseCameraInitErr
     * @tc.desc   test interface of closeCamera with not been associated with specific Web Components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCloseCameraInitErr',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitCloseCameraInitErr", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testCloseCameraInitErr", "17100001", 110860, null);
      Utils.registerEvent("testCloseCameraInitErr", "Init error. The WebviewController must be associated with a Web component", 110870, done);
      await Utils.waitAndClickComponent(driver, "webViewContCreatePdfAndOthersError");
    })
    /**
     * @tc.name   testStopAllMediaInitErr
     * @tc.number testStopAllMediaInitErr
     * @tc.desc   test interface of stopAllMedia with not been associated with specific Web Components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStopAllMediaInitErr',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitStopAllMediaInitErr", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testStopAllMediaInitErr", "17100001", 110920, null);
      Utils.registerEvent("testStopAllMediaInitErr", "Init error. The WebviewController must be associated with a Web component", 110930, done);
      await Utils.waitAndClickComponent(driver, "webViewContCreatePdfAndOthersError");
    })
    /**
     * @tc.name   testResumeAllMediaInitErr
     * @tc.number testResumeAllMediaInitErr
     * @tc.desc   test interface of resumeAllMedia with not been associated with specific Web Components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testResumeAllMediaInitErr',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitResumeAllMediaInitErr", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testResumeAllMediaInitErr", "17100001", 110940, null);
      Utils.registerEvent("testResumeAllMediaInitErr", "Init error. The WebviewController must be associated with a Web component", 110950, done);
      await Utils.waitAndClickComponent(driver, "webViewContCreatePdfAndOthersError");
    })
    /**
     * @tc.name   testPauseAllMediaInitErr
     * @tc.number testPauseAllMediaInitErr
     * @tc.desc   test interface of pauseAllMedia with not been associated with specific Web Components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPauseAllMediaInitErr',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitPauseAllMediaInitErr", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testPauseAllMediaInitErr", "17100001", 110960, null);
      Utils.registerEvent("testPauseAllMediaInitErr", "Init error. The WebviewController must be associated with a Web component", 110970, done);
      await Utils.waitAndClickComponent(driver, "webViewContCreatePdfAndOthersError");
    })
    /**
     * @tc.name   testCloseAllMediaPresentationsInitErr
     * @tc.number testCloseAllMediaPresentationsInitErr
     * @tc.desc   test interface of closeAllMediaPresentations with not been associated with specific Web Components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCloseAllMediaPresentationsInitErr',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitCloseAllMediaPresentationsInitErr", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testCloseAllMediaPresentationsInitErr", "17100001", 110980, null);
      Utils.registerEvent("testCloseAllMediaPresentationsInitErr", "Init error. The WebviewController must be associated with a Web component", 110990, done);
      await Utils.waitAndClickComponent(driver, "webViewContCreatePdfAndOthersError");
    })
    /**
     * @tc.name   testGetMediaPlaybackStateInitErr
     * @tc.number testGetMediaPlaybackStateInitErr
     * @tc.desc   test interface of getMediaPlaybackState with not been associated with specific Web Components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetMediaPlaybackStateInitErr',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitGetMediaPlaybackStateInitErr", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testGetMediaPlaybackStateInitErr", "17100001", 111000, null);
      Utils.registerEvent("testGetMediaPlaybackStateInitErr", "Init error. The WebviewController must be associated with a Web component", 111010, done);
      await Utils.waitAndClickComponent(driver, "webViewContCreatePdfAndOthersError");
    })
    /**
     * @tc.name   testTerminateRenderProcessInitErr
     * @tc.number testTerminateRenderProcessInitErr
     * @tc.desc   test interface of terminateRenderProcess with not been associated with specific Web Components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTerminateRenderProcessInitErr',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitTerminateRenderProcessInitErr", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testTerminateRenderProcessInitErr", "17100001", 111020, null);
      Utils.registerEvent("testTerminateRenderProcessInitErr", "Init error. The WebviewController must be associated with a Web component", 111030, done);
      await Utils.waitAndClickComponent(driver, "webViewContCreatePdfAndOthersError");
    })
    /**
     * @tc.name   testPrecompileJavaScriptInitErr
     * @tc.number testPrecompileJavaScriptInitErr
     * @tc.desc   test interface of precompileJavaScript with not been associated with specific Web Components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPrecompileJavaScriptInitErr',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitPrecompileJavaScriptInitErr", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testPrecompileJavaScriptInitErr", "17100001", 111040, null);
      Utils.registerEvent("testPrecompileJavaScriptInitErr", "Init error. The WebviewController must be associated with a Web component", 111050, done);
      await Utils.waitAndClickComponent(driver, "webViewContCreatePdfAndOthersError");
    })
    /**
     * @tc.name   testSetPathAllowingUniversalAccessInitErr
     * @tc.number testSetPathAllowingUniversalAccessInitErr
     * @tc.desc   test interface of setPathAllowingUniversalAccess with not been associated with specific Web Components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetPathAllowingUniversalAccessInitErr',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitSetPathAllowingUniversalAccessInitErr", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testSetPathAllowingUniversalAccessInitErr", "17100001", 111060, null);
      Utils.registerEvent("testSetPathAllowingUniversalAccessInitErr", "Init error. The WebviewController must be associated with a Web component", 111070, done);
      await Utils.waitAndClickComponent(driver, "webViewContCreatePdfAndOthersError");
    })
    /**
     * @tc.name   testScrollByWithResultInitErr
     * @tc.number testScrollByWithResultInitErr
     * @tc.desc   test interface of scrollByWithResult with not been associated with specific Web Components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testScrollByWithResultInitErr',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitScrollByWithResultInitErr", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testScrollByWithResultInitErr", "17100001", 111080, null);
      Utils.registerEvent("testScrollByWithResultInitErr", "Init error. The WebviewController must be associated with a Web component", 111090, done);
      await Utils.waitAndClickComponent(driver, "webViewContCreatePdfAndOthersError");
    })
    /**
     * @tc.name   testGetLastHitTestInitErr
     * @tc.number testGetLastHitTestInitErr
     * @tc.desc   test interface of getLastHitTest with not been associated with specific Web Components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetLastHitTestInitErr',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitGetLastHitTestInitErr", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testGetLastHitTestInitErr", "17100001", 111100, null);
      Utils.registerEvent("testGetLastHitTestInitErr", "Init error. The WebviewController must be associated with a Web component", 111110, done);
      await Utils.waitAndClickComponent(driver, "webViewContCreatePdfAndOthersError");
    })
    /**
     * @tc.name   testSetSiteIsolationModeErr
     * @tc.number SUB_ACE_WEBVIEW_DEINSTITUTIONALIZATION_API_0001
     * @tc.desc   test SetSiteIsolationMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetSiteIsolationModeErr',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitSetSiteIsolationModeErr", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testSetSiteIsolationModeErr", "17100001", 20151203, null);
      Utils.registerEvent("testSetSiteIsolationModeErr", "InitError 17100001: Site Isolation mode is already set by the developer.", 20151204, done);
      await Utils.waitAndClickComponent(driver, "webViewContCreatePdfAndOthersError");
    })

    /**
     * @tc.name   testSetSoftKeyboardBehaviorModeErr
     * @tc.number SUB_ACE_WEBVIEW_SETSOFTKEYBOARDBEHAVIORMODE_API_0001
     * @tc.desc   setSoftKeyboardBehaviorMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEXT
     * @tc.level  LEVEL0
     */
    it('testSetSoftKeyboardBehaviorModeErr',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitSetSoftKeyboardBehaviorModeErr", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testSetSoftKeyboardBehaviorModeErr", "17100001", 20151223, null);
      Utils.registerEvent("testSetSoftKeyboardBehaviorModeErr", "Init error. The WebviewController must be associated with a Web component", 20151224, done);
      await Utils.waitAndClickComponent(driver, "webViewContCreatePdfAndOthersError");
    })

  })
}