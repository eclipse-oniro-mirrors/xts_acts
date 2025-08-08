
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium";
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter';
import CommonFunc from '../../MainAbility/common/Common';
import { BusinessError } from '@ohos.base';

export default function gaugeJsunit() {
  describe('gaugeTest', () => {
    beforeEach(async (done:Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/gauge/gauge'
      }
      try {
        router.clear();
        let pages: router.RouterState = router.getState();
        console.info("get gauge state success " + JSON.stringify(pages));
        if (!("gauge" == pages.name)) {
          console.info("get gauge state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push gauge page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push gauge page error " + err);
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("gauge after each called");
    });

    it('testGauge001', Level.LEVEL0, async (done:Function) => {
      console.info('[testGauge001] START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('gauge');
      console.info("[testGauge001] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$type).assertEqual('Gauge');
      expect(JSON.parse(strJson).$attrs.strokeWidth).assertEqual('20.00vp');
      expect(JSON.parse(strJson).$attrs.width).assertEqual('200.00vp');
      expect(JSON.parse(strJson).$attrs.height).assertEqual('200.00vp');
      expect(JSON.parse(strJson).$attrs.value).assertEqual('50.00');
      done()
    });

    it('testGauge002', Level.LEVEL0, async (done:Function) => {
      console.info('[testGauge002] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "gaugeValue": 10
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 102,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testGauge002] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testGauge002] change component data error: " + (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew: string = getInspectorByKey('gauge');

      console.info("[testGauge002] component JSON.parse(strJsonNew) is: " + JSON.stringify(JSON.parse(strJsonNew)));
      expect(JSON.parse(strJsonNew).$attrs.value).assertEqual('10.00');
      done()
    });

    it('testGauge003', Level.LEVEL0, async (done:Function) => {
      console.info('[testGauge003] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "strokeWidthValue": "30",
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 102,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testGauge003] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testGauge003] change component data error: " + (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew: string = getInspectorByKey('gauge');

      console.info("[testGauge003] component JSON.parse(strJsonNew) is: " + JSON.stringify(JSON.parse(strJsonNew)));
      expect(JSON.parse(strJsonNew).$attrs.strokeWidth).assertEqual('30.00vp');
      done()
    });

    it('testGauge004', Level.LEVEL0, async (done:Function) => {
      console.info('[testGauge004] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "startAngleValue": 200
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 102,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testGauge004] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testGauge004] change component data error: " + (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew = getInspectorByKey('gauge');

      console.info("[testGauge004] component JSON.parse(strJsonNew) is: " + JSON.stringify(JSON.parse(strJsonNew)));
      expect(JSON.parse(strJsonNew).$attrs.startAngle).assertEqual('200.00');
      done()
    });

    it('testGauge005', Level.LEVEL0, async (done:Function) => {
      console.info('[testGauge005] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "endAngleValue": 200
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 102,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testGauge005] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testGauge005] change component data error: " + (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew: string = getInspectorByKey('gauge');

      console.info("[testGauge005] component JSON.parse(strJsonNew) is: " + JSON.stringify(JSON.parse(strJsonNew)));
      expect(JSON.parse(strJsonNew).$attrs.endAngle).assertEqual('200.00');
      done()
    });

    it('testGauge006', Level.LEVEL0, async (done:Function) => {
      console.info('[testGauge006] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "colorValues": JSON.stringify([[0x317AF7, 1], [0x5BA854, 1], [0xE08C3A, 1]])
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 103,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testGauge006] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testGauge006] change component data error: " + (err as BusinessError).message);
      }
      done()
    });

    it('testGauge007', Level.LEVEL0, async (done:Function) => {
      console.info('[testGauge007] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "gaugeValue": -10
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 904,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testGauge007] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testGauge007] change component data error: " + (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew: string = getInspectorByKey('gauge');

      console.info("[testGauge007] component JSON.parse(strJsonNew) is: " + JSON.stringify(JSON.parse(strJsonNew)));
      expect(JSON.parse(strJsonNew).$attrs.value).assertEqual('-10.00');
      done()
    });

    it('testGauge008', Level.LEVEL0, async (done:Function) => {
      console.info('[testGauge008] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "strokeWidthValue": "-30",
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 904,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testGauge008] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testGauge008] change component data error: " + (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew: string = getInspectorByKey('gauge');

      console.info("[testGauge008] component JSON.parse(strJsonNew) is: " + JSON.stringify(JSON.parse(strJsonNew)));
      expect(JSON.parse(strJsonNew).$attrs.strokeWidth).assertEqual('-30.00vp');
      done()
    });

    it('testGauge009', Level.LEVEL0, async (done:Function) => {
      console.info('[testGauge009] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "startAngleValue": -10
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 905,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testGauge009] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testGauge009] change component data error: " + (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew: string = getInspectorByKey('gauge');

      console.info("[testGauge009] component JSON.parse(strJsonNew) is: " + JSON.stringify(JSON.parse(strJsonNew)));
      expect(JSON.parse(strJsonNew).$attrs.startAngle).assertEqual('-10.00');
      done()
    });

    it('testGauge010', Level.LEVEL0, async (done:Function) => {
      console.info('[testGauge010] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "endAngleValue": -10
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 906,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testGauge010] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testGauge010] change component data error: " + (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew: string = getInspectorByKey('gauge');
      console.info("[testGauge010] component JSON.parse(strJsonNew) is: " + JSON.stringify(JSON.parse(strJsonNew)));
      expect(JSON.parse(strJsonNew).$attrs.endAngle).assertEqual('-10.00');
      done()
    });

    it('testGauge011', Level.LEVEL0, async (done:Function) => {
      console.info('[testGauge011] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "strokeWidthValue": "121111111"
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 905,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testGauge011] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testGauge011] change component data error: " + (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew: string = getInspectorByKey('gauge');
      console.info("[testGauge011] component JSON.parse(strJsonNew) is: " + JSON.stringify(JSON.parse(strJsonNew)));
      expect(JSON.parse(strJsonNew).$attrs.strokeWidth).assertEqual('121111111.00vp');
      done()
    });
  })
}
