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

let emitKey = "emitPrefetchPageErr";

export default function webViewContPageAndprepareForPageLoadErrorTwo() {
  describe('ActsAceWebDevWebViewContPageAndPrepareForPageLoadErrorTwoTest', () => {
    beforeAll(async (done: Function) => {
      let options = {
        uri: 'MainAbility/pages/webViewContPageAndprepareForPageLoadErrorTwo',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webViewContPageAndprepareForPageLoadErrorTwo state success " + JSON.stringify(pages));
        if (!("webViewContPageAndprepareForPageLoadErrorTwo" == pages.name)) {
          console.info("get webViewContPageAndprepareForPageLoadErrorTwo state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push webViewContPageAndprepareForPageLoadErrorTwo page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webViewContPageAndprepareForPageLoadErrorTwo page error: " + err);
      }
      done()
    });
    beforeEach(async (done: Function) => {
      await Utils.sleep(2000);
      console.info("webViewContPageAndprepareForPageLoadErrorTwo beforeEach start");
      done();
    })
    afterEach(async (done: Function) => {
      console.info("webViewContPageAndprepareForPageLoadErrorTwo afterEach start:" + emitKey);
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
     *tc.number SUB_ACE_BASIC_ETS__WEBVIEWCONTPAGEANDPREPAREFORPAGELOADERRORTWO_0100
     *tc.name testPostMessageInitErr
     *tc.desc test interface of postMessage with not been associated with specific Web Components
     */
    it('PrefetchPageErr', 0, async (done: Function) => {
      emitKey = "emitPrepareForPageLoadErr";
      Utils.registerEvent("PrefetchPageErr", "17100002", 903, done);
      sendEventByKey('webViewContPageAndprepareForPageLoadErrorTwo', 10, '');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS__WEBVIEWCONTPAGEANDPREPAREFORPAGELOADERROEONE_0200
     *tc.name testPostMessageEventPortClose
     *tc.desc test interface of postMessageEvent with WebMessagePort been closed by ets
     */
    it('PrepareForPageLoadErr', 0, async (done: Function) => {
      emitKey = "emitPrepareForPageLoadErrTwo";
      Utils.registerEvent("PrepareForPageLoadErr", "17100002", 904, done);
      sendEventByKey('webViewContPageAndprepareForPageLoadErrorTwo', 10, '');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS__WEBVIEWCONTPAGEANDPREPAREFORPAGELOADERROEONE_0300
     *tc.name testPostMessageEventPortClose
     *tc.desc test interface of postMessageEvent with WebMessagePort been closed by ets
     */
    it('PrepareForPageLoadErrTwo', 0, async (done: Function) => {
      emitKey = "emitPrepareForPageLoadErrTwo";
      Utils.registerEvent("PrepareForPageLoadErrTwo", "171000013", 905, done);
      sendEventByKey('webViewContPageAndprepareForPageLoadErrorTwo', 10, '');
    })
  })
}