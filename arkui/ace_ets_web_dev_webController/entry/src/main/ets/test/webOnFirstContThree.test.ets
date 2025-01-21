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

let emitKey = "emitLoadUrlOnfirstcontentfulpaintWebc";

export default function webOnFirstContThree() {
  describe('ActsAceWebDevWebOnFirstContThreeTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/webOnFirstContThree',
      };
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webOnFirstContThree state success " + JSON.stringify(pages));
        if (!("webOnFirstContThree" == pages.name)) {
          console.info("get webOnFirstContThree state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push webOnFirstContThree page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webOnFirstContThree page error: " + err);
      }
      done();
    });
    beforeEach(async (done: Function) => {
      await Utils.sleep(2000);
      console.info("webOnFirstContThree beforeEach start");
      done();
    })
    afterEach(async (done: Function) => {
      console.info("webOnFirstContThree afterEach start:" + emitKey);
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
     *tc.number SUB_ACE_BASIC_ETS_WEBPATR5_API_0300
     *tc.name testOnfirstcontentfulpaintloadurlWebc
     *tc.desc onfirstcontentfulpaint with web load url
     */
    it('testOnfirstcontentfulpaintloadurlWebc', 0, async (done: Function) => {
      emitKey = "emitLoadUrlOnfirstcontentfulpaintWebc";
      Utils.registerEvent("testOnfirstcontentfulpaintloadurlWebc", true, 426, done);
      sendEventByKey('webOnFirstContThree', 10, '');
    })
  })
}