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


import { describe, beforeEach, afterEach, it, expect, Level } from '@ohos/hypium';
import events_emitter from '@ohos.events.emitter';
import Utils from '../../MainAbility/utils/Common';
import router from '@ohos.router';
import { BusinessError } from '@ohos.base';

export default function sidebar() {
  describe('ActsAceSideBarTest',  () =>{
    beforeEach(async (done: Function) => {
      console.info("sidebar beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/SideBarContainer/SideBarContainer',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get sidebar state success " + JSON.stringify(pages));
        if (!("SideBarContainer" == pages.name)) {
          console.info("get sidebar state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push sidebar page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push sidebar page error: " + err);
      }
      done()
    });

    afterEach(async  (done:Function) =>{
      console.info("sidebar afterEach start");
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "strokeWidthStr": '10px',
            "dividerColorStr": '#000000',
            "startMarginStr": '5px',
            "endMarginStr": '5px',

            "nullFlag": false,

            "dividerColor": Color.Red,

            "strokeWidthNum": 10,
            "dividerColorNum": 0x000000,
            "startMarginNum": 5,
            "endMarginNum": 5,

            "strokeWidthRes": $r('app.string.Divider_width'),
            "dividerColorRes": $r('app.color.Divider_color'),
            "startMarginRes": $r('app.string.Divider_startMargin'),
            "endMarginRes": $r('app.string.Divider_endMargin'),
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_SideBarContainer_Divider] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_SideBarContainer_Divider] change component data error: " + (err as BusinessError).message);
      }
      await Utils.sleep(2000);
      done();
    })

    /**
     * @tc.name   ArkUI_SideBarContainer_Divider_0100
     * @tc.number ArkUI_SideBarContainer_Divider_0100
     * @tc.desc   Gets the default values of divider for the SideBarContainer component
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_SideBarContainer_Divider_0100',  Level.LEVEL0, async  (done:Function) =>{
      console.info("ArkUI_SideBarContainer_Divider_0100 start");
      let strJson: string = getInspectorByKey('sideBarTest1');
      console.info("ArkUI_SideBarContainer_Divider_0100: " + JSON.stringify(strJson))
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[ArkUI_SideBarContainer_Divider_0100] divider:" + obj.$attrs.divider);
      let dividerObject: ESObject = JSON.parse(obj.$attrs.divider);
      expect(dividerObject.strokeWidth).assertEqual("1.00vp");
      expect(dividerObject.color).assertEqual("#08000000");
      expect(dividerObject.startMargin).assertEqual("0.00vp");
      expect(dividerObject.endMargin).assertEqual("0.00vp");
      done();
    });

    /**
     * @tc.name   ArkUI_SideBarContainer_Divider_0200
     * @tc.number ArkUI_SideBarContainer_Divider_0200
     * @tc.desc   Gets the values of divider for the SideBarContainer component,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_SideBarContainer_Divider_0200',  Level.LEVEL0, async  (done:Function) =>{
      console.info("ArkUI_SideBarContainer_Divider_0200 start");
      let strJson: string = getInspectorByKey('sideBarTest2');
      console.info("ArkUI_SideBarContainer_Divider_0200: " + JSON.stringify(strJson))
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[ArkUI_SideBarContainer_Divider_0200] divider:" + obj.$attrs.divider);
      let dividerObject: ESObject = JSON.parse(obj.$attrs.divider);
      expect(dividerObject.strokeWidth).assertEqual("10.00vp");
      expect(dividerObject.color).assertEqual("#FF000000");
      expect(dividerObject.startMargin).assertEqual("5.00vp");
      expect(dividerObject.endMargin).assertEqual("5.00vp");
      done();
    });

    /**
     * @tc.name   ArkUI_SideBarContainer_Divider_0300
     * @tc.number ArkUI_SideBarContainer_Divider_0300
     * @tc.desc   Gets the values of divider for the SideBarContainer component,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_SideBarContainer_Divider_0300',  Level.LEVEL0, async  (done:Function) =>{
      console.info("ArkUI_SideBarContainer_Divider_0300 start");
      let strJson: string = getInspectorByKey('sideBarTest3');
      console.info("ArkUI_SideBarContainer_Divider_0300: " + JSON.stringify(strJson))
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[ArkUI_SideBarContainer_Divider_0300] divider:" + obj.$attrs.divider);
      let dividerObject: ESObject = JSON.parse(obj.$attrs.divider);
      expect(dividerObject.strokeWidth).assertEqual("10.00px");
      expect(dividerObject.color).assertEqual("#FF000000");
      expect(dividerObject.startMargin).assertEqual("5.00px");
      expect(dividerObject.endMargin).assertEqual("5.00px");
      done();
    });

    /**
     * @tc.name   ArkUI_SideBarContainer_Divider_0400
     * @tc.number ArkUI_SideBarContainer_Divider_0400
     * @tc.desc   Gets the values of divider for the SideBarContainer component,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_SideBarContainer_Divider_0400',  Level.LEVEL0, async  (done:Function) =>{
      console.info("ArkUI_SideBarContainer_Divider_0400 start");
      let strJson: string = getInspectorByKey('sideBarTest3');
      console.info("ArkUI_SideBarContainer_Divider_0400: " + JSON.stringify(strJson))

      let strokeWidthStr = '10vp';
      let startMarginStr = '5vp';
      let endMarginStr = '5vp';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "strokeWidthStr": strokeWidthStr,
            "startMarginStr": startMarginStr,
            "endMarginStr": endMarginStr
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("ArkUI_SideBarContainer_Divider_0400 start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("ArkUI_SideBarContainer_Divider_0400 change component data error: " + (err as BusinessError).message);
      }
      await Utils.sleep(2000);

      let newJson: string = getInspectorByKey('sideBarTest3');
      console.info("ArkUI_SideBarContainer_Divider_0400: " + JSON.stringify(newJson))
      let obj: ESObject = JSON.parse(newJson);
      console.info("[ArkUI_SideBarContainer_Divider_0400] divider:" + obj.$attrs.divider);
      let dividerObject: ESObject = JSON.parse(obj.$attrs.divider);
      expect(dividerObject.strokeWidth).assertEqual("10.00vp");
      expect(dividerObject.color).assertEqual("#FF000000");
      expect(dividerObject.startMargin).assertEqual("5.00vp");
      expect(dividerObject.endMargin).assertEqual("5.00vp");
      done();
    });

    /**
     * @tc.name   ArkUI_SideBarContainer_Divider_0500
     * @tc.number ArkUI_SideBarContainer_Divider_0500
     * @tc.desc   Gets the values of divider for the SideBarContainer component,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_SideBarContainer_Divider_0500',  Level.LEVEL0, async  (done:Function) =>{
      console.info("ArkUI_SideBarContainer_Divider_0500 start");
      let strJson: string = getInspectorByKey('sideBarTest3');
      console.info("ArkUI_SideBarContainer_Divider_0500: " + JSON.stringify(strJson))

      let strokeWidthStr = '10fp';
      let startMarginStr = '5fp';
      let endMarginStr = '5fp';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "strokeWidthStr": strokeWidthStr,
            "startMarginStr": startMarginStr,
            "endMarginStr": endMarginStr
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("ArkUI_SideBarContainer_Divider_0500 start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("ArkUI_SideBarContainer_Divider_0500 change component data error: " + (err as BusinessError).message);
      }
      await Utils.sleep(2000);

      let newJson: string = getInspectorByKey('sideBarTest3');
      console.info("ArkUI_SideBarContainer_Divider_0500: " + JSON.stringify(newJson))
      let obj: ESObject = JSON.parse(newJson);
      console.info("[ArkUI_SideBarContainer_Divider_0500] divider:" + obj.$attrs.divider);
      let dividerObject: ESObject = JSON.parse(obj.$attrs.divider);
      expect(dividerObject.strokeWidth).assertEqual("10.00fp");
      expect(dividerObject.color).assertEqual("#FF000000");
      expect(dividerObject.startMargin).assertEqual("5.00fp");
      expect(dividerObject.endMargin).assertEqual("5.00fp");
      done();
    });

    /**
     * @tc.name   ArkUI_SideBarContainer_Divider_0600
     * @tc.number ArkUI_SideBarContainer_Divider_0600
     * @tc.desc   Gets the values of divider for the SideBarContainer component,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_SideBarContainer_Divider_0600',  Level.LEVEL0, async  (done:Function) =>{
      console.info("ArkUI_SideBarContainer_Divider_0600 start");
      let strJson: string = getInspectorByKey('sideBarTest3');
      console.info("ArkUI_SideBarContainer_Divider_0600: " + JSON.stringify(strJson))

      let strokeWidthStr = '10lpx';
      let startMarginStr = '5lpx';
      let endMarginStr = '5lpx';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "strokeWidthStr": strokeWidthStr,
            "startMarginStr": startMarginStr,
            "endMarginStr": endMarginStr
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("ArkUI_SideBarContainer_Divider_0600 start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("ArkUI_SideBarContainer_Divider_0600 change component data error: " + (err as BusinessError).message);
      }
      await Utils.sleep(2000);

      let newJson: string = getInspectorByKey('sideBarTest3');
      console.info("ArkUI_SideBarContainer_Divider_0600: " + JSON.stringify(newJson))
      let obj: ESObject = JSON.parse(newJson);
      console.info("[ArkUI_SideBarContainer_Divider_0600] divider:" + obj.$attrs.divider);
      let dividerObject: ESObject = JSON.parse(obj.$attrs.divider);
      expect(dividerObject.strokeWidth).assertEqual("10.00lpx");
      expect(dividerObject.color).assertEqual("#FF000000");
      expect(dividerObject.startMargin).assertEqual("5.00lpx");
      expect(dividerObject.endMargin).assertEqual("5.00lpx");
      done();
    });

    /**
     * @tc.name   ArkUI_SideBarContainer_Divider_0700
     * @tc.number ArkUI_SideBarContainer_Divider_0700
     * @tc.desc   Gets the values of divider for the SideBarContainer component,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_SideBarContainer_Divider_0700',  Level.LEVEL0, async  (done:Function) =>{
      console.info("ArkUI_SideBarContainer_Divider_0700 start");
      let strJson: string = getInspectorByKey('sideBarTest4');
      console.info("ArkUI_SideBarContainer_Divider_0700: " + JSON.stringify(strJson))
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[ArkUI_SideBarContainer_Divider_0700] divider:" + obj.$attrs.divider);
      let dividerObject: ESObject = JSON.parse(obj.$attrs.divider);
      expect(dividerObject.strokeWidth).assertEqual("10.00px");
      expect(dividerObject.color).assertEqual("#FF000000");
      expect(dividerObject.startMargin).assertEqual("5.00px");
      expect(dividerObject.endMargin).assertEqual("5.00px");
      done();
    });

    /**
     * @tc.name   ArkUI_SideBarContainer_Divider_0800
     * @tc.number ArkUI_SideBarContainer_Divider_0800
     * @tc.desc   Gets the values of divider for the SideBarContainer component,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_SideBarContainer_Divider_0800',  Level.LEVEL0, async  (done:Function) =>{
      console.info("ArkUI_SideBarContainer_Divider_0800 start");
      let strJson: string = getInspectorByKey('sideBarTest5');
      console.info("ArkUI_SideBarContainer_Divider_0800: " + JSON.stringify(strJson))
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[ArkUI_SideBarContainer_Divider_0800] divider:" + obj.$attrs.divider);
      let dividerObject: ESObject = JSON.parse(obj.$attrs.divider);
      expect(dividerObject.strokeWidth).assertEqual("10.00vp");
      expect(dividerObject.color).assertEqual("#FFFF0000");
      expect(dividerObject.startMargin).assertEqual("5.00vp");
      expect(dividerObject.endMargin).assertEqual("5.00vp");
      done();
    });

    /**
     * @tc.name   ArkUI_SideBarContainer_Divider_0900
     * @tc.number ArkUI_SideBarContainer_Divider_0900
     * @tc.desc   Gets the values of divider for the SideBarContainer component,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_SideBarContainer_Divider_0900',  Level.LEVEL0, async  (done:Function) =>{
      console.info("ArkUI_SideBarContainer_Divider_0900 start");
      let strJson: string = getInspectorByKey('sideBarTest6');
      console.info("ArkUI_SideBarContainer_Divider_0900: " + JSON.stringify(strJson))
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[ArkUI_SideBarContainer_Divider_0900] divider:" + obj.$attrs.divider);
      let dividerObject: ESObject = JSON.parse(obj.$attrs.divider);
      expect(dividerObject.strokeWidth).assertEqual("10.00vp");
      expect(dividerObject.color).assertEqual("#08000000");
      expect(dividerObject.startMargin).assertEqual("0.00vp");
      expect(dividerObject.endMargin).assertEqual("0.00vp");
      done();
    });

    /**
     * @tc.name   ArkUI_SideBarContainer_Divider_1000
     * @tc.number ArkUI_SideBarContainer_Divider_1000
     * @tc.desc   Gets the strokeWidth of divider for the SideBarContainer component,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_SideBarContainer_Divider_1000',  Level.LEVEL0, async  (done:Function) =>{
      console.info("ArkUI_SideBarContainer_Divider_1000 start");
      let strJson: string = getInspectorByKey('sideBarTest2');
      console.info("ArkUI_SideBarContainer_Divider_1000: " + JSON.stringify(strJson))
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "nullFlag": true,
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_SideBarContainer_Divider_1000] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_SideBarContainer_Divider_1000] change component data error: " + (err as BusinessError).message);
      }
      await Utils.sleep(2000);
      let newJson: string = getInspectorByKey('sideBarTest2');
      let obj: ESObject = JSON.parse(newJson);
      console.info("[ArkUI_SideBarContainer_Divider_1000] divider:" + JSON.stringify(obj.$attrs.divider));
      let dividerObject: ESObject = JSON.parse(obj.$attrs.divider);
      expect(dividerObject.strokeWidth).assertEqual("1.00vp");
      done();
    });

    /**
     * @tc.name   ArkUI_SideBarContainer_Divider_1100
     * @tc.number ArkUI_SideBarContainer_Divider_1100
     * @tc.desc   Gets the strokeWidth of divider for the SideBarContainer component,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_SideBarContainer_Divider_1100',  Level.LEVEL0, async  (done:Function) =>{
      console.info("ArkUI_SideBarContainer_Divider_1100 start");
      let strJson: string = getInspectorByKey('sideBarTest2');
      console.info("ArkUI_SideBarContainer_Divider_1100: " + JSON.stringify(strJson))
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[ArkUI_SideBarContainer_Divider_1100] divider:" + obj.$attrs.divider);
      let dividerObject: ESObject = JSON.parse(obj.$attrs.divider);
      expect(dividerObject.strokeWidth).assertEqual("10.00vp");
      expect(dividerObject.color).assertEqual("#FF000000");
      expect(dividerObject.startMargin).assertEqual("5.00vp");
      expect(dividerObject.endMargin).assertEqual("5.00vp");

      try {
        let eventData: events_emitter.EventData = {
          data: {
            "strokeWidthNum": -1,
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_SideBarContainer_Divider_1100] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_SideBarContainer_Divider_1100] change component data error: " + (err as BusinessError).message);
      }
      await Utils.sleep(2000);
      let newJson: string = getInspectorByKey('sideBarTest2');
      let newobj: ESObject = JSON.parse(newJson);
      console.info("[ArkUI_SideBarContainer_Divider_1100] divider:" + JSON.stringify(newobj.$attrs.divider));
      let newdividerObject: ESObject = JSON.parse(newobj.$attrs.divider);
      expect(newdividerObject.strokeWidth).assertEqual("1.00vp");
      done();
    });

    /**
     * @tc.name   ArkUI_SideBarContainer_Divider_1200
     * @tc.number ArkUI_SideBarContainer_Divider_1200
     * @tc.desc   Gets the color of divider for the SideBarContainer component,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_SideBarContainer_Divider_1200',  Level.LEVEL0, async  (done:Function) =>{
      console.info("ArkUI_SideBarContainer_Divider_1200 start");
      let strJson: string = getInspectorByKey('sideBarTest3');
      console.info("ArkUI_SideBarContainer_Divider_1200: " + JSON.stringify(strJson))
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[ArkUI_SideBarContainer_Divider_1200] divider:" + obj.$attrs.divider);
      let dividerObject: ESObject = JSON.parse(obj.$attrs.divider);
      expect(dividerObject.strokeWidth).assertEqual("10.00px");
      expect(dividerObject.color).assertEqual("#FF000000");
      expect(dividerObject.startMargin).assertEqual("5.00px");
      expect(dividerObject.endMargin).assertEqual("5.00px");

      try {
        let eventData: events_emitter.EventData = {
          data: {
            "dividerColorStr": 'aaaaa',
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_SideBarContainer_Divider_1200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_SideBarContainer_Divider_1200] change component data error: " + (err as BusinessError).message);
      }
      await Utils.sleep(2000);
      let newJson: string = getInspectorByKey('sideBarTest3');
      let newobj: ESObject = JSON.parse(newJson);
      console.info("[ArkUI_SideBarContainer_Divider_1200] divider:" + JSON.stringify(newobj.$attrs.divider));
      let newdividerObject: ESObject = JSON.parse(newobj.$attrs.divider);
      expect(newdividerObject.color).assertEqual("#08000000");
      done();
    });

    /**
     * @tc.name   ArkUI_SideBarContainer_Divider_1300
     * @tc.number ArkUI_SideBarContainer_Divider_1300
     * @tc.desc   Gets the startMarginNum of divider for the SideBarContainer component,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_SideBarContainer_Divider_1300',  Level.LEVEL0, async  (done:Function) =>{
      console.info("ArkUI_SideBarContainer_Divider_1300 start");
      let strJson: string = getInspectorByKey('sideBarTest2');
      console.info("ArkUI_SideBarContainer_Divider_1300: " + JSON.stringify(strJson))
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[ArkUI_SideBarContainer_Divider_1300] divider:" + obj.$attrs.divider);
      let dividerObject: ESObject = JSON.parse(obj.$attrs.divider);
      expect(dividerObject.strokeWidth).assertEqual("10.00vp");
      expect(dividerObject.color).assertEqual("#FF000000");
      expect(dividerObject.startMargin).assertEqual("5.00vp");
      expect(dividerObject.endMargin).assertEqual("5.00vp");

      try {
        let eventData: events_emitter.EventData = {
          data: {
            "startMarginNum": -1,
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_SideBarContainer_Divider_1300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_SideBarContainer_Divider_1300] change component data error: " + (err as BusinessError).message);
      }
      await Utils.sleep(2000);
      let newJson: string = getInspectorByKey('sideBarTest2');
      let newobj: ESObject = JSON.parse(newJson);
      console.info("[ArkUI_SideBarContainer_Divider_1300] divider:" + JSON.stringify(newobj.$attrs.divider));
      let newdividerObject: ESObject = JSON.parse(newobj.$attrs.divider);
      expect(newdividerObject.startMargin).assertEqual("0.00vp");
      done();
    });

    /**
     * @tc.name   ArkUI_SideBarContainer_Divider_1400
     * @tc.number ArkUI_SideBarContainer_Divider_1400
     * @tc.desc   Gets the endMarginNum of divider for the SideBarContainer component,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUI_SideBarContainer_Divider_1400',  Level.LEVEL0, async  (done:Function) =>{
      console.info("ArkUI_SideBarContainer_Divider_1400 start");
      let strJson: string = getInspectorByKey('sideBarTest2');
      console.info("ArkUI_SideBarContainer_Divider_1400: " + JSON.stringify(strJson))
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[ArkUI_SideBarContainer_Divider_1400] divider:" + obj.$attrs.divider);
      let dividerObject: ESObject = JSON.parse(obj.$attrs.divider);
      expect(dividerObject.strokeWidth).assertEqual("10.00vp");
      expect(dividerObject.color).assertEqual("#FF000000");
      expect(dividerObject.startMargin).assertEqual("5.00vp");
      expect(dividerObject.endMargin).assertEqual("5.00vp");

      try {
        let eventData: events_emitter.EventData = {
          data: {
            "endMarginNum": -1,
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_SideBarContainer_Divider_1400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_SideBarContainer_Divider_1400] change component data error: " + (err as BusinessError).message);
      }
      await Utils.sleep(2000);
      let newJson: string = getInspectorByKey('sideBarTest2');
      let newobj: ESObject = JSON.parse(newJson);
      console.info("[ArkUI_SideBarContainer_Divider_1400] divider:" + JSON.stringify(newobj.$attrs.divider));
      let newdividerObject: ESObject = JSON.parse(newobj.$attrs.divider);
      expect(newdividerObject.endMargin).assertEqual("0.00vp");
      done();
    });
  })
}
