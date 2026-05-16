
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter';
import CommonFunc from '../../MainAbility/common/Common';
import { resourceManager } from '@kit.LocalizationKit';
import { BusinessError } from '@kit.BasicServicesKit';

export default function TextStyleJsunit() {
  describe('TextStyleJsunit', () => {
    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Text/TextStyleJsunit',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextStyleJsunit state pages:" + JSON.stringify(pages));
        if (!("TextStyleJsunit" == pages.name)) {
          console.info("get TextStyleJsunit state pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push TextStyleJsunit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextStyleJsunit page error:" + err);
      }

    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("TextStyleJsunit after each called");
    });
	let resourceSize = getContext().resourceManager.getNumber($r('sys.float.ohos_id_text_font_size').id)
    /**
     * @tc.name   testTextStyle006
     * @tc.number testTextStyle006
     * @tc.desc   set Text_Style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextStyle006', Level.LEVEL1, async () => {
      console.info('[testTextStyle006] START');
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('fontSize');
      console.info("[testTextStyle006] component strJson:" + strJson);
      console.info("[testTextStyle006] fontSize: " + JSON.parse(strJson).$attrs.fontSize);
	  console.info("[testTextStyle006] fontSize: " + $r('sys.float.ohos_id_text_font_size'));
	  expect(JSON.parse(strJson).$attrs.fontSize).assertEqual(px2fp(resourceSize)+'.00fp');
	  
    });
    /**
     * @tc.name   testTextStyle007
     * @tc.number testTextStyle007
     * @tc.desc   set Text_Style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextStyle007', Level.LEVEL1, async () => {
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
      await CommonFunc.sleep(4000);
      let strJson: string = getInspectorByKey('fontSize');
      console.info("[testTextStyle007] component strJson:" + strJson);
      
      console.info("[testTextStyle007] fontSize: " + JSON.parse(strJson).$attrs.fontSize);

	  expect(JSON.parse(strJson).$attrs.fontSize).assertEqual(px2fp(resourceSize)+'.00fp');
    });
    /**
     * @tc.name   testTextStyle008
     * @tc.number testTextStyle008
     * @tc.desc   set Text_Style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextStyle008', Level.LEVEL1, async () => {
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
      await CommonFunc.sleep(4000);
      let strJson: string = getInspectorByKey('fontSize');
      console.info("[testTextStyle008] component strJson:" + strJson);
      
      console.info("[testTextStyle008] fontSize: " + JSON.parse(strJson).$attrs.fontSize);

	  expect(JSON.parse(strJson).$attrs.fontSize).assertEqual(px2fp(resourceSize)+'.00fp');
    });
    /**
     * @tc.name   testTextStyle009
     * @tc.number testTextStyle009
     * @tc.desc   set Text_Style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextStyle009', Level.LEVEL1, async () => {
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
      await CommonFunc.sleep(4000);
      let strJson: string = getInspectorByKey('fontSize');
      console.info("[testTextStyle009] component strJson:" + strJson);
      
      console.info("[testTextStyle009] fontSize: " + JSON.parse(strJson).$attrs.fontSize);

	  expect(JSON.parse(strJson).$attrs.fontSize).assertEqual(px2fp(resourceSize)+'.00fp');
    });
    /**
     * @tc.name   testTextStyle010
     * @tc.number testTextStyle010
     * @tc.desc   set Text_Style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextStyle010', Level.LEVEL1, async () => {
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
      await CommonFunc.sleep(4000);
      let strJson: string = getInspectorByKey('fontSize');
      console.info("[testTextStyle010] component strJson:" + strJson);
      
      console.info("[testTextStyle010] fontSize: " + JSON.parse(strJson).$attrs.fontSize);

	  expect(JSON.parse(strJson).$attrs.fontSize).assertEqual(px2fp(resourceSize)+'.00fp');

    });
    /**
     * @tc.name   testTextStyle011
     * @tc.number testTextStyle011
     * @tc.desc   set Text_Style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextStyle011', Level.LEVEL1, async () => {
      console.info('[testTextStyle011] START');
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('fontStyle');
      console.info("[testTextStyle011] component strJson:" + strJson);
      
      console.info("[testTextStyle011] fontStyle: " + JSON.parse(strJson).$attrs.fontStyle);
      expect(JSON.parse(strJson).$attrs.fontStyle).assertEqual('FontStyle.Italic');

    });
    /**
     * @tc.name   testTextStyle012
     * @tc.number testTextStyle012
     * @tc.desc   set Text_Style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextStyle012', Level.LEVEL1, async () => {
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
      await CommonFunc.sleep(3000);
      let strJson: string = getInspectorByKey('fontStyle');
      console.info("[testTextStyle012] component strJson:" + strJson);
      
      console.info("[testTextStyle012] fontStyle: " + JSON.parse(strJson).$attrs.fontStyle);
      expect(JSON.parse(strJson).$attrs.fontStyle).assertEqual('FontStyle.Normal');

    });
    /**
     * @tc.name   testTextStyle013
     * @tc.number testTextStyle013
     * @tc.desc   set Text_Style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextStyle013', Level.LEVEL1, async () => {
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
      await CommonFunc.sleep(3000);
      let strJson: string = getInspectorByKey('fontStyle');
      console.info("[testTextStyle013] component strJson:" + strJson);
      
      console.info("[testTextStyle013] fontStyle: " + JSON.parse(strJson).$attrs.fontStyle);
      expect(JSON.parse(strJson).$attrs.fontStyle).assertEqual('FontStyle.Normal');

    });
    /**
     * @tc.name   testTextStyle014
     * @tc.number testTextStyle014
     * @tc.desc   set Text_Style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextStyle014', Level.LEVEL1, async () => {
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
      await CommonFunc.sleep(3000);
      let strJson: string = getInspectorByKey('fontStyle');
      console.info("[testTextStyle014] component strJson:" + strJson);
      
      console.info("[testTextStyle014] fontStyle: " + JSON.parse(strJson).$attrs.fontStyle);
      expect(JSON.parse(strJson).$attrs.fontStyle).assertEqual('FontStyle.Normal');

    });
    /**
     * @tc.name   testTextStyle015
     * @tc.number testTextStyle015
     * @tc.desc   set Text_Style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextStyle015', Level.LEVEL1, async () => {
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
      await CommonFunc.sleep(3000);
      let strJson: string = getInspectorByKey('fontStyle');
      console.info("[testTextStyle015] component strJson:" + strJson);
      
      console.info("[testTextStyle015] fontStyle: " + JSON.parse(strJson).$attrs.fontStyle);
      expect(JSON.parse(strJson).$attrs.fontStyle).assertEqual('FontStyle.Normal');

    });
    /**
     * @tc.name   testTextStyle016
     * @tc.number testTextStyle016
     * @tc.desc   set Text_Style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextStyle016', Level.LEVEL1, async () => {
      console.info('[testTextStyle016] START');
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('fontWeight');
      console.info("[testTextStyle016] component strJson:" + strJson);
      
      console.info("[testTextStyle016] fontWeight: " + JSON.parse(strJson).$attrs.fontWeight);
      expect(JSON.parse(strJson).$attrs.fontWeight).assertEqual('700');

    });
    /**
     * @tc.name   testTextStyle017
     * @tc.number testTextStyle017
     * @tc.desc   set Text_Style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextStyle017', Level.LEVEL1, async () => {
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
      await CommonFunc.sleep(3000);
      let strJson: string = getInspectorByKey('fontWeight');
      console.info("[testTextStyle017] component strJson:" + strJson);
      
      console.info("[testTextStyle017] fontWeight: " + JSON.parse(strJson).$attrs.fontWeight);
      expect(JSON.parse(strJson).$attrs.fontWeight).assertEqual('400');

    });
    /**
     * @tc.name   testTextStyle018
     * @tc.number testTextStyle018
     * @tc.desc   set Text_Style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextStyle018', Level.LEVEL1, async () => {
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
      await CommonFunc.sleep(3000);
      let strJson: string = getInspectorByKey('fontWeight');
      console.info("[testTextStyle018] component strJson:" + strJson);
      
      console.info("[testTextStyle018] fontWeight: " + JSON.parse(strJson).$attrs.fontWeight);
      expect(JSON.parse(strJson).$attrs.fontWeight).assertEqual('FontWeight.Normal');

    });
    /**
     * @tc.name   testTextStyle019
     * @tc.number testTextStyle019
     * @tc.desc   set Text_Style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextStyle019', Level.LEVEL1, async () => {
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
      await CommonFunc.sleep(3000);
      let strJson: string = getInspectorByKey('fontWeight');
      console.info("[testTextStyle019] component strJson:" + strJson);
      
      console.info("[testTextStyle019] fontWeight: " + JSON.parse(strJson).$attrs.fontWeight);
      expect(JSON.parse(strJson).$attrs.fontWeight).assertEqual('FontWeight.Normal');

    });
    /**
     * @tc.name   testTextStyle020
     * @tc.number testTextStyle020
     * @tc.desc   set Text_Style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextStyle020', Level.LEVEL1, async () => {
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
      await CommonFunc.sleep(3000);
      let strJson: string = getInspectorByKey('fontWeight');
      console.info("[testTextStyle020] component strJson:" + strJson);
      
      console.info("[testTextStyle020] fontWeight: " + JSON.parse(strJson).$attrs.fontWeight);
      expect(JSON.parse(strJson).$attrs.fontWeight).assertEqual('FontWeight.Normal');

    });
    /**
     * @tc.name   testTextStyle021
     * @tc.number testTextStyle021
     * @tc.desc   set Text_Style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextStyle021', Level.LEVEL1, async () => {
      console.info('[testTextStyle021] START');
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('fontFamily');
      console.info("[testTextStyle021] component strJson:" + strJson);
      
      console.info("[testTextStyle021] fontFamily: " + JSON.parse(strJson).$attrs.fontFamily);
      expect(JSON.parse(strJson).$attrs.fontFamily).assertEqual('sans-serif');

    });
    /**
     * @tc.name   testTextStyle022
     * @tc.number testTextStyle022
     * @tc.desc   set Text_Style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextStyle022', Level.LEVEL1, async () => {
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
      await CommonFunc.sleep(3000);
      let strJson: string = getInspectorByKey('fontFamily');
      console.info("[testTextStyle022] component strJson:" + strJson);
      
      console.info("[testTextStyle022] fontFamily: " + JSON.parse(strJson).$attrs.fontFamily);
      expect(JSON.parse(strJson).$attrs.fontFamily).assertEqual('Arial');

    });
    /**
     * @tc.name   testTextStyle023
     * @tc.number testTextStyle023
     * @tc.desc   set Text_Style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextStyle023', Level.LEVEL1, async () => {
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
      await CommonFunc.sleep(3000);
      let strJson: string = getInspectorByKey('fontFamily');
      console.info("[testTextStyle023] component strJson:" + strJson);
      
      console.info("[testTextStyle023] fontFamily: " + JSON.parse(strJson).$attrs.fontFamily);
      expect(JSON.parse(strJson).$attrs.fontFamily).assertEqual('error');
    });
  });
}