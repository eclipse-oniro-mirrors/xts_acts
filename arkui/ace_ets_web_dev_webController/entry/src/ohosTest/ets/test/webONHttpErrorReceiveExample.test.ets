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

let emitKey = "emitOnHttpErrorReceiveByExampleWebc";

export default function webONHttpErrorReceiveExample() {
  describe('ActsAceWebDevWebONHttpErrorReceiveExampleTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/webONHttpErrorReceiveExample',
      };
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webONHttpErrorReceiveExample state success " + JSON.stringify(pages));
        if (!("webONHttpErrorReceiveExample" == pages.name)) {
          console.info("get webONHttpErrorReceiveExample state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push webONHttpErrorReceiveExample page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webONHttpErrorReceiveExample page error: " + err);
      }
      done();
    });
    beforeEach(async (done: Function) => {
      await Utils.sleep(2000);
      console.info("webONHttpErrorReceiveExample beforeEach start");
      done();
    })
    afterEach(async (done: Function) => {
      console.info("webONHttpErrorReceiveExample afterEach start:" + emitKey);
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
     *tc.number SUB_ACE_BASIC_ETS_WEBERRORRECV_API_0200
     *tc.name testOnHttpErrorReceiveByExampleWebc
     *tc.desc test interface of onHttpErrorReceive with parameter used by example
     */
    it('testOnHttpErrorReceiveByExampleWebc', 0, async (done: Function) => {
      emitKey = "emitOnHttpErrorReceiveByExampleWebc";
      Utils.registerEvent("testOnHttpErrorReceiveByExampleWebc", 403, 491, done);
      Utils.registerEvent("testOnHttpErrorReceiveByExampleWebc", "intercept test", 492, done);
      sendEventByKey('webONHttpErrorReceiveExample', 10, '');
    })
  })
}