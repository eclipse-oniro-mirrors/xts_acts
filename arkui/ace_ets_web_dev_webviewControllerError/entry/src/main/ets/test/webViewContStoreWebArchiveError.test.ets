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

let emitKey = "emitStoreWebArchiveCallBackInitErr";

export default function webViewContStoreWebArchiveError() {
  describe('ActsAceWebDevWebViewContStoreWebArchiveErrorTest', () => {
    beforeAll(async (done: Function) => {
      let options = {
        uri: 'MainAbility/pages/webViewContStoreWebArchiveError',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webViewContStoreWebArchiveError state success " + JSON.stringify(pages));
        if (!("webViewContStoreWebArchiveError" == pages.name)) {
          console.info("get webViewContStoreWebArchiveError state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push webViewContStoreWebArchiveError page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webViewContStoreWebArchiveError page error: " + err);
      }
      done()
    });
    beforeEach(async (done: Function) => {
      await Utils.sleep(2000);
      console.info("webViewContStoreWebArchiveError beforeEach start");
      done();
    })
    afterEach(async (done: Function) => {
      console.info("webViewContStoreWebArchiveError afterEach start:" + emitKey);
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
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERROR_5100
     *tc.name testStoreWebArchiveInitErr
     *tc.desc test interface of storeWebArchive with not been associated with specific Web Components
     */
    it('teststoreWebArchiveInitErr', 0, async (done: Function) => {
      emitKey = "emitStoreWebArchiveCallBackPathErr";
      Utils.registerEvent("teststoreWebArchiveInitErr", "17100001", 700, done);
      Utils.registerEvent("teststoreWebArchiveInitErr", "Init error. The WebviewController must be associated with a Web component", 701, done);
      sendEventByKey('webViewContStoreWebArchiveError', 10, '');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERROR_5200
     *tc.name testStoreWebArchiveCallBackPathErr
     *tc.desc test interface of storeWebArchive with wrong resource path
     */
    it('testStoreWebArchiveCallBackPathErr', 0, async (done: Function) => {
      emitKey = "emitStoreWebArchiveCallBackUnAccessErr";
      Utils.registerEvent("testStoreWebArchiveCallBackPathErr", 17100003, 702, done);
      Utils.registerEvent("testStoreWebArchiveCallBackPathErr", "Invalid resource path or file type", 703, done);
      sendEventByKey('webViewContStoreWebArchiveError', 10, '');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERROR_5300
     *tc.name testStoreWebArchiveCallBackUnAccessErr
     *tc.desc test interface of storeWebArchive with resource path cannot access
     */
    it('testStoreWebArchiveCallBackUnAccessErr', 0, async (done: Function) => {
      emitKey = "emitStoreWebArchivePromiseInitErr";
      Utils.registerEvent("testStoreWebArchiveCallBackUnAccessErr", 17100003, 704, done);
      Utils.registerEvent("testStoreWebArchiveCallBackUnAccessErr", "Invalid resource path or file type", 705, done);
      sendEventByKey('webViewContStoreWebArchiveError', 10, '');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERROR_5400
     *tc.name testStoreWebArchivePromiseInitErr
     *tc.desc test interface of storeWebArchive promise with not been associated with specific Web Components
     */
    it('testStoreWebArchivePromiseInitErr', 0, async (done: Function) => {
      emitKey = "emitStoreWebArchivePromisePathErr";
      Utils.registerEvent("testStoreWebArchivePromiseInitErr", "17100001", 706, done);
      Utils.registerEvent("testStoreWebArchivePromiseInitErr", "Init error. The WebviewController must be associated with a Web component", 707, done);
      sendEventByKey('webViewContStoreWebArchiveError', 10, '');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERROR_5500
     *tc.name testStoreWebArchivePromisePathErr
     *tc.desc test interface of storeWebArchive promise with wrong resource path
     */
    it('testStoreWebArchivePromisePathErr', 0, async (done: Function) => {
      emitKey = "emitStoreWebArchivePromiseUnAccessErr";
      Utils.registerEvent("testStoreWebArchivePromisePathErr", 17100003, 708, done);
      Utils.registerEvent("testStoreWebArchivePromisePathErr", "Invalid resource path or file type", 709, done);
      sendEventByKey('webViewContStoreWebArchiveError', 10, '');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERROR_5600
     *tc.name testStoreWebArchivePromiseUnAccessErr
     *tc.desc test interface of storeWebArchive promise with resource path cannot access
     */
    it('testStoreWebArchivePromiseUnAccessErr', 0, async (done: Function) => {
      emitKey = "emitStoreWebArchivePromiseUnAccessErr";
      Utils.registerEvent("testStoreWebArchivePromiseUnAccessErr", 17100003, 710, done);
      Utils.registerEvent("testStoreWebArchivePromiseUnAccessErr", "Invalid resource path or file type", 711, done);
      sendEventByKey('webViewContStoreWebArchiveError', 10, '');
    })
  })
}