
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';
import events_emitter from '@ohos.events.emitter';

export default function swiperJsunit() {
  describe('swiperTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Swiper/swiper',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get swiper state success " + JSON.stringify(pages));
        if (!("swiper" == pages.name)) {
          console.info("get swiper state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(1000);
          console.info("push swiper page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push swiper page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("swiper after each called");
    });

    it('swiperTest_0100', Level.LEVEL1, async (done: Function) => {
      console.info('swiperTest_0100 START');
      let strJson: string = getInspectorByKey('swiper');
      console.info("swiperTest_0100 component strJson:" + strJson);

      console.info("swiperTest_0100 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("swiperTest_0100 JSON.parse(strJson).$attrs.index: " + JSON.parse(strJson).$attrs.index);
      console.info("swiperTest_0100 JSON.parse(strJson).$attrs.indicatorStyle: " + JSON.parse(strJson)
        .$attrs
        .indicatorStyle);
      expect(JSON.parse(strJson).$type).assertEqual('Swiper');
      expect(JSON.parse(strJson).$attrs.index).assertEqual('1');
      done()
    });

    it('swiperTest_0200', Level.LEVEL1, async (done: Function) => {
      console.info('swiperTest_0200 START');
      let strJson: string = getInspectorByKey('swiper');
      console.info("swiperTest_0200 component strJson:" + strJson);
      console.info("swiperTest_0200 component obj is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.indicator).assertEqual('true')
      expect(JSON.parse(strJson).$attrs.loop).assertEqual('false');
      console.info('swiperTest_0200 END');
      done()
    });

    it('swiperTest_0300', Level.LEVEL1, async (done: Function) => {
      console.info('swiperTest_0300 START');
      let strJson: string = getInspectorByKey('swiper');
      console.info("swiperTest_0300 component strJson:" + strJson);

      console.info("swiperTest_0300 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.duration).assertEqual('1000');
      expect(JSON.parse(strJson).$attrs.vertical).assertEqual('false');
      console.info('swiperTest_0300 END');
      done()
    });

    it('swiperTest_0400', Level.LEVEL1, async (done: Function) => {
      console.info('swiperTest_0400 START');
      let strJson: string = getInspectorByKey('swiper');
      console.info("swiperTest_0400 component strJson:" + strJson);

      console.info("swiperTest_0400 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.autoPlay).assertEqual('false');
      expect(JSON.parse(strJson).$attrs.interval).assertEqual('4000');
      console.info('swiperTest_0400 END');
      done()
    });

    it('swiperTest_0500', Level.LEVEL1, async (done: Function) => {
      console.info('swiperTest_0500 START');
      let strJson: string = getInspectorByKey('swiper');
      console.info("swiperTest_0500 component strJson:" + strJson);

      console.info("swiperTest_0500 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.itemSpace).assertEqual('0.00vp');
      expect(JSON.parse(strJson).$attrs.disableSwipe).assertEqual('false');
      console.info('swiperTest_0500 END');
      done()
    });

    it('swiperTest_0600', Level.LEVEL1, async (done: Function) => {
      console.info('swiperTest_0600 START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "index": 3
          }
        }
        let InnerEvent: events_emitter.InnerEvent = {
          eventId: 207,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("swiperTest_0600 start to publish emit");
        events_emitter.emit(InnerEvent, eventData);
      } catch (err) {
        console.log("swiperTest_0600 change component data error: " + err.message);
      }
      await CommonFunc.sleep(4000);
      let strJsonNew: string = getInspectorByKey('swiper');

      console.info("swiperTest_0600 component JSON.parse(strJsonNew) is: " + JSON.stringify(JSON.parse(strJsonNew)));
      expect(JSON.parse(strJsonNew).$attrs.index).assertEqual('3');
      console.info('swiperTest_0600 END');
      done()
    });

    it('swiperTest_0700', Level.LEVEL1, async (done: Function) => {
      console.info('swiperTest_0700 START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "autoPlay": true
          }
        }
        let InnerEvent: events_emitter.InnerEvent = {
          eventId: 207,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("swiperTest_0700 start to publish emit");
        events_emitter.emit(InnerEvent, eventData);
      } catch (err) {
        console.log("swiperTest_0700 change component data error: " + err.message);
      }
      await CommonFunc.sleep(4000);
      let strJsonNew = getInspectorByKey('swiper');

      console.info("swiperTest_0700 component JSON.parse(strJsonNew) is: " + JSON.stringify(JSON.parse(strJsonNew)));
      expect(JSON.parse(strJsonNew).$attrs.autoPlay).assertEqual('true');
      console.info('swiperTest_0700 END');
      done()
    });

    it('swiperTest_0800', Level.LEVEL1, async (done: Function) => {
      console.info('swiperTest_0800 START');
      await CommonFunc.sleep(1500);
      let callback = (InnerEvent: events_emitter.EventData) => {
        console.info("swiperTest_0800 get state result is: " + JSON.stringify(InnerEvent));
        expect(InnerEvent.data?.ACTION).assertEqual(true);
        done()
      }
      let InnerEvent: events_emitter.InnerEvent = {
        eventId: 205,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(InnerEvent, callback);
      } catch (err) {
        console.info("swiperTest_0800 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("swiperTest_0800 click result is: " + JSON.stringify(sendEventByKey('button1', 10, "")));
      await CommonFunc.sleep(1000);
      console.info('swiperTest_0800 END');
      done()
    });

    it('swiperTest_0900', Level.LEVEL1, async (done: Function) => {
      console.info('swiperTest_0900 START');
      await CommonFunc.sleep(1500);
      let callback = (InnerEvent: events_emitter.EventData) => {
        console.info("swiperTest_0900 get state result is: " + JSON.stringify(InnerEvent));
        expect(InnerEvent.data?.ACTION).assertEqual(true);
        done()
      }
      let InnerEvent: events_emitter.InnerEvent = {
        eventId: 206,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(InnerEvent, callback);
      } catch (err) {
        console.info("swiperTest_0900 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("swiperTest_0900 click result is: " + JSON.stringify(sendEventByKey('button2', 10, "")));
      await CommonFunc.sleep(1000);
      console.info('swiperTest_0900 END');
    });

    it('swiperTest_1000', Level.LEVEL1, async (done: Function) => {
      console.info('swiperTest_1000 START');
      await CommonFunc.sleep(1500);
      let callbackOne = (InnerEventOne: events_emitter.EventData) => {
        console.info("swiperTest_1000 get state result is: " + JSON.stringify(InnerEventOne));
        expect(InnerEventOne.data?.ACTION).assertEqual(true);
        done()
      }
      let innerEvent: events_emitter.InnerEvent = {
        eventId: 206,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(innerEvent, callbackOne);
      } catch (err) {
        console.info("swiperTest_1000 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("swiperTest_1000 click result is: " + JSON.stringify(sendEventByKey('button2', 10, "")));
      await CommonFunc.sleep(1500);
      let callback = (InnerEvent: events_emitter.EventData) => {
        console.info("swiperTest_1000 get state result is: " + JSON.stringify(InnerEvent));
        expect(InnerEvent.data?.ACTION).assertEqual(true);
        done()
      }
      let InnerEvent: events_emitter.InnerEvent = {
        eventId: 204,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(InnerEvent, callback);
      } catch (err) {
        console.info("swiperTest_1000 on events_emitter err : " + JSON.stringify(err));
      }
      console.info('swiperTest_1000 END');
    });

    it('swiperTest_1100', Level.LEVEL1, async (done: Function) => {
      console.info('swiperTest_1100 START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "loop": true
          }
        }
        let InnerEvent: events_emitter.InnerEvent = {
          eventId: 208,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("swiperTest_1100 start to publish emit");
        events_emitter.emit(InnerEvent, eventData);
      } catch (err) {
        console.log("swiperTest_1100 change component data error: " + err.message);
      }
      await CommonFunc.sleep(3000);
      let strJsonNew: string = getInspectorByKey('swiper');

      console.info("swiperTest_1100 component JSON.parse(strJsonNew) is: " + JSON.stringify(JSON.parse(strJsonNew)));
      expect(JSON.parse(strJsonNew).$attrs.loop).assertEqual('true');
      console.info('swiperTest_1100 END');
      done()
    });

    it('swiperTest_1200', Level.LEVEL1, async (done: Function) => {
      console.info('swiperTest_1200 START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "vertical": true
          }
        }
        let InnerEvent: events_emitter.InnerEvent = {
          eventId: 208,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("swiperTest_1200 start to publish emit");
        events_emitter.emit(InnerEvent, eventData);
      } catch (err) {
        console.log("swiperTest_1200 change component data error: " + err.message);
      }
      await CommonFunc.sleep(3000);
      let strJsonNew: string = getInspectorByKey('swiper');

      console.info("swiperTest_1200 component JSON.parse(strJsonNew) is: " + JSON.stringify(JSON.parse(strJsonNew)));
      expect(JSON.parse(strJsonNew).$attrs.vertical).assertEqual('true');
      console.info('swiperTest_1200 END');
      done()
    });

    it('swiperTest_1300', Level.LEVEL1, async (done: Function) => {
      console.info('swiperTest_1300 START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "interval": "3000"
          }
        }
        let InnerEvent: events_emitter.InnerEvent = {
          eventId: 209,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("swiperTest_1300 start to publish emit");
        events_emitter.emit(InnerEvent, eventData);
      } catch (err) {
        console.log("swiperTest_1300 change component data error: " + err.message);
      }
      await CommonFunc.sleep(4000);
      let strJsonNew = getInspectorByKey('swiper');

      console.info("swiperTest_1300 component JSON.parse(strJsonNew) is: " + JSON.stringify(JSON.parse(strJsonNew)));
      expect(JSON.parse(strJsonNew).$attrs.interval).assertEqual('3000');
      console.info('swiperTest_1300 END');
      done()
    });

    it('swiperTest_1400', Level.LEVEL1, async (done: Function) => {
      console.info('swiperTest_1400 START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "indicator": false
          }
        }
        let InnerEvent: events_emitter.InnerEvent = {
          eventId: 209,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("swiperTest_1400 start to publish emit");
        events_emitter.emit(InnerEvent, eventData);
      } catch (err) {
        console.log("swiperTest_1400 change component data error: " + err.message);
      }
      await CommonFunc.sleep(4000);
      let strJsonNew = getInspectorByKey('swiper');
      console.info("swiperTest_1400 component JSON.parse(strJson)New is: " + JSON.stringify(JSON.parse(strJsonNew)));
      expect(JSON.parse(strJsonNew).$attrs.indicator).assertEqual('false');
      console.info('swiperTest_1400 END');
      done()
    });

    it('swiperTest_1500', Level.LEVEL1, async (done: Function) => {
      console.info('swiperTest_1500 START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "duration": 500
          }
        }
        let InnerEvent: events_emitter.InnerEvent = {
          eventId: 210,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("swiperTest_1500 start to publish emit");
        events_emitter.emit(InnerEvent, eventData);
      } catch (err) {
        console.log("swiperTest_1500 change component data error: " + err.message);
      }
      await CommonFunc.sleep(4000);
      let strJsonNew = getInspectorByKey('swiper');

      console.info("swiperTest_1500 component JSON.parse(strJsonNew) is: " + JSON.stringify(JSON.parse(strJsonNew)));
      expect(JSON.parse(strJsonNew).$attrs.duration).assertEqual('500');
      console.info('swiperTest_1500 END');
      done()
    });

    it('swiperTest_1600', Level.LEVEL1, async (done: Function) => {
      console.info('swiperTest_1600 START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "itemSpace": "1"
          }
        }
        let InnerEvent: events_emitter.InnerEvent = {
          eventId: 210,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("swiperTest_1600 start to publish emit");
        events_emitter.emit(InnerEvent, eventData);
      } catch (err) {
        console.log("swiperTest_1600 change component data error: " + err.message);
      }
      await CommonFunc.sleep(4000);
      let strJsonNew = getInspectorByKey('swiper');

      console.info("swiperTest_1600 component JSON.parse(strJsonNew) is: " + JSON.stringify(JSON.parse(strJsonNew)));
      expect(JSON.parse(strJsonNew).$attrs.itemSpace).assertEqual('1.00vp');
      console.info('swiperTest_1600 END');
      done()
    });

    it('swiperTest_1700', Level.LEVEL1, async (done: Function) => {
      console.info('swiperTest_1700 START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "loop": "true123"
          }
        }
        let InnerEvent: events_emitter.InnerEvent = {
          eventId: 208,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("swiperTest_1700 start to publish emit");
        events_emitter.emit(InnerEvent, eventData);
      } catch (err) {
        console.log("swiperTest_1700 change component data error: " + err.message);
      }
      await CommonFunc.sleep(3000);
      let strJsonNew = getInspectorByKey('swiper');

      console.info("swiperTest_1700 component JSON.parse(strJsonNew) is: " + JSON.stringify(JSON.parse(strJsonNew)));
      expect(JSON.parse(strJsonNew).$attrs.loop).assertEqual('true');
      console.info('swiperTest_1700 END');
      done()
    });

    it('swiperTest_1800', Level.LEVEL1, async (done: Function) => {
      console.info('swiperTest_1800 START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "autoPlay": "false123"
          }
        }
        let InnerEvent: events_emitter.InnerEvent = {
          eventId: 207,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("swiperTest_1800 start to publish emit");
        events_emitter.emit(InnerEvent, eventData);
      } catch (err) {
        console.log("swiperTest_1800 change component data error: " + err.message);
      }
      await CommonFunc.sleep(4000);
      let strJsonNew = getInspectorByKey('swiper');

      console.info("swiperTest_1800 component JSON.parse(strJsonNew) is: " + JSON.stringify(JSON.parse(strJsonNew)));
      expect(JSON.parse(strJsonNew).$attrs.autoPlay).assertEqual('false');
      console.info('swiperTest_1800 END');
      done()
    });

    it('swiperTest_1900', Level.LEVEL1, async (done: Function) => {
      console.info('swiperTest_1900 START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "duration": 0
          }
        }
        let InnerEvent: events_emitter.InnerEvent = {
          eventId: 210,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("swiperTest_1900 start to publish emit");
        events_emitter.emit(InnerEvent, eventData);
      } catch (err) {
        console.log("swiperTest_1900 change component data error: " + err.message);
      }
      await CommonFunc.sleep(4000);
      let strJsonNew = getInspectorByKey('swiper');

      console.info("swiperTest_1900 component JSON.parse(strJsonNew) is: " + JSON.stringify(JSON.parse(strJsonNew)));
      expect(JSON.parse(strJsonNew).$attrs.duration).assertEqual('0');
      console.info('swiperTest_1900 END');
      done()
    });

    it('swiperTest_2000', Level.LEVEL1, async (done: Function) => {
      console.info('swiperTest_2000 START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "duration": "abc"
          }
        }
        let InnerEvent: events_emitter.InnerEvent = {
          eventId: 210,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("swiperTest_2000 start to publish emit");
        events_emitter.emit(InnerEvent, eventData);
      } catch (err) {
        console.log("swiperTest_2000 change component data error: " + err.message);
      }
      await CommonFunc.sleep(4000);
      let strJsonNew = getInspectorByKey('swiper');

      console.info("swiperTest_2000 component JSON.parse(strJsonNew) is: " + JSON.stringify(JSON.parse(strJsonNew)));
      expect(JSON.parse(strJsonNew).$attrs.duration).assertEqual('400');
      console.info('swiperTest_2000 END');
      done()
    });
  })
}