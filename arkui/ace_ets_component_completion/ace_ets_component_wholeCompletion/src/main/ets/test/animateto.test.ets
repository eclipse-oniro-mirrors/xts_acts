/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter'
import CommonFunc from '../TestAbility/utils/Common';
import { MessageManager, Callback } from '../TestAbility/utils/MessageManager';

const waitUiReadyMs = 1000;

export default function animateToTest() {
  describe('animateToTest', () => {
    beforeEach(async (done: Function) => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'TestAbility/pages/animateto',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get animateto state success " + JSON.stringify(pages));
        if (!("animateto" == pages.name)) {
          console.info("get animateto state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push animateto page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push animateto page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      console.info("animate after each called");
    });

    it('animateTest_0100', 0, async (done: Function) => {
      console.info('animateTest_0100 START');
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 51,
        priority: events_emitter.EventPriority.LOW
      }
      let callback = (indexEvent: events_emitter.EventData) => {
        console.info("animateTest_0100 get state result is: " + JSON.stringify(indexEvent))
        try {
          expect(indexEvent.data.duration == 100).assertTrue();
        } catch (err) {
          console.info("animateTest_0100 get state result is err: " + JSON.stringify(err));
        }
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("animateTest_0100 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("animateTest_0100 click result is: " + JSON.stringify(sendEventByKey('button1', 10, "")));
      console.info('animateTest_0100 END');
      done();
    });

    it('animateTest_0200', 0, async (done: Function) => {
      console.info('animateTest_0200 START');
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 52,
        priority: events_emitter.EventPriority.LOW
      }
      let callback = (indexEvent: events_emitter.EventData) => {
        console.info("animateTest_0200 get state result is: " + JSON.stringify(indexEvent))
        expect(indexEvent.data.curve).assertEqual('Ease')
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("animateTest_0200 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("animateTest_0200 click result is: " + JSON.stringify(sendEventByKey('button2', 10, "")));
      console.info('animateTest_0200 END');
      done();
    });

    it('animateTest_0300', 0, async (done: Function) => {
      console.info('animateTest_0300 START');
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 53,
        priority: events_emitter.EventPriority.LOW
      }
      let callback = (indexEvent: events_emitter.EventData) => {
        console.info("animateTest_0300 get state result is: " + JSON.stringify(indexEvent))
        try {
          expect(indexEvent.data.iterations == 1).assertTrue();
        } catch (err) {
          console.info("animateTest_0300 get state result err is: " + JSON.stringify(err))
        }

      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("animateTest_0300 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("animateTest_0300 click result is: " + JSON.stringify(sendEventByKey('button3', 10, "")));
      console.info('animateTest_0300 END');
      done();
    });

    it('animateTest_0400', 0, async (done: Function) => {
      console.info('animateTest_0400 START');
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 54,
        priority: events_emitter.EventPriority.LOW
      }
      let callback = (indexEvent: events_emitter.EventData) => {
        console.info("animateTest_0400 get state result is: " + JSON.stringify(indexEvent))
        expect(indexEvent.data.tempo).assertEqual(1000)
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("animateTest_0400 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("animateTest_0400 click result is: " + JSON.stringify(sendEventByKey('button4', 10, "")));
      console.info('animateTest_0400 END');
      done();
    });

    it('animateTest_0500', 0, async (done: Function) => {
      console.info('animateTest_0500 START');
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 55,
        priority: events_emitter.EventPriority.LOW
      }
      let callback = (indexEvent: events_emitter.EventData) => {
        console.info("animateTest_0500 get state result is: " + JSON.stringify(indexEvent))
        expect(indexEvent.data.playmode).assertEqual('normal')
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("animateTest_0500 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("animateTest_0500 click result is: " + JSON.stringify(sendEventByKey('button5', 10, "")));
      console.info('animateTest_0500 END');
      done();
    });

    it('animateTest_0600', 0, async (done: Function) => {
      await CommonFunc.sleep(10);
      globalThis.value.message.notify({
        name: 'duration', value: 2000
      });
      await CommonFunc.sleep(2);
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 151,
        priority: events_emitter.EventPriority.LOW
      }
      let callback = (indexEvent: events_emitter.EventData) => {
        console.info("animateTest_0600 get state result is: " + JSON.stringify(indexEvent))
        try {
          expect(indexEvent.data.duration == 2000).assertTrue();
        } catch (err) {
          console.info("animateTest_0600 get state result err is: " + JSON.stringify(err));
        }
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("animateTest_0600 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("animateTest_0600 click result is: " + JSON.stringify(sendEventByKey('button11', 10, "")));
      console.info('animateTest_0600 END');
      done();
    });

    it('animateTest_0700', 0, async (done: Function) => {
      console.info('animateTest_0700 START');
      globalThis.value.message.notify({
        name: 'curve', value: 'Linear'
      });
      await CommonFunc.sleep(2);
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 152,
        priority: events_emitter.EventPriority.LOW
      }
      let callback = (indexEvent: events_emitter.EventData) => {
        console.info("animateTest_0700 get state result is: " + JSON.stringify(indexEvent))
        try {
          expect(indexEvent.data.curve).assertEqual('Linear');
        } catch (err) {
          console.info("animateTest_0700 get state result err is: " + JSON.stringify(err))
        }
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("animateTest_0700 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("animateTest_0700 click result is: " + JSON.stringify(sendEventByKey('button12', 10, "")));
      console.info('animateTest_0700 END');
      done();
    });

    it('animateTest_0800', 0, async (done: Function) => {
      console.info('animateTest_0800 START');
      globalThis.value.message.notify({
        name: 'iteration', value: 2
      });
      await CommonFunc.sleep(2);
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 153,
        priority: events_emitter.EventPriority.LOW
      }
      let callback = (indexEvent: events_emitter.EventData) => {
        console.info("animateTest_0800 get state result is: " + JSON.stringify(indexEvent))
        try {
          expect(indexEvent.data.iterations).assertEqual(2)
        } catch (err) {
          console.info("animateTest_0800 get state result err is: " + JSON.stringify(err))
        }

      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("animateTest_0800 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("animateTest_0800 click result is: " + JSON.stringify(sendEventByKey('button13', 10, "")));
      console.info('animateTest_0800 END');
      done();
    });

    it('animateTest_0900', 0, async (done: Function) => {
      console.info('animateTest_0900 START');
      globalThis.value.message.notify({
        name: 'tempo', value: "20000"
      });
      await CommonFunc.sleep(2);
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 154,
        priority: events_emitter.EventPriority.LOW
      }
      let callback = (indexEvent: events_emitter.EventData) => {
        console.info("animateTest_0900 get state result is: " + JSON.stringify(indexEvent))
        try {
          expect(indexEvent.data.tempo).assertEqual('20000');
        } catch (err) {
          console.info("animateTest_0900 get state result err is: " + JSON.stringify(err))
        }

      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("animateTest_0900 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("animateTest_0900 click result is: " + JSON.stringify(sendEventByKey('button14', 10, "")));
      console.info('animateTest_0900 END');
      done();
    });

    it('animateTest_1000', 0, async (done: Function) => {
      console.info('animateTest_1000 START');
      globalThis.value.message.notify({
        name: 'playmode', value: PlayMode.Alternate
      });
      await CommonFunc.sleep(2);
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 155,
        priority: events_emitter.EventPriority.LOW
      }
      let callback = (indexEvent: events_emitter.EventData) => {
        console.info("animateTest_1000 get state result is: " + JSON.stringify(indexEvent))
        try {
          expect(indexEvent.data.playmode).assertEqual('alternate');
        } catch (err) {
          console.info("animateTest_1000 get state result err is: " + JSON.stringify(err))
        }
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("animateTest_1000 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("animateTest_1000 click result is: " + JSON.stringify(sendEventByKey('button15', 10, "")));
      console.info('animateTest_1000 END');
      done();
    });

    it('animateTest_1100', 0, async (done: Function) => {
      console.info('animateTest_1100 START');
      globalThis.value.message.notify({
        name: 'duration', value: -1000
      });
      await CommonFunc.sleep(2);
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 1001,
        priority: events_emitter.EventPriority.LOW
      }
      let callback = (indexEvent: events_emitter.EventData) => {
        console.info("animateTest_1100 get state result is: " + JSON.stringify(indexEvent))
        try {
          expect(indexEvent.data.duration).assertEqual(-1000);
        } catch (err) {
          console.info("animateTest_1100 get state result err is: " + JSON.stringify(err))
        }

      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("animateTest_1100 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("animateTest_1100 click result is: " + JSON.stringify(sendEventByKey('button6', 10, "")));
      console.info('animateTest_1100 END');
      done();
    });

    it('animateTest_1200', 0, async (done: Function) => {
      console.info('animateTest_1200 START');
      globalThis.value.message.notify({
        name: 'duration', value: 100000000
      });
      await CommonFunc.sleep(2);
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 1002,
        priority: events_emitter.EventPriority.LOW
      }
      let callback = (indexEvent: events_emitter.EventData) => {
        console.info("animateTest_1200 get state result is: " + JSON.stringify(indexEvent))
        try {
          expect(indexEvent.data.duration).assertEqual(100000000);
        } catch (err) {
          console.info("animateTest_1200 get state result err is: " + JSON.stringify(err))
        }
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("animateTest_1200 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("animateTest_1200 click result is: " + JSON.stringify(sendEventByKey('button7', 10, "")));
      console.info('animateTest_1200 END');
      done();
    });

    it('animateTest_1300', 0, async (done: Function) => {
      console.info('animateTest_1300 START');
      globalThis.value.message.notify({
        name: 'curve', value: '123'
      });
      await CommonFunc.sleep(2);
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 1003,
        priority: events_emitter.EventPriority.LOW
      }
      let callback = (indexEvent: events_emitter.EventData) => {
        console.info("animateTest_1300 get state result is: " + JSON.stringify(indexEvent))
        try {
          expect(indexEvent.data.curve).assertEqual('123');
        } catch (err) {
          console.info("animateTest_1300 get state result err is: " + JSON.stringify(err))
        }

      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("animateTest_1300 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("animateTest_1300 click result is: " + JSON.stringify(sendEventByKey('button8', 10, "")));
      console.info('animateTest_1300 END');
      done();
    });

    it('animateTest_1400', 0, async (done: Function) => {
      console.info('animateTest_1400 START');
      globalThis.value.message.notify({
        name: 'curve', value: 'abc'
      });
      await CommonFunc.sleep(2);
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 1004,
        priority: events_emitter.EventPriority.LOW
      }
      let callback = (indexEvent: events_emitter.EventData) => {
        console.info("animateTest_1400 get state result is: " + JSON.stringify(indexEvent))
        try {
          expect(indexEvent.data.curve).assertEqual('abc')
        } catch (err) {
          console.info("animateTest_1400 get state result err is: " + JSON.stringify(err))
        }
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("animateTest_1400 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("animateTest_1400 click result is: " + JSON.stringify(sendEventByKey('button9', 10, "")));
      console.info('animateTest_1400 END');
      done();
    });

    it('animateTest_1500', 0, async (done: Function) => {
      console.info('animateTest_1500 START');
      globalThis.value.message.notify({
        name: 'iteration', value: 121
      });
      await CommonFunc.sleep(2);
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 1005,
        priority: events_emitter.EventPriority.LOW
      }
      let callback = (indexEvent: events_emitter.EventData) => {
        console.info("animateTest_1500 get state result is: " + JSON.stringify(indexEvent))
        try {
          expect(indexEvent.data.iteration).assertEqual(121);
        } catch (err) {
          console.info("animateTest_1500 get state result err is: " + JSON.stringify(err))
        }
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("animateTest_1500 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("animateTest_1500 click result is: " + JSON.stringify(sendEventByKey('button10', 10, "")));
      console.info('animateTest_1500 END');
      done();
    });

    it('animateTest_1600', 0, async (done: Function) => {
      console.info('animateTest_1600 START');
      globalThis.value.message.notify({
        name: 'iteration', value: -5
      });
      await CommonFunc.sleep(2);
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 1006,
        priority: events_emitter.EventPriority.LOW
      }
      let callback = (indexEvent: events_emitter.EventData) => {
        console.info("animateTest_1600 get state result is: " + JSON.stringify(indexEvent))
        try {
          expect(indexEvent.data.iteration).assertEqual(-5);
        } catch (err) {
          console.info("animateTest_1600 get state result err is: " + JSON.stringify(err))
        }
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("animateTest_1600 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("animateTest_1600 click result is: " + JSON.stringify(sendEventByKey('button111', 10, "")));
      console.info('animateTest_1600 END');
      done();
    });

    it('animateTest_1700', 0, async (done: Function) => {
      console.info('animateTest_1700 START');
      globalThis.value.message.notify({
        name: 'tempo', value: "12121212121212"
      });
      await CommonFunc.sleep(2);
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 1007,
        priority: events_emitter.EventPriority.LOW
      }
      let callback = (indexEvent: events_emitter.EventData) => {
        console.info("animateTest_1700 get state result is: " + JSON.stringify(indexEvent))
        try {
          expect(indexEvent.data.tempo).assertEqual('12121212121212');
        } catch (err) {
          console.info("animateTest_1700 get state result err is: " + JSON.stringify(err))
        }

      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("animateTest_1700 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("animateTest_1700 click result is: " + JSON.stringify(sendEventByKey('button121', 10, "")));
      console.info('animateTest_1700 END');
      done();
    });

    it('animateTest_1800', 0, async (done: Function) => {
      console.info('animateTest_1800 START');
      globalThis.value.message.notify({
        name: 'tempo', value: "-5"
      });
      await CommonFunc.sleep(2);
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 1008,
        priority: events_emitter.EventPriority.LOW
      }
      let callback = (indexEvent: events_emitter.EventData) => {
        console.info("animateTest_1800 get state result is: " + JSON.stringify(indexEvent))
        try {
          expect(indexEvent.data.tempo).assertEqual('-5')
        } catch (err) {
          console.info("animateTest_1800 get state result err is: " + JSON.stringify(err))
        }
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("animateTest_1800 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("animateTest_1800 click result is: " + JSON.stringify(sendEventByKey('button131', 10, "")));
      console.info('animateTest_1800 END');
      done();
    });

    it('animateTest_1900', 0, async (done: Function) => {
      console.info('animateTest_1900 START');
      globalThis.value.message.notify({
        name: 'playmode', value: -6
      });
      await CommonFunc.sleep(2);
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 1009,
        priority: events_emitter.EventPriority.LOW
      }
      let callback = (indexEvent: events_emitter.EventData) => {
        console.info("animateTest_1900 get state result is: " + JSON.stringify(indexEvent))
        try {
          expect(indexEvent.data.playmode).assertEqual(-6);
        } catch (err) {
          console.info("animateTest_1900 get state result err is: " + JSON.stringify(err))
        }
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("animateTest_1900 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("animateTest_1900 click result is: " + JSON.stringify(sendEventByKey('button141', 10, "")));
      console.info('animateTest_1900 END');
      done();
    });

    it('animateTest_2000', 0, async (done: Function) => {
      console.info('animateTest_2000 START');
      globalThis.value.message.notify({
        name: 'playmode', value: 123456
      });
      await CommonFunc.sleep(2);

      let indexEvent: events_emitter.InnerEvent = {
        eventId: 1010,
        priority: events_emitter.EventPriority.LOW
      }
      let callback = (indexEvent: events_emitter.EventData) => {
        console.info("animateTest_2000 get state result is: " + JSON.stringify(indexEvent))
        try {
          expect(indexEvent.data.playmode).assertEqual(123456);
        } catch (err) {
          console.info("animateTest_2000 get state result err is: " + JSON.stringify(err));
        }

      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("animateTest_2000 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("animateTest_2000 click result is: " + JSON.stringify(sendEventByKey('button151', 10, "")));
      console.info('animateTest_2000 END');
      done();
    });
    /* *
      * @tc.number: SUB_ACE_FUNCTION_SR000S6E08_001
      * @tc.name  : animateTest_2100
      * @tc.desc  : finishCallbackType Property not set
      * @tc.level : Level 3
    */
    it('animateTest_2100', 0, async (done: Function) => {
      console.info('animateTest_2100 START');
      await CommonFunc.sleep(2);

      let indexEvent: events_emitter.InnerEvent = {
        eventId: 1011,
        priority: events_emitter.EventPriority.LOW
      }
      let callback = (indexEvent: events_emitter.EventData) => {
        console.info("animateTest_2100 get state result is: " + JSON.stringify(indexEvent))
        try {
          expect(indexEvent.data.finishCallbackType).assertEqual(FinishCallbackType.REMOVED);
        } catch (err) {
          console.info("animateTest_2100 get state result err is: " + JSON.stringify(err));
        }
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("animateTest_2100 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("animateTest_2100 click result is: " + JSON.stringify(sendEventByKey('button161', 10, "")));
      console.info('animateTest_2100 END');
      done();
    });
    /* *
      * @tc.number: SUB_ACE_FUNCTION_SR000S6E08_002
      * @tc.name  : animateTest_2200
      * @tc.desc  : finishCallbackType Property set FinishCallbackType.REMOVED
      * @tc.level : Level 3
    */
    it('animateTest_2200', 0, async (done: Function) => {
      console.info('animateTest_2200 START');
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 1012,
        priority: events_emitter.EventPriority.LOW
      }
      let callback = (indexEvent: events_emitter.EventData) => {
        console.info("animateTest_2200 get state result is: " + JSON.stringify(indexEvent))
        expect(indexEvent.data.finishCallbackType).assertEqual(FinishCallbackType.REMOVED)
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("animateTest_2200 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("animateTest_2200 click result is: " + JSON.stringify(sendEventByKey('button171', 10, "")));
      console.info('animateTest_2200 END');
      done();
    });
    /* *
      * @tc.number: SUB_ACE_FUNCTION_SR000S6E08_003
      * @tc.name  : animateTest_2300
      * @tc.desc  : finishCallbackType Property set FinishCallbackType.LOGICALLY
      * @tc.level : Level 3
    */
    it('animateTest_2300', 0, async (done: Function) => {
      console.info('animateTest_2300 START');
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 1013,
        priority: events_emitter.EventPriority.LOW
      }
      let callback = (indexEvent: events_emitter.EventData) => {
        console.info("animateTest_2300 get state result is: " + JSON.stringify(indexEvent))
        try {
          expect(indexEvent.data.finishCallbackType).assertEqual(FinishCallbackType.LOGICALLY);
        } catch (err) {
          console.info("animateTest_2300 get state result err is: " + JSON.stringify(err));
        }
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("animateTest_2300 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("animateTest_2300 click result is: " + JSON.stringify(sendEventByKey('button181', 10, "")));
      console.info('animateTest_2300 END');
      done();
    });
  })
}