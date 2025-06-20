/*
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

import { describe, beforeEach, afterEach, it, expect, Level } from '@ohos/hypium'
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';

export default function select() {
  describe('ActsAceBasicSelectTest', () => {
    beforeEach(async (done: Function) => {
      await Utils.sleep(2000);
      console.info("select beforeEach start");
      done();
    })
    afterEach(async (done: Function) => {
      console.info("[selectTest_afterEach] start");
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "spaceValue": 8,
            "arrowPosition": ArrowPosition.END,
            "spaceValueString": '50.00vp'
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 181,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[selectTest_afterEach] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[selectTest_afterEach] change component data error: " +(err as Error).message);
      }
      done();
    })

    /**
     * @tc.number ArkUI_Stage_Select_Layout_0100
     * @tc.name Tests the arrowPosition property of the select component
     * @tc.desc the default arrowPosition parameter is "ArrowPosition.END"
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('ArkUI_Stage_Select_Layout_0100', Level.LEVEL0, async (done: Function) => {
      console.info("ArkUI_Stage_Select_Layout_0100 start");
      let strJson = getInspectorByKey('selectTest');
      
      console.info("ArkUI_Stage_Select_Layout_0100: arrowPosition=" + JSON.parse(strJson).$attrs.arrowPosition)
      expect(JSON.parse(strJson).$attrs.arrowPosition == 'ArrowPosition.END').assertTrue();
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Select_Layout_0200
     * @tc.name Tests the arrowPosition property of the select component
     * @tc.desc set arrowPosition to "ArrowPosition.START"
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('ArkUI_Stage_Select_Layout_0200', Level.LEVEL0, async (done: Function) => {
      console.info("ArkUI_Stage_Select_Layout_0200 start");
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "arrowPosition": ArrowPosition.START
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 181,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Select_Layout_0200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Select_Layout_0200] change component data error: " + (err as Error).message);

      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('selectTest');
      
      console.info("[ArkUI_Stage_Select_Layout_0200] arrowPosition:" + JSON.parse(strJson).$attrs.arrowPosition);
      expect(JSON.parse(strJson).$attrs.arrowPosition == 'ArrowPosition.START').assertTrue();
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Select_Layout_0300
     * @tc.name Tests the arrowPosition property of the select component
     * @tc.desc set arrowPosition to abnormol value null then get the default value ArrowPosition.END
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('ArkUI_Stage_Select_Layout_0300', Level.LEVEL0, async (done: Function) => {
      console.info("ArkUI_Stage_Select_Layout_0300 start");
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "arrowPosition": null
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 181,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Select_Layout_0300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Select_Layout_0300] change component data error: " + (err as Error).message);

      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('selectTest');
      
      console.info("[ArkUI_Stage_Select_Layout_0300] arrowPosition:" + JSON.parse(strJson).$attrs.arrowPosition);
      expect(JSON.parse(strJson).$attrs.arrowPosition == 'ArrowPosition.END').assertTrue();
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Select_Layout_0400
     * @tc.name Tests the arrowPosition property of the select component
     * @tc.desc set arrowPosition to abnormol value -1 then get the default value "ArrowPosition.END"
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('ArkUI_Stage_Select_Layout_0400', Level.LEVEL0, async (done: Function) => {
      console.info("ArkUI_Stage_Select_Layout_0400 start");
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "arrowPosition": -1
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 181,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Select_Layout_0400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Select_Layout_0400] change component data error: " + (err as Error).message);

      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('selectTest');
      
      console.info("[ArkUI_Stage_Select_Layout_0400] arrowPosition:" + JSON.parse(strJson).$attrs.arrowPosition);
      expect(JSON.parse(strJson).$attrs.arrowPosition == 'ArrowPosition.END').assertTrue();
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Select_Space_0100
     * @tc.name Tests the space property of the select component
     * @tc.desc get the default value of "space" is '8.00vp'
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('ArkUI_Stage_Select_Space_0100', Level.LEVEL0, async (done: Function) => {
      console.info("ArkUI_Stage_Select_Space_0100 start");
      let strJson = getInspectorByKey('selectTest');
      
      console.info("ArkUI_Stage_Select_Space_0100: space=" + JSON.parse(strJson).$attrs.space);
      expect(JSON.parse(strJson).$attrs.space).assertEqual('8.00vp');
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Select_Space_0200
     * @tc.name Tests the space property of the select component
     * @tc.desc set space to 20.00 then get the value is '20.00vp'
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('ArkUI_Stage_Select_Space_0200', Level.LEVEL0, async (done: Function) => {
      console.info("ArkUI_Stage_Select_Space_0200 start");
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "spaceValue": 20.00
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 181,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Select_Space_0200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Select_Space_0200] change component data error: " + (err as Error).message);

      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('selectTest');
      
      console.info("[ArkUI_Stage_Select_Space_0200] space:" + JSON.parse(strJson).$attrs.space);
      expect(JSON.parse(strJson).$attrs.space).assertEqual('20.00vp');
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Select_Space_0300
     * @tc.name Tests the space property of the select component
     * @tc.desc set space to string type '40.00vp' then get the value is '40.00vp'
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('ArkUI_Stage_Select_Space_0300', Level.LEVEL0, async (done: Function) => {
      console.info("ArkUI_Stage_Select_Space_0300 start");
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "spaceValueString": '40.00vp'
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 181,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Select_Space_0300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Select_Space_0300] change component data error: " + (err as Error).message);

      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('selectTest2');
      
      console.info("[ArkUI_Stage_Select_Space_0300] space:" + JSON.parse(strJson).$attrs.space);
      expect(JSON.parse(strJson).$attrs.space).assertEqual('40.00vp');
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Select_Space_0400
     * @tc.name Tests the space property of the select component
     * @tc.desc set space to abnormol value null then get the default value is '8.00vp'
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('ArkUI_Stage_Select_Space_0400', Level.LEVEL0, async (done: Function) => {
      console.info("ArkUI_Stage_Select_Space_0400 start");
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "spaceValue": null
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 181,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Select_Space_0400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Select_Space_0400] change component data error: " + (err as Error).message);

      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('selectTest');
      
      console.info("[ArkUI_Stage_Select_Space_0400] space:" + JSON.parse(strJson).$attrs.space);
      expect(JSON.parse(strJson).$attrs.space).assertEqual('8.00vp');
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Select_Space_0500
     * @tc.name Tests the space property of the select component
     * @tc.desc set space to abnormol value -1 then get the default value is '8.00vp'
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('ArkUI_Stage_Select_Space_0500', Level.LEVEL0, async (done: Function) => {
      console.info("ArkUI_Stage_Select_Space_0500 start");
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "spaceValue": -1
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 181,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Select_Space_0500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Select_Space_0500] change component data error: " + (err as Error).message);

      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('selectTest');
      
      console.info("[ArkUI_Stage_Select_Space_0500] space:" + JSON.parse(strJson).$attrs.space);
      expect(JSON.parse(strJson).$attrs.space).assertEqual('8.00vp');
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Select_Space_0600
     * @tc.name Tests the space property of the select component
     * @tc.desc set space to normol resource type then get the correct value is '50.00vp'
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('ArkUI_Stage_Select_Space_0600', Level.LEVEL0, async (done: Function) => {
      console.info("ArkUI_Stage_Select_Space_0600 start");
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "spaceValueResource": $r('app.string.Test_Values')
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 181,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Select_Space_0600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Select_Space_0600] change component data error: " + (err as Error).message);

      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('selectTest3');
      
      console.info("[ArkUI_Stage_Select_Space_0600] space:" + JSON.parse(strJson).$attrs.space);
      expect(JSON.parse(strJson).$attrs.space).assertEqual('50.00vp');
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Select_Space_0700
     * @tc.name Tests the space property of the select component
     * @tc.desc set space to string type '40.00vp' then get the value is '40.00vp'
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('ArkUI_Stage_Select_Space_0700', Level.LEVEL0, async (done: Function) => {
      console.info("ArkUI_Stage_Select_Space_0700 start");
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "spaceValueString": "40.00px"
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 181,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Select_Space_0700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Select_Space_0700] change component data error: " + (err as Error).message);

      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('selectTest2');
      
      console.info("[ArkUI_Stage_Select_Space_0700] space:" + JSON.parse(strJson).$attrs.space);
      expect(JSON.parse(strJson).$attrs.space).assertEqual('40.00px');
      //expect(JSON.parse(strJson).$attrs.space == expectString).assertTrue();
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Select_Space_0800
     * @tc.name Tests the space property of the select component
     * @tc.desc set space to string type '40.00vp' then get the value is '40.00vp'
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('ArkUI_Stage_Select_Space_0800', Level.LEVEL0, async (done: Function) => {
      console.info("ArkUI_Stage_Select_Space_0800 start");
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "spaceValueString": "40.00lpx"
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 181,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Select_Space_0800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Select_Space_0800] change component data error: " + (err as Error).message);

      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('selectTest2');
      
      console.info("[ArkUI_Stage_Select_Space_0800] space:" + JSON.parse(strJson).$attrs.space);
      expect(JSON.parse(strJson).$attrs.space).assertEqual('40.00lpx');
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Select_Space_0900
     * @tc.name Tests the space property of the select component
     * @tc.desc set space to string type '40.00vp' then get the value is '40.00vp'
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('ArkUI_Stage_Select_Space_0900', Level.LEVEL0, async (done: Function) => {
      console.info("ArkUI_Stage_Select_Space_0900 start");
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "spaceValueString": "40.00fp"
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 181,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Select_Space_0900] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Select_Space_0900] change component data error: " + (err as Error).message);

      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('selectTest2');
      
      console.info("[ArkUI_Stage_Select_Space_0900] space:" + JSON.parse(strJson).$attrs.space);
      expect(JSON.parse(strJson).$attrs.space).assertEqual('40.00fp');
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Select_Size_1000
     * @tc.name Tests the controlSize property of the select component
     * @tc.desc set controlSize to "ControlSize.Normal"
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('ArkUI_Stage_Select_Size_1000', Level.LEVEL0, async (done: Function) => {
      console.info("ArkUI_Stage_Select_Size_1000 start");
      let strJson = getInspectorByKey('ArkUI_Stage_Select_Size_1000');
      
      console.info("[ArkUI_Stage_Select_Size_1000] str:" + strJson);
      console.info("[ArkUI_Stage_Select_Size_1000] json:" + JSON.stringify(JSON.parse(strJson).$attrs));
      console.info("[ArkUI_Stage_Select_Size_1000] space:" + JSON.parse(strJson).$attrs.controlSize);
      expect(JSON.parse(strJson).$attrs.controlSize).assertEqual('ControlSize.NORMAL');
      done();
    });
  })
}