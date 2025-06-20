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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level  } from "@ohos/hypium"
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter';
import Utils from '../Utils';

class SweepGradientValue {
  center!: [number, number];
  start!: number;
  colors!: Array<[ResourceColor, number]>;
  end!: number;
  repeating!: boolean;
}

class RadialGradientValue {
  center!: [number, number];
  radius!: number | string;
  colors!: Array<[ResourceColor, number]>;
  repeating!: boolean;
}

class LinearGradientValue {
  angle!: number;
  direction!: GradientDirection;
  colors!: Array<[ResourceColor, number]>;
  repeating!: boolean;
}

export default function colorGradientJsunit() {
  describe('borderTest_five_2', () => {
    beforeEach(async (done: Function) => {
      console.info("colorGradient beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Row/colorGradient',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get colorGradient state pages:" + JSON.stringify(pages));
        if (!("colorGradient" == pages.name)) {
          console.info("get colorGradient state pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push colorGradient page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push colorGradient page error:" + err);
      }
      done()
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("colorGradient after each called");
    });

    it('testColorGradient001',  Level.LEVEL0, async (done: Function) => {
      console.info('[testColorGradient001] START');
      await Utils.sleep(1000);
      let strJson: string = getInspectorByKey('linearGradient');
      console.info("[testColorGradient001] component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)
        .$attrs
        .linearGradient));
      expect(JSON.parse(strJson).$attrs.linearGradient.angle).assertEqual('90.00px');
      expect(JSON.parse(strJson).$attrs.linearGradient.direction).assertEqual('GradientDirection.Left');
      expect(JSON.parse(strJson).$attrs.linearGradient.repeating).assertEqual('true');
      console.info('[testColorGradient001] END');
      done();
    });

    it('testColorGradient002',  Level.LEVEL0, async (done: Function) => {
      console.info('[testColorGradient002] START');
      await Utils.sleep(1000);
      let linearGradientValue: LinearGradientValue = {
        angle: 80,
        direction: GradientDirection.Top,
        colors: [[0xAEE1E1, 0.0], [0xD3E0DC, 0.3], [0xFCD1D1, 1.0]],
        repeating: false
      };
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "linearGradientValue": JSON.stringify(linearGradientValue)
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 5,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testColorGradient002] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testColorGradient002] change component data error: " + (err as Error)?.message);
      }
      await Utils.sleep(2000);
      let strJsonNew = getInspectorByKey('linearGradient');

      console.info("[testColorGradient002] component JSON.parse(strJsonNew) is: " + JSON.stringify(JSON.parse(strJsonNew)));
      expect(JSON.parse(strJsonNew).$attrs.linearGradient.angle).assertEqual('80.00px');
      expect(JSON.parse(strJsonNew).$attrs.linearGradient.direction).assertEqual('GradientDirection.Top');
      expect(JSON.parse(strJsonNew).$attrs.linearGradient.repeating).assertEqual('false');
      console.info('[testColorGradient002] END');
      done();
    });

    it('testColorGradient003',  Level.LEVEL0, async (done: Function) => {
      await Utils.sleep(1000)
      console.info('[testColorGradient003] START');
      await Utils.sleep(1000);
      let strJson: string = getInspectorByKey('sweepGradient');
      console.info("[testColorGradient003] component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.sweepGradient.end).assertEqual('359.00px');
      expect(JSON.parse(strJson).$attrs.sweepGradient.start).assertEqual('0.00px');
      expect(JSON.parse(strJson).$attrs.sweepGradient.repeating).assertEqual('true');
      console.info('[testColorGradient003] END');
      done();
    });

    it('testColorGradient004',  Level.LEVEL0, async (done: Function) => {
      console.info('[testColorGradient004] START');
      await Utils.sleep(1000);
      let sweepGradientValue: SweepGradientValue = {
        center: [50, 50],
        start: 10,
        end: 356,
        colors: [[0xAEE1E1, 0.0], [0xD3E0DC, 0.3], [0xFCD1D1, 1.0]],
        repeating: false
      };
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "sweepGradientValue": JSON.stringify(sweepGradientValue)
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 6,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testColorGradient004] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testColorGradient004] change component data error: " + (err as Error)?.message);
      }
      await Utils.sleep(2000);
      let strJsonNew = getInspectorByKey('sweepGradient');
      console.info("[testColorGradient004] component JSON.parse(strJsonNew) is: " + JSON.stringify(JSON.parse(strJsonNew)));
      expect(JSON.parse(strJsonNew).$attrs.sweepGradient.end).assertEqual('356.00px');
      expect(JSON.parse(strJsonNew).$attrs.sweepGradient.start).assertEqual('10.00px');
      expect(JSON.parse(strJsonNew).$attrs.sweepGradient.repeating).assertEqual('false');
      console.info('[testColorGradient004] END');
      done();
    });

    it('testColorGradient005',  Level.LEVEL0, async (done: Function) => {
      await Utils.sleep(1000)
      console.info('[testColorGradient005] START');
      await Utils.sleep(1000);
      let strJson: string = getInspectorByKey('radialGradient');

      console.info("[testColorGradient005] component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.radialGradient.radius).assertEqual('60.00vp');
      expect(JSON.parse(strJson).$attrs.radialGradient.center[0]).assertEqual('50.00vp');
      expect(JSON.parse(strJson).$attrs.radialGradient.center[1]).assertEqual('50.00vp');
      expect(JSON.parse(strJson).$attrs.radialGradient.repeating).assertEqual('true');
      console.info('[testColorGradient005] END');
      done();
    });

    it('testColorGradient006',  Level.LEVEL0, async (done: Function) => {
      console.info('[testColorGradient006] START');
      await Utils.sleep(1000);
      let radialGradientValue: RadialGradientValue = {
        center: [60, 60],
        radius: 70,
        colors: [[0xAEE1E1, 0.0], [0xD3E0DC, 0.3], [0xFCD1D1, 1.0]],
        repeating: false
      };
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "radialGradientValue": JSON.stringify(radialGradientValue)
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 7,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testColorGradient006] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testColorGradient006] change component data error: " + (err as Error)?.message);
      }
      await Utils.sleep(2000);
      let strJsonNew = getInspectorByKey('radialGradient');
      console.info("[testColorGradient006] component JSON.parse(strJsonNew) is: " + JSON.stringify(JSON.parse(strJsonNew)));
      expect(JSON.parse(strJsonNew).$attrs.radialGradient.radius).assertEqual('70.00vp');
      expect(JSON.parse(strJsonNew).$attrs.radialGradient.center[0]).assertEqual('60.00vp');
      expect(JSON.parse(strJsonNew).$attrs.radialGradient.center[1]).assertEqual('60.00vp');
      expect(JSON.parse(strJsonNew).$attrs.radialGradient.repeating).assertEqual('false');
      console.info('[testColorGradient006] END');
      done();
    });
  })
}