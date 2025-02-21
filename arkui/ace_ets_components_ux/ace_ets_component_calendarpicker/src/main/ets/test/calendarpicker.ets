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

export default function calendarpicker() {
  describe('ActsAceCalendarPickerTest', () => {
    beforeEach(async (done: Function) => {
      await Utils.sleep(2000);
      console.info("CalendarPicker beforeEach start");
      done();
    })

    /*
     * @tc.number       ArkUI_Stage_CalendarPicker_textStyle_0100     
     * @tc.name         Tests the textStyle property of the CalendarCalendarPicker component
     * @tc.desc         get the default value
     */
    it('ArkUI_Stage_CalendarPicker_textStyle_0100', 0, async (done: Function) => {
      let strJson = getInspectorByKey('CalendarPicker');
      let obj: Record<string, Object> = JSON.parse(strJson);
      console.info("[ArkUI_Stage_CalendarPicker_textStyle_0100] Color:" + JSON.parse(strJson).$attrs.textStyle.color);
      expect(JSON.parse(strJson).$attrs.textStyle.color).assertEqual('#FF000000');
      expect(JSON.parse(strJson)
        .$attrs
        .textStyle
        .font
        .size).assertEqual('8.00fp');
      expect(JSON.parse(strJson)
        .$attrs
        .textStyle
        .font
        .weight).assertEqual('FontWeight.Lighter');
      done();
    });

    /*
     * @tc.number       ArkUI_Stage_CalendarPicker_textStyle_0200
     * @tc.name         Tests the textStyle property of the CalendarPicker component
     * @tc.desc         set textStyle then get the value
     */
    it('ArkUI_Stage_CalendarPicker_textStyle_0200', 0, async (done: Function) => {
      let value = {
        color: '#ff0000', font: {
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
        console.info("[ArkUI_Stage_CalendarPicker_textStyle_0200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_CalendarPicker_textStyle_0200] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('CalendarPicker');
      let obj: Record<string, Object> = JSON.parse(strJson);
      console.info("[ArkUI_Stage_CalendarPicker_textStyle_0200] color:" + JSON.parse(strJson).$attrs.textStyle.color);
      expect(JSON.parse(strJson).$attrs.textStyle.color).assertEqual('#FFFF0000');
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
     * @tc.number       ArkUI_Stage_CalendarPicker_textStyle_0300
     * @tc.name         Tests the textStyle property of the CalendarPicker component
     * @tc.desc         set textStyle then get the value
     */
    it('ArkUI_Stage_CalendarPicker_textStyle_0300', 0, async (done: Function) => {
      let value = {
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
        console.info("[ArkUI_Stage_CalendarPicker_textStyle_0300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_CalendarPicker_textStyle_0300] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('CalendarPicker');
      let obj: Record<string, Object> = JSON.parse(strJson);
      console.info("[ArkUI_Stage_CalendarPicker_textStyle_0300] color:" + JSON.parse(strJson).$attrs.textStyle.color);
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
     * @tc.number       ArkUI_Stage_CalendarPicker_textStyle_0400
     * @tc.name         Tests the textStyle property of the CalendarPicker component
     * @tc.desc         set textStyle then get the value
     */
    it('ArkUI_Stage_CalendarPicker_textStyle_0400', 0, async (done: Function) => {
      let value = {
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
        console.info("[ArkUI_Stage_CalendarPicker_textStyle_0400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_CalendarPicker_textStyle_0400] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('CalendarPicker');
      let obj: Record<string, Object> = JSON.parse(strJson);

      let strJsonDefault = getInspectorByKey('CalendarPickerDefault');
      let objDefault: Record<string, Object> = JSON.parse(strJsonDefault);

      console.info("[ArkUI_Stage_CalendarPicker_textStyle_0400] color:" + JSON.parse(strJson).$attrs.textStyle.color);
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
     * @tc.number       ArkUI_Stage_CalendarPicker_textStyle_0500
     * @tc.name         Tests the textStyle property of the CalendarPicker component
     * @tc.desc         set textStyle then get the value
     */
    it('ArkUI_Stage_CalendarPicker_textStyle_0500', 0, async (done: Function) => {
      let value = {
        color: 'xxx', font: {
          size: 'xxx', weight: FontWeight.Bold
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
        console.info("[ArkUI_Stage_CalendarPicker_textStyle_0500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_CalendarPicker_textStyle_0500] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('CalendarPicker');
      let obj: Record<string, Object> = JSON.parse(strJson);

      let strJsonDefault = getInspectorByKey('CalendarPickerDefault');
      let objDefault: Record<string, Object> = JSON.parse(strJsonDefault);

      console.info("[ArkUI_Stage_CalendarPicker_textStyle_0500] color:" + JSON.parse(strJson).$attrs.textStyle.color);
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
        .weight).assertEqual('FontWeight.Bold');
      done();
    });

    /*
     * @tc.number       ArkUI_Stage_CalendarPicker_textStyle_0600
     * @tc.name         Tests the textStyle property of the CalendarPicker component
     * @tc.desc         set textStyle then get the value
     */
    it('ArkUI_Stage_CalendarPicker_textStyle_0600', 0, async (done: Function) => {
      let value = {
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
        console.info("[ArkUI_Stage_CalendarPicker_textStyle_0600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_CalendarPicker_textStyle_0600] change component data error: " + err.message);
      }
      await Utils.sleep(3000);
      let strJson = getInspectorByKey('CalendarPicker');
      let obj: Record<string, Object> = JSON.parse(strJson);
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
     * @tc.number       ArkUI_Stage_CalendarPicker_textStyle_0700
     * @tc.name         Tests the textStyle property of the CalendarPicker component
     * @tc.desc         set textStyle then get the value
     */
    it('ArkUI_Stage_CalendarPicker_textStyle_0700', 0, async (done: Function) => {
      let value = {
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
        console.info("[ArkUI_Stage_CalendarPicker_textStyle_0700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_CalendarPicker_textStyle_0700] change component data error: " + err.message);
      }
      await Utils.sleep(3000);
      let strJson = getInspectorByKey('CalendarPicker');
      let obj: Record<string, Object> = JSON.parse(strJson);
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
     * @tc.number       ArkUI_Stage_CalendarPicker_EdgeAlign_0100
     * @tc.name         Tests the EdgeAlign of the CalendarPicker component
     * @tc.desc         set EdgeAlign then get the value
     */
    it('ArkUI_Stage_CalendarPicker_EdgeAlign_0100', 0, async (done: Function) => {
      let strJson = getInspectorByKey('CalendarPicker');
      let obj: Record<string, Object> = JSON.parse(strJson);
      console.info("[ArkUI_Stage_CalendarPicker_EdgeAlign_0100] edgeAlign:" + JSON.parse(strJson).$attrs.edgeAlign);
      console.info("[ArkUI_Stage_CalendarPicker_EdgeAlign_0100] edgeAlign.alignType:" + JSON.parse(strJson)
        .$attrs
        .edgeAlign
        .alignType);
      expect(JSON.parse(strJson).$attrs.edgeAlign.alignType).assertEqual('CalendarAlign.END');
      done();
    });

    /*
     * @tc.number       ArkUI_Stage_CalendarPicker_EdgeAlign_0200
     * @tc.name         Tests the EdgeAlign property of the CalendarPicker component
     * @tc.desc         set EdgeAlign then get the value
     */
    it('ArkUI_Stage_CalendarPicker_EdgeAlign_0200', 0, async (done: Function) => {
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "edgeAlign": CalendarAlign.CENTER
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 185,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_CalendarPicker_EdgeAlign_0200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
        console.info("[ArkUI_Stage_CalendarPicker_EdgeAlign_0200] eventData:" + JSON.stringify(eventData));
      } catch (err) {
        console.log("[ArkUI_Stage_CalendarPicker_EdgeAlign_0200] change component data error: " + err.message);
      }
      await Utils.sleep(3000);
      let strJson = getInspectorByKey('CalendarPicker');
      let obj: Record<string, Object> = JSON.parse(strJson);
      console.info("[ArkUI_Stage_CalendarPicker_EdgeAlign_0200] edgeAlign:" + JSON.parse(strJson).$attrs.edgeAlign);
      console.info("[ArkUI_Stage_CalendarPicker_EdgeAlign_0200] edgeAlign.alignType:" + JSON.parse(strJson)
        .$attrs
        .edgeAlign
        .alignType);
      expect(JSON.parse(strJson).$attrs.edgeAlign.alignType).assertEqual('CalendarAlign.CENTER');
      done();
    });

    /*
     * @tc.number       ArkUI_Stage_CalendarPicker_EdgeAlign_0300
     * @tc.name         Tests the EdgeAlign property of the CalendarPicker component
     * @tc.desc         set EdgeAlign then get the value
     */
    it('ArkUI_Stage_CalendarPicker_EdgeAlign_0300', 0, async (done: Function) => {
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "edgeAlign": CalendarAlign.START
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 185,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_CalendarPicker_EdgeAlign_0300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_CalendarPicker_EdgeAlign_0300] change component data error: " + err.message);
      }
      await Utils.sleep(3000);
      let strJson = getInspectorByKey('CalendarPicker');
      let obj: Record<string, Object> = JSON.parse(strJson);
      console.info("[ArkUI_Stage_CalendarPicker_EdgeAlign_0300] edgeAlign.alignType:" + JSON.parse(strJson)
        .$attrs
        .edgeAlign
        .alignType);
      console.info("[ArkUI_Stage_CalendarPicker_EdgeAlign_0300] edgeAlign.offset.dx:" + JSON.parse(strJson)
        .$attrs
        .edgeAlign
        .offset
        .dx);
      expect(JSON.parse(strJson).$attrs.edgeAlign.alignType).assertEqual('CalendarAlign.START');
      done();
    });

    /*
     * @tc.number       ArkUI_Stage_CalendarPicker_EdgeAlign_0400
     * @tc.name         Tests the EdgeAlign property of the CalendarPicker component
     * @tc.desc         set EdgeAlign then get the value
     */
    it('ArkUI_Stage_CalendarPicker_EdgeAlign_0400', 0, async (done: Function) => {
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "edgeAlign": "edgeAlign"
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 185,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_CalendarPicker_EdgeAlign_0400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
        console.info("[ArkUI_Stage_CalendarPicker_EdgeAlign_0400] eventData:" + JSON.stringify(eventData));
      } catch (err) {
        console.log("[ArkUI_Stage_CalendarPicker_EdgeAlign_0400] change component data error: " + err.message);
      }
      await Utils.sleep(3000);
      let strJson = getInspectorByKey('CalendarPicker');
      let obj: Record<string, Object> = JSON.parse(strJson);
      console.info("[ArkUI_Stage_CalendarPicker_EdgeAlign_0400] edgeAlign.alignType:" + JSON.parse(strJson)
        .$attrs
        .edgeAlign
        .alignType);
      expect(JSON.parse(strJson).$attrs.edgeAlign.alignType).assertEqual('CalendarAlign.END');
      done();
    });

    /*
     * @tc.number       ArkUI_Stage_CalendarPicker_EdgeAlign_0500
     * @tc.name         Tests the EdgeAlign property of the CalendarPicker component
     * @tc.desc         set EdgeAlign then get the value
     */
    it('ArkUI_Stage_CalendarPicker_EdgeAlign_0500', 0, async (done: Function) => {
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "edgeAlign": null
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 185,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_CalendarPicker_EdgeAlign_0500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_CalendarPicker_EdgeAlign_0500] change component data error: " + err.message);
      }
      await Utils.sleep(3000);
      let strJson = getInspectorByKey('CalendarPicker');
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(JSON.parse(strJson).$attrs.edgeAlign.alignType).assertEqual('CalendarAlign.END');
      done();
    });

    /*
     * @tc.number       ArkUI_Stage_CalendarPicker_EdgeAlign_0600
     * @tc.name         Tests the EdgeAlign property of the CalendarPicker component
     * @tc.desc         set EdgeAlign then get the value
     */
    it('ArkUI_Stage_CalendarPicker_EdgeAlign_0600', 0, async (done: Function) => {
      let strJson = getInspectorByKey('CalendarPicker1');
      let obj: Record<string, Object> = JSON.parse(strJson);
      console.info("[ArkUI_Stage_CalendarPicker_EdgeAlign_0600] edgeAlign.alignType:" + JSON.parse(strJson)
        .$attrs
        .edgeAlign
        .alignType);
      console.info("[ArkUI_Stage_CalendarPicker_EdgeAlign_0600] edgeAlign.offset.dx:" + JSON.parse(strJson)
        .$attrs
        .edgeAlign
        .offset
        .dx);
      expect(JSON.parse(strJson).$attrs.edgeAlign.alignType).assertEqual('CalendarAlign.START');
      expect(JSON.parse(strJson)
        .$attrs
        .edgeAlign
        .offset
        .dx).assertEqual('5.00vp');
      expect(JSON.parse(strJson)
        .$attrs
        .edgeAlign
        .offset
        .dy).assertEqual('5.00vp');
      done();
    });

    /*
     * @tc.number       ArkUI_Stage_CalendarPicker_EdgeAlign_0700
     * @tc.name         Tests the EdgeAlign property of the CalendarPicker component
     * @tc.desc         set EdgeAlign then get the value
     */
    it('ArkUI_Stage_CalendarPicker_EdgeAlign_0700', 0, async (done: Function) => {
      let strJson = getInspectorByKey('CalendarPicker2');
      let obj: Record<string, Object> = JSON.parse(strJson);
      console.info("[ArkUI_Stage_CalendarPicker_EdgeAlign_0700] edgeAlign.alignType:" + JSON.parse(strJson)
        .$attrs
        .edgeAlign
        .alignType);
      console.info("[ArkUI_Stage_CalendarPicker_EdgeAlign_0700] edgeAlign.offset.dx:" + JSON.parse(strJson)
        .$attrs
        .edgeAlign
        .offset
        .dx);
      expect(JSON.parse(strJson).$attrs.edgeAlign.alignType).assertEqual('CalendarAlign.CENTER');
      expect(JSON.parse(strJson)
        .$attrs
        .edgeAlign
        .offset
        .dx).assertEqual('-10.00vp');
      expect(JSON.parse(strJson)
        .$attrs
        .edgeAlign
        .offset
        .dy).assertEqual('0.00vp');
      done();
    });

    /*
     * @tc.number       ArkUI_Stage_CalendarPicker_EdgeAlign_0800
     * @tc.name         Tests the EdgeAlign property of the CalendarPicker component
     * @tc.desc         set EdgeAlign then get the value
     */
    it('ArkUI_Stage_CalendarPicker_EdgeAlign_0800', 0, async (done: Function) => {
      let strJson = getInspectorByKey('CalendarPicker3');
      let obj: Record<string, Object> = JSON.parse(strJson);
      console.info("[ArkUI_Stage_CalendarPicker_EdgeAlign_0800] edgeAlign.alignType:" + JSON.parse(strJson)
        .$attrs
        .edgeAlign
        .alignType);
      console.info("[ArkUI_Stage_CalendarPicker_EdgeAlign_0800] edgeAlign.offset.dx:" + JSON.parse(strJson)
        .$attrs
        .edgeAlign
        .offset
        .dx);
      expect(JSON.parse(strJson).$attrs.edgeAlign.alignType).assertEqual('CalendarAlign.END');
      expect(JSON.parse(strJson)
        .$attrs
        .edgeAlign
        .offset
        .dx).assertEqual('-20.00vp');
      expect(JSON.parse(strJson)
        .$attrs
        .edgeAlign
        .offset
        .dy).assertEqual('-10.00vp');
      done();
    });

    /*
     * @tc.number       ArkUI_Stage_CalendarPicker_hintRadius_0100
     * @tc.name         Tests the hintRadius property of the CalendarPicker component
     * @tc.desc         get the property of the hintRadius
     */
    it('ArkUI_Stage_CalendarPicker_hintRadius_0100', 0, async (done: Function) => {
      let strJson = getInspectorByKey('CalendarPicker');
      let obj: Record<string, Object> = JSON.parse(strJson);
      console.info("[ArkUI_Stage_CalendarPicker_hintRadius_0100] hintRadius:" + JSON.parse(strJson).$attrs.hintRadius);
      expect(JSON.parse(strJson).$attrs.hintRadius).assertEqual(undefined);
      done();
    });

  })
}
