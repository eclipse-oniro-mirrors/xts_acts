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
import events_emitter from '@ohos.events.emitter';
import Utils from '../Utils';

export default function selectJsunit() {
  describe('appInfoTest_five_2', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Select/select1',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get select state success " + JSON.stringify(pages));
        if (!("select" == pages.name)) {
          console.info("get select success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push select page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push select page error " + JSON.stringify(err));
      }
      done()
    });

    afterEach(async () => {
      await Utils.sleep(2000);
      console.info("select after each called");
    });

    it('selectTest_0100', Level.LEVEL1, async (done: Function) => {
      console.info('selectTest_0100 START');
      await Utils.sleep(1000);
      let strJson: string = getInspectorByKey('select');
      console.info("selectTest_0100 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.value).assertEqual('10');
      await Utils.sleep(1000);
      done();
    });

    it('selectTest_0200', Level.LEVEL1, async (done: Function) => {
      console.info('[selectTest_0200] START');
      await Utils.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "value": "5"
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 191,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[selectTest_0200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[selectTest_0200] change component data error: " + (err as Error).message);
      }
      await Utils.sleep(2000);
      let strJsonNew = getInspectorByKey('select');
      console.info("[selectTest_0200] component objNew is: " + JSON.stringify(JSON.parse(strJsonNew)));
      expect(JSON.parse(strJsonNew).$attrs.value).assertEqual('5');
      done();
    });

    it('selectTest_0300', Level.LEVEL1, async (done: Function) => {
      console.info('[selectTest_0300] START');
      await Utils.sleep(2000);
      let strJson: string = getInspectorByKey('select');
      console.info("[selectTest_0300] component strJson:" + strJson);
      console.info("[selectTest_0300] font:" + JSON.parse(strJson).$attrs.font);
      expect(JSON.parse(JSON.parse(strJson).$attrs.font).size).assertEqual('30.00fp');
      expect(JSON.parse(JSON.parse(strJson).$attrs.font).weight).assertEqual('400');
      expect(JSON.parse(JSON.parse(strJson).$attrs.font).family).assertEqual('serif');
      expect(JSON.parse(JSON.parse(strJson).$attrs.font).style).assertEqual('FontStyle.Normal');
      done();
    });

    it('selectTest_0400', Level.LEVEL1, async (done: Function) => {
      console.info('[selectTest_0400] START');
      await Utils.sleep(1000);
      let font: Font = {
        size: 24, weight: 500, family: 'sans-serif', style: FontStyle.Normal
      };
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "font": JSON.stringify(font)
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 191,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[selectTest_0400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[selectTest_0400] change component data error: " + (err as Error).message);
      }
      await Utils.sleep(2000);
      let strJson: string = getInspectorByKey('select');
      console.info("[selectTest_0400] component strJson:" + strJson);
      console.info("[selectTest_0400] font:" + JSON.parse(strJson).$attrs.font);
      expect(JSON.parse(JSON.parse(strJson).$attrs.font).size).assertEqual('24.00fp');
      expect(JSON.parse(JSON.parse(strJson).$attrs.font).weight).assertEqual('500');
      expect(JSON.parse(JSON.parse(strJson).$attrs.font).family).assertEqual('sans-serif');
      expect(JSON.parse(JSON.parse(strJson).$attrs.font).style).assertEqual('FontStyle.Normal');
      done();
    });

    it('selectTest_0500', Level.LEVEL1, async (done: Function) => {
      console.info('[selectTest_0500] START');
      await Utils.sleep(2000);
      let strJson: string = getInspectorByKey('select');
      console.info("[selectTest_0500] component strJson:" + strJson);
      console.info("[selectTest_0500] fontColor:" + JSON.parse(strJson).$attrs.fontColor);
      expect(JSON.parse(strJson).$attrs.fontColor).assertEqual('#FFCCCCCC');
      done();
    });

    it('selectTest_0600', Level.LEVEL1, async (done: Function) => {
      console.info('[selectTest_0600] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "fontColor": '#FF000990'
          }
        }
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 191,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[selectTest_0600] start to publish emit");
        events_emitter.emit(indexEvent, eventData);
      } catch (err) {
        console.log("[selectTest_0600] change component data error: " + (err as Error).message);
      }
      await Utils.sleep(4000);
      let strJson: string = getInspectorByKey('select');
      console.info("[selectTest_0600] component strJson:" + strJson);
      console.info("[selectTest_0600] fontColor:" + JSON.parse(strJson).$attrs.fontColor);
      expect(JSON.parse(strJson).$attrs.fontColor).assertEqual('#FF000990');
      done();
    });

    it('selectTest_0700', Level.LEVEL1, async (done: Function) => {
      console.info('[selectTest_0700] START');
      await Utils.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "value": "-10"
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 191,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[selectTest_0700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[selectTest_0700] change component data error: " + (err as Error).message);
      }
      await Utils.sleep(2000);
      let strJsonNew = getInspectorByKey('select');
      console.info("[selectTest_0700] component objNew is: " + JSON.stringify(JSON.parse(strJsonNew)));
      expect(JSON.parse(strJsonNew).$attrs.value).assertEqual('-10');
      done();
    });

    it('selectTest_0800', Level.LEVEL1, async (done: Function) => {
      console.info('[selectTest_0800] START');
      await Utils.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "value": '1111111111'
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 191,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[selectTest_0800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[selectTest_0800] change component data error: " + (err as Error).message);
      }
      await Utils.sleep(2000);
      let strJsonNew = getInspectorByKey('select');
      console.info("[selectTest_0800] component objNew is: " + JSON.stringify(JSON.parse(strJsonNew)));
      expect(JSON.parse(strJsonNew).$attrs.value).assertEqual('1111111111');
      done();
    });

    it('selectTest_0900', Level.LEVEL1, async (done: Function) => {
      console.info('[selectTest_0900] START');
      await Utils.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "value": '1111111111aaa'
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 191,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[selectTest_0900] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[selectTest_0900] change component data error: " + (err as Error).message);
      }
      await Utils.sleep(2000);
      let strJsonNew = getInspectorByKey('select');
      console.info("[selectTest_0900] component objNew is: " + JSON.stringify(JSON.parse(strJsonNew)));
      expect(JSON.parse(strJsonNew).$attrs.value).assertEqual('1111111111aaa');
      done();
    });

    it('selectTest_1000', Level.LEVEL1, async (done: Function) => {
      console.info('[selectTest_1000] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "fontColor": 121111
          }
        }
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 191,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[selectTest_1000] start to publish emit");
        events_emitter.emit(indexEvent, eventData);
      } catch (err) {
        console.log("[selectTest_1000] change component data error: " + (err as Error).message);
      }
      await Utils.sleep(4000);
      let strJson: string = getInspectorByKey('select');
      console.info("[selectTest_1000] component strJson:" + strJson);

      console.info("[selectTest_1000] fontColor:" + JSON.parse(strJson).$attrs.fontColor);
      expect(JSON.parse(strJson).$attrs.fontColor).assertEqual('#FF01D917');
      done();
    });

  })
}
