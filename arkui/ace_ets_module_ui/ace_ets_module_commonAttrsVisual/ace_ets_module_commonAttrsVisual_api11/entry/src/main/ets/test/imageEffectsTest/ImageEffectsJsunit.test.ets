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
import CommonFunc from '../../MainAbility/common/Common';

class ShadowValue {
  radius: number = 0
  color: Color | ColoringStrategy = Color.Gray
  offsetX: number = 0
  offsetY: number = 0
}

export default function imageEffectsJsunit() {
  describe('imageEffectsTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/imageEffects/imageEffects',
      }
      try {
        router.clear();
        let pages: router.RouterState = router.getState();
        console.info("get imageEffects state success " + JSON.stringify(pages));
        if (!("imageEffects" == pages.name)) {
          console.info("get imageEffects state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push imageEffects page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push imageEffects page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("imageEffects after each called");
    });

    it('testImageEffects001', Level.LEVEL2, async (done: Function) => {
      console.info('[testSizeSetting001] START');
      await CommonFunc.sleep(2000);
      let strJson: string = getInspectorByKey('centerRow');
      console.info("[testImageEffects001] component strJson:" + strJson);
      expect(JSON.parse(strJson).$type).assertEqual('Text');
      expect(JSON.parse(strJson).$attrs.blur).assertEqual(100);
      done()
    });

    it('testImageEffects002', Level.LEVEL2, async (done: Function) => {
      console.info('[testImageEffects002] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "blurValue": "10"
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 12,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testImageEffects002] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testImageEffects002] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew = getInspectorByKey('centerRow');

      console.info("[testImageEffects002] component JSON.parse(strJsonNew) is: " + JSON.stringify(JSON.parse(strJsonNew)));
      expect(JSON.parse(strJsonNew).$attrs.blur).assertEqual(10);
      done()
    });

    it('testImageEffects003', Level.LEVEL2, async (done: Function) => {
      console.info('[testImageEffects003] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "blurValue": 0x80000000
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 12,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testImageEffects003] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testImageEffects003] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew = getInspectorByKey('centerRow');

      console.info("[testImageEffects003] component JSON.parse(strJsonNew) is: " + JSON.stringify(JSON.parse(strJsonNew)));
      expect(JSON.parse(strJsonNew).$attrs.blur).assertEqual(0x80000000);
      done()
    });

    it('testImageEffects004', Level.LEVEL2, async (done: Function) => {
      console.info('[testImageEffects004] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "blurValue": 10000
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 12,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testImageEffects004] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testImageEffects004] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew: string = getInspectorByKey('centerRow');

      console.info("[testImageEffects004] component JSON.parse(strJsonNew) is: " + JSON.stringify(JSON.parse(strJsonNew)));
      expect(JSON.parse(strJsonNew).$attrs.blur).assertEqual(10000);
      done()
    });

    it('testImageEffects005', Level.LEVEL2, async (done: Function) => {
      console.info('[testImageEffects005] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "blurValue": '0'
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 12,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testImageEffects005] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testImageEffects005] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew: string = getInspectorByKey('centerRow');

      console.info("[testImageEffects005] component JSON.parse(strJsonNew) is: " + JSON.stringify(JSON.parse(strJsonNew)));
      expect(JSON.parse(strJsonNew).$attrs.blur).assertEqual(0);
      done()
    });

    it('testImageEffects006', Level.LEVEL2, async (done: Function) => {
      console.info('[testImageEffects006] START');
      await CommonFunc.sleep(2000);
      let strJson: string = getInspectorByKey('centerRow3');
      console.info("[testImageEffects006] component strJson:" + JSON.parse(strJson).$attrs.shadow);
      expect(JSON.parse(strJson).$attrs.shadow.radius).assertEqual("10.000000");
      expect(JSON.parse(strJson).$attrs.shadow.color).assertEqual("#FF808080");
      expect(JSON.parse(strJson).$attrs.shadow.offsetX).assertEqual("5.000000");
      expect(JSON.parse(strJson).$attrs.shadow.offsetY).assertEqual("5.000000");
      done()
    });

    it('testImageEffects007', Level.LEVEL2, async (done: Function) => {
      console.info('[testImageEffects007] START');
      await CommonFunc.sleep(1000);
      let shadowValue: ShadowValue = {
        radius: 20, color: Color.Gray, offsetX: 10, offsetY: 10
      };
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "shadowValue": JSON.stringify(shadowValue)
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 13,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testImageEffects007] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testImageEffects007] change component data error: " + err.message);
      }

      await CommonFunc.sleep(2000);
      let strJsonNew: string = getInspectorByKey('centerRow3');

      console.info("[testImageEffects007] component JSON.parse(strJsonNew) is: " + JSON.stringify(JSON.parse(strJsonNew)));
      expect(JSON.parse(strJsonNew).$attrs.shadow.radius).assertEqual("20.000000");
      expect(JSON.parse(strJsonNew).$attrs.shadow.color).assertEqual("#FF808080");
      expect(JSON.parse(strJsonNew).$attrs.shadow.offsetX).assertEqual("10.000000");
      expect(JSON.parse(strJsonNew).$attrs.shadow.offsetY).assertEqual("10.000000");
      done()
    });

    it('testImageEffects008', Level.LEVEL2, async (done: Function) => {
      console.info('[testImageEffects008] START');
      await CommonFunc.sleep(1000);
      let shadowValue: ShadowValue = {
        radius: 0x80000000, color: 0x80000000, offsetX: 0x80000000, offsetY: 0x80000000
      };
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "shadowValue": JSON.stringify(shadowValue)
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 13,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testImageEffects008] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testImageEffects008] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew: string = getInspectorByKey('centerRow3');

      console.info("[testImageEffects008] component JSON.parse(strJsonNew) is: " + JSON.stringify(JSON.parse(strJsonNew)));
      expect(JSON.parse(strJsonNew).$attrs.shadow.radius).assertEqual("2147483648.000000");
      expect(JSON.parse(strJsonNew).$attrs.shadow.color).assertEqual("#80000000");
      expect(JSON.parse(strJsonNew).$attrs.shadow.offsetX).assertEqual("2147483648.000000");
      expect(JSON.parse(strJsonNew).$attrs.shadow.offsetY).assertEqual("2147483648.000000");
      done()
    });

    it('testImageEffects009', Level.LEVEL2, async (done: Function) => {
      console.info('[testImageEffects009] START');
      await CommonFunc.sleep(1000);
      let shadowValue: ShadowValue = {
        radius: 0x7FFFFFFF, color: 0x7FFFFFFF, offsetX: 0x7FFFFFFF, offsetY: 0x7FFFFFFF
      };
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "shadowValue": JSON.stringify(shadowValue)
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 13,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testImageEffects009] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testImageEffects009] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew: string = getInspectorByKey('centerRow3');

      console.info("[testImageEffects009] component JSON.parse(strJsonNew) is: " + JSON.stringify(JSON.parse(strJsonNew)));
      expect(JSON.parse(strJsonNew).$attrs.shadow.radius).assertEqual("2147483647.000000");
      expect(JSON.parse(strJsonNew).$attrs.shadow.color).assertEqual("#7FFFFFFF");
      expect(JSON.parse(strJsonNew).$attrs.shadow.offsetX).assertEqual("2147483647.000000");
      expect(JSON.parse(strJsonNew).$attrs.shadow.offsetY).assertEqual("2147483647.000000");
      done()
    });

    it('testImageEffects010', Level.LEVEL2, async (done: Function) => {
      console.info('[testImageEffects010] START');
      await CommonFunc.sleep(1000);
      let shadowValue: ESObject = {
        radius: 'error', color: 'error', offsetX: 'error', offsetY: 'error'
      };
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "shadowValue": JSON.stringify(shadowValue)
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 13,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testImageEffects010] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testImageEffects010] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew: string = getInspectorByKey('centerRow3');

      console.info("[testImageEffects010] component JSON.parse(strJsonNew) is: " + JSON.stringify(JSON.parse(strJsonNew)));
      expect(JSON.parse(strJsonNew).$attrs.shadow.radius).assertEqual("0.000000");
      expect(JSON.parse(strJsonNew).$attrs.shadow.color).assertEqual("#FF000000");
      expect(JSON.parse(strJsonNew).$attrs.shadow.offsetX).assertEqual("0.000000");
      expect(JSON.parse(strJsonNew).$attrs.shadow.offsetY).assertEqual("0.000000");
      done()
    });

    it('testImageEffects011', Level.LEVEL2, async (done: Function) => {
      console.info('[testSizeSetting011] START');
      await CommonFunc.sleep(2000);
      let strJson: string = getInspectorByKey('centerRow5');
      console.info("[testImageEffects011] component strJson:" + strJson);
      expect(JSON.parse(strJson).$attrs.brightness).assertEqual(20);
      done()
    });

    it('testImageEffects012', Level.LEVEL2, async (done: Function) => {
      console.info('[testImageEffects012] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "brightnessValue": "15"
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 15,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testImageEffects012] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testImageEffects012] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew = getInspectorByKey('centerRow5');

      console.info("[testImageEffects012] component JSON.parse(strJsonNew) is: " + JSON.stringify(JSON.parse(strJsonNew)));
      expect(JSON.parse(strJsonNew).$attrs.brightness).assertEqual(15);
      done()
    });

    it('testImageEffects013', Level.LEVEL2, async (done: Function) => {
      console.info('[testImageEffects012] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "brightnessValue": 0x80000000
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 15,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testImageEffects013] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testImageEffects013] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew: string = getInspectorByKey('centerRow5');

      console.info("[testImageEffects013] component JSON.parse(strJsonNew) is: " + JSON.stringify(JSON.parse(strJsonNew)));
      expect(JSON.parse(strJsonNew).$attrs.brightness).assertEqual(0x80000000);
      done()
    });

    it('testImageEffects014', Level.LEVEL2, async (done: Function) => {
      console.info('[testImageEffects014] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "brightnessValue": 0x7FFFFFFF
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 15,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testImageEffects014] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testImageEffects014] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew: string = getInspectorByKey('centerRow5');

      console.info("[testImageEffects014] component JSON.parse(strJsonNew) is: " + JSON.stringify(JSON.parse(strJsonNew)));
      expect(JSON.parse(strJsonNew).$attrs.brightness).assertEqual(2147483647);
      done()
    });

    it('testImageEffects015', Level.LEVEL2, async (done: Function) => {
      console.info('[testImageEffects015] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "brightnessValue": 'error'
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 15,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testImageEffects015] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testImageEffects015] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew: string = getInspectorByKey('centerRow5');

      console.info("[testImageEffects015] component JSON.parse(strJsonNew) is: " + JSON.stringify(JSON.parse(strJsonNew)));
      expect(JSON.parse(strJsonNew).$attrs.brightness).assertEqual(0);
      done()
    });

    it('testImageEffects016', Level.LEVEL2, async (done: Function) => {
      console.info('[testImageEffects016] START');
      await CommonFunc.sleep(2000);
      let strJson: string = getInspectorByKey('centerRow6');
      console.info("[testImageEffects016] component strJson:" + strJson);
      console.info("[testImageEffects016] component strJson:" + JSON.parse(strJson).$attrs.saturate);
      expect(JSON.parse(strJson).$attrs.saturate).assertEqual(50);
      done()
    });

    it('testImageEffects017', Level.LEVEL2, async (done: Function) => {
      console.info('[testImageEffects017] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "saturateValue": "40"
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 16,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testImageEffects017] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testImageEffects017] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew: string = getInspectorByKey('centerRow6');

      console.info("[testImageEffects017] component JSON.parse(strJsonNew) is: " + JSON.stringify(JSON.parse(strJsonNew)));
      expect(JSON.parse(strJsonNew).$attrs.saturate).assertEqual(40);
      done()
    });

    it('testImageEffects018', Level.LEVEL2, async (done: Function) => {
      console.info('[testImageEffects018] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "saturateValue": -2147483648
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 16,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testImageEffects018] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testImageEffects018] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew: string = getInspectorByKey('centerRow6');

      console.info("[testImageEffects018] component JSON.parse(strJsonNew) is: " + JSON.stringify(JSON.parse(strJsonNew)));
      expect(JSON.parse(strJsonNew).$attrs.saturate).assertEqual(0);
      done()
    });

    it('testImageEffects019', Level.LEVEL2, async (done: Function) => {
      console.info('[testImageEffects019] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "saturateValue": 0x7FFFFFFF
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 16,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testImageEffects019] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testImageEffects019] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew: string = getInspectorByKey('centerRow6');

      console.info("[testImageEffects019] component JSON.parse(strJsonNew) is: " + JSON.stringify(JSON.parse(strJsonNew)));
      expect(JSON.parse(strJsonNew).$attrs.saturate).assertEqual(2147483647);
      done()
    });

    it('testImageEffects020', Level.LEVEL2, async (done: Function) => {
      console.info('[testImageEffects020] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "saturateValue": 'error'
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 16,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testImageEffects020] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testImageEffects020] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew: string = getInspectorByKey('centerRow6');

      console.info("[testImageEffects020] component JSON.parse(strJsonNew) is: " + JSON.stringify(JSON.parse(strJsonNew)));
      expect(JSON.parse(strJsonNew).$attrs.saturate).assertEqual(0);
      done()
    });

    it('testImageEffects021', Level.LEVEL2, async (done: Function) => {
      console.info('[testSizeSetting021] START');
      await CommonFunc.sleep(2000);
      let strJson: string = getInspectorByKey('centerRow7');
      console.info("[testImageEffects021] component strJson:" + strJson);
      expect(JSON.parse(strJson).$attrs.contrast).assertEqual(20);
      done()
    });

    it('testImageEffects022', Level.LEVEL2, async (done: Function) => {
      console.info('[testImageEffects022] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "contrastValue": "10"
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 17,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testImageEffects022] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testImageEffects022] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew: string = getInspectorByKey('centerRow7');

      console.info("[testImageEffects022] component JSON.parse(strJsonNew) is: " + JSON.stringify(JSON.parse(strJsonNew)));
      expect(JSON.parse(strJsonNew).$attrs.contrast).assertEqual(10);
      done()
    });

    it('testImageEffects023', Level.LEVEL2, async (done: Function) => {
      console.info('[testImageEffects023] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "contrastValue": -2147483648
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 17,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testImageEffects023] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testImageEffects023] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew: string = getInspectorByKey('centerRow7');

      console.info("[testImageEffects023] component JSON.parse(strJsonNew) is: " + JSON.stringify(JSON.parse(strJsonNew)));
      expect(JSON.parse(strJsonNew).$attrs.contrast).assertEqual(0);
      done()
    });

    it('testImageEffects024', Level.LEVEL2, async (done: Function) => {
      console.info('[testImageEffects024] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "contrastValue": 0x7FFFFFFF
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 17,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testImageEffects024] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testImageEffects024] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew: string = getInspectorByKey('centerRow7');

      console.info("[testImageEffects024] component JSON.parse(strJsonNew) is: " + JSON.stringify(JSON.parse(strJsonNew)));
      expect(JSON.parse(strJsonNew).$attrs.contrast).assertEqual(2147483647);
      done()
    });

    it('testImageEffects025', Level.LEVEL2, async (done: Function) => {
      console.info('[testImageEffects025] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "contrastValue": 'error'
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 17,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testImageEffects025] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testImageEffects025] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew: string = getInspectorByKey('centerRow7');

      console.info("[testImageEffects025] component JSON.parse(strJsonNew) is: " + JSON.stringify(JSON.parse(strJsonNew)));
      expect(JSON.parse(strJsonNew).$attrs.contrast).assertEqual(0);
      done()
    });

    it('testImageEffects026', Level.LEVEL2, async (done: Function) => {
      console.info('[testSizeSetting0026] START');
      await CommonFunc.sleep(2000);
      let strJson: string = getInspectorByKey('centerRow8');
      console.info("[testImageEffects026] component strJson:" + strJson);
      expect(JSON.parse(strJson).$attrs.invert).assertEqual(1);
      done()
    });

    it('testImageEffects027', Level.LEVEL2, async (done: Function) => {
      console.info('[testImageEffects027] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "invertValue": 20
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 18,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testImageEffects027] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testImageEffects027] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew: string = getInspectorByKey('centerRow8');

      console.info("[testImageEffects027] component JSON.parse(strJsonNew) is: " + JSON.stringify(JSON.parse(strJsonNew)));
      expect(JSON.parse(strJsonNew).$attrs.invert).assertEqual(1);
      done()
    });

    it('testImageEffects028', Level.LEVEL2, async (done: Function) => {
      console.info('[testImageEffects028] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "invertValue": 0
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 18,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testImageEffects028] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testImageEffects028] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew: string = getInspectorByKey('centerRow8');

      console.info("[testImageEffects028] component JSON.parse(strJsonNew) is: " + JSON.stringify(JSON.parse(strJsonNew)));
      expect(JSON.parse(strJsonNew).$attrs.invert).assertEqual(0);
      done()
    });

    it('testImageEffects029', Level.LEVEL2, async (done: Function) => {
      console.info('[testImageEffects029] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "invertValue": 10000
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 18,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testImageEffects029] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testImageEffects029] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew: string = getInspectorByKey('centerRow8');

      console.info("[testImageEffects029] component JSON.parse(strJsonNew) is: " + JSON.stringify(JSON.parse(strJsonNew)));
      expect(JSON.parse(strJsonNew).$attrs.invert).assertEqual(1);
      done()
    });

    it('testImageEffects030', Level.LEVEL2, async (done: Function) => {
      console.info('[testImageEffects030] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "invertValue": 'error'
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 18,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testImageEffects030] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testImageEffects030] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew: string = getInspectorByKey('centerRow8');

      console.info("[testImageEffects030] component JSON.parse(strJsonNew) is: " + JSON.stringify(JSON.parse(strJsonNew)));
      expect(JSON.parse(strJsonNew).$attrs.invert).assertEqual(0);
      done()
    });

    it('testImageEffects031', Level.LEVEL2, async (done: Function) => {
      console.info('[testImageEffects031] START');
      await CommonFunc.sleep(2000);
      let strJson: string = getInspectorByKey('centerRow9');
      console.info("[testImageEffects031] component strJson:" + strJson);
      console.info("[testImageEffects031] component strJson:" + JSON.parse(strJson).$attrs.shadow);
      expect(JSON.parse(strJson).$attrs.hueRotate).assertEqual(10);
      done()
    });

    it('testImageEffects032', Level.LEVEL2, async (done: Function) => {
      console.info('[testImageEffects032] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "hueRotateValue": "20"
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 19,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testImageEffects032] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testImageEffects032] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew: string = getInspectorByKey('centerRow9');

      console.info("[testImageEffects032] component JSON.parse(strJsonNew) is: " + JSON.stringify(JSON.parse(strJsonNew)));
      expect(JSON.parse(strJsonNew).$attrs.hueRotate).assertEqual(20);
      done()
    });

    it('testImageEffects033', Level.LEVEL2, async (done: Function) => {
      console.info('[testImageEffects033] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "hueRotateValue": 0x80000000
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 19,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testImageEffects033] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testImageEffects033] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew: string = getInspectorByKey('centerRow9');

      console.info("[testImageEffects033] component JSON.parse(strJsonNew) is: " + JSON.stringify(JSON.parse(strJsonNew)));
      expect(JSON.parse(strJsonNew).$attrs.hueRotate).assertEqual(128);
      done()
    });

    it('testImageEffects034', Level.LEVEL2, async (done: Function) => {
      console.info('[testImageEffects034] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "hueRotateValue": 0x7FFFFFFF
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 19,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testImageEffects034] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testImageEffects034] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew: string = getInspectorByKey('centerRow9');

      console.info("[testImageEffects034] component JSON.parse(strJsonNew) is: " + JSON.stringify(JSON.parse(strJsonNew)));
      expect(JSON.parse(strJsonNew).$attrs.hueRotate).assertEqual(128);
      done()
    });

    it('testImageEffects035', Level.LEVEL2, async (done: Function) => {
      console.info('[testImageEffects035] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "hueRotateValue": 'error'
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 19,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testImageEffects035] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testImageEffects035] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew: string = getInspectorByKey('centerRow9');

      console.info("[testImageEffects035] component JSON.parse(strJsonNew) is: " + JSON.stringify(JSON.parse(strJsonNew)));
      expect(JSON.parse(strJsonNew).$attrs.hueRotate).assertEqual(0);
      done()
    });

    it('testImageEffects036', Level.LEVEL2, async (done: Function) => {
      console.info('[testImageEffects036] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "shadowStyleValue": ShadowStyle.OUTER_DEFAULT_XS
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 20,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testImageEffects036] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testImageEffects036] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew: string = getInspectorByKey('shadowDefaultShadow');

      console.info("[testImageEffects036] component JSON.parse(strJsonNew) is: " + JSON.stringify(JSON.parse(strJsonNew)));
      expect(JSON.parse(strJsonNew).$attrs.shadow).assertEqual("ShadowStyle.OuterDefaultXS");
      done()
    });

    it('testImageEffects037', Level.LEVEL2, async (done: Function) => {
      console.info('[testImageEffects037] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "shadowStyleValue": ShadowStyle.OUTER_DEFAULT_SM
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 20,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testImageEffects037] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testImageEffects037] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJsonNew: string = getInspectorByKey('shadowDefaultShadow');

      console.info("[testImageEffects037] component JSON.parse(strJsonNew) is: " + JSON.stringify(JSON.parse(strJsonNew)));
      expect(JSON.parse(strJsonNew).$attrs.shadow).assertEqual("ShadowStyle.OuterDefaultSM");
      done()
    });

    it('testImageEffects038', Level.LEVEL2, async (done: Function) => {
      console.info('[testImageEffects038] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "shadowStyleValue": ShadowStyle.OUTER_DEFAULT_MD
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 20,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testImageEffects038] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testImageEffects038] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJsonNew: string = getInspectorByKey('shadowDefaultShadow');

      console.info("[testImageEffects038] component JSON.parse(strJsonNew) is: " + JSON.stringify(JSON.parse(strJsonNew)));
      expect(JSON.parse(strJsonNew).$attrs.shadow).assertEqual("ShadowStyle.OuterDefaultMD");
      done()
    });

    it('testImageEffects039', Level.LEVEL2, async (done: Function) => {
      console.info('[testImageEffects039] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "shadowStyleValue": ShadowStyle.OUTER_DEFAULT_LG
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 20,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testImageEffects039] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testImageEffects039] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJsonNew: string = getInspectorByKey('shadowDefaultShadow');

      console.info("[testImageEffects039] component JSON.parse(strJsonNew) is: " + JSON.stringify(JSON.parse(strJsonNew)));
      expect(JSON.parse(strJsonNew).$attrs.shadow).assertEqual("ShadowStyle.OuterDefaultLG");
      done()
    });

    it('testImageEffects040', Level.LEVEL2, async (done: Function) => {
      console.info('[testImageEffects040] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "shadowStyleValue": ShadowStyle.OUTER_FLOATING_SM
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 20,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testImageEffects040] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testImageEffects040] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJsonNew: string = getInspectorByKey('shadowDefaultShadow');

      console.info("[testImageEffects040] component JSON.parse(strJsonNew) is: " + JSON.stringify(JSON.parse(strJsonNew)));
      expect(JSON.parse(strJsonNew).$attrs.shadow).assertEqual("ShadowStyle.OuterFloatingSM");
      done()
    });

    it('testImageEffects041', Level.LEVEL2, async (done: Function) => {
      console.info('[testImageEffects041] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "shadowStyleValue": ShadowStyle.OUTER_FLOATING_MD
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 20,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testImageEffects041] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testImageEffects041] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);

      let strJsonNew: string = getInspectorByKey('shadowDefaultShadow');

      console.info("[testImageEffects041] component JSON.parse(strJsonNew) is: " + JSON.stringify(JSON.parse(strJsonNew)));
      expect(JSON.parse(strJsonNew).$attrs.shadow).assertEqual("ShadowStyle.OuterFloatingMD");
      done()
    });

    it('testImageEffects042', Level.LEVEL2, async (done: Function) => {
      console.info('[testImageEffects042] START');
      await CommonFunc.sleep(1000);
      let shadowValue: ShadowValue = {
        radius: 20, color: ColoringStrategy.AVERAGE, offsetX: 10, offsetY: 10
      };
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "shadowValue": JSON.stringify(shadowValue)
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 21,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testImageEffects042] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testImageEffects042] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew: string = getInspectorByKey('centerRow3');

      console.info("[testImageEffects042] component JSON.parse(strJsonNew) is: " + JSON.stringify(JSON.parse(strJsonNew)));
      expect(JSON.parse(strJsonNew).$attrs.shadow.radius).assertEqual("20.000000");
      expect(JSON.parse(strJsonNew).$attrs.shadow.color).assertEqual("ColoringStrategy.AVERAGE");
      expect(JSON.parse(strJsonNew).$attrs.shadow.offsetX).assertEqual("10.000000");
      expect(JSON.parse(strJsonNew).$attrs.shadow.offsetY).assertEqual("10.000000");
      done()
    });
  })
}












