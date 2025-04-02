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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter';
import CommonFunc from '../../MainAbility/common/Common';

class Data1 {
  x: number | string = 0;
  y: number | string = 0;
}

export default function positionSettingJsunit() {
  describe('borderTest_five_3', () => {
    beforeEach(async (done: Function) => {
      console.info("positionSetting beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/text/positionSetting',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get positionSetting state pages:" + JSON.stringify(pages));
        if (!("positionSetting" == pages.name)) {
          console.info("get positionSetting state pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push positionSetting page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push positionSetting page error:" + err);
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("positionSetting after each called");
    });

    it('testPositionSetting001', 0, async (done: Function) => {
      console.info('[testPositionSetting001] START');
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('textAlign');
      console.info("[testPositionSetting001] component strJson:" + strJson);
      console.info("[testPositionSetting001] textAlign: " + JSON.parse(strJson)
        .$attrs
        .textAlign + "_" + JSON.parse(strJson).$attrs.align);
      expect(JSON.parse(strJson).$attrs.textAlign).assertEqual('TextAlign.Start');
      console.info('[testPositionSetting001] END');
      done();
    });

    it('testPositionSetting002', 0, async (done: Function) => {
      console.info('[testPositionSetting002] START');
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('rowDirection');
      console.info("[testPositionSetting002] component strJson:" + strJson);
      console.info("[testPositionSetting002] rowDirection: " + JSON.parse(strJson).$attrs.direction);
      expect(JSON.parse(strJson).$attrs.direction).assertEqual('Direction.Rtl');
      console.info('[testPositionSetting002] END');
      done();
    });

    it('testPositionSetting003', 0, async (done: Function) => {
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
      await CommonFunc.sleep(4000);
      let strJson: string = getInspectorByKey('textAlign');
      console.info("[testPositionSetting003] component strJson:" + strJson);
      console.info("[testPositionSetting003] textAlign: " + JSON.parse(strJson).$attrs.textAlign);
      expect(JSON.parse(strJson).$attrs.textAlign).assertEqual("TextAlign.Start");
      console.info('[testPositionSetting003] END');
      done();
    });

    it('testPositionSetting004', 0, async (done: Function) => {
      console.info('[testPositionSetting004] START');
      await CommonFunc.sleep(1000);
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
      await CommonFunc.sleep(3000);
      let strJson: string = getInspectorByKey('rowDirection');
      console.info("[testPositionSetting004] component strJson:" + strJson);
      console.info("[testPositionSetting004] rowDirection: " + JSON.parse(strJson).$attrs.direction);
      expect(JSON.parse(strJson).$attrs.direction).assertEqual('Direction.Ltr');
      console.info('[testPositionSetting004] END');
      done();
    });

    it('testPositionSetting005', 0, async (done: Function) => {
      console.info('[testPositionSetting005] START');
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('position1');
      console.info("[testPositionSetting005] component strJson:" + strJson);
      console.info("[testPositionSetting005] position: " + JSON.stringify(JSON.parse(strJson).$attrs.position));
      expect(JSON.parse(strJson).$attrs.position.x).assertEqual('25.00vp');
      expect(JSON.parse(strJson).$attrs.position.y).assertEqual('15.00vp');
      let strJson1 = getInspectorByKey('position2');
      console.info("[testPositionSetting005] component strJson1:" + strJson1);
      console.info("[testPositionSetting005] position1: " + JSON.stringify(JSON.parse(strJson1).$attrs.position));
      expect(JSON.parse(strJson1).$attrs.position.x).assertEqual('50.00%');
      expect(JSON.parse(strJson1).$attrs.position.y).assertEqual('70.00%');
      console.info('[testPositionSetting005] END');
      done();
    });

    it('testPositionSetting006', 0, async (done: Function) => {
      console.info('[testPositionSetting006] START');
      await CommonFunc.sleep(1000);
      try {
        let data: Data1 = {
          x: 10, y: 25
        };
        let data2: Data1 = {
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
      await CommonFunc.sleep(3000);
      let strJson: string = getInspectorByKey('position1');
      console.info("[testPositionSetting006] component strJson:" + strJson);
      console.info("[testPositionSetting006] position1: " + JSON.stringify(JSON.parse(strJson).$attrs.position));
      expect(JSON.parse(strJson).$attrs.position.x).assertEqual('10.00vp');
      expect(JSON.parse(strJson).$attrs.position.y).assertEqual('25.00vp');
      let strJson2 = getInspectorByKey('position2');
      console.info("[testPositionSetting006] component strJson2:" + strJson2);
      console.info("[testPositionSetting006] position2: " + JSON.stringify(JSON.parse(strJson2).$attrs.position));
      expect(JSON.parse(strJson2).$attrs.position.x).assertEqual('30.00%');
      expect(JSON.parse(strJson2).$attrs.position.y).assertEqual('50.00%');
      done();
    });

    it('testPositionSetting007', 0, async (done: Function) => {
      console.info('[testPositionSetting007] START');
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('markAnchor');
      console.info("[testPositionSetting007] component strJson:" + strJson);
      console.info("[testPositionSetting007] position: " + JSON.stringify(JSON.parse(strJson).$attrs.markAnchor));
      expect(JSON.parse(strJson).$attrs.markAnchor.x).assertEqual('25.00vp');
      expect(JSON.parse(strJson).$attrs.markAnchor.y).assertEqual('25.00vp');
      console.info('[testPositionSetting007] END');
      done();
    });

    it('testPositionSetting008', 0, async (done: Function) => {
      console.info('[testPositionSetting008] START');
      await CommonFunc.sleep(1000);
      try {
        let data: Data1 = {
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
      await CommonFunc.sleep(3000);
      let strJson: string = getInspectorByKey('markAnchor');
      console.info("[testPositionSetting008] component strJson:" + strJson);
      console.info("[testPositionSetting008] markAnchor: " + JSON.stringify(JSON.parse(strJson).$attrs.markAnchor));
      expect(JSON.parse(strJson).$attrs.markAnchor.x).assertEqual('0.00vp');
      expect(JSON.parse(strJson).$attrs.markAnchor.y).assertEqual('0.00vp');
      console.info('[testPositionSetting008] END');
      done();
    });

    it('testPositionSetting009', 0, async (done: Function) => {
      console.info('[testPositionSetting009] START');
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('offset');
      console.info("[testPositionSetting009] component strJson:" + strJson);
      console.info("[testPositionSetting009] offset: " + JSON.stringify(JSON.parse(strJson).$attrs.offset));
      expect(JSON.parse(strJson).$attrs.offset.x).assertEqual('10.00vp');
      expect(JSON.parse(strJson).$attrs.offset.y).assertEqual('15.00vp');
      console.info('[testPositionSetting009] END');
      done();
    });

    it('testPositionSetting010', 0, async (done: Function) => {
      console.info('[testPositionSetting010] START');
      await CommonFunc.sleep(1000);
      try {
        let data: Data1 = {
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
      await CommonFunc.sleep(3000);
      let strJson: string = getInspectorByKey('offset');
      console.info("[testPositionSetting010] component strJson:" + strJson);
      console.info("[testPositionSetting010] offset: " + JSON.stringify(JSON.parse(strJson).$attrs.offset));
      expect(JSON.parse(strJson).$attrs.offset.x).assertEqual('150.00vp');
      expect(JSON.parse(strJson).$attrs.offset.y).assertEqual('10.00vp');
      console.info('[testPositionSetting010] END');
      done();
    });

    it('testPositionSetting011', 0, async (done: Function) => {
      console.info('[testPositionSetting011] START');
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('opacity');
      console.info("[testPositionSetting011] component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.opacity).assertEqual(1);
      console.info('[testPositionSetting011] END');
      done();
    });

    it('testPositionSetting012', 0, async (done: Function) => {
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
      await CommonFunc.sleep(2000);
      let strJsonNew = getInspectorByKey('opacity');
      console.info("[testPositionSetting012] component objNew is: " + JSON.stringify(JSON.parse(strJsonNew)));
      expect(JSON.parse(strJsonNew).$attrs.opacity).assertEqual(0.7);
      console.info('[testPositionSetting012] END');
      done();
    });
  })
}