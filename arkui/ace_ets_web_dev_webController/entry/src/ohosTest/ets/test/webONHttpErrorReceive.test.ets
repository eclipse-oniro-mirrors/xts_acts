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
import { afterEach, beforeAll, beforeEach, describe, it, expect } from '@ohos/hypium';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
import router from '@ohos.router';

let emitKey = "emitOnHttpErrorReceiveFixedUserAgentWebc";

export default function webONHttpErrorReceive() {
  describe('ActsAceWebDevWebONHttpErrorReceiveTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/webONHttpErrorReceive',
      };
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webONHttpErrorReceive state success " + JSON.stringify(pages));
        if (!("webONHttpErrorReceive" == pages.name)) {
          console.info("get webONHttpErrorReceive state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push webONHttpErrorReceive page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webONHttpErrorReceive page error: " + err);
      }
      done();
    });
    beforeEach(async (done: Function) => {
      await Utils.sleep(2000);
      console.info("webONHttpErrorReceive beforeEach start");
      done();
    })
    afterEach(async (done: Function) => {
      console.info("webONHttpErrorReceive afterEach start:" + emitKey);
      try {
        let backData: events_emitter.EventData = {
          data: {
            "ACTION": emitKey
          }
        };
        let backEvent: events_emitter.InnerEvent = {
          eventId: 10,
          priority: events_emitter.EventPriority.LOW
        };
        console.info("start send emitKey");
        events_emitter.emit(backEvent, backData);
      } catch (err) {
        console.info("emit emitKey  err: " + JSON.stringify(err));
      }
      await Utils.sleep(2000);
      done();
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBERRORRECV_API_0100
     *tc.name testOnHttpErrorReceiveFixedUserAgentWebc
     *tc.desc test interface of onHttpErrorReceive with parameter fixed userAgent
     */
    it('testOnHttpErrorReceiveFixedUserAgentWebc', 0, async (done: Function) => {
      emitKey = "emitOnHttpErrorReceiveFixedUserAgentWebc";
      Utils.registerEvent("testOnHttpErrorReceiveFixedUserAgentWebc", "http://1.1.1.123/index.html", 362, done);
      Utils.registerEvent("testOnHttpErrorReceiveFixedUstestOnHttpErrorReceiveFixedUserAgentWebcerAgent", true, 364, done);
      Utils.registerEvent("testOnHttpErrorReceiveFixedUserAgentWebc", false, 466, done);
      Utils.registerEvent("testOnHttpErrorReceiveFixedUserAgentWebc", false, 468, done);
      Utils.registerEvent("testOnHttpErrorReceiveFixedUserAgentWebc", "GET", 470, done);
      Utils.registerEvent("testOnHttpErrorReceiveFixedUserAgentWebc", '""', 472, done);
      Utils.registerEvent("testOnHttpErrorReceiveFixedUserAgentWebc", "utf-8", 474, done);
      Utils.registerEvent("testOnHttpErrorReceiveFixedUserAgentWebc", "text/html", 476, done);
      Utils.registerEvent("testOnHttpErrorReceiveFixedUserAgentWebc", 403, 478, done);
      Utils.registerEvent("testOnHttpErrorReceiveFixedUserAgentWebc", "Forbidden", 480, done);
      Utils.registerEvent("testOnHttpErrorReceiveFixedUserAgentWebc", "User-Agent", 482, done);
      Utils.registerEvent("testOnHttpErrorReceiveFixedUserAgentWebc", "Mozilla/5.0 (X11; Linux aarch64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.88 Mobile Safari/537.36", 484, done);
      Utils.registerEvent("testOnHttpErrorReceiveFixedUserAgentWebc", "X-Frame-Options", 486, done);
      Utils.registerEvent("testOnHttpErrorReceiveFixedUserAgentWebc", "SAMEORIGIN", 488, done);
      Utils.registerEvent("testOnHttpErrorReceiveFixedUserAgentWebc", "403http://1.1.1.123/index.html", 490, done);
      sendEventByKey('webONHttpErrorReceive', 10, '');
    })
  })
}