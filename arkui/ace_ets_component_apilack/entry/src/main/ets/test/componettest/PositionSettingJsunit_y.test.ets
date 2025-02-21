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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "hypium/index"
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';

export default function positionSettingJsunit() {
  describe('borderTest_five_3', () => {
    beforeEach(async () => {
      console.info("positionSetting beforeEach start");
      let options: router.RouterOptions  = {
        url: 'pages/positionSetting',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get positionSetting state pages:" + JSON.stringify(pages));
        if (!("positionSetting" == pages.name)) {
          console.info("get positionSetting state pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push positionSetting page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push positionSetting page error:" + err);
      }
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("positionSetting after each called");
    });

    it('testPositionSetting001', 0, async () => {
      console.info('[testPositionSetting001] START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('textAlign');
      console.info("[testPositionSetting001] component strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      console.info("[testPositionSetting001] textAlign: " + JSON.parse(strJson).$attrs.textAlign);
      expect(JSON.parse(strJson).$attrs.textAlign).assertEqual('TextAlign.Left');
      console.info('[testPositionSetting001] END');
    });

    it('testPositionSetting002', 0, async () => {
      console.info('[testPositionSetting002] START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('rowDirection');
      console.info("[testPositionSetting002] component strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      console.info("[testPositionSetting002] rowDirection: " + JSON.parse(strJson).$attrs.direction);
      expect(JSON.parse(strJson).$attrs.direction).assertEqual('Direction.Rtl');
      console.info('[testPositionSetting002] END');
    });

    it('testPositionSetting003', 0, async () => {
      console.info('[testPositionSetting003] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "textAlign": Alignment.BottomEnd
          }
        }
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 25,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testPositionSetting003] start to publish emit");
        events_emitter.emit(indexEvent, eventData);
      } catch (err) {
        console.log("[testPositionSetting003] change component data error: " + err.message);
      }
      await Utils.sleep(4000);
      let strJson = getInspectorByKey('textAlign');
      console.info("[testPositionSetting003] component strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      console.info("[testPositionSetting003] textAlign: " + JSON.parse(strJson).$attrs.textAlign);
      expect(JSON.parse(strJson).$attrs.textAlign).assertEqual("TextAlign.Right");
      console.info('[testPositionSetting003] END');
    });

    it('testPositionSetting004', 0, async () => {
      console.info('[testPositionSetting004] START');
      await Utils.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "direction": Direction.Ltr
          }
        }
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 26,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testPositionSetting004] start to publish emit");
        events_emitter.emit(indexEvent, eventData);
      } catch (err) {
        console.log("[testPositionSetting004] change component data error: " + err.message);
      }
      await Utils.sleep(3000);
      let strJson = getInspectorByKey('rowDirection');
      console.info("[testPositionSetting004] component strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      console.info("[testPositionSetting004] rowDirection: " + JSON.parse(strJson).$attrs.direction);
      expect(JSON.parse(strJson).$attrs.direction).assertEqual('Direction.Ltr');
      console.info('[testPositionSetting004] END');
    });

    it('testPositionSetting005', 0, async () => {
      console.info('[testPositionSetting005] START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('position1');
      console.info("[testPositionSetting005] component strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      console.info("[testPositionSetting005] position: " + JSON.stringify(JSON.parse(strJson).$attrs.position));
      expect(JSON.parse(strJson).$attrs.position.x).assertEqual('25.00vp');
      expect(JSON.parse(strJson).$attrs.position.y).assertEqual('15.00vp');
      let strJson1 = getInspectorByKey('position2');
      console.info("[testPositionSetting005] component strJson1:" + strJson1);
      let obj1: Record<string, Object> = JSON.parse(strJson1);
      console.info("[testPositionSetting005] position1: " + JSON.stringify(JSON.parse(strJson1).$attrs.position));
      expect(JSON.parse(strJson1).$attrs.position.x).assertEqual('50.00%');
      expect(JSON.parse(strJson1).$attrs.position.y).assertEqual('70.00%');
      console.info('[testPositionSetting005] END');
    });

    it('testPositionSetting006', 0, async () => {
      console.info('[testPositionSetting006] START');
      await Utils.sleep(1000);
      try {
        let data = {
          x: 10, y: 25
        };
        let data2 = {
          x: '30%', y: '50%'
        };
        let eventData: events_emitter.EventData = {
          data: {
            "position1": JSON.stringify(data),
            "position2": JSON.stringify(data2)
          }
        }
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 27,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testPositionSetting006] start to publish emit");
        events_emitter.emit(indexEvent, eventData);
      } catch (err) {
        console.log("[testPositionSetting006] change component data error: " + err.message);
      }
      await Utils.sleep(3000);
      let strJson = getInspectorByKey('position1');
      console.info("[testPositionSetting006] component strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      console.info("[testPositionSetting006] position1: " + JSON.stringify(JSON.parse(strJson).$attrs.position));
      expect(JSON.parse(strJson).$attrs.position.x).assertEqual('10.00vp');
      expect(JSON.parse(strJson).$attrs.position.y).assertEqual('25.00vp');
      let strJson2 = getInspectorByKey('position2');
      console.info("[testPositionSetting006] component strJson2:" + strJson2);
      let obj2: Record<string, Object> = JSON.parse(strJson2);
      console.info("[testPositionSetting006] position2: " + JSON.stringify(JSON.parse(strJson2).$attrs.position));
      expect(JSON.parse(strJson2).$attrs.position.x).assertEqual('30.00%');
      expect(JSON.parse(strJson2).$attrs.position.y).assertEqual('50.00%');

    });

    it('testPositionSetting007', 0, async () => {
      console.info('[testPositionSetting007] START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('markAnchor');
      console.info("[testPositionSetting007] component strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      console.info("[testPositionSetting007] position: " + JSON.stringify(JSON.parse(strJson).$attrs.markAnchor));
      expect(JSON.parse(strJson).$attrs.markAnchor.x).assertEqual('25.00vp');
      expect(JSON.parse(strJson).$attrs.markAnchor.y).assertEqual('25.00vp');
      console.info('[testPositionSetting007] END');

    });

    it('testPositionSetting008', 0, async () => {
      console.info('[testPositionSetting008] START');
      await Utils.sleep(1000);
      try {
        let data = {
          x: 0, y: 0
        };
        let eventData: events_emitter.EventData = {
          data: {
            "markAnchor": JSON.stringify(data),
          }
        }
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 28,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testPositionSetting008] start to publish emit");
        events_emitter.emit(indexEvent, eventData);
      } catch (err) {
        console.log("[testPositionSetting008] change component data error: " + err.message);
      }
      await Utils.sleep(3000);
      let strJson = getInspectorByKey('markAnchor');
      console.info("[testPositionSetting008] component strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      console.info("[testPositionSetting008] markAnchor: " + JSON.stringify(JSON.parse(strJson).$attrs.markAnchor));
      expect(JSON.parse(strJson).$attrs.markAnchor.x).assertEqual('0.00vp');
      expect(JSON.parse(strJson).$attrs.markAnchor.y).assertEqual('0.00vp');
      console.info('[testPositionSetting008] END');

    });

    it('testPositionSetting009', 0, async () => {
      console.info('[testPositionSetting009] START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('offset');
      console.info("[testPositionSetting009] component strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      console.info("[testPositionSetting009] offset: " + JSON.stringify(JSON.parse(strJson).$attrs.offset));
      expect(JSON.parse(strJson).$attrs.offset.x).assertEqual('10.00vp');
      expect(JSON.parse(strJson).$attrs.offset.y).assertEqual('15.00vp');
      expect(JSON.parse(strJson).$attrs.span.x).assertEqual('10.00vp');
      expect(JSON.parse(strJson).$attrs.span.y).assertEqual('15.00vp');
      console.info('[testPositionSetting009] END');

    });

    it('testPositionSetting010', 0, async () => {
      console.info('[testPositionSetting010] START');
      await Utils.sleep(1000);
      try {
        let data = {
          x: 150, y: 10
        };
        let eventData: events_emitter.EventData = {
          data: {
            "offset": JSON.stringify(data),
          }
        }
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 29,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testPositionSetting010] start to publish emit");
        events_emitter.emit(indexEvent, eventData);
      } catch (err) {
        console.log("[testPositionSetting010] change component data error: " + err.message);
      }
      await Utils.sleep(3000);
      let strJson = getInspectorByKey('offset');
      console.info("[testPositionSetting010] component strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      console.info("[testPositionSetting010] offset: " + JSON.stringify(JSON.parse(strJson).$attrs.offset));
      expect(JSON.parse(strJson).$attrs.offset.x).assertEqual('150.00vp');
      expect(JSON.parse(strJson).$attrs.offset.y).assertEqual('10.00vp');
      console.info('[testPositionSetting010] END');

    });

    it('testPositionSetting011', 0, async () => {
      console.info('[testPositionSetting011] START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('opacity');
      let obj: Record<string, Object> = JSON.parse(strJson);
      console.info("[testPositionSetting011] component obj is: " + JSON.stringify(obj));
      expect(JSON.parse(strJson).$attrs.opacity).assertEqual(1);
      console.info('[testPositionSetting011] END');

    });

    it('testPositionSetting012', 0, async () => {
      console.info('[testPositionSetting012] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "opacityValue": "0.7"
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 25,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testPositionSetting012] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testPositionSetting012] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJsonNew = getInspectorByKey('opacity');
      let objNew: Record<string, Object> = JSON.parse(strJsonNew);
      console.info("[testPositionSetting012] component objNew is: " + JSON.stringify(objNew));
      expect(JSON.parse(strJsonNew).$attrs.opacity).assertEqual(0.7);
      console.info('[testPositionSetting012] END');

    });
  })
}