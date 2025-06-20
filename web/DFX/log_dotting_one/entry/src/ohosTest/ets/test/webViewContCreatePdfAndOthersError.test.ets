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
import { describe, beforeEach, afterEach, it, expect, beforeAll,  TestType, Size, Level } from "@ohos/hypium";
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
// import router from '@system.router';
import router from '@ohos.router';
import { accessibility, config } from '@kit.AccessibilityKit';
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
          await Utils.sleep(2000);
          console.info("push webViewContCreatePdfAndOthersError page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webViewContCreatePdfAndOthersError page error: " + err);
      }
      done()
    });
    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      await Utils.sleep(2000);
      console.info("webViewContCreatePdfAndOthersError beforeEach start");
      done();
    })
    /*
     *tc.number testCreatePdfCallbackInitErr
     *tc.name testCreatePdfCallbackInitErr
     *tc.desc test interface of CreatePdf with not been associated with specific Web Components
     */
    it('testCreatePdfCallbackInitErr',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitCreatePdfCallbackInitErr", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testCreatePdfCallbackInitErr", "17100001", 17101, done);
      Utils.registerEvent("testCreatePdfCallbackInitErr", "Init error. The WebviewController must be associated with a Web component", 17102, done);
      sendEventByKey('webViewContCreatePdfAndOthersError', 10, '');
    })
    /*
     *tc.number testCreatePdfPromiseInitErr
     *tc.name testCreatePdfPromiseInitErr
     *tc.desc test interface of CreatePdf with not been associated with specific Web Components
     */
    it('testCreatePdfPromiseInitErr',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitCreatePdfPromiseInitErr", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testCreatePdfPromiseInitErr", "17100001", 17103, done);
      Utils.registerEvent("testCreatePdfPromiseInitErr", "Init error. The WebviewController must be associated with a Web component", 17104, done);
      sendEventByKey('webViewContCreatePdfAndOthersError', 10, '');
    })
    /*
     *tc.number testPrefetchPageInitErr
     *tc.name testPrefetchPageInitErr
     *tc.desc test interface of prefetchPage with not been associated with specific Web Components
     */
    it('testPrefetchPageInitErr',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitPrefetchPageInitErr", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testPrefetchPageInitErr", "17100001", 17105, done);
      Utils.registerEvent("testPrefetchPageInitErr", "Init error. The WebviewController must be associated with a Web component", 17106, done);
      sendEventByKey('webViewContCreatePdfAndOthersError', 10, '');
    })
    /*
      *tc.number testCreateWebPrintDocumentAdapterInitErr
      *tc.name testCreateWebPrintDocumentAdapterInitErr
      *tc.desc test interface of createWebPrintDocumentAdapter with not been associated with specific Web Components
      */
    it('testCreateWebPrintDocumentAdapterInitErr',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitCreateWebPrintDocumentAdapterInitErr", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testCreateWebPrintDocumentAdapterInitErr", "17100001", 17107, done);
      Utils.registerEvent("testCreateWebPrintDocumentAdapterInitErr", "Init error. The WebviewController must be associated with a Web component", 17108, done);
      sendEventByKey('webViewContCreatePdfAndOthersError', 10, '');
    })
    /*
    *tc.number testSetScrollableInitErr
    *tc.name testSetScrollableInitErr
    *tc.desc test interface of setScrollable with not been associated with specific Web Components
    */
    it('testSetScrollableInitErr',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitSetScrollableInitErr", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testSetScrollableInitErr", "17100001", 17109, done);
      Utils.registerEvent("testSetScrollableInitErr", "Init error. The WebviewController must be associated with a Web component", 17110, done);
      sendEventByKey('webViewContCreatePdfAndOthersError', 10, '');
    })
    /*
    *tc.number testGetScrollableInitErr
    *tc.name testGetScrollableInitErr
    *tc.desc test interface of getScrollable with not been associated with specific Web Components
    */
    it('testGetScrollableInitErr',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitGetScrollableInitErr", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testGetScrollableInitErr", "17100001", 17111, done);
      Utils.registerEvent("testGetScrollableInitErr", "Init error. The WebviewController must be associated with a Web component", 17112, done);
      sendEventByKey('webViewContCreatePdfAndOthersError', 10, '');
    })
    /*
    *tc.number testSetPrintBackgroundInitErr
    *tc.name testSetPrintBackgroundInitErr
    *tc.desc test interface of setPrintBackground with not been associated with specific Web Components
    */
    it('testSetPrintBackgroundInitErr',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitSetPrintBackgroundInitErr", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testSetPrintBackgroundInitErr", "17100001", 17113, done);
      Utils.registerEvent("testSetPrintBackgroundInitErr", "Init error. The WebviewController must be associated with a Web component", 17114, done);
      sendEventByKey('webViewContCreatePdfAndOthersError', 10, '');
    })
    /*
    *tc.number testGetPrintBackgroundInitErr
    *tc.name testGetPrintBackgroundInitErr
    *tc.desc test interface of getPrintBackground with not been associated with specific Web Components
    */
    it('testGetPrintBackgroundInitErr',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitGetPrintBackgroundInitErr", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testGetPrintBackgroundInitErr", "17100001", 17115, done);
      Utils.registerEvent("testGetPrintBackgroundInitErr", "Init error. The WebviewController must be associated with a Web component", 17116, done);
      sendEventByKey('webViewContCreatePdfAndOthersError', 10, '');
    })
    /*
    *tc.number testStartCameraInitErr
    *tc.name testStartCameraInitErr
    *tc.desc test interface of startCamera with not been associated with specific Web Components
    */
    it('testStartCameraInitErr',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitStartCameraInitErr", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testStartCameraInitErr", "17100001", 17117, done);
      Utils.registerEvent("testStartCameraInitErr", "Init error. The WebviewController must be associated with a Web component", 17118, done);
      sendEventByKey('webViewContCreatePdfAndOthersError', 10, '');
    })
    /*
    *tc.number testStopCameraInitErr
    *tc.name testStopCameraInitErr
    *tc.desc test interface of stopCamera with not been associated with specific Web Components
    */
    it('testStopCameraInitErr',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitStopCameraInitErr", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testStopCameraInitErr", "17100001", 17119, done);
      Utils.registerEvent("testStopCameraInitErr", "Init error. The WebviewController must be associated with a Web component", 17120, done);
      sendEventByKey('webViewContCreatePdfAndOthersError', 10, '');
    })
    /*
     *tc.number testCloseCameraInitErr
     *tc.name testCloseCameraInitErr
     *tc.desc test interface of closeCamera with not been associated with specific Web Components
     */
    it('testCloseCameraInitErr',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitCloseCameraInitErr", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testCloseCameraInitErr", "17100001", 17121, done);
      Utils.registerEvent("testCloseCameraInitErr", "Init error. The WebviewController must be associated with a Web component", 17122, done);
      sendEventByKey('webViewContCreatePdfAndOthersError', 10, '');
    })
    /*
    *tc.number testPauseAllTimersInitErr
    *tc.name testPauseAllTimersInitErr
    *tc.desc test interface of pauseAllTimers with not been associated with specific Web Components
    */
    it('testPauseAllTimersInitErr',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitPauseAllTimersInitErr", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testPauseAllTimersInitErr", "17100001", 17123, done);
      Utils.registerEvent("testPauseAllTimersInitErr", "Init error. The WebviewController must be associated with a Web component", 17124, done);
      sendEventByKey('webViewContCreatePdfAndOthersError', 10, '');
    })
    /*
    *tc.number testResumeAllTimersInitErr
    *tc.name testResumeAllTimersInitErr
    *tc.desc test interface of resumeAllTimers with not been associated with specific Web Components
    */
    it('testResumeAllTimersInitErr',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitResumeAllTimersInitErr", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testResumeAllTimersInitErr", "17100001", 17125, done);
      Utils.registerEvent("testResumeAllTimersInitErr", "Init error. The WebviewController must be associated with a Web component", 17126, done);
      sendEventByKey('webViewContCreatePdfAndOthersError', 10, '');
    })
    /*
    *tc.number testStopAllMediaInitErr
    *tc.name testStopAllMediaInitErr
    *tc.desc test interface of stopAllMedia with not been associated with specific Web Components
    */
    it('testStopAllMediaInitErr',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitStopAllMediaInitErr", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testStopAllMediaInitErr", "17100001", 17127, done);
      Utils.registerEvent("testStopAllMediaInitErr", "Init error. The WebviewController must be associated with a Web component", 17128, done);
      sendEventByKey('webViewContCreatePdfAndOthersError', 10, '');
    })
    /*
    *tc.number testResumeAllMediaInitErr
    *tc.name testResumeAllMediaInitErr
    *tc.desc test interface of resumeAllMedia with not been associated with specific Web Components
    */
    it('testResumeAllMediaInitErr',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitResumeAllMediaInitErr", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testResumeAllMediaInitErr", "17100001", 17129, done);
      Utils.registerEvent("testResumeAllMediaInitErr", "Init error. The WebviewController must be associated with a Web component", 17130, done);
      sendEventByKey('webViewContCreatePdfAndOthersError', 10, '');
    })
    /*
    *tc.number testPauseAllMediaInitErr
    *tc.name testPauseAllMediaInitErr
    *tc.desc test interface of pauseAllMedia with not been associated with specific Web Components
    */
    it('testPauseAllMediaInitErr',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitPauseAllMediaInitErr", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testPauseAllMediaInitErr", "17100001", 17131, done);
      Utils.registerEvent("testPauseAllMediaInitErr", "Init error. The WebviewController must be associated with a Web component", 17132, done);
      sendEventByKey('webViewContCreatePdfAndOthersError', 10, '');
    })
    /*
    *tc.number testCloseAllMediaPresentationsInitErr
    *tc.name testCloseAllMediaPresentationsInitErr
    *tc.desc test interface of closeAllMediaPresentations with not been associated with specific Web Components
    */
    it('testCloseAllMediaPresentationsInitErr',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitCloseAllMediaPresentationsInitErr", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testCloseAllMediaPresentationsInitErr", "17100001", 17133, done);
      Utils.registerEvent("testCloseAllMediaPresentationsInitErr", "Init error. The WebviewController must be associated with a Web component", 17134, done);
      sendEventByKey('webViewContCreatePdfAndOthersError', 10, '');
    })
    /*
    *tc.number testGetMediaPlaybackStateInitErr
    *tc.name testGetMediaPlaybackStateInitErr
    *tc.desc test interface of getMediaPlaybackState with not been associated with specific Web Components
    */
    it('testGetMediaPlaybackStateInitErr',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitGetMediaPlaybackStateInitErr", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testGetMediaPlaybackStateInitErr", "17100001", 17135, done);
      Utils.registerEvent("testGetMediaPlaybackStateInitErr", "Init error. The WebviewController must be associated with a Web component", 17136, done);
      sendEventByKey('webViewContCreatePdfAndOthersError', 10, '');
    })
    /*
    *tc.number testTerminateRenderProcessInitErr
    *tc.name testTerminateRenderProcessInitErr
    *tc.desc test interface of terminateRenderProcess with not been associated with specific Web Components
    */
    it('testTerminateRenderProcessInitErr',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitTerminateRenderProcessInitErr", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testTerminateRenderProcessInitErr", "17100001", 17137, done);
      Utils.registerEvent("testTerminateRenderProcessInitErr", "Init error. The WebviewController must be associated with a Web component", 17138, done);
      sendEventByKey('webViewContCreatePdfAndOthersError', 10, '');
    })
    /*
    *tc.number testPrecompileJavaScriptInitErr
    *tc.name testPrecompileJavaScriptInitErr
    *tc.desc test interface of precompileJavaScript with not been associated with specific Web Components
    */
    it('testPrecompileJavaScriptInitErr',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitPrecompileJavaScriptInitErr", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testPrecompileJavaScriptInitErr", "17100001", 17139, done);
      Utils.registerEvent("testPrecompileJavaScriptInitErr", "Init error. The WebviewController must be associated with a Web component", 17140, done);
      sendEventByKey('webViewContCreatePdfAndOthersError', 10, '');
    })
    /*
    *tc.number testSetPathAllowingUniversalAccessInitErr
    *tc.name testSetPathAllowingUniversalAccessInitErr
    *tc.desc test interface of setPathAllowingUniversalAccess with not been associated with specific Web Components
    */
    it('testSetPathAllowingUniversalAccessInitErr',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitSetPathAllowingUniversalAccessInitErr", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testSetPathAllowingUniversalAccessInitErr", "17100001", 17141, done);
      Utils.registerEvent("testSetPathAllowingUniversalAccessInitErr", "Init error. The WebviewController must be associated with a Web component", 17142, done);
      sendEventByKey('webViewContCreatePdfAndOthersError', 10, '');
    })
    /*
    *tc.number testScrollByWithResultInitErr
    *tc.name testScrollByWithResultInitErr
    *tc.desc test interface of scrollByWithResult with not been associated with specific Web Components
    */
    it('testScrollByWithResultInitErr',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitScrollByWithResultInitErr", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testScrollByWithResultInitErr", "17100001", 17143, done);
      Utils.registerEvent("testScrollByWithResultInitErr", "Init error. The WebviewController must be associated with a Web component", 17144, done);
      sendEventByKey('webViewContCreatePdfAndOthersError', 10, '');
    })
    /*
    *tc.number testGetLastHitTestInitErr
    *tc.name testGetLastHitTestInitErr
    *tc.desc test interface of getLastHitTest with not been associated with specific Web Components
    */
    it('testGetLastHitTestInitErr',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitGetLastHitTestInitErr", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testGetLastHitTestInitErr", "17100001", 17145, done);
      Utils.registerEvent("testGetLastHitTestInitErr", "Init error. The WebviewController must be associated with a Web component", 17146, done);
      sendEventByKey('webViewContCreatePdfAndOthersError', 10, '');
    })
  })
}