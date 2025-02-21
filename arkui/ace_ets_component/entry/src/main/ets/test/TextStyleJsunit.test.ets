
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';

export default function textStyleJsunit() {
  describe('textStyleTest', () => {
    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/textStyle',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get textStyle state pages:" + JSON.stringify(pages));
        if (!("textStyle" == pages.name)) {
          console.info("get textStyle state pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push textStyle page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push textStyle page error:" + err);
      }

    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("textStyle after each called");
    });


    it('testTextStyle006', 0, async () => {
      console.info('[testTextStyle006] START');
      await Utils.sleep(1000);
      let strJson: string = getInspectorByKey('fontSize');
      console.info("[testTextStyle006] component strJson:" + strJson);
      
      console.info("[testTextStyle006] fontSize: " + JSON.parse(strJson).$attrs.fontSize);
      expect(JSON.parse(strJson).$attrs.fontSize).assertEqual('16.00fp');

    });

    it('testTextStyle007', 0, async () => {
      console.info('[testTextStyle007] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "fontSize": 30
          }
        }
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 38,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testTextStyle007] start to publish emit");
        events_emitter.emit(indexEvent, eventData);
      } catch (err) {
        console.log("[testTextStyle007] change component data error: " + err.message);
      }
      await Utils.sleep(4000);
      let strJson: string = getInspectorByKey('fontSize');
      console.info("[testTextStyle007] component strJson:" + strJson);
      
      console.info("[testTextStyle007] fontSize: " + JSON.parse(strJson).$attrs.fontSize);
      expect(JSON.parse(strJson).$attrs.fontSize).assertEqual('16.00fp');

    });

    it('testTextStyle008', 0, async () => {
      console.info('[testTextStyle008] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "fontSize": 0x80000000
          }
        }
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 38,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testTextStyle008] start to publish emit");
        events_emitter.emit(indexEvent, eventData);
      } catch (err) {
        console.log("[testTextStyle008] change component data error: " + err.message);
      }
      await Utils.sleep(4000);
      let strJson: string = getInspectorByKey('fontSize');
      console.info("[testTextStyle008] component strJson:" + strJson);
      
      console.info("[testTextStyle008] fontSize: " + JSON.parse(strJson).$attrs.fontSize);
      expect(JSON.parse(strJson).$attrs.fontSize).assertEqual('16.00fp');

    });

    it('testTextStyle009', 0, async () => {
      console.info('[testTextStyle009] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "fontSize": 'error'
          }
        }
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 38,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testTextStyle009] start to publish emit");
        events_emitter.emit(indexEvent, eventData);
      } catch (err) {
        console.log("[testTextStyle009] change component data error: " + err.message);
      }
      await Utils.sleep(4000);
      let strJson: string = getInspectorByKey('fontSize');
      console.info("[testTextStyle009] component strJson:" + strJson);
      
      console.info("[testTextStyle009] fontSize: " + JSON.parse(strJson).$attrs.fontSize);
      expect(JSON.parse(strJson).$attrs.fontSize).assertEqual('16.00fp');

    });

    it('testTextStyle010', 0, async () => {
      console.info('[testTextStyle010] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "fontSize": 0x7FFFFFFF
          }
        }
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 38,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testTextStyle010] start to publish emit");
        events_emitter.emit(indexEvent, eventData);
      } catch (err) {
        console.log("[testTextStyle010] change component data error: " + err.message);
      }
      await Utils.sleep(4000);
      let strJson: string = getInspectorByKey('fontSize');
      console.info("[testTextStyle010] component strJson:" + strJson);
      
      console.info("[testTextStyle010] fontSize: " + JSON.parse(strJson).$attrs.fontSize);
      expect(JSON.parse(strJson).$attrs.fontSize).assertEqual('16.00fp');

    });

    it('testTextStyle011', 0, async () => {
      console.info('[testTextStyle011] START');
      await Utils.sleep(1000);
      let strJson: string = getInspectorByKey('fontStyle');
      console.info("[testTextStyle011] component strJson:" + strJson);
      
      console.info("[testTextStyle011] fontStyle: " + JSON.parse(strJson).$attrs.fontStyle);
      expect(JSON.parse(strJson).$attrs.fontStyle).assertEqual('FontStyle.Italic');

    });

    it('testTextStyle012', 0, async () => {
      console.info('[testTextStyle012] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "fontStyle": FontStyle.Normal
          }
        }
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 39,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testTextStyle012] start to publish emit");
        events_emitter.emit(indexEvent, eventData);
      } catch (err) {
        console.log("[testTextStyle012] change component data error: " + err.message);
      }
      await Utils.sleep(3000);
      let strJson: string = getInspectorByKey('fontStyle');
      console.info("[testTextStyle012] component strJson:" + strJson);
      
      console.info("[testTextStyle012] fontStyle: " + JSON.parse(strJson).$attrs.fontStyle);
      expect(JSON.parse(strJson).$attrs.fontStyle).assertEqual('FontStyle.Normal');

    });

    it('testTextStyle013', 0, async () => {
      console.info('[testTextStyle013] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "fontStyle": 0x7FFFFFFF
          }
        }
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 39,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testTextStyle013] start to publish emit");
        events_emitter.emit(indexEvent, eventData);
      } catch (err) {
        console.log("[testTextStyle013] change component data error: " + err.message);
      }
      await Utils.sleep(3000);
      let strJson: string = getInspectorByKey('fontStyle');
      console.info("[testTextStyle013] component strJson:" + strJson);
      
      console.info("[testTextStyle013] fontStyle: " + JSON.parse(strJson).$attrs.fontStyle);
      expect(JSON.parse(strJson).$attrs.fontStyle).assertEqual('FontStyle.Normal');

    });

    it('testTextStyle014', 0, async () => {
      console.info('[testTextStyle014] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "fontStyle": 'error'
          }
        }
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 39,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testTextStyle014] start to publish emit");
        events_emitter.emit(indexEvent, eventData);
      } catch (err) {
        console.log("[testTextStyle014] change component data error: " + err.message);
      }
      await Utils.sleep(3000);
      let strJson: string = getInspectorByKey('fontStyle');
      console.info("[testTextStyle014] component strJson:" + strJson);
      
      console.info("[testTextStyle014] fontStyle: " + JSON.parse(strJson).$attrs.fontStyle);
      expect(JSON.parse(strJson).$attrs.fontStyle).assertEqual('FontStyle.Normal');

    });

    it('testTextStyle015', 0, async () => {
      console.info('[testTextStyle015] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "fontStyle": 0x80000000
          }
        }
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 39,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testTextStyle015] start to publish emit");
        events_emitter.emit(indexEvent, eventData);
      } catch (err) {
        console.log("[testTextStyle015] change component data error: " + err.message);
      }
      await Utils.sleep(3000);
      let strJson: string = getInspectorByKey('fontStyle');
      console.info("[testTextStyle015] component strJson:" + strJson);
      
      console.info("[testTextStyle015] fontStyle: " + JSON.parse(strJson).$attrs.fontStyle);
      expect(JSON.parse(strJson).$attrs.fontStyle).assertEqual('FontStyle.Normal');

    });

    it('testTextStyle016', 0, async () => {
      console.info('[testTextStyle016] START');
      await Utils.sleep(1000);
      let strJson: string = getInspectorByKey('fontWeight');
      console.info("[testTextStyle016] component strJson:" + strJson);
      
      console.info("[testTextStyle016] fontWeight: " + JSON.parse(strJson).$attrs.fontWeight);
      expect(JSON.parse(strJson).$attrs.fontWeight).assertEqual('700');

    });

    it('testTextStyle017', 0, async () => {
      console.info('[testTextStyle017] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "fontWeight": 400
          }
        }
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 40,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testTextStyle017] start to publish emit");
        events_emitter.emit(indexEvent, eventData);
      } catch (err) {
        console.log("[testTextStyle017] change component data error: " + err.message);
      }
      await Utils.sleep(3000);
      let strJson: string = getInspectorByKey('fontWeight');
      console.info("[testTextStyle017] component strJson:" + strJson);
      
      console.info("[testTextStyle017] fontWeight: " + JSON.parse(strJson).$attrs.fontWeight);
      expect(JSON.parse(strJson).$attrs.fontWeight).assertEqual('400');

    });

    it('testTextStyle018', 0, async () => {
      console.info('[testTextStyle018] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "fontWeight": 'error'
          }
        }
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 40,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testTextStyle018] start to publish emit");
        events_emitter.emit(indexEvent, eventData);
      } catch (err) {
        console.log("[testTextStyle018] change component data error: " + err.message);
      }
      await Utils.sleep(3000);
      let strJson: string = getInspectorByKey('fontWeight');
      console.info("[testTextStyle018] component strJson:" + strJson);
      
      console.info("[testTextStyle018] fontWeight: " + JSON.parse(strJson).$attrs.fontWeight);
      expect(JSON.parse(strJson).$attrs.fontWeight).assertEqual('FontWeight.Normal');

    });

    it('testTextStyle019', 0, async () => {
      console.info('[testTextStyle019] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "fontWeight": 0x80000000
          }
        }
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 40,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testTextStyle019] start to publish emit");
        events_emitter.emit(indexEvent, eventData);
      } catch (err) {
        console.log("[testTextStyle019] change component data error: " + err.message);
      }
      await Utils.sleep(3000);
      let strJson: string = getInspectorByKey('fontWeight');
      console.info("[testTextStyle019] component strJson:" + strJson);
      
      console.info("[testTextStyle019] fontWeight: " + JSON.parse(strJson).$attrs.fontWeight);
      expect(JSON.parse(strJson).$attrs.fontWeight).assertEqual('FontWeight.Normal');

    });

    it('testTextStyle020', 0, async () => {
      console.info('[testTextStyle020] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "fontWeight": 0x7FFFFFFF
          }
        }
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 40,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testTextStyle020] start to publish emit");
        events_emitter.emit(indexEvent, eventData);
      } catch (err) {
        console.log("[testTextStyle020] change component data error: " + err.message);
      }
      await Utils.sleep(3000);
      let strJson: string = getInspectorByKey('fontWeight');
      console.info("[testTextStyle020] component strJson:" + strJson);
      
      console.info("[testTextStyle020] fontWeight: " + JSON.parse(strJson).$attrs.fontWeight);
      expect(JSON.parse(strJson).$attrs.fontWeight).assertEqual('FontWeight.Normal');

    });

    it('testTextStyle021', 0, async () => {
      console.info('[testTextStyle021] START');
      await Utils.sleep(1000);
      let strJson: string = getInspectorByKey('fontFamily');
      console.info("[testTextStyle021] component strJson:" + strJson);
      
      console.info("[testTextStyle021] fontFamily: " + JSON.parse(strJson).$attrs.fontFamily);
      expect(JSON.parse(strJson).$attrs.fontFamily).assertEqual('sans-serif');

    });

    it('testTextStyle022', 0, async () => {
      console.info('[testTextStyle022] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "fontFamily": 'Arial'
          }
        }
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 41,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testTextStyle022] start to publish emit");
        events_emitter.emit(indexEvent, eventData);
      } catch (err) {
        console.log("[testTextStyle022] change component data error: " + err.message);
      }
      await Utils.sleep(3000);
      let strJson: string = getInspectorByKey('fontFamily');
      console.info("[testTextStyle022] component strJson:" + strJson);
      
      console.info("[testTextStyle022] fontFamily: " + JSON.parse(strJson).$attrs.fontFamily);
      expect(JSON.parse(strJson).$attrs.fontFamily).assertEqual('Arial');

    });

    it('testTextStyle023', 0, async () => {
      console.info('[testTextStyle023] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "fontFamily": 'error'
          }
        }
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 41,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testTextStyle023] start to publish emit");
        events_emitter.emit(indexEvent, eventData);
      } catch (err) {
        console.log("[testTextStyle023] change component data error: " + err.message);
      }
      await Utils.sleep(3000);
      let strJson: string = getInspectorByKey('fontFamily');
      console.info("[testTextStyle023] component strJson:" + strJson);
      
      console.info("[testTextStyle023] fontFamily: " + JSON.parse(strJson).$attrs.fontFamily);
      expect(JSON.parse(strJson).$attrs.fontFamily).assertEqual('error');
    });
  });
}