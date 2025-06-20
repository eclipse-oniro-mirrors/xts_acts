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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import Utils from '../../MainAbility/common/Utils.ets'
import events_emitter from '@ohos.events.emitter';

export default function refreshDragJsunit() {
  describe('refreshDragTest', () => {
    beforeEach(async (done: Function) => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Refresh/refreshAPI',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get refresh state success " + JSON.stringify(pages));
        if (!("refreshAPI" == pages.name)) {
          console.info("get refresh state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push refresh page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push refresh page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("refreshDrag after each called");
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0011
     * @tc.name         testrefreshDrag0011
     * @tc.desic         acerefreshDragEtsTest0011
     */
    it('testrefreshDrag0011', Level.LEVEL1, async (done: Function) => {
      console.info('refreshDrag testrefreshDrag0011 START');
      await Utils.sleep(2000);
      try {
        let event: events_emitter.InnerEvent = {
          eventId: 60304,
          priority: events_emitter.EventPriority.LOW
        }
        let callback = (eventData: events_emitter.EventData) => {
          console.info("testrefreshDrag0011 get event data is: " + JSON.stringify(eventData));
          expect(eventData.data?.Result).assertEqual(true);
          done();
        }
        console.info("testrefreshDrag0011 click result is: " + JSON.stringify(sendEventByKey('Refresh', 10, "")));
        events_emitter.on(event, callback);
      } catch (err) {
        console.info("testrefreshDrag0011 on events_emitter err : " + JSON.stringify(err));
      }
      console.info('testrefreshDrag0011 END');
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0012
     * @tc.name         testrefreshRefresh0001
     * @tc.desic         acerefreshRefreshEtsTest0001
     */
    it('testrefreshRefresh0001', Level.LEVEL1, async (done: Function) => {
      console.info('refreshDrag testrefreshRefresh0001 START');
      await Utils.sleep(2000);
      try {
        let eventTwo: events_emitter.InnerEvent = {
          eventId: 60305,
          priority: events_emitter.EventPriority.LOW
        }
        let callbackTwo = (eventData: events_emitter.EventData) => {
          console.info("testrefreshRefresh0001 get event data is: " + JSON.stringify(eventData));
          expect(eventData.data?.Result).assertEqual(true);
          done();
        }
        console.info("testrefreshRefresh0001 click result is: " + JSON.stringify(sendEventByKey('Refresh', 10, "")));
        events_emitter.on(eventTwo, callbackTwo);
      } catch (err) {
        console.info("testrefreshRefresh0001 on events_emitter err : " + JSON.stringify(err));
      }
      console.info('testrefreshRefresh0001 END');
    });
  })
}
