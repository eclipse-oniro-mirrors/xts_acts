
/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';
import events_emitter from '@ohos.events.emitter';

export default function marqueeJsunit() {
  describe('marqueeTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/marquee/marquee',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get marquee state success " + JSON.stringify(pages));
        if (!("marquee" == pages.name)) {
          console.info("get marquee state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(4000);
          console.info("push marquee page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push marquee page error " + JSON.stringify(err));
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("marquee after each called");
    });


    it('testMarquee_0100', Level.LEVEL1, async (done: Function) => {
      console.info('testMarquee_0100 START');
      await CommonFunc.sleep(1500);
      let callback = (indexEvent: events_emitter.EventData) => {
        console.info("testMarquee_0100 get state result is: " + JSON.stringify(indexEvent));
        expect(indexEvent.data?.start).assertEqual(true);
        done()
      }
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 130,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("testMarquee_0100 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("testMarquee_0100 click result is: " + JSON.stringify(sendEventByKey('button', 10, "")));
      await CommonFunc.sleep(1000);
      let callback1 = (eventData: events_emitter.EventData) => {
        console.info("testMarquee_0100 get event state result is: " + JSON.stringify(eventData));
        expect(eventData.data?.fontColor).assertEqual(Color.Blue);
        done()
      }
      let innerEventOne: events_emitter.InnerEvent = {
        eventId: 127,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(innerEventOne, callback1);
      } catch (err) {
        console.info("testMarquee_0100 on events_emitter err : " + JSON.stringify(err));
      }
      console.info('testMarquee_0100 END');

    });

    it('testMarquee_0200', Level.LEVEL1, async (done: Function) => {
      console.info('testMarquee_0200 START');
      await CommonFunc.sleep(1500);
      let callback = (indexEvent: events_emitter.EventData) => {
        console.info("testMarquee_0200 get state result is: " + JSON.stringify(indexEvent));
        expect(indexEvent.data?.start).assertEqual(true);
        done()
      }
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 130,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("testMarquee_0200 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("testMarquee_0200 click result is: " + JSON.stringify(sendEventByKey('button', 10, "")));
      await CommonFunc.sleep(1000);
      let callback1 = (eventData: events_emitter.EventData) => {
        console.info("testMarquee_0200 get event state result is: " + JSON.stringify(eventData));
        expect(eventData.data?.fontSize).assertEqual(50);
        done()
      }
      let innerEventOne: events_emitter.InnerEvent = {
        eventId: 128,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(innerEventOne, callback1)
      } catch (err) {
        console.info("testMarquee_0200 on events_emitter err : " + JSON.stringify(err));
      }
      console.info('testMarquee_0200 END');
    });

    it('testMarquee_0300', Level.LEVEL1, async (done: Function) => {
      console.info('testMarquee_0300 START');
      await CommonFunc.sleep(1500);
      let callback = (indexEvent: events_emitter.EventData) => {
        console.info("testMarquee_0300 get state result is: " + JSON.stringify(indexEvent));
        expect(indexEvent.data?.start).assertEqual(true);
        done()
      }
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 130,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("testMarquee_0300 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("testMarquee_0300 click result is: " + JSON.stringify(sendEventByKey('button', 10, "")));
      await CommonFunc.sleep(1000);
      let callback1 = (eventData: events_emitter.EventData) => {
        console.info("testMarquee_0300 get event state result is: " + JSON.stringify(eventData));
        expect(eventData.data?.ACTION).assertEqual(true);
        done()
      }
      let innerEventOne: events_emitter.InnerEvent = {
        eventId: 129,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(innerEventOne, callback1)
      } catch (err) {
        console.info("testMarquee_0300 on events_emitter err : " + JSON.stringify(err));
      }
      console.info('testMarquee_0300 END');
    });
  })
}