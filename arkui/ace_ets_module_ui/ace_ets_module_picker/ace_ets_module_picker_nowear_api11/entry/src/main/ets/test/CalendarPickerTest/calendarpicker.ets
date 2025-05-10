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
import Utils from "../../MainAbility/common/Common";
import router from '@ohos.router';
export default function calendarpicker() {
  describe('ActsAceCalendarPickerTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: "MainAbility/pages/CalendarPicker/CalendarPickerIndex",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get CalendarPicker state success " + JSON.stringify(pages));
        if (!("CalendarPickerIndex" == pages.name)) {
          console.info("get CalendarPicker state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          console.info("push CalendarPicker page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push CalendarPicker page error " + JSON.stringify(err));
      }
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
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[ArkUI_Stage_CalendarPicker_textStyle_0100] Color:" + obj.$attrs.textStyle.color);
      expect(obj.$attrs.textStyle.color).assertEqual('#FF000000');
      expect(obj.$attrs.textStyle.font.size).assertEqual('8.00fp');
      expect(obj.$attrs.textStyle.font.weight).assertEqual('FontWeight.Lighter');
      done();
    });

    /*
     * @tc.number       ArkUI_Stage_CalendarPicker_textStyle_0200
     * @tc.name         Tests the textStyle property of the CalendarPicker component
     * @tc.desc         set textStyle then get the value
     */
    it('ArkUI_Stage_CalendarPicker_textStyle_0200', 0, async (done: Function) => {  
      let value: CalendarPickerTextStyle = {color:'#ff0000',font:{size:'1px',weight:'700'}}    
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
        console.log("[ArkUI_Stage_CalendarPicker_textStyle_0200] change component data error: " + (err as Error).message);
      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('CalendarPicker');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[ArkUI_Stage_CalendarPicker_textStyle_0200] color:" + obj.$attrs.textStyle.color);
      expect(obj.$attrs.textStyle.color).assertEqual('#FFFF0000');
      expect(obj.$attrs.textStyle.font.size).assertEqual('1.00px');
      expect(obj.$attrs.textStyle.font.weight).assertEqual('700');
      done();
    });

    /*
     * @tc.number       ArkUI_Stage_CalendarPicker_textStyle_0300
     * @tc.name         Tests the textStyle property of the CalendarPicker component
     * @tc.desc         set textStyle then get the value
     */
    it('ArkUI_Stage_CalendarPicker_textStyle_0300', 0, async (done: Function) => { 
      let value: CalendarPickerTextStyle = {color:Color.Green,font:{size:30,weight:450}}         
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
        console.log("[ArkUI_Stage_CalendarPicker_textStyle_0300] change component data error: " + (err as Error).message);
      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('CalendarPicker');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[ArkUI_Stage_CalendarPicker_textStyle_0300] color:" + obj.$attrs.textStyle.color);
      expect(obj.$attrs.textStyle.color).assertEqual('#FF008000');
      expect(obj.$attrs.textStyle.font.size).assertEqual('30.00fp');
      expect(obj.$attrs.textStyle.font.weight).assertEqual('FontWeight.Normal');
      done();
    });

    /*
     * @tc.number       ArkUI_Stage_CalendarPicker_textStyle_0400
     * @tc.name         Tests the textStyle property of the CalendarPicker component
     * @tc.desc         set textStyle then get the value
     */
    it('ArkUI_Stage_CalendarPicker_textStyle_0400', 0, async (done: Function) => {   
      let value: CalendarPickerTextStyle = {color:'#80808g',font:{size:-1,weight:1000}}      
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
        console.log("[ArkUI_Stage_CalendarPicker_textStyle_0400] change component data error: " + (err as Error).message);
      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('CalendarPicker');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      let strJsonDefault = getInspectorByKey('CalendarPickerDefault');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);

      console.info("[ArkUI_Stage_CalendarPicker_textStyle_0400] color:" + obj.$attrs.textStyle.color);
      expect(obj.$attrs.textStyle.color).assertEqual(objDefault.$attrs.textStyle.color);
      expect(obj.$attrs.textStyle.font.size).assertEqual(objDefault.$attrs.textStyle.font.size);
      expect(obj.$attrs.textStyle.font.weight).assertEqual('FontWeight.Normal');
      done();
    });

    /*
     * @tc.number       ArkUI_Stage_CalendarPicker_textStyle_0500
     * @tc.name         Tests the textStyle property of the CalendarPicker component
     * @tc.desc         set textStyle then get the value
     */
    it('ArkUI_Stage_CalendarPicker_textStyle_0500', 0, async (done: Function) => {   
      let value: CalendarPickerTextStyle = {color:'xxx',font:{size:'xxx',weight:FontWeight.Bold}}       
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
        console.log("[ArkUI_Stage_CalendarPicker_textStyle_0500] change component data error: " + (err as Error).message);
      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('CalendarPicker');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      let strJsonDefault = getInspectorByKey('CalendarPickerDefault');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);

      console.info("[ArkUI_Stage_CalendarPicker_textStyle_0500] color:" + obj.$attrs.textStyle.color);
      expect(obj.$attrs.textStyle.color).assertEqual(objDefault.$attrs.textStyle.color);
      expect(obj.$attrs.textStyle.font.size).assertEqual(objDefault.$attrs.textStyle.font.size);
      expect(obj.$attrs.textStyle.font.weight).assertEqual('FontWeight.Bold');
      done();
    });

    /*
     * @tc.number       ArkUI_Stage_CalendarPicker_textStyle_0600
     * @tc.name         Tests the textStyle property of the CalendarPicker component
     * @tc.desc         set textStyle then get the value
     */
    it('ArkUI_Stage_CalendarPicker_textStyle_0600', 0, async (done: Function) => { 
      let value: CalendarPickerTextStyle = {color:'rgb(138,43,226)',font:{size:'20vp',weight:900}} 
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
        console.log("[ArkUI_Stage_CalendarPicker_textStyle_0600] change component data error: " + (err as Error).message);
      }
      await Utils.sleep(3000);
      let strJson = getInspectorByKey('CalendarPicker');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.textStyle.color).assertEqual('#FF8A2BE2');
      expect(obj.$attrs.textStyle.font.size).assertEqual('20.00vp');
      expect(obj.$attrs.textStyle.font.weight).assertEqual('900');
      done();
    });

    /*
     * @tc.number       ArkUI_Stage_CalendarPicker_textStyle_0700
     * @tc.name         Tests the textStyle property of the CalendarPicker component
     * @tc.desc         set textStyle then get the value
     */
    it('ArkUI_Stage_CalendarPicker_textStyle_0700', 0, async (done: Function) => { 
      let value: CalendarPickerTextStyle = {color:'rgb(138,43,226)',font:{size:'15lpx',weight:90}} 
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
        console.log("[ArkUI_Stage_CalendarPicker_textStyle_0700] change component data error: " + (err as Error).message);
      }
      await Utils.sleep(3000);
      let strJson = getInspectorByKey('CalendarPicker');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.textStyle.color).assertEqual('#FF8A2BE2');
      expect(obj.$attrs.textStyle.font.size).assertEqual('15.00lpx');
      expect(obj.$attrs.textStyle.font.weight).assertEqual('FontWeight.Normal');
      done();
    });

    /*
     * @tc.number       ArkUI_Stage_CalendarPicker_EdgeAlign_0100
     * @tc.name         Tests the EdgeAlign of the CalendarPicker component
     * @tc.desc         set EdgeAlign then get the value
     */
    it('ArkUI_Stage_CalendarPicker_EdgeAlign_0100', 0, async (done: Function) => { 
      let strJson = getInspectorByKey('CalendarPicker');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[ArkUI_Stage_CalendarPicker_EdgeAlign_0100] edgeAlign:" + obj.$attrs.edgeAlign);
      console.info("[ArkUI_Stage_CalendarPicker_EdgeAlign_0100] edgeAlign.alignType:" + obj.$attrs.edgeAlign.alignType);
      expect(obj.$attrs.edgeAlign.alignType).assertEqual('CalendarAlign.END');
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
        console.log("[ArkUI_Stage_CalendarPicker_EdgeAlign_0200] change component data error: " + (err as Error).message);
      }
      await Utils.sleep(3000);
      let strJson = getInspectorByKey('CalendarPicker');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[ArkUI_Stage_CalendarPicker_EdgeAlign_0200] edgeAlign:" + obj.$attrs.edgeAlign);
      console.info("[ArkUI_Stage_CalendarPicker_EdgeAlign_0200] edgeAlign.alignType:" + obj.$attrs.edgeAlign.alignType);
      expect(obj.$attrs.edgeAlign.alignType).assertEqual('CalendarAlign.CENTER');
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
        console.log("[ArkUI_Stage_CalendarPicker_EdgeAlign_0300] change component data error: " + (err as Error).message);
      }
      await Utils.sleep(3000);
      let strJson = getInspectorByKey('CalendarPicker');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[ArkUI_Stage_CalendarPicker_EdgeAlign_0300] edgeAlign.alignType:" + obj.$attrs.edgeAlign.alignType);
      console.info("[ArkUI_Stage_CalendarPicker_EdgeAlign_0300] edgeAlign.offset.dx:" + obj.$attrs.edgeAlign.offset.dx);
      expect(obj.$attrs.edgeAlign.alignType).assertEqual('CalendarAlign.START');
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
        console.log("[ArkUI_Stage_CalendarPicker_EdgeAlign_0400] change component data error: " + (err as Error).message);
      }
      await Utils.sleep(3000);
      let strJson = getInspectorByKey('CalendarPicker');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[ArkUI_Stage_CalendarPicker_EdgeAlign_0400] edgeAlign.alignType:" + obj.$attrs.edgeAlign.alignType);
      expect(obj.$attrs.edgeAlign.alignType).assertEqual('CalendarAlign.END');
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
        console.log("[ArkUI_Stage_CalendarPicker_EdgeAlign_0500] change component data error: " + (err as Error).message);
      }
      await Utils.sleep(3000);
      let strJson = getInspectorByKey('CalendarPicker');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.edgeAlign.alignType).assertEqual('CalendarAlign.END');
      done();
    }); 

    /*
     * @tc.number       ArkUI_Stage_CalendarPicker_EdgeAlign_0600
     * @tc.name         Tests the EdgeAlign property of the CalendarPicker component
     * @tc.desc         set EdgeAlign then get the value
     */
    it('ArkUI_Stage_CalendarPicker_EdgeAlign_0600', 0, async (done: Function) => { 
      let strJson = getInspectorByKey('CalendarPicker1');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[ArkUI_Stage_CalendarPicker_EdgeAlign_0600] edgeAlign.alignType:" + obj.$attrs.edgeAlign.alignType);
      console.info("[ArkUI_Stage_CalendarPicker_EdgeAlign_0600] edgeAlign.offset.dx:" + obj.$attrs.edgeAlign.offset.dx);
      expect(obj.$attrs.edgeAlign.alignType).assertEqual('CalendarAlign.START');
      expect(obj.$attrs.edgeAlign.offset.dx).assertEqual('5.00vp');
      expect(obj.$attrs.edgeAlign.offset.dy).assertEqual('5.00vp');
      done();
    });    

    /*
     * @tc.number       ArkUI_Stage_CalendarPicker_EdgeAlign_0700
     * @tc.name         Tests the EdgeAlign property of the CalendarPicker component
     * @tc.desc         set EdgeAlign then get the value
     */
    it('ArkUI_Stage_CalendarPicker_EdgeAlign_0700', 0, async (done: Function) => { 
      let strJson = getInspectorByKey('CalendarPicker2');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[ArkUI_Stage_CalendarPicker_EdgeAlign_0700] edgeAlign.alignType:" + obj.$attrs.edgeAlign.alignType);
      console.info("[ArkUI_Stage_CalendarPicker_EdgeAlign_0700] edgeAlign.offset.dx:" + obj.$attrs.edgeAlign.offset.dx);
      expect(obj.$attrs.edgeAlign.alignType).assertEqual('CalendarAlign.CENTER');
      expect(obj.$attrs.edgeAlign.offset.dx).assertEqual('-10.00vp');
      expect(obj.$attrs.edgeAlign.offset.dy).assertEqual('0.00vp');
      done();
    });

    /*
     * @tc.number       ArkUI_Stage_CalendarPicker_EdgeAlign_0800
     * @tc.name         Tests the EdgeAlign property of the CalendarPicker component
     * @tc.desc         set EdgeAlign then get the value
     */
    it('ArkUI_Stage_CalendarPicker_EdgeAlign_0800', 0, async (done: Function) => { 
      let strJson = getInspectorByKey('CalendarPicker3');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[ArkUI_Stage_CalendarPicker_EdgeAlign_0800] edgeAlign.alignType:" + obj.$attrs.edgeAlign.alignType);
      console.info("[ArkUI_Stage_CalendarPicker_EdgeAlign_0800] edgeAlign.offset.dx:" + obj.$attrs.edgeAlign.offset.dx);
      expect(obj.$attrs.edgeAlign.alignType).assertEqual('CalendarAlign.END');
      expect(obj.$attrs.edgeAlign.offset.dx).assertEqual('-20.00vp');
      expect(obj.$attrs.edgeAlign.offset.dy).assertEqual('-10.00vp');
      done();
    });
    
    /*
     * @tc.number       ArkUI_Stage_CalendarPicker_hintRadius_0100
     * @tc.name         Tests the hintRadius property of the CalendarPicker component
     * @tc.desc         get the property of the hintRadius
     */
	  it('ArkUI_Stage_CalendarPicker_hintRadius_0100', 0, async (done: Function) => {
      let strJson = getInspectorByKey('CalendarPicker');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[ArkUI_Stage_CalendarPicker_hintRadius_0100] hintRadius:" + obj.$attrs.hintRadius);
      expect(obj.$attrs.hintRadius).assertEqual(undefined);
      done();
    });
    
  })
}

interface CalendarPickerFont {
  size: number|string;
  weight: number|string|FontWeight;
}
interface CalendarPickerTextStyle {
  color: string|Color,
  font: CalendarPickerFont
}