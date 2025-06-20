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
import { describe, beforeEach, afterEach, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from '../Utils';
import events_emitter from '@ohos.events.emitter';

export default function rating3Jsunit() {
  describe('rating3Jsunit', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Rating/rating3',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get rating state success " + JSON.stringify(pages));
        if (!("rating3" == pages.name)) {
          console.info("get rating state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(4000);
          console.info("push rating page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push rating page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("rating after each called");
    });

    it('testRating_100', Level.LEVEL1, async (done: Function) => {
      console.info('testRating_100 START');
      await Utils.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "rating": 2
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 173,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("testRating_100 start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("testRating_100 change component data error: " + (err as Error).message);
      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('Rating');

      console.info("testRating_100 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.rating).assertEqual("2.000000");
      console.info('testRating_100 END');
      done();
    });

    it('testRating_200', Level.LEVEL1, async (done: Function) => {
      console.info('[testRating_200] START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('Rating');

      console.info("testRating_200 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.stepSize).assertEqual("0.500000");
      console.info('testRating_200 END');
      done();
    });

    it('testRating_300', Level.LEVEL1, async (done: Function) => {
      console.info('testRating_300 START');
      await Utils.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "rating": 3
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 174,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("testRating_300 start to publish emit");
        console.info("eventData.data.rating value" + eventData.data!.rating);
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("testRating_300 change component data error: " + (err as Error).message);
      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('Rating');

      console.info("testRating_300 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.rating).assertEqual("3.000000");
      console.info('testRating_300 END');
      done();
    });

    it('testRating_400', Level.LEVEL1, async (done: Function) => {
      console.info('testRating_400 START');
      await Utils.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "rating": 4
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 175,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("testRating_400 start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("testRating_400 change component data error: " + (err as Error).message);
      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('Rating');

      console.info("testRating_400 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.rating).assertEqual("4.000000");
      console.info('testRating_400 END');
      done();
    });

    it('testRating_500', Level.LEVEL1, async (done: Function) => {
      console.info('testRating_500 START');
      await Utils.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "rating": 5
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 176,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("testRating_500 start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("testRating_500 change component data error: " + (err as Error).message);
      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('Rating');

      console.info("testRating_500 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.rating).assertEqual("5.000000");
      console.info('testRating_500 END');
      done();
    });

    it('testRating_600', Level.LEVEL1, async (done: Function) => {
      console.info('testRating_600 START');
      await Utils.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "rating": 0
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 177,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("testRating_600 start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("testRating_600 change component data error: " + (err as Error).message);
      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('Rating');

      console.info("testRating_600 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.rating).assertEqual("0.000000");
      console.info('testRating_600 END');
      done();
    });

    it('testRating_700', Level.LEVEL1, async (done: Function) => {
      console.info('testRating_700 START');
      await Utils.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "rating": 1
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 178,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("testRating_700 start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("testRating_700 change component data error: " + (err as Error).message);
      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('Rating');

      console.info("testRating_700 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.rating).assertEqual("1.000000");
      console.info('testRating_700 END');
      done();
    });

    it('testRating_800', Level.LEVEL1, async (done: Function) => {
      console.info('testRating_800 START');
      await Utils.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "rating": -1
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 1027,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("testRating_800 start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("testRating_800 change component data error: " + (err as Error).message);
      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('Rating');

      console.info("testRating_800 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.rating).assertEqual("0.000000");
      console.info('testRating_800 END');
      done();
    });

    it('testRating_900', Level.LEVEL1, async (done: Function) => {
      console.info('testRating_900 START');
      await Utils.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "rating": 'a'
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 1028,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("testRating_900 start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("testRating_900 change component data error: " + (err as Error).message);
      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('Rating');

      console.info("testRating_900 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.rating).assertEqual("0.000000");
      console.info('testRating_900 END');
      done();
    });
  })
}