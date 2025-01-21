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

export default function webViewContPageAndprepareForPageLoadErrorOne() {
  describe('ActsAceWebDevWebViewContPageAndPrepareForPageLoadErrorOneTest', () => {
    beforeAll(async (done: Function) => {
      let options = {
        uri: 'MainAbility/pages/webViewContPageAndprepareForPageLoadErrorOne',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webViewContPageAndprepareForPageLoadErrorOne state success " + JSON.stringify(pages));
        if (!("webViewContPageAndprepareForPageLoadErrorOne" == pages.name)) {
          console.info("get webViewContPageAndprepareForPageLoadErrorOne state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push webViewContPageAndprepareForPageLoadErrorOne page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webViewContPageAndprepareForPageLoadErrorOne page error: " + err);
      }
      done()
    });
    beforeEach(async (done: Function) => {
      await Utils.sleep(2000);
      console.info("webViewContPageAndprepareForPageLoadErrorOne beforeEach start");
      done();
    })
    afterEach(async (done: Function) => {
      console.info("webViewContPageAndprepareForPageLoadErrorOne afterEach start:" + emitKey);
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
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWCONTPAGEANDPREPAREFORPAGELOADERROEONE_0100
     *tc.name testPostMessageInitErr
     *tc.desc test interface of postMessage with not been associated with specific Web Components
     */
    it('PrefetchPageErr', 0, async (done: Function) => {
      emitKey = "emitPrepareForPageLoadErr";
      Utils.registerEvent("PrefetchPageErr", "17100001", 900, done);
      sendEventByKey('webViewContPageAndprepareForPageLoadErrorOne', 10, '');
    })
  })
}