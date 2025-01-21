/**
 * Copyright (c) 2022 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import Utils from './Utils.ets'

export default function ScrollExampleJsunit() {
  describe('ScrollExampleTest', () => {
    beforeAll(async (done: Function) => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/scroll_edge',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get scroll_edge state success " + JSON.stringify(pages));
        if (!("ScrollExample" == pages.name)) {
          console.info("get scroll_edge state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push scroll_edge page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push scroll_edge page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("ScrollExample after each called");
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0001
     * @tc.name         testscrollEdgeMiddle0001
     * @tc.desic         acescrollEdgeMiddleEtsTest0001
     */
    it('testscrollEdgeMiddle0001', 0, async (done: Function) => {
      console.info('scrollEdgeMiddle testscrollEdgeMiddle0001 START');

      await Utils.sleep(2000);
      try {
        let innerEventOne: events_emitter.InnerEvent = {
          eventId: 60306,
          priority: events_emitter.EventPriority.LOW
        }
        let callback1 = (eventData: events_emitter.EventData) => {
          console.info("testscrollEdgeMiddle0001 get event state result is: " + JSON.stringify(eventData));
          expect(eventData.data.STATUS).assertEqual(true);
          done();
        }
        console.info("onSelect_0012 click result is: " + JSON.stringify(sendEventByKey('MiddleText', 10, "")));
        events_emitter.on(innerEventOne, callback1);
      } catch (err) {
        console.info("testscrollEdgeMiddle0001 on events_emitter err : " + JSON.stringify(err));
      }
      console.info('testscrollEdgeMiddle0001 END');
    });
  })
}
