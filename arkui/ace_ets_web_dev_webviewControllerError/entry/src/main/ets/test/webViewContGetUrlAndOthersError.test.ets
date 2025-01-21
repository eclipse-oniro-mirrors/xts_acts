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
import { describe, beforeEach, afterEach, it, expect, beforeAll } from "@ohos/hypium";
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils.ets';
import router from '@system.router';

let emitKey = "emitGetUrlInitErr";

export default function webViewContGetUrlAndOthersError() {
  describe('ActsAceWebDevWebViewContGetUrlAndOthersErrorTest', () => {
    beforeAll(async (done: Function) => {
      let options = {
        uri: 'MainAbility/pages/webViewContGetUrlAndOthersError',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webViewContGetUrlAndOthersError state success " + JSON.stringify(pages));
        if (!("webViewContGetUrlAndOthersError" == pages.name)) {
          console.info("get webViewContGetUrlAndOthersError state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push webViewContGetUrlAndOthersError page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webViewContGetUrlAndOthersError page error: " + err);
      }
      done()
    });
    beforeEach(async (done: Function) => {
      await Utils.sleep(2000);
      console.info("webViewContGetUrlAndOthersError beforeEach start");
      done();
    })
    afterEach(async (done: Function) => {
      console.info("webViewContGetUrlAndOthersError afterEach start:" + emitKey);
      try {
        let backData: events_emitter.EventData = {
          data: {
            "ACTION": emitKey
          }
        }
        let backEvent: events_emitter.InnerEvent = {
          eventId: 10,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("start send emitKey");
        events_emitter.emit(backEvent, backData);
      } catch (err) {
        console.info("emit emitKey  err: " + JSON.stringify(err));
      }
      await Utils.sleep(2000);
      done();
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERROR_5700
     *tc.name testGetUrlInitErr
     *tc.desc test interface of getUrl with not been associated with specific Web Components
     */
    it('testGetUrlInitErr', 0, async (done: Function) => {
      emitKey = "emitStopInitErr";
      Utils.registerEvent("testGetUrlInitErr", "17100001", 712, done);
      Utils.registerEvent("testGetUrlInitErr", "Init error. The WebviewController must be associated with a Web component", 713, done);
      sendEventByKey('webViewContGetUrlAndOthersError', 10, '');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERROR_5800
     *tc.name testStopInitErr
     *tc.desc test interface of stop with not been associated with specific Web Components
     */
    it('testStopInitErr', 0, async (done: Function) => {
      emitKey = "emitBackOrForwardInitErr";
      Utils.registerEvent("testStopInitErr", "17100001", 714, done);
      Utils.registerEvent("testStopInitErr", "Init error. The WebviewController must be associated with a Web component", 715, done);
      sendEventByKey('webViewContGetUrlAndOthersError', 10, '');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERROR_5900
     *tc.name testBackOrForwardInitErr
     *tc.desc test interface of backOrForward with not been associated with specific Web Components
     */
    it('testBackOrForwardInitErr', 0, async (done: Function) => {
      emitKey = "emitScrollToInitErr";
      Utils.registerEvent("testBackOrForwardInitErr", "17100001", 716, done);
      Utils.registerEvent("testBackOrForwardInitErr", "Init error. The WebviewController must be associated with a Web component", 717, done);
      sendEventByKey('webViewContGetUrlAndOthersError', 10, '');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERROR_6000
     *tc.name testScrollToInitErr
     *tc.desc test interface of scrollTo with not been associated with specific Web Components
     */
    it('testScrollToInitErr', 0, async (done: Function) => {
      emitKey = "emitScrollByInitErr";
      Utils.registerEvent("testScrollToInitErr", "17100001", 718, done);
      Utils.registerEvent("testScrollToInitErr", "Init error. The WebviewController must be associated with a Web component", 719, done);
      sendEventByKey('webViewContGetUrlAndOthersError', 10, '');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERROR_6100
     *tc.name testScrollByInitErr
     *tc.desc test interface of scrollBy with not been associated with specific Web Components
     */
    it('testScrollByInitErr', 0, async (done: Function) => {
      emitKey = "emitSlideScrollInitErr";
      Utils.registerEvent("testScrollByInitErr", "17100001", 720, done);
      Utils.registerEvent("testScrollByInitErr", "Init error. The WebviewController must be associated with a Web component", 721, done);
      sendEventByKey('webViewContGetUrlAndOthersError', 10, '');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERROR_6200
     *tc.name testSlideScrollInitErr
     *tc.desc test interface of slideScroll with not been associated with specific Web Components
     */
    it('testSlideScrollInitErr', 0, async (done: Function) => {
      emitKey = "emitGetOriginalUrlInitErr";
      Utils.registerEvent("testSlideScrollInitErr", "17100001", 722, done);
      Utils.registerEvent("testSlideScrollInitErr", "Init error. The WebviewController must be associated with a Web component", 723, done);
      sendEventByKey('webViewContGetUrlAndOthersError', 10, '');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERROR_6300
     *tc.name testGetOriginalUrlInitErr
     *tc.desc test interface of getOriginalUrl with not been associated with specific Web Components
     */
    it('testGetOriginalUrlInitErr', 0, async (done: Function) => {
      emitKey = "emitGetFaviconInitErr";
      Utils.registerEvent("testGetOriginalUrlInitErr", "17100001", 724, done);
      Utils.registerEvent("testGetOriginalUrlInitErr", "Init error. The WebviewController must be associated with a Web component", 725, done);
      sendEventByKey('webViewContGetUrlAndOthersError', 10, '');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERROR_6400
     *tc.name testGetFaviconInitErr
     *tc.desc test interface of getFavicon with not been associated with specific Web Components
     */
    it('testGetFaviconInitErr', 0, async (done: Function) => {
      emitKey = "emitSetNetworkAvailableInitErr";
      Utils.registerEvent("testGetFaviconInitErr", "17100001", 726, done);
      Utils.registerEvent("testGetFaviconInitErr", "Init error. The WebviewController must be associated with a Web component", 727, done);
      sendEventByKey('webViewContGetUrlAndOthersError', 10, '');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERROR_6500
     *tc.name testSetNetworkAvailableInitErr
     *tc.desc test interface of setNetworkAvailable with not been associated with specific Web Components
     */
    it('testSetNetworkAvailableInitErr', 0, async (done: Function) => {
      emitKey = "emitHasImageCallBackInitErr";
      Utils.registerEvent("testSetNetworkAvailableInitErr", "17100001", 728, done);
      Utils.registerEvent("testSetNetworkAvailableInitErr", "Init error. The WebviewController must be associated with a Web component", 729, done);
      sendEventByKey('webViewContGetUrlAndOthersError', 10, '');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERROR_6600
     *tc.name testHasImageCallBackInitErr
     *tc.desc test interface of hasImage (callback) with not been associated with specific Web Components
     */
    it('testHasImageCallBackInitErr', 0, async (done: Function) => {
      emitKey = "emitHasImagePromiseInitErr";
      Utils.registerEvent("testHasImageCallBackInitErr", "17100001", 730, done);
      Utils.registerEvent("testHasImageCallBackInitErr", "Init error. The WebviewController must be associated with a Web component", 731, done);
      sendEventByKey('webViewContGetUrlAndOthersError', 10, '');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERROR_6700
     *tc.name testHasImagePromiseInitErr
     *tc.desc test interface of hasImage (promise) with not been associated with specific Web Components
     */
    it('testHasImagePromiseInitErr', 0, async (done: Function) => {
      emitKey = "emitRemoveCacheInitErr";
      Utils.registerEvent("testHasImagePromiseInitErr", "17100001", 732, done);
      Utils.registerEvent("testHasImagePromiseInitErr", "Init error. The WebviewController must be associated with a Web component", 733, done);
      sendEventByKey('webViewContGetUrlAndOthersError', 10, '');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERROR_6800
     *tc.name testRemoveCacheInitErr
     *tc.desc test interface of removeCache with not been associated with specific Web Components
     */
    it('testRemoveCacheInitErr', 0, async (done: Function) => {
      emitKey = "emitPageUpInitErr";
      Utils.registerEvent("testRemoveCacheInitErr", "17100001", 734, done);
      Utils.registerEvent("testRemoveCacheInitErr", "Init error. The WebviewController must be associated with a Web component", 735, done);
      sendEventByKey('webViewContGetUrlAndOthersError', 10, '');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERROR_6900
     *tc.name testPageUpInitErr
     *tc.desc test interface of pageUp with not been associated with specific Web Components
     */
    it('testPageUpInitErr', 0, async (done: Function) => {
      emitKey = "emitPageDownInitErr";
      Utils.registerEvent("testPageUpInitErr", "17100001", 736, done);
      Utils.registerEvent("testPageUpInitErr", "Init error. The WebviewController must be associated with a Web component", 737, done);
      sendEventByKey('webViewContGetUrlAndOthersError', 10, '');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERROR_7000
     *tc.name testPageDownInitErr
     *tc.desc test interface of pageDown with not been associated with specific Web Components
     */
    it('testPageDownInitErr', 0, async (done: Function) => {
      emitKey = "emitGetBackForwardEntriesInitErr";
      Utils.registerEvent("testPageDownInitErr", "17100001", 738, done);
      Utils.registerEvent("testPageDownInitErr", "Init error. The WebviewController must be associated with a Web component", 739, done);
      sendEventByKey('webViewContGetUrlAndOthersError', 10, '');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERROR_7100
     *tc.name testGetBackForwardEntriesInitErr
     *tc.desc test interface of getBackForwardEntries with not been associated with specific Web Components
     */
    it('testGetBackForwardEntriesInitErr', 0, async (done: Function) => {
      emitKey = "emitSerializeWebStateInitErr";
      Utils.registerEvent("testGetBackForwardEntriesInitErr", "17100001", 740, done);
      Utils.registerEvent("testGetBackForwardEntriesInitErr", "Init error. The WebviewController must be associated with a Web component", 741, done);
      sendEventByKey('webViewContGetUrlAndOthersError', 10, '');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERROR_7200
     *tc.name testSerializeWebStateInitErr
     *tc.desc test interface of serializeWebState with not been associated with specific Web Components
     */
    it('testSerializeWebStateInitErr', 0, async (done: Function) => {
      emitKey = "emitRestoreWebStateInitErr";
      Utils.registerEvent("testSerializeWebStateInitErr", "17100001", 742, done);
      Utils.registerEvent("testSerializeWebStateInitErr", "Init error. The WebviewController must be associated with a Web component", 743, done);
      sendEventByKey('webViewContGetUrlAndOthersError', 10, '');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERROR_7300
     *tc.name testRestoreWebStateInitErr
     *tc.desc test interface of restoreWebState with not been associated with specific Web Components
     */
    it('testRestoreWebStateInitErr', 0, async (done: Function) => {
      emitKey = "emitGetCertificatePromiseInitErr";
      Utils.registerEvent("testRestoreWebStateInitErr", "17100001", 744, done);
      Utils.registerEvent("testRestoreWebStateInitErr", "Init error. The WebviewController must be associated with a Web component", 745, done);
      sendEventByKey('webViewContGetUrlAndOthersError', 10, '');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERROR_7400
     *tc.name testGetCertificatePromiseInitErr
     *tc.desc test interface of getCertificate (promise) with not been associated with specific Web Components
     */
    it('testGetCertificatePromiseInitErr', 0, async (done: Function) => {
      emitKey = "emitGetCertificateCallbackInitErr";
      Utils.registerEvent("testGetCertificatePromiseInitErr", "17100001", 746, done);
      Utils.registerEvent("testGetCertificatePromiseInitErr", "Init error. The WebviewController must be associated with a Web component", 747, done);
      sendEventByKey('webViewContGetUrlAndOthersError', 10, '');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERROR_7500
     *tc.name testGetCertificateCallbackInitErr
     *tc.desc test interface of getCertificate (callback) with not been associated with specific Web Components
     */
    it('testGetCertificateCallbackInitErr', 0, async (done: Function) => {
      emitKey = "emitSetAudioMutedInitErr";
      Utils.registerEvent("testGetCertificateCallbackInitErr", "17100001", 748, done);
      Utils.registerEvent("testGetCertificateCallbackInitErr", "Init error. The WebviewController must be associated with a Web component", 749, done);
      sendEventByKey('webViewContGetUrlAndOthersError', 10, '');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERROR_7600
     *tc.name testSetAudioMutedInitErr
     *tc.desc test interface of setAudioMuted with not been associated with specific Web Components
     */
    it('testSetAudioMutedInitErr', 0, async (done: Function) => {
      emitKey = "emitSetAudioMutedInitErr";
      Utils.registerEvent("testSetAudioMutedInitErr", "17100001", 750, done);
      Utils.registerEvent("testSetAudioMutedInitErr", "Init error. The WebviewController must be associated with a Web component", 751, done);
      sendEventByKey('webViewContGetUrlAndOthersError', 10, '');
    })
  })
}