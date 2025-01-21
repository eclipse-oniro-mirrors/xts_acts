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
import { describe, beforeEach, afterEach, it, expect } from "@ohos/hypium"
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter';
import Utils from '../Utils';

class ScaleValue {
  x: number = 0;
  y: number = 0;
}

class RotateValue {
  x: number = 0;
  y: number = 0;
  z: number = 0;
  centerX: string = "";
  centerY: string = "";
  angle: number = 0;
}

export default function transFormJsunit() {
  describe('appInfoTest_five_4', () => {
    beforeEach(async (done: Function) => {
      console.info("transForm beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Row/transForm',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get transForm state pages:" + JSON.stringify(pages));
        if (!("transForm " == pages.name)) {
          console.info("get transForm  state pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push transForm  page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push transForm  page error:" + err);
      }
      done()
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("transFrom each called");
    });

    it('testTransForm001', 0, async (done: Function) => {
      console.info('[testTransForm001] START');
      await Utils.sleep(1000);
      let strJson: string = getInspectorByKey('rotate');
      console.info("[testTransForm001] component strJson:" + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$type).assertEqual('Row');
      expect(JSON.parse(strJson).$attrs.rotate.x).assertEqual('1.000000');
      expect(JSON.parse(strJson).$attrs.rotate.y).assertEqual('1.000000');
      expect(JSON.parse(strJson).$attrs.rotate.z).assertEqual('1.000000');
      expect(JSON.parse(strJson).$attrs.rotate.centerX).assertEqual('50.00%');
      expect(JSON.parse(strJson).$attrs.rotate.centerY).assertEqual('50.00%');
      expect(JSON.parse(strJson).$attrs.rotate.angle).assertEqual('300.000000');
      done();
    });

    it('testTransForm002', 0, async (done: Function) => {
      console.info('[testTransForm002] START');
      await Utils.sleep(1000);
      let rotateValue: RotateValue = {
        x: 2,
        y: 2,
        z: 2,
        centerX: '60%',
        centerY: '60%',
        angle: 100
      }
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "rotateValue": JSON.stringify(rotateValue)
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 45,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testTransForm002] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testTransForm002] change component data error: " + (err as Error)?.message);
      }
      await Utils.sleep(2000);
      let strJsonNew: string = getInspectorByKey('rotate');
      console.info("[testTransForm002] component objNew is: " + JSON.stringify(JSON.parse(strJsonNew)));
      expect(JSON.parse(strJsonNew).$attrs.rotate.x).assertEqual('2.000000');
      expect(JSON.parse(strJsonNew).$attrs.rotate.y).assertEqual('2.000000');
      expect(JSON.parse(strJsonNew).$attrs.rotate.z).assertEqual('2.000000');
      expect(JSON.parse(strJsonNew).$attrs.rotate.centerX).assertEqual('60.00%');
      expect(JSON.parse(strJsonNew).$attrs.rotate.centerY).assertEqual('60.00%');
      expect(JSON.parse(strJsonNew).$attrs.rotate.angle).assertEqual('100.000000');
      done();
    });

    it('testTransForm003', 0, async (done: Function) => {
      console.info('[testTransForm003] START');
      await Utils.sleep(1000);
      let strJson: string = getInspectorByKey('rotate3');

      console.info("[testTransForm003] component strJson:" + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.scale.x).assertEqual('2.000000');
      expect(JSON.parse(strJson).$attrs.scale.y).assertEqual('0.500000');
      done();
    });

    it('testTransForm004', 0, async (done: Function) => {
      console.info('[testTransForm004] START');
      await Utils.sleep(1000);
      let scaleValue: ScaleValue = {
        x: 1, y: 1
      }
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "scaleValue": JSON.stringify(scaleValue)
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 46,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testTransForm004] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testTransForm004] change component data error: " + (err as Error)?.message);
      }
      await Utils.sleep(2000);
      let strJsonNew: string = getInspectorByKey('rotate3');
      console.info("[testTransForm004] component objNew is: " + JSON.stringify(JSON.parse(strJsonNew)));
      expect(JSON.parse(strJsonNew).$attrs.scale.x).assertEqual('1.000000');
      expect(JSON.parse(strJsonNew).$attrs.scale.y).assertEqual('1.000000');
      done();
    });
  })
}




