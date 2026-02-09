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

import events_emitter from '@ohos.events.emitter';
import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import Utils from './Utils'

export default function lazyForEachOnDataAddJsunit() {
  describe('lazyForEachOnDataAddTest', () => {
    beforeAll(async () => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions  = {
        url: 'MainAbility/pages/lazyForEach',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get lazyForEach state success " + JSON.stringify(pages));
        if (!("lazyForEach" == pages.name)) {
          console.info("get lazyForEach state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push lazyForEach page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push lazyForEach page error: " + err);
      }
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("lazyForEachOnDataAdd after each called");
    });

    /**
     * @tc.name   testlazyForEachOnDataAdd0001
     * @tc.number SUB_ACE_BASIC_ETS_API_0001
     * @tc.desc   testlazyForEachOnDataAdd0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testlazyForEachOnDataAdd0001', Level.LEVEL0, async () => {
      console.info('lazyForEachOnDataAdd testlazyForEachOnDataAdd0001 START');

      let innerEvent1: events_emitter.InnerEvent = {
        eventId: 60212,
        priority: events_emitter.EventPriority.LOW
      }
      let callback1 = (eventData: events_emitter.EventData) => {
        console.info("eventData.data.result1 result is: " + eventData.data?.result1);
        try {
          console.info("callback1 success");
          console.info("Lazy_101 eventData.data.result1 result is: " + eventData.data?.result1);
          expect(eventData.data?.result1).assertEqual(true);
          console.info('lazyForEachOnDataAdd testlazyForEachOnDataAdd0001 END');
        } catch (err) {
          console.info("Lazy_101 on events_emitter err : " + JSON.stringify(err));
        }

      }
      try {
        console.info("Lazy_101 click result is:" + JSON.stringify(sendEventByKey('listItemOne', 10, "")));
        events_emitter.on(innerEvent1, callback1);
      } catch (err) {
        console.info("Lazy_101 on events_emitter err : " + JSON.stringify(err));
      }
    });

    /**
     * @tc.name   testlazyForEachOnDataAdd0002
     * @tc.number SUB_ACE_BASIC_ETS_API_0002
     * @tc.desc   testlazyForEachOnDataAdd0002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testlazyForEachOnDataAdd0002', Level.LEVEL0, async () => {
      console.info('lazyForEachOnDataAdd testlazyForEachOnDataAdd0002 START');

      let innerEvent2: events_emitter.InnerEvent = {
        eventId: 60213,
        priority: events_emitter.EventPriority.LOW
      }
      let callback2 = (eventData: events_emitter.EventData) => {
        console.info("eventData.data.result2 result is: " + eventData.data?.result2);
        try {
          console.info("callback2 success");
          console.info("Lazy_102 eventData.data.result2 result is: " + eventData.data?.result2);
          expect(eventData.data?.result2).assertEqual(true);
          console.info('lazyForEachOnDataAdd testlazyForEachOnDataAdd0002 END');
        } catch (err) {
          console.info("Lazy_102 on events_emitter err : " + JSON.stringify(err));
        }

      }
      try {
        console.info("Lazy_102 click result is:" + JSON.stringify(sendEventByKey('listItemTwo', 10, "")));
        events_emitter.on(innerEvent2, callback2);
      } catch (err) {
        console.info("Lazy_102 on events_emitter err : " + JSON.stringify(err));
      }
    });

    /**
     * @tc.name   testlazyForEachOnDataAdd0003
     * @tc.number SUB_ACE_BASIC_ETS_API_0003
     * @tc.desc   testlazyForEachOnDataAdd0003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testlazyForEachOnDataAdd0003', Level.LEVEL0, async () => {
      console.info('lazyForEachOnDataAdd testlazyForEachOnDataAdd0003 START');

      let innerEvent3: events_emitter.InnerEvent = {
        eventId: 60214,
        priority: events_emitter.EventPriority.LOW
      }
      let callback3 = (eventData: events_emitter.EventData) => {
        console.info("eventData.data.result3 result is: " + eventData.data?.result3);
        try {
          console.info("callback3 success");
          console.info("Lazy_103 eventData.data.result3 result is: " + eventData.data?.result3);
          expect(eventData.data?.result3).assertEqual(true);
          console.info('lazyForEachOnDataAdd testlazyForEachOnDataAdd0003 END');
        } catch (err) {
          console.info("Lazy_103 on events_emitter err : " + JSON.stringify(err));
        }

      }
      try {
        console.info("Lazy_103 click result is:" + JSON.stringify(sendEventByKey('listItemThree', 10, "")));
        events_emitter.on(innerEvent3, callback3);
      } catch (err) {
        console.info("Lazy_103 on events_emitter err : " + JSON.stringify(err));
      }
    });

    /**
     * @tc.name   testlazyForEachOnDataAdd0004
     * @tc.number SUB_ACE_BASIC_ETS_API_0004
     * @tc.desc   testlazyForEachOnDataAdd0004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testlazyForEachOnDataAdd0004', Level.LEVEL0, async () => {
      console.info('lazyForEachOnDataAdd testlazyForEachOnDataAdd0004 START');

      let innerEvent4: events_emitter.InnerEvent = {
        eventId: 60215,
        priority: events_emitter.EventPriority.LOW
      }
      let callback4 = (eventData: events_emitter.EventData) => {
        console.info("eventData.data.result4 result is: " + eventData.data?.result4);
        try {
          console.info("callback4 success");
          console.info("Lazy_104 eventData.data.result4 result is: " + eventData.data?.result4);
          expect(eventData.data?.result4).assertEqual(true);
          console.info('lazyForEachOnDataAdd testlazyForEachOnDataAdd0004 END');
        } catch (err) {
          console.info("Lazy_104 on events_emitter err : " + JSON.stringify(err));
        }

      }
      try {
        console.info("Lazy_104 click result is:" + JSON.stringify(sendEventByKey('listItemFour', 10, "")));
        events_emitter.on(innerEvent4, callback4);
      } catch (err) {
        console.info("Lazy_104 on events_emitter err : " + JSON.stringify(err));
      }
    });
  })
}
