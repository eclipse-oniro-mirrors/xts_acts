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
import Utils from './Utils';
import router from '@ohos.router';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';

const EVENT_ID_SET_EMIT_KEY = 111120;
const driver = Driver.create();
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

let emitKey = "";

export default function webViewContGetUrlAndOthersError() {
  describe('ActsAceWebDevWebViewContGetUrlAndOthersErrorTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/webViewContGetUrlAndOthersError',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webViewContGetUrlAndOthersError state success " + JSON.stringify(pages));
        if (!("webViewContGetUrlAndOthersError" == pages.name)) {
          console.info("get webViewContGetUrlAndOthersError state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push webViewContGetUrlAndOthersError page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webViewContGetUrlAndOthersError page error: " + err);
      }
      await driver.waitForComponent(ON.id("webViewContGetUrlAndOthersError"), 10000);
      console.log("waitForComponent webViewContGetUrlAndOthersError");
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("webViewContGetUrlAndOthersError beforeEach start");
      done();
    })

    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERROR_5700
     *tc.name testGetUrlInitErr
     *tc.desc test interface of getUrl with not been associated with specific Web Components
     */
    it('testGetUrlInitErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitGetUrlInitErr";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testGetUrlInitErr", "17100001", 111130, null);
      Utils.registerEvent("testGetUrlInitErr", "Init error. The WebviewController must be associated with a Web component", 111140, done);
      await Utils.waitAndClickComponent(driver, "webViewContGetUrlAndOthersError");
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERROR_5800
     *tc.name testStopInitErr
     *tc.desc test interface of stop with not been associated with specific Web Components
     */
    it('testStopInitErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitStopInitErr";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testStopInitErr", "17100001", 111150, null);
      Utils.registerEvent("testStopInitErr", "Init error. The WebviewController must be associated with a Web component", 111160, done);
      await Utils.waitAndClickComponent(driver, "webViewContGetUrlAndOthersError");
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERROR_5900
     *tc.name testBackOrForwardInitErr
     *tc.desc test interface of backOrForward with not been associated with specific Web Components
     */
    it('testBackOrForwardInitErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitBackOrForwardInitErr";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testBackOrForwardInitErr", "17100001", 111170, null);
      Utils.registerEvent("testBackOrForwardInitErr", "Init error. The WebviewController must be associated with a Web component", 111180, done);
      await Utils.waitAndClickComponent(driver, "webViewContGetUrlAndOthersError");
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERROR_6000
     *tc.name testScrollToInitErr
     *tc.desc test interface of scrollTo with not been associated with specific Web Components
     */
    it('testScrollToInitErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitScrollToInitErr";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testScrollToInitErr", "17100001", 111190, null);
      Utils.registerEvent("testScrollToInitErr", "Init error. The WebviewController must be associated with a Web component", 111200, done);
      await Utils.waitAndClickComponent(driver, "webViewContGetUrlAndOthersError");
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERROR_6100
     *tc.name testScrollByInitErr
     *tc.desc test interface of scrollBy with not been associated with specific Web Components
     */
    it('testScrollByInitErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitScrollByInitErr";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testScrollByInitErr", "17100001", 111210, null);
      Utils.registerEvent("testScrollByInitErr", "Init error. The WebviewController must be associated with a Web component", 111220, done);
      await Utils.waitAndClickComponent(driver, "webViewContGetUrlAndOthersError");
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERROR_6200
     *tc.name testSlideScrollInitErr
     *tc.desc test interface of slideScroll with not been associated with specific Web Components
     */
    it('testSlideScrollInitErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitSlideScrollInitErr";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testSlideScrollInitErr", "17100001", 111230, null);
      Utils.registerEvent("testSlideScrollInitErr", "Init error. The WebviewController must be associated with a Web component", 111240, done);
      await Utils.waitAndClickComponent(driver, "webViewContGetUrlAndOthersError");
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERROR_6300
     *tc.name testGetOriginalUrlInitErr
     *tc.desc test interface of getOriginalUrl with not been associated with specific Web Components
     */
    it('testGetOriginalUrlInitErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitGetOriginalUrlInitErr";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testGetOriginalUrlInitErr", "17100001", 111250, null);
      Utils.registerEvent("testGetOriginalUrlInitErr", "Init error. The WebviewController must be associated with a Web component", 111260, done);
      await Utils.waitAndClickComponent(driver, "webViewContGetUrlAndOthersError");
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERROR_6400
     *tc.name testGetFaviconInitErr
     *tc.desc test interface of getFavicon with not been associated with specific Web Components
     */
    it('testGetFaviconInitErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitGetFaviconInitErr";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testGetFaviconInitErr", "17100001", 111270, null);
      Utils.registerEvent("testGetFaviconInitErr", "Init error. The WebviewController must be associated with a Web component", 111280, done);
      await Utils.waitAndClickComponent(driver, "webViewContGetUrlAndOthersError");
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERROR_6500
     *tc.name testSetNetworkAvailableInitErr
     *tc.desc test interface of setNetworkAvailable with not been associated with specific Web Components
     */
    it('testSetNetworkAvailableInitErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitSetNetworkAvailableInitErr";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testSetNetworkAvailableInitErr", "17100001", 111290, null);
      Utils.registerEvent("testSetNetworkAvailableInitErr", "Init error. The WebviewController must be associated with a Web component", 111300, done);
      await Utils.waitAndClickComponent(driver, "webViewContGetUrlAndOthersError");
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERROR_6600
     *tc.name testHasImageCallBackInitErr
     *tc.desc test interface of hasImage (callback) with not been associated with specific Web Components
     */
    it('testHasImageCallBackInitErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitHasImageCallBackInitErr";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testHasImageCallBackInitErr", "17100001", 111310, null);
      Utils.registerEvent("testHasImageCallBackInitErr", "Init error. The WebviewController must be associated with a Web component", 111320, done);
      await Utils.waitAndClickComponent(driver, "webViewContGetUrlAndOthersError");
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERROR_6700
     *tc.name testHasImagePromiseInitErr
     *tc.desc test interface of hasImage (promise) with not been associated with specific Web Components
     */
    it('testHasImagePromiseInitErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitHasImagePromiseInitErr";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testHasImagePromiseInitErr", "17100001", 111330, null);
      Utils.registerEvent("testHasImagePromiseInitErr", "Init error. The WebviewController must be associated with a Web component", 111340, done);
      await Utils.waitAndClickComponent(driver, "webViewContGetUrlAndOthersError");
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERROR_6800
     *tc.name testRemoveCacheInitErr
     *tc.desc test interface of removeCache with not been associated with specific Web Components
     */
    it('testRemoveCacheInitErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitRemoveCacheInitErr";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testRemoveCacheInitErr", "17100001", 111350, null);
      Utils.registerEvent("testRemoveCacheInitErr", "Init error. The WebviewController must be associated with a Web component", 111360, done);
      await Utils.waitAndClickComponent(driver, "webViewContGetUrlAndOthersError");
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERROR_6900
     *tc.name testPageUpInitErr
     *tc.desc test interface of pageUp with not been associated with specific Web Components
     */
    it('testPageUpInitErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitPageUpInitErr";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testPageUpInitErr", "17100001", 111370, null);
      Utils.registerEvent("testPageUpInitErr", "Init error. The WebviewController must be associated with a Web component", 111380, done);
      await Utils.waitAndClickComponent(driver, "webViewContGetUrlAndOthersError");
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERROR_7000
     *tc.name testPageDownInitErr
     *tc.desc test interface of pageDown with not been associated with specific Web Components
     */
    it('testPageDownInitErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitPageDownInitErr";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testPageDownInitErr", "17100001", 111390, null);
      Utils.registerEvent("testPageDownInitErr", "Init error. The WebviewController must be associated with a Web component", 111400, done);
      await Utils.waitAndClickComponent(driver, "webViewContGetUrlAndOthersError");
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERROR_7100
     *tc.name testGetBackForwardEntriesInitErr
     *tc.desc test interface of getBackForwardEntries with not been associated with specific Web Components
     */
    it('testGetBackForwardEntriesInitErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitGetBackForwardEntriesInitErr";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testGetBackForwardEntriesInitErr", "17100001", 111410, null);
      Utils.registerEvent("testGetBackForwardEntriesInitErr", "Init error. The WebviewController must be associated with a Web component", 111420, done);
      await Utils.waitAndClickComponent(driver, "webViewContGetUrlAndOthersError");
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERROR_7200
     *tc.name testSerializeWebStateInitErr
     *tc.desc test interface of serializeWebState with not been associated with specific Web Components
     */
    it('testSerializeWebStateInitErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitSerializeWebStateInitErr";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testSerializeWebStateInitErr", "17100001", 111430, null);
      Utils.registerEvent("testSerializeWebStateInitErr", "Init error. The WebviewController must be associated with a Web component", 111440, done);
      await Utils.waitAndClickComponent(driver, "webViewContGetUrlAndOthersError");
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERROR_7300
     *tc.name testRestoreWebStateInitErr
     *tc.desc test interface of restoreWebState with not been associated with specific Web Components
     */
    it('testRestoreWebStateInitErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitRestoreWebStateInitErr";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testRestoreWebStateInitErr", "17100001", 111450, null);
      Utils.registerEvent("testRestoreWebStateInitErr", "Init error. The WebviewController must be associated with a Web component", 111460, done);
      await Utils.waitAndClickComponent(driver, "webViewContGetUrlAndOthersError");
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERROR_7400
     *tc.name testGetCertificatePromiseInitErr
     *tc.desc test interface of getCertificate (promise) with not been associated with specific Web Components
     */
    it('testGetCertificatePromiseInitErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitGetCertificatePromiseInitErr";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testGetCertificatePromiseInitErr", "17100001", 111470, null);
      Utils.registerEvent("testGetCertificatePromiseInitErr", "Init error. The WebviewController must be associated with a Web component", 111480, done);
      await Utils.waitAndClickComponent(driver, "webViewContGetUrlAndOthersError");
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERROR_7500
     *tc.name testGetCertificateCallbackInitErr
     *tc.desc test interface of getCertificate (callback) with not been associated with specific Web Components
     */
    it('testGetCertificateCallbackInitErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitGetCertificateCallbackInitErr";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testGetCertificateCallbackInitErr", "17100001", 111490, null);
      Utils.registerEvent("testGetCertificateCallbackInitErr", "Init error. The WebviewController must be associated with a Web component", 111500, done);
      await Utils.waitAndClickComponent(driver, "webViewContGetUrlAndOthersError");
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERROR_7600
     *tc.name testSetAudioMutedInitErr
     *tc.desc test interface of setAudioMuted with not been associated with specific Web Components
     */
    it('testSetAudioMutedInitErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitSetAudioMutedInitErr";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testSetAudioMutedInitErr", "17100001", 111510, null);
      Utils.registerEvent("testSetAudioMutedInitErr", "Init error. The WebviewController must be associated with a Web component", 111520, done);
      await Utils.waitAndClickComponent(driver, "webViewContGetUrlAndOthersError");
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERROR_7700
     *tc.name testSetAudioMutedInitErr
     *tc.desc test interface of setAudioMuted with not been associated with specific Web Components
     */
    it('emitAvoidVisibleViewportBottomErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitAvoidVisibleViewportBottomErr";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("emitAvoidVisibleViewportBottomErr", "17100001", 20250827, null);
      Utils.registerEvent("emitAvoidVisibleViewportBottomErr", "Init error. The WebviewController must be associated with a Web component", 20250828, done);
      await Utils.waitAndClickComponent(driver, "webViewContGetUrlAndOthersError");
    })


  })
}