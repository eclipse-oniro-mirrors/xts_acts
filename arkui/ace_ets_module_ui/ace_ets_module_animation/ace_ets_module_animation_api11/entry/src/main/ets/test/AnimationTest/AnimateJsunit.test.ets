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
import { describe, beforeEach, afterEach, it, Level, expect } from "@ohos/hypium"
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter'
import Utils from '../Utils';
import CommonFunc from '../../MainAbility/utils/Common';
export default function animateJsunit() {
  describe('animateTest', () => {
    beforeEach(async (done: Function) => {
      console.info("animate beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Animation/animate',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get animate state pages:" + JSON.stringify(pages));
        if (!("animate" == pages.name)) {
          console.info("get animate state pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push animate page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push animate page error:" + err);
      }
      done()
    });
    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("animate after each called");
    });
    /**
     * @tc.name   animateTest_0100
     * @tc.number animateTest_0100
     * @tc.desc   animateTest_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('animateTest_0100', Level.LEVEL0, async (done: Function) => {
      console.info('animateTest_0100 START');
      await Utils.sleep(1500);
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 51,
        priority: events_emitter.EventPriority.LOW
      }
      let callback = (indexEvent: events_emitter.EventData) => {
        console.info("animateTest_0100 get state result is: " + JSON.stringify(indexEvent))
        try {
          expect(indexEvent.data?.duration == 100).assertTrue();
        } catch (err) {
          console.info("animateTest_0100 get state result is errr: " + JSON.stringify(err));
        }
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("animateTest_0100 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("animateTest_0100 click result is: " + JSON.stringify(sendEventByKey('button1', 10, "")));
      await Utils.sleep(2000);
      console.info('animateTest_0100 END');
      done();
    });
    /**
     * @tc.name   animateTest_0200
     * @tc.number animateTest_0200
     * @tc.desc   animateTest_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('animateTest_0200', Level.LEVEL0, async (done: Function) => {
      console.info('animateTest_0200 START');
      await Utils.sleep(1500);
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 52,
        priority: events_emitter.EventPriority.LOW
      }
      let callback = (indexEvent: events_emitter.EventData) => {
        console.info("animateTest_0200 get state result is: " + JSON.stringify(indexEvent))
        expect(indexEvent.data?.curve).assertEqual('Ease')
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("animateTest_0200 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("animateTest_0200 click result is: " + JSON.stringify(sendEventByKey('button2', 10, "")));
      await Utils.sleep(2000);
      console.info('animateTest_0200 END');
      done();
    });
    /**
     * @tc.name   animateTest_0300
     * @tc.number animateTest_0300
     * @tc.desc   animateTest_0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('animateTest_0300', Level.LEVEL0, async (done: Function) => {
      console.info('animateTest_0300 START');
      await Utils.sleep(1500);
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 53,
        priority: events_emitter.EventPriority.LOW
      }
      let callback = (indexEvent: events_emitter.EventData) => {
        console.info("animateTest_0300 get state result is: " + JSON.stringify(indexEvent))
        try {
          expect(indexEvent.data?.iterations == 1).assertTrue();
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
      await Utils.sleep(2000);
      console.info('animateTest_0300 END');
      done();
    });
    /**
     * @tc.name   animateTest_0400
     * @tc.number animateTest_0400
     * @tc.desc   animateTest_0400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('animateTest_0400', Level.LEVEL0, async (done: Function) => {
      console.info('animateTest_0400 START');
      await Utils.sleep(1500);
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 54,
        priority: events_emitter.EventPriority.LOW
      }
      let callback = (indexEvent: events_emitter.EventData) => {
        console.info("animateTest_0400 get state result is: " + JSON.stringify(indexEvent))
        expect(indexEvent.data?.tempo).assertEqual(1000)
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("animateTest_0400 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("animateTest_0400 click result is: " + JSON.stringify(sendEventByKey('button4', 10, "")));
      await Utils.sleep(2000);
      console.info('animateTest_0400 END');
      done();
    });
    /**
     * @tc.name   animateTest_0500
     * @tc.number animateTest_0500
     * @tc.desc   animateTest_0500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('animateTest_0500', Level.LEVEL0, async (done: Function) => {
      console.info('animateTest_0500 START');
      await Utils.sleep(1500);
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 55,
        priority: events_emitter.EventPriority.LOW
      }
      let callback = (indexEvent: events_emitter.EventData) => {
        console.info("animateTest_0500 get state result is: " + JSON.stringify(indexEvent))
        expect(indexEvent.data?.playmode).assertEqual('normal')
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("animateTest_0500 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("animateTest_0500 click result is: " + JSON.stringify(sendEventByKey('button5', 10, "")));
      await Utils.sleep(2000);
      console.info('animateTest_0500 END');
      done();
    });
    /**
     * @tc.name   animateTest_0600
     * @tc.number animateTest_0600
     * @tc.desc   animateTest_0600
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('animateTest_0600', Level.LEVEL0, async (done: Function) => {
      await CommonFunc.sleep(1000);
      globalThis.value.message.notify({
        name: 'duration', value: 2000
      });
      await CommonFunc.sleep(200);
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 151,
        priority: events_emitter.EventPriority.LOW
      }
      let callback = (indexEvent: events_emitter.EventData) => {
        console.info("animateTest_0600 get state result is: " + JSON.stringify(indexEvent))
        try {
          expect(indexEvent.data?.duration == 2000).assertTrue();
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
      await Utils.sleep(2000);
      console.info('animateTest_0600 END');
      done();
    });
    /**
     * @tc.name   animateTest_0700
     * @tc.number animateTest_0700
     * @tc.desc   animateTest_0700
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('animateTest_0700', Level.LEVEL0, async (done: Function) => {
      console.info('animateTest_0700 START');
      globalThis.value.message.notify({
        name: 'curve', value: 'Linear'
      });
      await CommonFunc.sleep(200);
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 152,
        priority: events_emitter.EventPriority.LOW
      }
      let callback = (indexEvent: events_emitter.EventData) => {
        console.info("animateTest_0700 get state result is: " + JSON.stringify(indexEvent))
        try {
          expect(indexEvent.data?.curve).assertEqual('Linear');
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
      await Utils.sleep(2000);
      console.info('animateTest_0700 END');
      done();
    });
    /**
     * @tc.name   animateTest_0800
     * @tc.number animateTest_0800
     * @tc.desc   animateTest_0800
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('animateTest_0800', Level.LEVEL0, async (done: Function) => {
      console.info('animateTest_0800 START');
      globalThis.value.message.notify({
        name: 'iteration', value: 2
      });
      await CommonFunc.sleep(200);
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 153,
        priority: events_emitter.EventPriority.LOW
      }
      let callback = (indexEvent: events_emitter.EventData) => {
        console.info("animateTest_0800 get state result is: " + JSON.stringify(indexEvent))
        try {
          expect(indexEvent.data?.iterations).assertEqual(2)
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
      await Utils.sleep(2000);
      console.info('animateTest_0800 END');
      done();
    });
    /**
     * @tc.name   animateTest_0900
     * @tc.number animateTest_0900
     * @tc.desc   animateTest_0900
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('animateTest_0900', Level.LEVEL0, async (done: Function) => {
      console.info('animateTest_0900 START');
      globalThis.value.message.notify({
        name: 'tempo', value: "20000"
      });
      await CommonFunc.sleep(200);
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 154,
        priority: events_emitter.EventPriority.LOW
      }
      let callback = (indexEvent: events_emitter.EventData) => {
        console.info("animateTest_0900 get state result is: " + JSON.stringify(indexEvent))
        try {
          expect(indexEvent.data?.tempo).assertEqual('20000');
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
      await Utils.sleep(2000);
      console.info('animateTest_0900 END');
      done();
    });
    /**
     * @tc.name   animateTest_1000
     * @tc.number animateTest_1000
     * @tc.desc   animateTest_1000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('animateTest_1000', Level.LEVEL0, async (done: Function) => {
      console.info('animateTest_1000 START');
      globalThis.value.message.notify({
        name: 'playmode', value: PlayMode.Alternate
      });
      await CommonFunc.sleep(200);
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 155,
        priority: events_emitter.EventPriority.LOW
      }
      let callback = (indexEvent: events_emitter.EventData) => {
        console.info("animateTest_1000 get state result is: " + JSON.stringify(indexEvent))
        try {
          expect(indexEvent.data?.playmode).assertEqual('alternate');
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
      await Utils.sleep(2000);
      console.info('animateTest_1000 END');
      done();
    });
    /**
     * @tc.name   animateTest_1100
     * @tc.number animateTest_1100
     * @tc.desc   animateTest_1100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('animateTest_1100', Level.LEVEL0, async (done: Function) => {
      console.info('animateTest_1100 START');
      globalThis.value.message.notify({
        name: 'duration', value: -1000
      });
      await CommonFunc.sleep(200);
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 1001,
        priority: events_emitter.EventPriority.LOW
      }
      let callback = (indexEvent: events_emitter.EventData) => {
        console.info("animateTest_1100 get state result is: " + JSON.stringify(indexEvent))
        try {
          expect(indexEvent.data?.duration).assertEqual(-1000);
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
      await Utils.sleep(2000);
      console.info('animateTest_1100 END');
      done();
    });
    /**
     * @tc.name   animateTest_1200
     * @tc.number animateTest_1200
     * @tc.desc   animateTest_1200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('animateTest_1200', Level.LEVEL0, async (done: Function) => {
      console.info('animateTest_1200 START');
      globalThis.value.message.notify({
        name: 'duration', value: 100000000
      });
      await CommonFunc.sleep(200);
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 1002,
        priority: events_emitter.EventPriority.LOW
      }
      let callback = (indexEvent: events_emitter.EventData) => {
        console.info("animateTest_1200 get state result is: " + JSON.stringify(indexEvent))
        try {
          expect(indexEvent.data?.duration).assertEqual(100000000);
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
      await Utils.sleep(2000);
      console.info('animateTest_1200 END');
      done();
    });
    /**
     * @tc.name   animateTest_1300
     * @tc.number animateTest_1300
     * @tc.desc   animateTest_1300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('animateTest_1300', Level.LEVEL0, async (done: Function) => {
      console.info('animateTest_1300 START');
      globalThis.value.message.notify({
        name: 'curve', value: '123'
      });
      await CommonFunc.sleep(200);
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 1003,
        priority: events_emitter.EventPriority.LOW
      }
      let callback = (indexEvent: events_emitter.EventData) => {
        console.info("animateTest_1300 get state result is: " + JSON.stringify(indexEvent))
        try {
          expect(indexEvent.data?.curve).assertEqual('123');
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
      await Utils.sleep(2000);
      console.info('animateTest_1300 END');
      done();
    });
    /**
     * @tc.name   animateTest_1400
     * @tc.number animateTest_1400
     * @tc.desc   animateTest_1400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('animateTest_1400', Level.LEVEL0, async (done: Function) => {
      console.info('animateTest_1400 START');
      globalThis.value.message.notify({
        name: 'curve', value: 'abc'
      });
      await CommonFunc.sleep(200);
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 1004,
        priority: events_emitter.EventPriority.LOW
      }
      let callback = (indexEvent: events_emitter.EventData) => {
        console.info("animateTest_1400 get state result is: " + JSON.stringify(indexEvent))
        try {
          expect(indexEvent.data?.curve).assertEqual('abc')
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
      await Utils.sleep(2000);
      console.info('animateTest_1400 END');
      done();
    });
    /**
     * @tc.name   animateTest_1500
     * @tc.number animateTest_1500
     * @tc.desc   animateTest_1500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('animateTest_1500', Level.LEVEL0, async (done: Function) => {
      console.info('animateTest_1500 START');
      globalThis.value.message.notify({
        name: 'iteration', value: 121
      });
      await CommonFunc.sleep(200);
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 1005,
        priority: events_emitter.EventPriority.LOW
      }
      let callback = (indexEvent: events_emitter.EventData) => {
        console.info("animateTest_1500 get state result is: " + JSON.stringify(indexEvent))
        try {
          expect(indexEvent.data?.iteration).assertEqual(121);
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
      await Utils.sleep(2000);
      console.info('animateTest_1500 END');
      done();
    });
    /**
     * @tc.name   animateTest_1600
     * @tc.number animateTest_1600
     * @tc.desc   animateTest_1600
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('animateTest_1600', Level.LEVEL0, async (done: Function) => {
      console.info('animateTest_1600 START');
      globalThis.value.message.notify({
        name: 'iteration', value: -5
      });
      await CommonFunc.sleep(200);
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 1006,
        priority: events_emitter.EventPriority.LOW
      }
      let callback = (indexEvent: events_emitter.EventData) => {
        console.info("animateTest_1600 get state result is: " + JSON.stringify(indexEvent))
        try {
          expect(indexEvent.data?.iteration).assertEqual(-5);
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
      await Utils.sleep(2000);
      console.info('animateTest_1600 END');
      done();
    });
    /**
     * @tc.name   animateTest_1700
     * @tc.number animateTest_1700
     * @tc.desc   animateTest_1700
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('animateTest_1700', Level.LEVEL0, async (done: Function) => {
      console.info('animateTest_1700 START');
      globalThis.value.message.notify({
        name: 'tempo', value: "12121212121212"
      });
      await CommonFunc.sleep(200);
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 1007,
        priority: events_emitter.EventPriority.LOW
      }
      let callback = (indexEvent: events_emitter.EventData) => {
        console.info("animateTest_1700 get state result is: " + JSON.stringify(indexEvent))
        try {
          expect(indexEvent.data?.tempo).assertEqual('12121212121212');
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
      await Utils.sleep(2000);
      console.info('animateTest_1700 END');
      done();
    });
    /**
     * @tc.name   animateTest_1800
     * @tc.number animateTest_1800
     * @tc.desc   animateTest_1800
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('animateTest_1800', Level.LEVEL0, async (done: Function) => {
      console.info('animateTest_1800 START');
      globalThis.value.message.notify({
        name: 'tempo', value: "-5"
      });
      await CommonFunc.sleep(200);
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 1008,
        priority: events_emitter.EventPriority.LOW
      }
      let callback = (indexEvent: events_emitter.EventData) => {
        console.info("animateTest_1800 get state result is: " + JSON.stringify(indexEvent))
        try {
          expect(indexEvent.data?.tempo).assertEqual('-5')
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
      await Utils.sleep(2000);
      console.info('animateTest_1800 END');
      done();
    });
    /**
     * @tc.name   animateTest_1900
     * @tc.number animateTest_1900
     * @tc.desc   animateTest_1900
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('animateTest_1900', Level.LEVEL0, async (done: Function) => {
      console.info('animateTest_1900 START');
      globalThis.value.message.notify({
        name: 'playmode', value: -6
      });
      await CommonFunc.sleep(200);
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 1009,
        priority: events_emitter.EventPriority.LOW
      }
      let callback = (indexEvent: events_emitter.EventData) => {
        console.info("animateTest_1900 get state result is: " + JSON.stringify(indexEvent))
        try {
          expect(indexEvent.data?.playmode).assertEqual(-6);
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
      await Utils.sleep(2000);
      console.info('animateTest_1900 END');
      done();
    });
    /**
     * @tc.name   animateTest_2000
     * @tc.number animateTest_2000
     * @tc.desc   animateTest_2000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('animateTest_2000', Level.LEVEL0, async (done: Function) => {
      console.info('animateTest_2000 START');
      globalThis.value.message.notify({
        name: 'playmode', value: 123456
      });
      await CommonFunc.sleep(200);
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 1010,
        priority: events_emitter.EventPriority.LOW
      }
      let callback = (indexEvent: events_emitter.EventData) => {
        console.info("animateTest_2000 get state result is: " + JSON.stringify(indexEvent))
        try {
          expect(indexEvent.data?.playmode).assertEqual(123456);
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
      await Utils.sleep(2000);
      console.info('animateTest_2000 END');
      done();
    });
  })
}