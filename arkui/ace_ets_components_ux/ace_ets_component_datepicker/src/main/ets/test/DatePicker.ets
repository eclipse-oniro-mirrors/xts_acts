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
// @ts-nocheck
import { describe, beforeEach, afterEach, it, expect } from '@ohos/hypium'
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils.ets';

class Value {
  color: Color;
  font: ESObject;
}

export default function datepicker() {
  describe('ActsAceDatePickerTest', () => {
    beforeEach(async (done: Function) => {
      await Utils.sleep(2000);
      console.info("datePicker beforeEach start");
      done();
    })

    afterEach(async (done: Function) => {
      console.info("datePicker afterEach start");
      let value1: Value = {
        color: Color.Black, font: {
          size: 8, weight: FontWeight.Lighter
        }
      }
      let value2: Value = {
        color: Color.Red, font: {
          size: '10px', weight: FontWeight.Normal
        }
      }
      let value3: Value = {
        color: Color.Blue, font: {
          size: '20px', weight: FontWeight.Bold
        }
      }
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "disappearTextStyle": JSON.stringify(value1),
            "textStyle": JSON.stringify(value2),
            "selectedTextStyle": JSON.stringify(value3)
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 185,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[datePicker_afterEach] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[selectTest_afterEach] change component data error: " + err.message);
      }
      done();
    })

    /*
     * @tc.number       ArkUI_Stage_datePicker_disappearTextStyle_0100     
     * @tc.name         Tests the disappearTextStyle property of the picker component
     * @tc.desc         get the default value
     */
    it('ArkUI_Stage_datePicker_disappearTextStyle_0100', 0, async (done: Function) => {
      let strJson = getInspectorByKey('datePicker');

      console.info("[ArkUI_Stage_datePicker_disappearTextStyle_0100] disappearColor:" + JSON.parse(strJson)
        .$attrs
        .disappearTextStyle
        .color);
      expect(JSON.parse(strJson).$attrs.disappearTextStyle.color).assertEqual('#FF000000');
      expect(JSON.parse(strJson)
        .$attrs
        .disappearTextStyle
        .font
        .size).assertEqual('8.00fp');
      expect(JSON.parse(strJson)
        .$attrs
        .disappearTextStyle
        .font
        .weight).assertEqual('FontWeight.Lighter');
      done();
    });

    /*
     * @tc.number       ArkUI_Stage_datePicker_disappearTextStyle_0200
     * @tc.name         Tests the disappearTextStyle property of the picker component
     * @tc.desc         set disappearTextStyle then get the value
     */
    it('ArkUI_Stage_datePicker_disappearTextStyle_0200', 0, async (done: Function) => {
      let value: Value = {
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
          eventId: 185,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_datePicker_disappearTextStyle_0200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_datePicker_disappearTextStyle_0200] change component data error: " + err.message);
      }
      await Utils.sleep(3000);
      let strJson = getInspectorByKey('datePicker');

      console.error("[ArkUI_Stage_dataPicker_disappearTextStyle_0200] disappearColor:" + JSON.parse(strJson)
        .$attrs
        .disappearTextStyle
        .color);
      expect(JSON.parse(strJson).$attrs.disappearTextStyle.color).assertEqual('#FF000000');
      expect(JSON.parse(strJson)
        .$attrs
        .disappearTextStyle
        .font
        .size).assertEqual('8.00fp');
      expect(JSON.parse(strJson)
        .$attrs
        .disappearTextStyle
        .font
        .weight).assertEqual('FontWeight.Bolder');
      done();
    });

    /*
     * @tc.number       ArkUI_Stage_datePicker_disappearTextStyle_0300
     * @tc.name         Tests the disappearTextStyle property of the picker component
     * @tc.desc         set disappearTextStyle then get the value
     */
    it('ArkUI_Stage_datePicker_disappearTextStyle_0300', 0, async (done: Function) => {
      let value: Value = {
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
          eventId: 185,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_datePicker_disappearTextStyle_0300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_datePicker_disappearTextStyle_0300] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('datePicker');

      console.info("[ArkUI_Stage_datePicker_disappearTextStyle_0300] disappearColor:" + JSON.parse(strJson)
        .$attrs
        .disappearTextStyle
        .color);
      expect(JSON.parse(strJson).$attrs.disappearTextStyle.color).assertEqual('#FF808080');
      expect(JSON.parse(strJson)
        .$attrs
        .disappearTextStyle
        .font
        .size).assertEqual('8.00fp');
      expect(JSON.parse(strJson)
        .$attrs
        .disappearTextStyle
        .font
        .weight).assertEqual('100');
      done();
    });

    /*
     * @tc.number       ArkUI_Stage_datePicker_disappearTextStyle_0400
     * @tc.name         Tests the disappearTextStyle property of the picker component
     * @tc.desc         set disappearTextStyle then get the value
     */
    it('ArkUI_Stage_datePicker_disappearTextStyle_0400', 0, async (done: Function) => {
      let value: Value = {
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
          eventId: 185,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_datePicker_disappearTextStyle_0400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_datePicker_disappearTextStyle_0400] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('datePicker');

      console.info("[ArkUI_Stage_datePicker_disappearTextStyle_0400] disappearColor:" + JSON.parse(strJson)
        .$attrs
        .disappearTextStyle
        .color);
      expect(JSON.parse(strJson).$attrs.disappearTextStyle.color).assertEqual('#FFFF0000');
      expect(JSON.parse(strJson)
        .$attrs
        .disappearTextStyle
        .font
        .size).assertEqual('1.00px');
      expect(JSON.parse(strJson)
        .$attrs
        .disappearTextStyle
        .font
        .weight).assertEqual('700');
      done();
    });

    /*
     * @tc.number       ArkUI_Stage_datePicker_disappearTextStyle_0500
     * @tc.name         Tests the disappearTextStyle property of the picker component
     * @tc.desc         set disappearTextStyle then get the value
     */
    it('ArkUI_Stage_datePicker_disappearTextStyle_0500', 0, async (done: Function) => {
      let value: Value = {
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
          eventId: 185,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_datePicker_disappearTextStyle_0500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_datePicker_disappearTextStyle_0500] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('datePicker');

      console.info("[ArkUI_Stage_datePicker_disappearTextStyle_0500] disappearColor:" + JSON.parse(strJson)
        .$attrs
        .disappearTextStyle
        .color);
      expect(JSON.parse(strJson).$attrs.disappearTextStyle.color).assertEqual('#FF008000');
      expect(JSON.parse(strJson)
        .$attrs
        .disappearTextStyle
        .font
        .size).assertEqual('30.00fp');
      expect(JSON.parse(strJson)
        .$attrs
        .disappearTextStyle
        .font
        .weight).assertEqual('FontWeight.Normal');
      done();
    });

    /*
     * @tc.number       ArkUI_Stage_datePicker_disappearTextStyle_0600
     * @tc.name         Tests the disappearTextStyle property of the picker component
     * @tc.desc         set disappearTextStyle then get the value
     */
    it('ArkUI_Stage_datePicker_disappearTextStyle_0600', 0, async (done: Function) => {
      let value: Value = {
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
          eventId: 185,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_datePicker_disappearTextStyle_0600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_datePicker_disappearTextStyle_0600] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('datePicker');


      let strJsonDefault = getInspectorByKey('datePickerDefault');
      console.info("[ArkUI_Stage_datePicker_disappearTextStyle_0600] disappearColor:" + JSON.parse(strJson)
        .$attrs
        .disappearTextStyle
        .color);
      expect(JSON.parse(strJson).$attrs.disappearTextStyle.color)
        .assertEqual(JSON.parse(strJsonDefault).$attrs.disappearTextStyle.color);
      expect(JSON.parse(strJson)
        .$attrs
        .disappearTextStyle
        .font
        .size)
        .assertEqual(JSON.parse(strJsonDefault)
          .$attrs
          .disappearTextStyle
          .font
          .size);
      expect(JSON.parse(strJson)
        .$attrs
        .disappearTextStyle
        .font
        .weight).assertEqual('FontWeight.Normal');
      done();
    });

    /*
     * @tc.number       ArkUI_Stage_datePicker_disappearTextStyle_0700
     * @tc.name         Tests the disappearTextStyle property of the picker component
     * @tc.desc         set disappearTextStyle then get the value
     */
    it('ArkUI_Stage_datePicker_disappearTextStyle_0700', 0, async (done: Function) => {
      let value: Value = {
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
          eventId: 185,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_datePicker_disappearTextStyle_0700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_datePicker_disappearTextStyle_0700] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('datePicker');


      let strJsonDefault = getInspectorByKey('datePickerDefault');
      console.info("[ArkUI_Stage_datePicker_disappearTextStyle_0700] disappearColor:" + JSON.parse(strJson)
        .$attrs
        .disappearTextStyle
        .color);
      expect(JSON.parse(strJson).$attrs.disappearTextStyle.color)
        .assertEqual(JSON.parse(strJsonDefault).$attrs.disappearTextStyle.color);
      expect(JSON.parse(strJson)
        .$attrs
        .disappearTextStyle
        .font
        .size)
        .assertEqual(JSON.parse(strJsonDefault)
          .$attrs
          .disappearTextStyle
          .font
          .size);
      expect(JSON.parse(strJson)
        .$attrs
        .disappearTextStyle
        .font
        .weight).assertEqual('FontWeight.Bold');
      done();
    });

    /*
     * @tc.number       ArkUI_Stage_dataPicker_disappearTextStyle_0800
     * @tc.name         Tests the disappearTextStyle property of the picker component
     * @tc.desc         set disappearTextStyle then get the value
     */
    it('ArkUI_Stage_dataPicker_disappearTextStyle_0800', 0, async (done: Function) => {
      let value: Value = {
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
          eventId: 185,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_dataPicker_disappearTextStyle_0800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_dataPicker_disappearTextStyle_0800] change component data error: " + err.message);
      }
      await Utils.sleep(3000);
      let strJson = getInspectorByKey('datePicker');

      expect(JSON.parse(strJson).$attrs.disappearTextStyle.color).assertEqual('#FF8A2BE2');
      expect(JSON.parse(strJson)
        .$attrs
        .disappearTextStyle
        .font
        .size).assertEqual('20.00vp');
      expect(JSON.parse(strJson)
        .$attrs
        .disappearTextStyle
        .font
        .weight).assertEqual('900');
      done();
    });

    /*
      * @tc.number       ArkUI_Stage_dataPicker_disappearTextStyle_0900
      * @tc.name         Tests the disappearTextStyle property of the picker component
      * @tc.desc         set disappearTextStyle then get the value
      */
    it('ArkUI_Stage_dataPicker_disappearTextStyle_0900', 0, async (done: Function) => {
      let value: Value = {
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
          eventId: 185,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_dataPicker_disappearTextStyle_0900] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_dataPicker_disappearTextStyle_0900] change component data error: " + err.message);
      }
      await Utils.sleep(3000);
      let strJson = getInspectorByKey('datePicker');

      expect(JSON.parse(strJson).$attrs.disappearTextStyle.color).assertEqual('#FF8A2BE2');
      expect(JSON.parse(strJson)
        .$attrs
        .disappearTextStyle
        .font
        .size).assertEqual('15.00lpx');
      expect(JSON.parse(strJson)
        .$attrs
        .disappearTextStyle
        .font
        .weight).assertEqual('FontWeight.Normal');
      done();
    });

    /*
     * @tc.number       ArkUI_Stage_datePicker_textStyle_0100
     * @tc.name         Tests the textStyle property of the picker component
     * @tc.desc         get the default value
     */
    it('ArkUI_Stage_datePicker_textStyle_0100', 0, async (done: Function) => {
      let strJson = getInspectorByKey('datePicker');

      console.info("[ArkUI_Stage_datePicker_textStyle_0100] disappearColor:" + JSON.parse(strJson)
        .$attrs
        .textStyle
        .color);
      expect(JSON.parse(strJson).$attrs.textStyle.color).assertEqual('#FFFF0000');
      expect(JSON.parse(strJson)
        .$attrs
        .textStyle
        .font
        .size).assertEqual('10.00px');
      expect(JSON.parse(strJson)
        .$attrs
        .textStyle
        .font
        .weight).assertEqual('FontWeight.Normal');
      done();
    });

    /*
     * @tc.number       ArkUI_Stage_datePicker_textStyle_0200
     * @tc.name         Tests the textStyle property of the picker component
     * @tc.desc         set textStyle then get the value
     */
    it('ArkUI_Stage_datePicker_textStyle_0200', 0, async (done: Function) => {
      let value: Value = {
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
          eventId: 185,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_datePicker_textStyle_0200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_datePicker_textStyle_0200] change component data error: " + err.message);
      }
      await Utils.sleep(3000);
      let strJson = getInspectorByKey('datePicker');

      console.error("[ArkUI_Stage_datePicker_textStyle_0200] disappearColor:" + JSON.parse(strJson)
        .$attrs
        .textStyle
        .color);
      expect(JSON.parse(strJson).$attrs.textStyle.color).assertEqual('#FFFF0000');
      expect(JSON.parse(strJson)
        .$attrs
        .textStyle
        .font
        .size).assertEqual('10.00px');
      expect(JSON.parse(strJson)
        .$attrs
        .textStyle
        .font
        .weight).assertEqual('FontWeight.Bolder');
      done();
    });

    /*
     * @tc.number       ArkUI_Stage_datePicker_textStyle_0300
     * @tc.name         Tests the textStyle property of the picker component
     * @tc.desc         set textStyle then get the value
     */
    it('ArkUI_Stage_datePicker_textStyle_0300', 0, async (done: Function) => {
      let value: Value = {
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
          eventId: 185,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_datePicker_textStyle_0300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_datePicker_textStyle_0300] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('datePicker');

      console.info("[ArkUI_Stage_datePicker_textStyle_0300] disappearColor:" + JSON.parse(strJson)
        .$attrs
        .textStyle
        .color);
      expect(JSON.parse(strJson).$attrs.textStyle.color).assertEqual('#FF808080');
      expect(JSON.parse(strJson)
        .$attrs
        .textStyle
        .font
        .size).assertEqual('10.00px');
      expect(JSON.parse(strJson)
        .$attrs
        .textStyle
        .font
        .weight).assertEqual('100');
      done();
    });

    /*
     * @tc.number       ArkUI_Stage_datePicker_textStyle_0400
     * @tc.name         Tests the textStyle property of the picker component
     * @tc.desc         set textStyle then get the value
     */
    it('ArkUI_Stage_datePicker_textStyle_0400', 0, async (done: Function) => {
      let value: Value = {
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
          eventId: 185,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_datePicker_textStyle_0400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_datePicker_textStyle_0400] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('datePicker');

      console.info("[ArkUI_Stage_datePicker_textStyle_0400] disappearColor:" + JSON.parse(strJson)
        .$attrs
        .textStyle
        .color);
      expect(JSON.parse(strJson).$attrs.textStyle.color).assertEqual('#FF00FF00');
      expect(JSON.parse(strJson)
        .$attrs
        .textStyle
        .font
        .size).assertEqual('1.00px');
      expect(JSON.parse(strJson)
        .$attrs
        .textStyle
        .font
        .weight).assertEqual('700');
      done();
    });

    /*
     * @tc.number       ArkUI_Stage_datePicker_textStyle_0500
     * @tc.name         Tests the textStyle property of the picker component
     * @tc.desc         set textStyle then get the value
     */
    it('ArkUI_Stage_datePicker_textStyle_0500', 0, async (done: Function) => {
      let value: Value = {
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
          eventId: 185,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_datePicker_textStyle_0500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_datePicker_textStyle_0500] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('datePicker');

      console.info("[ArkUI_Stage_datePicker_textStyle_0500] disappearColor:" + JSON.parse(strJson)
        .$attrs
        .textStyle
        .color);
      expect(JSON.parse(strJson).$attrs.textStyle.color).assertEqual('#FF008000');
      expect(JSON.parse(strJson)
        .$attrs
        .textStyle
        .font
        .size).assertEqual('30.00fp');
      expect(JSON.parse(strJson)
        .$attrs
        .textStyle
        .font
        .weight).assertEqual('FontWeight.Normal');
      done();
    });

    /*
     * @tc.number       ArkUI_Stage_datePicker_textStyle_0600
     * @tc.name         Tests the textStyle property of the picker component
     * @tc.desc         set textStyle then get the value
     */
    it('ArkUI_Stage_datePicker_textStyle_0600', 0, async (done: Function) => {
      let value: Value = {
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
          eventId: 185,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_datepicker_textStyle_0600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_datePicker_textStyle_0600] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('datePicker');


      let strJsonDefault = getInspectorByKey('datePickerDefault');

      console.info("[ArkUI_Stage_datePicker_textStyle_0600] disappearColor:" + JSON.parse(strJson)
        .$attrs
        .textStyle
        .color);
      expect(JSON.parse(strJson).$attrs.textStyle.color).assertEqual(JSON.parse(strJsonDefault).$attrs.textStyle.color);
      expect(JSON.parse(strJson)
        .$attrs
        .textStyle
        .font
        .size)
        .assertEqual(JSON.parse(strJsonDefault)
          .$attrs
          .textStyle
          .font
          .size);
      expect(JSON.parse(strJson)
        .$attrs
        .textStyle
        .font
        .weight).assertEqual('FontWeight.Normal');
      done();
    });

    /*
     * @tc.number       ArkUI_Stage_datePicker_textStyle_0700
     * @tc.name         Tests the textStyle property of the picker component
     * @tc.desc         set textStyle then get the value
     */
    it('ArkUI_Stage_datePicker_textStyle_0700', 0, async (done: Function) => {
      let value: Value = {
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
          eventId: 185,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_datePicker_textStyle_0700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_datePicker_textStyle_0700] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('datePicker');


      let strJsonDefault = getInspectorByKey('datePickerDefault');
      console.info("[ArkUI_Stage_datePicker_textStyle_0700] disappearColor:" + JSON.parse(strJson)
        .$attrs
        .textStyle
        .color);
      expect(JSON.parse(strJson).$attrs.textStyle.color).assertEqual(JSON.parse(strJsonDefault).$attrs.textStyle.color);
      expect(JSON.parse(strJson)
        .$attrs
        .textStyle
        .font
        .size)
        .assertEqual(JSON.parse(strJsonDefault)
          .$attrs
          .textStyle
          .font
          .size);
      expect(JSON.parse(strJson)
        .$attrs
        .textStyle
        .font
        .weight).assertEqual('FontWeight.Lighter');
      done();
    });

    /*
     * @tc.number       ArkUI_Stage_datePicker_textStyle_0800
     * @tc.name         Tests the textStyle property of the picker component
     * @tc.desc         set textStyle then get the value
     */
    it('ArkUI_Stage_datePicker_textStyle_0800', 0, async (done: Function) => {
      let value: Value = {
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
          eventId: 185,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_datePicker_textStyle_0800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_datePicker_textStyle_0800] change component data error: " + err.message);
      }
      await Utils.sleep(3000);
      let strJson = getInspectorByKey('datePicker');

      expect(JSON.parse(strJson).$attrs.textStyle.color).assertEqual('#FF8A2BE2');
      expect(JSON.parse(strJson)
        .$attrs
        .textStyle
        .font
        .size).assertEqual('20.00vp');
      expect(JSON.parse(strJson)
        .$attrs
        .textStyle
        .font
        .weight).assertEqual('900');
      done();
    });

    /*
      * @tc.number       ArkUI_Stage_datePicker_textStyle_0900
      * @tc.name         Tests the textStyle property of the picker component
      * @tc.desc         set textStyle then get the value
      */
    it('ArkUI_Stage_datePicker_textStyle_0900', 0, async (done: Function) => {
      let value: Value = {
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
          eventId: 185,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_datePicker_textStyle_0900] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_datePicker_textStyle_0900] change component data error: " + err.message);
      }
      await Utils.sleep(3000);
      let strJson = getInspectorByKey('datePicker');

      expect(JSON.parse(strJson).$attrs.textStyle.color).assertEqual('#FF8A2BE2');
      expect(JSON.parse(strJson)
        .$attrs
        .textStyle
        .font
        .size).assertEqual('15.00lpx');
      expect(JSON.parse(strJson)
        .$attrs
        .textStyle
        .font
        .weight).assertEqual('FontWeight.Normal');
      done();
    });

    /*
     * @tc.number       ArkUI_Stage_datepicker_selectedTextStyle_0100
     * @tc.name         Tests the selectedTextStyle property of the picker component
     * @tc.desc         get the default value
     */
    it('ArkUI_Stage_datepicker_selectedTextStyle_0100', 0, async (done: Function) => {
      let strJson = getInspectorByKey('datePicker');

      console.info("[ArkUI_Stage_datepicker_selectedTextStyle_0100] disappearColor:" + JSON.parse(strJson)
        .$attrs
        .selectedTextStyle
        .color);
      expect(JSON.parse(strJson).$attrs.selectedTextStyle.color).assertEqual('#FF0000FF');
      expect(JSON.parse(strJson)
        .$attrs
        .selectedTextStyle
        .font
        .size).assertEqual('20.00px');
      expect(JSON.parse(strJson)
        .$attrs
        .selectedTextStyle
        .font
        .weight).assertEqual('FontWeight.Bold');
      done();
    });

    /*
     * @tc.number       ArkUI_Stage_datepicker_selectedTextStyle_0200
     * @tc.name         Tests the selectedTextStyle property of the picker component
     * @tc.desc         set selectedTextStyle then get the value
     */
    it('ArkUI_Stage_datepicker_selectedTextStyle_0200', 0, async (done: Function) => {
      let value: Value = {
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
          eventId: 185,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_datepicker_selectedTextStyle_0200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_datepicker_selectedTextStyle_0200] change component data error: " + err.message);
      }
      await Utils.sleep(3000);
      let strJson = getInspectorByKey('datePicker');

      console.error("[ArkUI_Stage_datepicker_selectedTextStyle_0200] disappearColor:" + JSON.parse(strJson)
        .$attrs
        .selectedTextStyle
        .color);
      expect(JSON.parse(strJson).$attrs.selectedTextStyle.color).assertEqual('#FF0000FF');
      expect(JSON.parse(strJson)
        .$attrs
        .selectedTextStyle
        .font
        .size).assertEqual('20.00px');
      expect(JSON.parse(strJson)
        .$attrs
        .selectedTextStyle
        .font
        .weight).assertEqual('FontWeight.Bolder');
      done();
    });

    /*
     * @tc.number       ArkUI_Stage_datepicker_selectedTextStyle_0300
     * @tc.name         Tests the selectedTextStyle property of the picker component
     * @tc.desc         set selectedTextStyle then get the value
     */
    it('ArkUI_Stage_datepicker_selectedTextStyle_0300', 0, async (done: Function) => {
      let value: Value = {
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
          eventId: 185,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_datepicker_selectedTextStyle_0300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_datepicker_selectedTextStyle_0300] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('datePicker');

      console.info("[ArkUI_Stage_datepicker_selectedTextStyle_0300] disappearColor:" + JSON.parse(strJson)
        .$attrs
        .selectedTextStyle
        .color);
      expect(JSON.parse(strJson).$attrs.selectedTextStyle.color).assertEqual('#FF808080');
      expect(JSON.parse(strJson)
        .$attrs
        .selectedTextStyle
        .font
        .size).assertEqual('20.00px');
      expect(JSON.parse(strJson)
        .$attrs
        .selectedTextStyle
        .font
        .weight).assertEqual('100');
      done();
    });

    /*
     * @tc.number       ArkUI_Stage_datepicker_selectedTextStyle_0400
     * @tc.name         Tests the selectedTextStyle property of the picker component
     * @tc.desc         set selectedTextStyle then get the value
     */
    it('ArkUI_Stage_datepicker_selectedTextStyle_0400', 0, async (done: Function) => {
      let value: Value = {
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
          eventId: 185,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_datepicker_selectedTextStyle_0400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_datepicker_selectedTextStyle_0400] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('datePicker');

      console.info("[ArkUI_Stage_datepicker_selectedTextStyle_0400] disappearColor:" + JSON.parse(strJson)
        .$attrs
        .selectedTextStyle
        .color);
      expect(JSON.parse(strJson).$attrs.selectedTextStyle.color).assertEqual('#FF00FF00');
      expect(JSON.parse(strJson)
        .$attrs
        .selectedTextStyle
        .font
        .size).assertEqual('1.00px');
      expect(JSON.parse(strJson)
        .$attrs
        .selectedTextStyle
        .font
        .weight).assertEqual('700');
      done();
    });

    /*
     * @tc.number       ArkUI_Stage_datepicker_selectedTextStyle_0500
     * @tc.name         Tests the selectedTextStyle property of the picker component
     * @tc.desc         set selectedTextStyle then get the value
     */
    it('ArkUI_Stage_datepicker_selectedTextStyle_0500', 0, async (done: Function) => {
      let value: Value = {
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
          eventId: 185,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_datepicker_selectedTextStyle_0500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_datepicker_selectedTextStyle_0500] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('datePicker');

      console.info("[ArkUI_Stage_datepicker_selectedTextStyle_0500] disappearColor:" + JSON.parse(strJson)
        .$attrs
        .selectedTextStyle
        .color);
      expect(JSON.parse(strJson).$attrs.selectedTextStyle.color).assertEqual('#FF008000');
      expect(JSON.parse(strJson)
        .$attrs
        .selectedTextStyle
        .font
        .size).assertEqual('30.00fp');
      expect(JSON.parse(strJson)
        .$attrs
        .selectedTextStyle
        .font
        .weight).assertEqual('FontWeight.Normal');
      done();
    });

    /*
     * @tc.number       ArkUI_Stage_datepicker_selectedTextStyle_0600
     * @tc.name         Tests the selectedTextStyle property of the picker component
     * @tc.desc         set selectedTextStyle then get the value
     */
    it('ArkUI_Stage_datepicker_selectedTextStyle_0600', 0, async (done: Function) => {
      let value: Value = {
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
          eventId: 185,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_datepicker_selectedTextStyle_0600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_datepicker_selectedTextStyle_0600] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('datePicker');


      let strJsonDefault = getInspectorByKey('datePickerDefault');

      console.info("[ArkUI_Stage_datepicker_selectedTextStyle_0600] disappearColor:" + JSON.parse(strJson)
        .$attrs
        .selectedTextStyle
        .color);
      expect(JSON.parse(strJson).$attrs.selectedTextStyle.color)
        .assertEqual(JSON.parse(strJsonDefault).$attrs.selectedTextStyle.color);
      expect(JSON.parse(strJson)
        .$attrs
        .selectedTextStyle
        .font
        .size)
        .assertEqual(JSON.parse(strJsonDefault)
          .$attrs
          .selectedTextStyle
          .font
          .size);
      expect(JSON.parse(strJson)
        .$attrs
        .selectedTextStyle
        .font
        .weight).assertEqual('FontWeight.Normal');
      done();
    });

    /*
     * @tc.number       ArkUI_Stage_datepicker_selectedTextStyle_0700
     * @tc.name         Tests the selectedTextStyle property of the picker component
     * @tc.desc         set selectedTextStyle then get the value
     */
    it('ArkUI_Stage_datepicker_selectedTextStyle_0700', 0, async (done: Function) => {
      let value: Value = {
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
          eventId: 185,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_datepicker_selectedTextStyle_0700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_datepicker_selectedTextStyle_0700] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('datePicker');


      let strJsonDefault = getInspectorByKey('datePickerDefault');
      console.info("[ArkUI_Stage_datepicker_selectedTextStyle_0700] disappearColor:" + JSON.parse(strJson)
        .$attrs
        .selectedTextStyle
        .color);
      expect(JSON.parse(strJson).$attrs.selectedTextStyle.color)
        .assertEqual(JSON.parse(strJsonDefault).$attrs.selectedTextStyle.color);
      expect(JSON.parse(strJson)
        .$attrs
        .selectedTextStyle
        .font
        .size)
        .assertEqual(JSON.parse(strJsonDefault)
          .$attrs
          .selectedTextStyle
          .font
          .size);
      expect(JSON.parse(strJson)
        .$attrs
        .selectedTextStyle
        .font
        .weight).assertEqual('FontWeight.Lighter');
      done();
    });

    /*
* @tc.number       ArkUI_Stage_datepicker_selectedTextStyle_0800
* @tc.name         Tests the selectedTextStyle property of the picker component
* @tc.desc         set selectedTextStyle then get the value
*/
    it('ArkUI_Stage_datepicker_selectedTextStyle_0800', 0, async (done: Function) => {
      let value: Value = {
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
          eventId: 185,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_datepicker_selectedTextStyle_0800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_datepicker_selectedTextStyle_0800] change component data error: " + err.message);
      }
      await Utils.sleep(3000);
      let strJson = getInspectorByKey('datePicker');

      expect(JSON.parse(strJson).$attrs.selectedTextStyle.color).assertEqual('#FF8A2BE2');
      expect(JSON.parse(strJson)
        .$attrs
        .selectedTextStyle
        .font
        .size).assertEqual('20.00vp');
      expect(JSON.parse(strJson)
        .$attrs
        .selectedTextStyle
        .font
        .weight).assertEqual('900');
      done();
    });

    /*
      * @tc.number       ArkUI_Stage_datepicker_selectedTextStyle_0900
      * @tc.name         Tests the selectedTextStyle property of the picker component
      * @tc.desc         set selectedTextStyle then get the value
      */
    it('ArkUI_Stage_datepicker_selectedTextStyle_0900', 0, async (done: Function) => {
      let value: Value = {
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
          eventId: 185,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_datepicker_selectedTextStyle_0900] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_datepicker_selectedTextStyle_0900] change component data error: " + err.message);
      }
      await Utils.sleep(3000);
      let strJson = getInspectorByKey('datePicker');

      expect(JSON.parse(strJson).$attrs.selectedTextStyle.color).assertEqual('#FF8A2BE2');
      expect(JSON.parse(strJson)
        .$attrs
        .selectedTextStyle
        .font
        .size).assertEqual('15.00lpx');
      expect(JSON.parse(strJson)
        .$attrs
        .selectedTextStyle
        .font
        .weight).assertEqual('FontWeight.Normal');
      done();
    });


    /*
     * @tc.number       ArkUI_Stage_datepicker_Dialog_0100
     * @tc.name         Tests the property of the Dialog
     * @tc.desc         get the property of the Dialog
     */
    it('ArkUI_Stage_datepicker_dialog_0100', 0, async (done: Function) => {
      console.info('testDialog START');
      await Utils.sleep(3000);
      try {
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 185,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_datepicker_dialog_0100] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_datepicker_dialog_0100] change component data error: " + err.message);
      }
      done();
    });

  })
}

