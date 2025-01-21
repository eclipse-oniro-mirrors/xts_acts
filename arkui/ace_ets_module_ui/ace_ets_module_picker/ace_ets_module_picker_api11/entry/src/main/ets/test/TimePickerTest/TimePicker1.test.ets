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
import { describe, beforeEach, afterEach, it, expect } from '@ohos/hypium'
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils.ets';
import router from '@ohos.router';
import CommonFunc from "../../MainAbility/common/Common";


interface FontStyleCls {
  size: Length,
  weight: FontWeight | string
}

interface TextStyleCls {
  color: Color | number | string,
  font: FontStyleCls
}

export default function TimePicker1Test() {
  describe('TimePicker1Test', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: "MainAbility/pages/TimePicker/TimePicker1",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TimePicker state pages: " + JSON.stringify(pages));
        if (!("TimePicker1" == pages.name)) {
          console.info("get TimePicker state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push TimePicker page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TimePicker page error: " + err);
        expect().assertFail();
      }
      done()
    });

    afterEach(async (done: Function) => {
      console.info("timepicker afterEach start");

      try {
        let value1: TextStyleCls = {
          color: Color.Black, font: {
            size: 8, weight: FontWeight.Lighter
          }
        }

        let value2: TextStyleCls = {
          color: Color.Red, font: {
            size: '10px', weight: FontWeight.Normal
          }
        }

        let value3: TextStyleCls = {
          color: Color.Blue, font: {
            size: '20px', weight: FontWeight.Bold
          }
        }

        let eventData: events_emitter.EventData = {
          data: {
            "disappearTextStyle": JSON.stringify(value1),
            "textStyle": JSON.stringify(value2),
            "selectedTextStyle": JSON.stringify(value3)
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 184,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[timepicker_afterEach] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[selectTest_afterEach] change component data error: " + err.message);
      }
      done();
    })

    /*
     * @tc.number       ArkUI_Stage_timepicker_disappearTextStyle_0100
     * @tc.name         Tests the disappearTextStyle property of the picker component
     * @tc.desc         get the default value
     */
    it('ArkUI_Stage_timepicker_disappearTextStyle_0100', 0, async (done: Function) => {
      let strJson = getInspectorByKey('timePicker');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_timepicker_disappearTextStyle_0100] disappearColor:" + obj.$attrs.disappearTextStyle.color);
      expect(obj.$attrs.disappearTextStyle.color).assertEqual('#FF000000');
      expect(obj.$attrs.disappearTextStyle.font.size).assertEqual('8.00fp');
      expect(obj.$attrs.disappearTextStyle.font.weight).assertEqual('FontWeight.Lighter');
      done();
    });

    /*
     * @tc.number       ArkUI_Stage_timepicker_disappearTextStyle_0200
     * @tc.name         Tests the disappearTextStyle property of the picker component
     * @tc.desc         set disappearTextStyle then get the value
     */
    it('ArkUI_Stage_timepicker_disappearTextStyle_0200', 0, async (done: Function) => {
      let value: TextStyleCls = {
        color: Color.Black, font: {
          size: 8, weight: FontWeight.Bolder
        }
      }
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "disappearTextStyle": JSON.stringify(value)
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 184,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_timepicker_disappearTextStyle_0200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_timepicker_disappearTextStyle_0200] change component data error: " + err.message);
      }
      await Utils.sleep(3000);
      let strJson = getInspectorByKey('timePicker');
      let obj: ESObject = JSON.parse(strJson);
      console.error("[ArkUI_Stage_timepicker_disappearTextStyle_0200] disappearColor:" + obj.$attrs.disappearTextStyle.color);
      expect(obj.$attrs.disappearTextStyle.color).assertEqual('#FF000000');
      expect(obj.$attrs.disappearTextStyle.font.size).assertEqual('8.00fp');
      expect(obj.$attrs.disappearTextStyle.font.weight).assertEqual('FontWeight.Bolder');
      done();
    });

    /*
     * @tc.number       ArkUI_Stage_timepicker_disappearTextStyle_0300
     * @tc.name         Tests the disappearTextStyle property of the picker component
     * @tc.desc         set disappearTextStyle then get the value
     */
    it('ArkUI_Stage_timepicker_disappearTextStyle_0300', 0, async (done: Function) => {
      let value: TextStyleCls = {
        color: 0x808080, font: {
          size: 8, weight: 100
        }
      }
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "disappearTextStyle": JSON.stringify(value)
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 184,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_timepicker_disappearTextStyle_0300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_timepicker_disappearTextStyle_0300] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('timePicker');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_timePicker_disappearTextStyle_0300] disappearColor:" + obj.$attrs.disappearTextStyle.color);
      expect(obj.$attrs.disappearTextStyle.color).assertEqual('#FF808080');
      expect(obj.$attrs.disappearTextStyle.font.size).assertEqual('8.00fp');
      expect(obj.$attrs.disappearTextStyle.font.weight).assertEqual('100');
      done();
    });

    /*
     * @tc.number       ArkUI_Stage_timepicker_disappearTextStyle_0400
     * @tc.name         Tests the disappearTextStyle property of the picker component
     * @tc.desc         set disappearTextStyle then get the value
     */
    it('ArkUI_Stage_timepicker_disappearTextStyle_0400', 0, async (done: Function) => {
      let value: TextStyleCls = {
        color: '#ff0000', font: {
          size: '1px', weight: '700'
        }
      }
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "disappearTextStyle": JSON.stringify(value)
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 184,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_timepicker_disappearTextStyle_0400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_timepicker_disappearTextStyle_0400] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('timePicker');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_timepicker_disappearTextStyle_0400] disappearColor:" + obj.$attrs.disappearTextStyle.color);
      expect(obj.$attrs.disappearTextStyle.color).assertEqual('#FFFF0000');
      expect(obj.$attrs.disappearTextStyle.font.size).assertEqual('1.00px');
      expect(obj.$attrs.disappearTextStyle.font.weight).assertEqual('700');
      done();
    });

    /*
     * @tc.number       ArkUI_Stage_timepicker_disappearTextStyle_0500
     * @tc.name         Tests the disappearTextStyle property of the picker component
     * @tc.desc         set disappearTextStyle then get the value
     */
    it('ArkUI_Stage_timepicker_disappearTextStyle_0500', 0, async (done: Function) => {
      let value: TextStyleCls = {
        color: Color.Green, font: {
          size: 30, weight: 450
        }
      }
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "disappearTextStyle": JSON.stringify(value)
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 184,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_timepicker_disappearTextStyle_0500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_timepicker_disappearTextStyle_0500] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('timePicker');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_timepicker_disappearTextStyle_0500] disappearColor:" + obj.$attrs.disappearTextStyle.color);
      expect(obj.$attrs.disappearTextStyle.color).assertEqual('#FF008000');
      expect(obj.$attrs.disappearTextStyle.font.size).assertEqual('30.00fp');
      expect(obj.$attrs.disappearTextStyle.font.weight).assertEqual('FontWeight.Normal');
      done();
    });

    /*
     * @tc.number       ArkUI_Stage_timepicker_disappearTextStyle_0600
     * @tc.name         Tests the disappearTextStyle property of the picker component
     * @tc.desc         set disappearTextStyle then get the value
     */
    it('ArkUI_Stage_timepicker_disappearTextStyle_0600', 0, async (done: Function) => {
      let value: TextStyleCls = {
        color: '#80808g', font: {
          size: -1, weight: 1000
        }
      }
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "disappearTextStyle": JSON.stringify(value)
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 184,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_timepicker_disappearTextStyle_0600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_timepicker_disappearTextStyle_0600] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('timePicker');
      let obj: ESObject = JSON.parse(strJson);

      let strJsonDefault = getInspectorByKey('timePickerDefault');
      let objDefault: ESObject = JSON.parse(strJsonDefault);

      console.info("[ArkUI_Stage_timepicker_disappearTextStyle_0600] disappearColor:" + obj.$attrs.disappearTextStyle.color);
      expect(obj.$attrs.disappearTextStyle.color).assertEqual(objDefault.$attrs.disappearTextStyle.color);
      expect(obj.$attrs.disappearTextStyle.font.size).assertEqual(objDefault.$attrs.disappearTextStyle.font.size);
      expect(obj.$attrs.disappearTextStyle.font.weight).assertEqual('FontWeight.Normal');
      done();
    });

    /*
     * @tc.number       ArkUI_Stage_timepicker_disappearTextStyle_0700
     * @tc.name         Tests the disappearTextStyle property of the picker component
     * @tc.desc         set disappearTextStyle then get the value
     */
    it('ArkUI_Stage_timepicker_disappearTextStyle_0700', 0, async (done: Function) => {
      let value: TextStyleCls = {
        color: 'xxx', font: {
          size: 'xxx', weight: FontWeight.Bold
        }
      }
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "disappearTextStyle": JSON.stringify(value)
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 184,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_timepicker_disappearTextStyle_0700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_timepicker_disappearTextStyle_0700] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('timePicker');
      let obj: ESObject = JSON.parse(strJson);

      let strJsonDefault = getInspectorByKey('timePickerDefault');
      let objDefault: ESObject = JSON.parse(strJsonDefault);

      console.info("[ArkUI_Stage_timepicker_disappearTextStyle_0700] disappearColor:" + obj.$attrs.disappearTextStyle.color);
      expect(obj.$attrs.disappearTextStyle.color).assertEqual(objDefault.$attrs.disappearTextStyle.color);
      expect(obj.$attrs.disappearTextStyle.font.size).assertEqual(objDefault.$attrs.disappearTextStyle.font.size);
      expect(obj.$attrs.disappearTextStyle.font.weight).assertEqual('FontWeight.Bold');
      done();
    });

    /*
      * @tc.number       ArkUI_Stage_timepicker_disappearTextStyle_0800
      * @tc.name         Tests the disappearTextStyle property of the picker component
      * @tc.desc         set disappearTextStyle then get the value
      */
    it('ArkUI_Stage_timepicker_disappearTextStyle_0800', 0, async (done: Function) => {
      let value: TextStyleCls = {
        color: 'rgb(138,43,226)', font: {
          size: '20vp', weight: 900
        }
      }
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "disappearTextStyle": JSON.stringify(value)
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 184,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_timepicker_disappearTextStyle_0800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_timepicker_disappearTextStyle_0800] change component data error: " + err.message);
      }
      await Utils.sleep(3000);
      let strJson = getInspectorByKey('timePicker');
      let obj: ESObject = JSON.parse(strJson);
      expect(obj.$attrs.disappearTextStyle.color).assertEqual('#FF8A2BE2');
      expect(obj.$attrs.disappearTextStyle.font.size).assertEqual('20.00vp');
      expect(obj.$attrs.disappearTextStyle.font.weight).assertEqual('900');
      done();
    });

    /*
      * @tc.number       ArkUI_Stage_timepicker_disappearTextStyle_0900
      * @tc.name         Tests the disappearTextStyle property of the picker component
      * @tc.desc         set disappearTextStyle then get the value
      */
    it('ArkUI_Stage_timepicker_disappearTextStyle_0900', 0, async (done: Function) => {
      let value: TextStyleCls = {
        color: 'rgb(138,43,226)', font: {
          size: '15lpx', weight: 90
        }
      }
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "disappearTextStyle": JSON.stringify(value)
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 184,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_timepicker_disappearTextStyle_0900] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_timepicker_disappearTextStyle_0900] change component data error: " + err.message);
      }
      await Utils.sleep(3000);
      let strJson = getInspectorByKey('timePicker');
      let obj: ESObject = JSON.parse(strJson);
      expect(obj.$attrs.disappearTextStyle.color).assertEqual('#FF8A2BE2');
      expect(obj.$attrs.disappearTextStyle.font.size).assertEqual('15.00lpx');
      expect(obj.$attrs.disappearTextStyle.font.weight).assertEqual('FontWeight.Normal');
      done();
    });

    /*
     * @tc.number       ArkUI_Stage_timepicker_textStyle_0100
     * @tc.name         Tests the textStyle property of the picker component
     * @tc.desc         get the default value
     */
    it('ArkUI_Stage_timepicker_textStyle_0100', 0, async (done: Function) => {
      let strJson = getInspectorByKey('timePicker');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_timepicker_textStyle_0100] disappearColor:" + obj.$attrs.textStyle.color);
      expect(obj.$attrs.textStyle.color).assertEqual('#FFFF0000');
      expect(obj.$attrs.textStyle.font.size).assertEqual('10.00px');
      expect(obj.$attrs.textStyle.font.weight).assertEqual('FontWeight.Normal');
      done();
    });

    /*
     * @tc.number       ArkUI_Stage_timepicker_textStyle_0200
     * @tc.name         Tests the textStyle property of the picker component
     * @tc.desc         set textStyle then get the value
     */
    it('ArkUI_Stage_timepicker_textStyle_0200', 0, async (done: Function) => {
      let value: TextStyleCls = {
        color: Color.Red, font: {
          size: '10px', weight: FontWeight.Bolder
        }
      }
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "textStyle": JSON.stringify(value)
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 184,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_timepicker_textStyle_0200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_timepicker_textStyle_0200] change component data error: " + err.message);
      }
      await Utils.sleep(3000);
      let strJson = getInspectorByKey('timePicker');
      let obj: ESObject = JSON.parse(strJson);
      console.error("[ArkUI_Stage_timepicker_textStyle_0200] disappearColor:" + obj.$attrs.textStyle.color);
      expect(obj.$attrs.textStyle.color).assertEqual('#FFFF0000');
      expect(obj.$attrs.textStyle.font.size).assertEqual('10.00px');
      expect(obj.$attrs.textStyle.font.weight).assertEqual('FontWeight.Bolder');
      done();
    });

    /*
     * @tc.number       ArkUI_Stage_timepicker_textStyle_0300
     * @tc.name         Tests the textStyle property of the picker component
     * @tc.desc         set textStyle then get the value
     */
    it('ArkUI_Stage_timepicker_textStyle_0300', 0, async (done: Function) => {
      let value: TextStyleCls = {
        color: 0xFF808080, font: {
          size: '10px', weight: 100
        }
      }
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "textStyle": JSON.stringify(value)
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 184,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_timepicker_textStyle_0300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_timepicker_textStyle_0300] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('timePicker');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_timepicker_textStyle_0300] disappearColor:" + obj.$attrs.textStyle.color);
      expect(obj.$attrs.textStyle.color).assertEqual('#FF808080');
      expect(obj.$attrs.textStyle.font.size).assertEqual('10.00px');
      expect(obj.$attrs.textStyle.font.weight).assertEqual('100');
      done();
    });

    /*
     * @tc.number       ArkUI_Stage_timepicker_textStyle_0400
     * @tc.name         Tests the textStyle property of the picker component
     * @tc.desc         set textStyle then get the value
     */
    it('ArkUI_Stage_timepicker_textStyle_0400', 0, async (done: Function) => {
      let value: TextStyleCls = {
        color: '#00ff00', font: {
          size: '1px', weight: '700'
        }
      }
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "textStyle": JSON.stringify(value)
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 184,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_timepicker_textStyle_0400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_timepicker_textStyle_0400] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('timePicker');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_timepicker_textStyle_0400] disappearColor:" + obj.$attrs.textStyle.color);
      expect(obj.$attrs.textStyle.color).assertEqual('#FF00FF00');
      expect(obj.$attrs.textStyle.font.size).assertEqual('1.00px');
      expect(obj.$attrs.textStyle.font.weight).assertEqual('700');
      done();
    });

    /*
     * @tc.number       ArkUI_Stage_timepicker_textStyle_0500
     * @tc.name         Tests the textStyle property of the picker component
     * @tc.desc         set textStyle then get the value
     */
    it('ArkUI_Stage_timepicker_textStyle_0500', 0, async (done: Function) => {
      let value: TextStyleCls = {
        color: Color.Green, font: {
          size: 30, weight: 450
        }
      }
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "textStyle": JSON.stringify(value)
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 184,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_timepicker_textStyle_0500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_timepicker_textStyle_0500] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('timePicker');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_timepicker_textStyle_0500] disappearColor:" + obj.$attrs.textStyle.color);
      expect(obj.$attrs.textStyle.color).assertEqual('#FF008000');
      expect(obj.$attrs.textStyle.font.size).assertEqual('30.00fp');
      expect(obj.$attrs.textStyle.font.weight).assertEqual('FontWeight.Normal');
      done();
    });

    /*
     * @tc.number       ArkUI_Stage_timepicker_textStyle_0600
     * @tc.name         Tests the textStyle property of the picker component
     * @tc.desc         set textStyle then get the value
     */
    it('ArkUI_Stage_timepicker_textStyle_0600', 0, async (done: Function) => {
      let value: TextStyleCls = {
        color: '#80808g', font: {
          size: -1, weight: 1000
        }
      }
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "textStyle": JSON.stringify(value)
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 184,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_timepicker_textStyle_0600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_timepicker_textStyle_0600] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('timePicker');
      let obj: ESObject = JSON.parse(strJson);

      let strJsonDefault = getInspectorByKey('timePickerDefault');
      let objDefault: ESObject = JSON.parse(strJsonDefault);

      console.info("[ArkUI_Stage_timepicker_textStyle_0600] disappearColor:" + obj.$attrs.textStyle.color);
      expect(obj.$attrs.textStyle.color).assertEqual(objDefault.$attrs.textStyle.color);
      expect(obj.$attrs.textStyle.font.size).assertEqual(objDefault.$attrs.textStyle.font.size);
      expect(obj.$attrs.textStyle.font.weight).assertEqual('FontWeight.Normal');
      done();
    });

    /*
     * @tc.number       ArkUI_Stage_timepicker_textStyle_0700
     * @tc.name         Tests the textStyle property of the picker component
     * @tc.desc         set textStyle then get the value
     */
    it('ArkUI_Stage_timepicker_textStyle_0700', 0, async (done: Function) => {
      let value: TextStyleCls = {
        color: 'xxx', font: {
          size: 'xxx', weight: FontWeight.Lighter
        }
      }
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "textStyle": JSON.stringify(value)
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 184,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_timepicker_textStyle_0700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_timepicker_textStyle_0700] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('timePicker');
      let obj: ESObject = JSON.parse(strJson);

      let strJsonDefault = getInspectorByKey('timePickerDefault');
      let objDefault: ESObject = JSON.parse(strJsonDefault);

      console.info("[ArkUI_Stage_timepicker_textStyle_0700] disappearColor:" + obj.$attrs.textStyle.color);
      expect(obj.$attrs.textStyle.color).assertEqual(objDefault.$attrs.textStyle.color);
      expect(obj.$attrs.textStyle.font.size).assertEqual(objDefault.$attrs.textStyle.font.size);
      expect(obj.$attrs.textStyle.font.weight).assertEqual('FontWeight.Lighter');
      done();
    });

    /*
      * @tc.number       ArkUI_Stage_timepicker_textStyle_0800
      * @tc.name         Tests the textStyle property of the picker component
      * @tc.desc         set textStyle then get the value
      */
    it('ArkUI_Stage_timepicker_textStyle_0800', 0, async (done: Function) => {
      let value: TextStyleCls = {
        color: 'rgb(138,43,226)', font: {
          size: '20vp', weight: 900
        }
      }
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "textStyle": JSON.stringify(value)
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 184,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_timepicker_textStyle_0800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_timepicker_textStyle_0800] change component data error: " + err.message);
      }
      await Utils.sleep(3000);
      let strJson = getInspectorByKey('timePicker');
      let obj: ESObject = JSON.parse(strJson);
      expect(obj.$attrs.textStyle.color).assertEqual('#FF8A2BE2');
      expect(obj.$attrs.textStyle.font.size).assertEqual('20.00vp');
      expect(obj.$attrs.textStyle.font.weight).assertEqual('900');
      done();
    });

    /*
      * @tc.number       ArkUI_Stage_timepicker_textStyle_0900
      * @tc.name         Tests the textStyle property of the picker component
      * @tc.desc         set textStyle then get the value
      */
    it('ArkUI_Stage_timepicker_textStyle_0900', 0, async (done: Function) => {
      let value: TextStyleCls = {
        color: 'rgb(138,43,226)', font: {
          size: '15lpx', weight: 90
        }
      }
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "textStyle": JSON.stringify(value)
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 184,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_timepicker_textStyle_0900] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_timepicker_textStyle_0900] change component data error: " + err.message);
      }
      await Utils.sleep(3000);
      let strJson = getInspectorByKey('timePicker');
      let obj: ESObject = JSON.parse(strJson);
      expect(obj.$attrs.textStyle.color).assertEqual('#FF8A2BE2');
      expect(obj.$attrs.textStyle.font.size).assertEqual('15.00lpx');
      expect(obj.$attrs.textStyle.font.weight).assertEqual('FontWeight.Normal');
      done();
    });

    /*
     * @tc.number       ArkUI_Stage_timepicker_selectedTextStyle_0100
     * @tc.name         Tests the selectedTextStyle property of the picker component
     * @tc.desc         get the default value
     */
    it('ArkUI_Stage_timepicker_selectedTextStyle_0100', 0, async (done: Function) => {
      let strJson = getInspectorByKey('timePicker');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_timepicker_selectedTextStyle_0100] disappearColor:" + obj.$attrs.selectedTextStyle.color);
      expect(obj.$attrs.selectedTextStyle.color).assertEqual('#FF0000FF');
      expect(obj.$attrs.selectedTextStyle.font.size).assertEqual('20.00px');
      expect(obj.$attrs.selectedTextStyle.font.weight).assertEqual('FontWeight.Bold');
      done();
    });

    /*
     * @tc.number       ArkUI_Stage_timepicker_selectedTextStyle_0200
     * @tc.name         Tests the selectedTextStyle property of the picker component
     * @tc.desc         set selectedTextStyle then get the value
     */
    it('ArkUI_Stage_timepicker_selectedTextStyle_0200', 0, async (done: Function) => {
      let value: TextStyleCls = {
        color: Color.Blue, font: {
          size: '20px', weight: FontWeight.Bolder
        }
      }
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "selectedTextStyle": JSON.stringify(value)
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 184,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_timepicker_selectedTextStyle_0200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_timepicker_selectedTextStyle_0200] change component data error: " + err.message);
      }
      await Utils.sleep(3000);
      let strJson = getInspectorByKey('timePicker');
      let obj: ESObject = JSON.parse(strJson);
      console.error("[ArkUI_Stage_timepicker_selectedTextStyle_0200] disappearColor:" + obj.$attrs.selectedTextStyle.color);
      expect(obj.$attrs.selectedTextStyle.color).assertEqual('#FF0000FF');
      expect(obj.$attrs.selectedTextStyle.font.size).assertEqual('20.00px');
      expect(obj.$attrs.selectedTextStyle.font.weight).assertEqual('FontWeight.Bolder');
      done();
    });

    /*
     * @tc.number       ArkUI_Stage_timepicker_selectedTextStyle_0300
     * @tc.name         Tests the selectedTextStyle property of the picker component
     * @tc.desc         set selectedTextStyle then get the value
     */
    it('ArkUI_Stage_timepicker_selectedTextStyle_0300', 0, async (done: Function) => {
      let value: TextStyleCls = {
        color: 0xFF808080, font: {
          size: '20px', weight: 100
        }
      }
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "selectedTextStyle": JSON.stringify(value)
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 184,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_timepicker_selectedTextStyle_0300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_timepicker_selectedTextStyle_0300] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('timePicker');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_timepicker_selectedTextStyle_0300] disappearColor:" + obj.$attrs.selectedTextStyle.color);
      expect(obj.$attrs.selectedTextStyle.color).assertEqual('#FF808080');
      expect(obj.$attrs.selectedTextStyle.font.size).assertEqual('20.00px');
      expect(obj.$attrs.selectedTextStyle.font.weight).assertEqual('100');
      done();
    });

    /*
     * @tc.number       ArkUI_Stage_timepicker_selectedTextStyle_0400
     * @tc.name         Tests the selectedTextStyle property of the picker component
     * @tc.desc         set selectedTextStyle then get the value
     */
    it('ArkUI_Stage_timepicker_selectedTextStyle_0400', 0, async (done: Function) => {
      let value: TextStyleCls = {
        color: '#00ff00', font: {
          size: '1px', weight: '700'
        }
      }
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "selectedTextStyle": JSON.stringify(value)
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 184,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_timepicker_selectedTextStyle_0400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_timepicker_selectedTextStyle_0400] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('timePicker');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_timepicker_selectedTextStyle_0400] disappearColor:" + obj.$attrs.selectedTextStyle.color);
      expect(obj.$attrs.selectedTextStyle.color).assertEqual('#FF00FF00');
      expect(obj.$attrs.selectedTextStyle.font.size).assertEqual('1.00px');
      expect(obj.$attrs.selectedTextStyle.font.weight).assertEqual('700');
      done();
    });

    /*
     * @tc.number       ArkUI_Stage_timepicker_selectedTextStyle_0500
     * @tc.name         Tests the selectedTextStyle property of the picker component
     * @tc.desc         set selectedTextStyle then get the value
     */
    it('ArkUI_Stage_timepicker_selectedTextStyle_0500', 0, async (done: Function) => {
      let value: TextStyleCls = {
        color: Color.Green, font: {
          size: 30, weight: 450
        }
      }
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "selectedTextStyle": JSON.stringify(value)
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 184,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_timepicker_selectedTextStyle_0500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_timepicker_selectedTextStyle_0500] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('timePicker');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_timepicker_selectedTextStyle_0500] disappearColor:" + obj.$attrs.selectedTextStyle.color);
      expect(obj.$attrs.selectedTextStyle.color).assertEqual('#FF008000');
      expect(obj.$attrs.selectedTextStyle.font.size).assertEqual('30.00fp');
      expect(obj.$attrs.selectedTextStyle.font.weight).assertEqual('FontWeight.Normal');
      done();
    });

    /*
     * @tc.number       ArkUI_Stage_timepicker_selectedTextStyle_0600
     * @tc.name         Tests the selectedTextStyle property of the picker component
     * @tc.desc         set selectedTextStyle then get the value
     */
    it('ArkUI_Stage_timepicker_selectedTextStyle_0600', 0, async (done: Function) => {
      let value: TextStyleCls = {
        color: '#80808g', font: {
          size: -1, weight: 1000
        }
      }
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "selectedTextStyle": JSON.stringify(value)
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 184,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_timepicker_selectedTextStyle_0600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_timepicker_selectedTextStyle_0600] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('timePicker');
      let obj: ESObject = JSON.parse(strJson);

      let strJsonDefault = getInspectorByKey('timePickerDefault');
      let objDefault: ESObject = JSON.parse(strJsonDefault);

      console.info("[ArkUI_Stage_timepicker_selectedTextStyle_0600] disappearColor:" + obj.$attrs.selectedTextStyle.color);
      expect(obj.$attrs.selectedTextStyle.color).assertEqual(objDefault.$attrs.selectedTextStyle.color);
      expect(obj.$attrs.selectedTextStyle.font.size).assertEqual(objDefault.$attrs.selectedTextStyle.font.size);
      expect(obj.$attrs.selectedTextStyle.font.weight).assertEqual('FontWeight.Normal');
      done();
    });

    /*
     * @tc.number       ArkUI_Stage_timepicker_selectedTextStyle_0700
     * @tc.name         Tests the selectedTextStyle property of the picker component
     * @tc.desc         set selectedTextStyle then get the value
     */
    it('ArkUI_Stage_timepicker_selectedTextStyle_0700', 0, async (done: Function) => {
      let value: TextStyleCls = {
        color: 'xxx', font: {
          size: 'xxx', weight: FontWeight.Lighter
        }
      }
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "selectedTextStyle": JSON.stringify(value)
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 184,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_timepicker_selectedTextStyle_0700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_timepicker_selectedTextStyle_0700] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('timePicker');
      let obj: ESObject = JSON.parse(strJson);

      let strJsonDefault = getInspectorByKey('timePickerDefault');
      let objDefault: ESObject = JSON.parse(strJsonDefault);

      console.info("[ArkUI_Stage_timepicker_selectedTextStyle_0700] disappearColor:" + obj.$attrs.selectedTextStyle.color);
      expect(obj.$attrs.selectedTextStyle.color).assertEqual(objDefault.$attrs.selectedTextStyle.color);
      expect(obj.$attrs.selectedTextStyle.font.size).assertEqual(objDefault.$attrs.selectedTextStyle.font.size);
      expect(obj.$attrs.selectedTextStyle.font.weight).assertEqual('FontWeight.Lighter');
      done();
    });

    /*
      * @tc.number       ArkUI_Stage_timepicker_selectedTextStyle_0800
      * @tc.name         Tests the selectedTextStyle property of the picker component
      * @tc.desc         set selectedTextStyle then get the value
      */
    it('ArkUI_Stage_timepicker_selectedTextStyle_0800', 0, async (done: Function) => {
      let value: TextStyleCls = {
        color: 'rgb(138,43,226)', font: {
          size: '20vp', weight: 900
        }
      }
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "selectedTextStyle": JSON.stringify(value)
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 184,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_timepicker_selectedTextStyle_0800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_timepicker_selectedTextStyle_0800] change component data error: " + err.message);
      }
      await Utils.sleep(3000);
      let strJson = getInspectorByKey('timePicker');
      let obj: ESObject = JSON.parse(strJson);
      expect(obj.$attrs.selectedTextStyle.color).assertEqual('#FF8A2BE2');
      expect(obj.$attrs.selectedTextStyle.font.size).assertEqual('20.00vp');
      expect(obj.$attrs.selectedTextStyle.font.weight).assertEqual('900');
      done();
    });

    /*
      * @tc.number       ArkUI_Stage_timepicker_selectedTextStyle_0900
      * @tc.name         Tests the selectedTextStyle property of the picker component
      * @tc.desc         set selectedTextStyle then get the value
      */
    it('ArkUI_Stage_timepicker_selectedTextStyle_0900', 0, async (done: Function) => {
      let value: TextStyleCls = {
        color: 'rgb(138,43,226)', font: {
          size: '15lpx', weight: 90
        }
      }
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "selectedTextStyle": JSON.stringify(value)
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 184,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_timepicker_selectedTextStyle_0900] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_timepicker_selectedTextStyle_0900] change component data error: " + err.message);
      }
      await Utils.sleep(3000);
      let strJson = getInspectorByKey('timePicker');
      let obj: ESObject = JSON.parse(strJson);
      expect(obj.$attrs.selectedTextStyle.color).assertEqual('#FF8A2BE2');
      expect(obj.$attrs.selectedTextStyle.font.size).assertEqual('15.00lpx');
      expect(obj.$attrs.selectedTextStyle.font.weight).assertEqual('FontWeight.Normal');
      done();
    });
  })
}

