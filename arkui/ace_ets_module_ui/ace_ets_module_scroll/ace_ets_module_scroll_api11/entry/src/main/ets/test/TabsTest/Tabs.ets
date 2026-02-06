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
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter';
import Utils from '../../MainAbility/common/Utils'
export default function tabs() {
  describe('ActsAceTabsTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Tabs/Index3",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Index state success " + JSON.stringify(pages));
        if (!("Index3" == pages.name)) {
          console.info("get Index state success " + JSON.stringify(pages.name));
          let result = await router.push(options)
          console.info("push Index page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Index page error " + JSON.stringify(err));
      }

      await Utils.sleep(2000);
      console.info("tabs beforeEach start");
      done();
    })

    afterEach(async (done: Function) => {
      console.info("tabs afterEach start");
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "strokeWidthStr": '10px',
            "dividerColorStr": 'red',
            "startMarginStr": '5px',
            "endMarginStr": '5px',

            "nullFlag": false,

            "strokeWidthNum": 10,
            "dividerColorNum": 0xFFFF0000,
            "startMarginNum": 5,
            "endMarginNum": 5,

            "dividerColor": Color.Red,

            "strokeWidthRes": $r("app.string.Divider_Stroke_Width"),
            "dividerColorRes": $r("app.color.Divider_Color"),
            "startMarginRes": $r("app.string.Divider_Start_Margin"),
            "endMarginRes": $r("app.string.Divider_End_Margin"),

            "overflowFlag": false,
            "selfIndicatorColor": Color.Red,
            "selfIndicatorHeight": 10,
            "selfIndicatorWidth": 30,
            "selfIndicatorBorderRadius": 5,
            "selfMarginTop": 10,
            "selfSubTabBorderRadius": 20,
            "selfSelectedMode": SelectedMode.INDICATOR,

            "selfIndicatorColorStr": "#FFFF0000",
            "selfIndicatorHeightStr": "10vp",
            "selfIndicatorWidthStr": "30vp",
            "selfIndicatorBorderRadiusStr": "5vp",
            "selfSubTabBorderRadiusStr": "20vp",
            "selfMarginTopStr": "10vp",
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      done();
    })

    /**
     * @tc.name   ArkUI_Tabs_Divider_0100
     * @tc.number ArkUI_Tabs_Divider_0100
     * @tc.desc   the default divier parameter is {}
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Tabs_Divider_0100', Level.LEVEL1, async (done: Function) => {
      console.info("ArkUI_Tabs_Divider_0100 start");
      let strJson = getInspectorByKey('tabsTest5');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Tabs_Divider_0100] divider:" + obj.$attrs.divider);
      if(!obj.$attrs.divider.strokeWidth) {
        expect(true).assertTrue();
      } else {
        expect(true).assertFalse();
      }
      done();
    });

    /**
     * @tc.name   ArkUI_Tabs_Divider_0200
     * @tc.number ArkUI_Tabs_Divider_0200
     * @tc.desc   set divier parameter to type number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Tabs_Divider_0200', Level.LEVEL1, async (done: Function) => {
      console.info("ArkUI_Tabs_Divider_0200 start");
      let strJson = getInspectorByKey('tabsTest');
      let obj: ESObject = JSON.parse(strJson);
      
      console.info("[ArkUI_Tabs_Divider_0200] divider:" + JSON.stringify(obj.$attrs.divider));
      let dividerObject: ESObject = obj.$attrs.divider;
      expect(dividerObject.strokeWidth).assertEqual("10.00px");
      expect(dividerObject.color).assertEqual("#FFFF0000");
      expect(dividerObject.startMargin).assertEqual("5.00px");
      expect(dividerObject.endMargin).assertEqual("5.00px");
      done();
    });

    /**
     * @tc.name   ArkUI_Tabs_Divider_0300
     * @tc.number ArkUI_Tabs_Divider_0300
     * @tc.desc   set divier parameter to type string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Tabs_Divider_0300', Level.LEVEL1, async (done: Function) => {
      console.info("ArkUI_Tabs_Divider_0300 start");
      let strJson = getInspectorByKey('tabsTest2');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Tabs_Divider_0300] divider:" + JSON.stringify(obj.$attrs.divider));
      let dividerObject: ESObject = obj.$attrs.divider;
      expect(dividerObject.strokeWidth).assertEqual("10.00vp");
      expect(dividerObject.color).assertEqual('#FFFF0000');
      expect(dividerObject.startMargin).assertEqual("5.00vp");
      expect(dividerObject.endMargin).assertEqual("5.00vp");
      done();
    });

    /**
     * @tc.name   ArkUI_Tabs_Divider_0400
     * @tc.number ArkUI_Tabs_Divider_0400
     * @tc.desc   set divier parameter to type Resource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Tabs_Divider_0400', Level.LEVEL1, async (done: Function) => {
      console.info("ArkUI_Tabs_Divider_0400 start");
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('tabsTest3');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Tabs_Divider_0400] divider:" + JSON.stringify(obj.$attrs.divider));
      let dividerObject: ESObject = obj.$attrs.divider;
      expect(dividerObject.strokeWidth).assertEqual("10.00px");
      expect(dividerObject.color).assertEqual('#FF121212');
      expect(dividerObject.startMargin).assertEqual("5.00px");
      expect(dividerObject.endMargin).assertEqual("5.00px");
      done();
    });

    /**
     * @tc.name   ArkUI_Tabs_Divider_0500
     * @tc.number ArkUI_Tabs_Divider_0500
     * @tc.desc   set divier parameter to type Color
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Tabs_Divider_0500', Level.LEVEL1, async (done: Function) => {
      console.info("ArkUI_Tabs_Divider_0500 start");
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('tabsTest4');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Tabs_Divider_0500] divider:" + JSON.stringify(obj.$attrs.divider));
      let dividerObject: ESObject = obj.$attrs.divider;
      expect(dividerObject.strokeWidth).assertEqual("10.00px");
      expect(dividerObject.color).assertEqual("#FFFF0000");
      expect(dividerObject.startMargin).assertEqual("5.00px");
      expect(dividerObject.endMargin).assertEqual("5.00px");
      done();
    });

    /**
     * @tc.name   ArkUI_Tabs_Divider_0600
     * @tc.number ArkUI_Tabs_Divider_0600
     * @tc.desc   set divier parameter to null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Tabs_Divider_0600', Level.LEVEL1, async (done: Function) => {
      console.info("ArkUI_Tabs_Divider_0600 start");

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
        console.info("[ArkUI_Tabs_Divider_0600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_Divider_0600] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let defaultStrJson = getInspectorByKey('defaultTabs');
      let defaultObj: ESObject = JSON.parse(defaultStrJson);
      console.info("[ArkUI_Tabs_Divider_0600] defaultDivider:" + JSON.stringify(defaultObj.$attrs.divider));
      let defaultDividerObject: ESObject = defaultObj.$attrs.divider;
      let defaultDividerColor: string = defaultDividerObject.color;

      let strJson = getInspectorByKey('tabsTest');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Tabs_Divider_0600] divider:" + JSON.stringify(obj.$attrs.divider));
      let dividerObject: ESObject = obj.$attrs.divider;
      expect(dividerObject.strokeWidth).assertEqual("0.00px");
      expect(dividerObject.color).assertEqual(defaultDividerColor);
      expect(dividerObject.startMargin).assertEqual('0.00px');
      expect(dividerObject.endMargin).assertEqual('0.00px');
      done();
    });

    /**
     * @tc.name   ArkUI_Tabs_Divider_0700
     * @tc.number ArkUI_Tabs_Divider_0700
     * @tc.desc   set divier parameter to abnormol color value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Tabs_Divider_0700', Level.LEVEL1, async (done: Function) => {
      console.info("ArkUI_Tabs_Divider_0700 start");

      try {
        let eventData: events_emitter.EventData = {
          data: {
            "strokeWidthStr": '10px',
            "dividerColorStr": 'xxxxxxxx',
            "startMarginStr": '5px',
            "endMarginStr": '5px',
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_Divider_0700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_Divider_0700] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let defaultStrJson = getInspectorByKey('defaultTabs');
      let defaultObj: ESObject = JSON.parse(defaultStrJson);
      console.info("[ArkUI_Tabs_Divider_0700] defaultDivider:" + JSON.stringify(defaultObj.$attrs.divider));
      let defaultDividerObject: ESObject = defaultObj.$attrs.divider;
      let defaultDividerColor: string = defaultDividerObject.color;

      let strJson = getInspectorByKey('tabsTest');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Tabs_Divider_0700] divider:" + JSON.stringify(obj.$attrs.divider));
      let dividerObject: ESObject = obj.$attrs.divider;
      expect(dividerObject.strokeWidth).assertEqual("10.00px");
      expect(dividerObject.color).assertEqual(defaultDividerColor);
      expect(dividerObject.startMargin).assertEqual("5.00px");
      expect(dividerObject.endMargin).assertEqual("5.00px");
      done();
    });

    /**
     * @tc.name   ArkUI_Tabs_Divider_0800
     * @tc.number ArkUI_Tabs_Divider_0800
     * @tc.desc   set divier parameter to abnormol strokeWidthStr value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Tabs_Divider_0800', Level.LEVEL1, async (done: Function) => {
      console.info("ArkUI_Tabs_Divider_0800 start");

      try {
        let eventData: events_emitter.EventData = {
          data: {
            "strokeWidthStr": 'xxxxxxxx',
            "dividerColorStr": 'red',
            "startMarginStr": '5px',
            "endMarginStr": '5px',
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_Divider_0800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_Divider_0800] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('tabsTest');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Tabs_Divider_0800] divider:" + JSON.stringify(obj.$attrs.divider));
      let dividerObject: ESObject = obj.$attrs.divider;
      expect(dividerObject.strokeWidth).assertEqual('0.00vp');
      done();
    });

    /**
     * @tc.name   ArkUI_Tabs_Divider_0900
     * @tc.number ArkUI_Tabs_Divider_0900
     * @tc.desc   set divier parameter to abnormol startMarginStr value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Tabs_Divider_0900', Level.LEVEL1, async (done: Function) => {
      console.info("ArkUI_Tabs_Divider_0900 start");

      try {
        let eventData: events_emitter.EventData = {
          data: {
            "strokeWidthStr": '10px',
            "dividerColorStr": 'red',
            "startMarginStr": 'xxxxxxxx',
            "endMarginStr": '5px',
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_Divider_0900] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_Divider_0900] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('tabsTest');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Tabs_Divider_0900] divider:" + JSON.stringify(obj.$attrs.divider));
      let dividerObject: ESObject = obj.$attrs.divider;
      expect(dividerObject.startMargin).assertEqual('0.00vp');
      done();
    });

    /**
     * @tc.name   ArkUI_Tabs_Divider_1000
     * @tc.number ArkUI_Tabs_Divider_1000
     * @tc.desc   set divier parameter to abnormol endMarginStr value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Tabs_Divider_1000', Level.LEVEL1, async (done: Function) => {
      console.info("ArkUI_Tabs_Divider_1000 start");

      try {
        let eventData: events_emitter.EventData = {
          data: {
            "strokeWidthStr": '10px',
            "dividerColorStr": 'red',
            "startMarginStr": '5px',
            "endMarginStr": 'xxxxxxxx',
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_Divider_1000] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_Divider_1000] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('tabsTest');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Tabs_Divider_1000] divider:" + JSON.stringify(obj.$attrs.divider));
      let dividerObject: ESObject = obj.$attrs.divider;
      expect(dividerObject.endMargin).assertEqual('0.00vp');
      done();
    });
    
    /**
     * @tc.name   ArkUI_Tabs_Divider_1100
     * @tc.number ArkUI_Tabs_Divider_1100
     * @tc.desc   set divider and indicator.selectedMode test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Tabs_Divider_1100', Level.LEVEL1, async (done: Function) => {
      console.info("ArkUI_Tabs_Divider_1100 start");
      
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "strokeWidthStr": '10px',
            "dividerColorStr": 'red',
            "startMarginStr": '5px',
            "endMarginStr": '5px',
            "selfSelectedMode": SelectedMode.BOARD,
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_Divider_1100] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_Divider_1100] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('tabsTest');
      let strJson2 = getInspectorByKey('indicatorTest1');
      let obj: ESObject = JSON.parse(strJson);
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[ArkUI_Tabs_Divider_1100] divider:" + JSON.stringify(obj.$attrs.divider));
      console.info("[ArkUI_Tabs_Divider_1100] selectedMode:" + obj2.$attrs.tabBar.selectedMode);
      let dividerObject: ESObject = obj.$attrs.divider;
      expect(dividerObject.strokeWidth).assertEqual("10.00px");
      expect(dividerObject.color).assertEqual("#FFFF0000");
      expect(dividerObject.startMargin).assertEqual("5.00px");
      expect(dividerObject.endMargin).assertEqual("5.00px");
      expect(obj2.$attrs.tabBar.selectedMode).assertEqual("SelectedMode.BOARD");
      done();
    });
    
    /**
     * @tc.name   ArkUI_Tabs_Divider_1200
     * @tc.number ArkUI_Tabs_Divider_1200
     * @tc.desc   set divier parameter to abnormol endMarginStr value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Tabs_Divider_1200', Level.LEVEL1, async (done: Function) => {
      console.info("ArkUI_Tabs_Divider_1200 start");

      try {
        let eventData: events_emitter.EventData = {
          data: {
            "strokeWidthStr": '10vp',
            "startMarginStr": '10vp',
            "endMarginStr": '10vp',
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_Divider_1200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_Divider_1200] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('tabsTest');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Tabs_Divider_1200] divider:" + JSON.stringify(obj.$attrs.divider));
      let dividerObject: ESObject = obj.$attrs.divider;
      expect(dividerObject.strokeWidth).assertEqual('10.00vp');
      expect(dividerObject.startMargin).assertEqual('10.00vp');
      expect(dividerObject.endMargin).assertEqual('10.00vp');

      try {
        let eventData: events_emitter.EventData = {
          data: {
            "strokeWidthStr": '10px',
            "startMarginStr": '10px',
            "endMarginStr": '10px',
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_Divider_1200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_Divider_1200] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      strJson = getInspectorByKey('tabsTest');
      obj = JSON.parse(strJson);
      console.info("[ArkUI_Tabs_Divider_1200] divider:" + JSON.stringify(obj.$attrs.divider));
      dividerObject = obj.$attrs.divider;
      expect(dividerObject.strokeWidth).assertEqual('10.00px');
      expect(dividerObject.startMargin).assertEqual('10.00px');
      expect(dividerObject.endMargin).assertEqual('10.00px');

      try {
        let eventData: events_emitter.EventData = {
          data: {
            "strokeWidthStr": '10fp',
            "startMarginStr": '10fp',
            "endMarginStr": '10fp',
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_Divider_1200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_Divider_1200] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      strJson = getInspectorByKey('tabsTest');
      obj = JSON.parse(strJson);
      console.info("[ArkUI_Tabs_Divider_1200] divider:" + JSON.stringify(obj.$attrs.divider));
      dividerObject = obj.$attrs.divider;
      expect(dividerObject.strokeWidth).assertEqual('10.00fp');
      expect(dividerObject.startMargin).assertEqual('10.00fp');
      expect(dividerObject.endMargin).assertEqual('10.00fp');

      try {
        let eventData: events_emitter.EventData = {
          data: {
            "strokeWidthStr": '10lpx',
            "startMarginStr": '10lpx',
            "endMarginStr": '10lpx',
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_Divider_1200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_Divider_1200] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      strJson = getInspectorByKey('tabsTest');
      obj = JSON.parse(strJson);
      console.info("[ArkUI_Tabs_Divider_1200] divider:" + JSON.stringify(obj.$attrs.divider));
      dividerObject = obj.$attrs.divider;
      expect(dividerObject.strokeWidth).assertEqual('10.00lpx');
      expect(dividerObject.startMargin).assertEqual('10.00lpx');
      expect(dividerObject.endMargin).assertEqual('10.00lpx');
      done();
    });

    /**
     * @tc.name   ArkUI_Tabs_LabelStyle_0100
     * @tc.number ArkUI_Tabs_LabelStyle_0100
     * @tc.desc   the default labelStyle parameter is true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Tabs_LabelStyle_0100', Level.LEVEL1, async (done: Function) => {
      console.info("ArkUI_Tabs_LabelStyle_0100 start");

      let defaultStrJson = getInspectorByKey('indicatorTest6');
      let defaultObj: ESObject = JSON.parse(defaultStrJson);
      console.info("[ArkUI_Tabs_LabelStyle_0100] labelStyle:" +  JSON.stringify(defaultObj.$attrs.tabBar.labelStyle));
      let defaultLabelStyleObject: ESObject = defaultObj.$attrs.tabBar.labelStyle;
      let defaultFontSize: ESObject = defaultLabelStyleObject.font.size;

      let strJson = getInspectorByKey('indicatorTest5');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Tabs_LabelStyle_0100] labelStyle:" +  JSON.stringify(obj.$attrs.tabBar.labelStyle));

      expect(obj.$attrs.tabBar.labelStyle.overflow).assertEqual('TextOverflow.Ellipsis');
      expect(obj.$attrs.tabBar.labelStyle.maxLines).assertEqual('1');
      expect(obj.$attrs.tabBar.labelStyle.minFontSize).assertEqual('0.00vp');
      expect(obj.$attrs.tabBar.labelStyle.maxFontSize).assertEqual('0.00vp');
      expect(obj.$attrs.tabBar.labelStyle.heightAdaptivePolicy).assertEqual('TextHeightAdaptivePolicy.MAX_LINES_FIRST');
      expect(obj.$attrs.tabBar.labelStyle.font.size).assertEqual(defaultFontSize);
      expect(obj.$attrs.tabBar.labelStyle.font.weight).assertEqual('FontWeight.Normal');
      expect(obj.$attrs.tabBar.labelStyle.font.family).assertEqual('HarmonyOS Sans');
      expect(obj.$attrs.tabBar.labelStyle.font.style).assertEqual('FontStyle.Normal');
      done();
    });

    /**
     * @tc.name   ArkUI_Tabs_LabelStyle_0200
     * @tc.number ArkUI_Tabs_LabelStyle_0200
     * @tc.desc   set labelStyle to Single line truncation with ellipsis
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Tabs_LabelStyle_0200', Level.LEVEL1, async (done: Function) => {
      console.info("ArkUI_Tabs_LabelStyle_0200 start");
      let strJson = getInspectorByKey('indicatorTest1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Tabs_LabelStyle_0200] labelStyle:" +  JSON.stringify(obj.$attrs.tabBar.labelStyle));

      expect(obj.$attrs.tabBar.labelStyle.overflow).assertEqual('TextOverflow.Ellipsis');
      expect(obj.$attrs.tabBar.labelStyle.maxLines).assertEqual('1');
      expect(obj.$attrs.tabBar.labelStyle.minFontSize).assertEqual('5.00fp');
      expect(obj.$attrs.tabBar.labelStyle.heightAdaptivePolicy).assertEqual('TextHeightAdaptivePolicy.MIN_FONT_SIZE_FIRST');
      expect(obj.$attrs.tabBar.labelStyle.font.size).assertEqual('15.00fp');
      done();
    });

    /**
     * @tc.name   ArkUI_Tabs_LabelStyle_0300
     * @tc.number ArkUI_Tabs_LabelStyle_0300
     * @tc.desc   set labelStyle to Reduce and then truncate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Tabs_LabelStyle_0300', Level.LEVEL1, async (done: Function) => {
      console.info("ArkUI_Tabs_LabelStyle_0300 start");
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('indicatorTest2');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Tabs_LabelStyle_0300] labelStyle:" + JSON.stringify(obj.$attrs.tabBar.labelStyle));
      expect(obj.$attrs.tabBar.labelStyle.overflow).assertEqual('TextOverflow.Clip');
      expect(obj.$attrs.tabBar.labelStyle.maxLines).assertEqual('1');
      expect(obj.$attrs.tabBar.labelStyle.minFontSize).assertEqual('5.00fp');
      expect(obj.$attrs.tabBar.labelStyle.maxFontSize).assertEqual('20.00fp');
      expect(obj.$attrs.tabBar.labelStyle.heightAdaptivePolicy).assertEqual('TextHeightAdaptivePolicy.LAYOUT_CONSTRAINT_FIRST');
      expect(obj.$attrs.tabBar.labelStyle.font.size).assertEqual('15.00fp');
      done();
    });

    /**
     * @tc.name   ArkUI_Tabs_LabelStyle_0400
     * @tc.number ArkUI_Tabs_LabelStyle_0400
     * @tc.desc   set labelStyle to shrink, wrap, and truncate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Tabs_LabelStyle_0400', Level.LEVEL1, async (done: Function) => {
      console.info("ArkUI_Tabs_LabelStyle_0400 start");

      let strJson = getInspectorByKey('indicatorTest3');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Tabs_LabelStyle_0400] labelStyle:" + JSON.stringify(obj.$attrs.tabBar.labelStyle));
      expect(obj.$attrs.tabBar.labelStyle.overflow).assertEqual('TextOverflow.None');
      expect(obj.$attrs.tabBar.labelStyle.maxLines).assertEqual('2');
      expect(obj.$attrs.tabBar.labelStyle.minFontSize).assertEqual('5.00fp');
      expect(obj.$attrs.tabBar.labelStyle.maxFontSize).assertEqual('20.00fp');
      expect(obj.$attrs.tabBar.labelStyle.heightAdaptivePolicy).assertEqual('TextHeightAdaptivePolicy.LAYOUT_CONSTRAINT_FIRST');
      expect(obj.$attrs.tabBar.labelStyle.font.size).assertEqual('15.00fp');
      done();
    });

    /**
     * @tc.name   ArkUI_Tabs_LabelStyle_0500
     * @tc.number ArkUI_Tabs_LabelStyle_0500
     * @tc.desc   set labelStyle to line feed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Tabs_LabelStyle_0500', Level.LEVEL1, async (done: Function) => {
      console.info("ArkUI_Tabs_LabelStyle_0500 start");

      let strJson = getInspectorByKey('indicatorTest4');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Tabs_LabelStyle_0500] labelStyle:" + JSON.stringify(obj.$attrs.tabBar.labelStyle));
      expect(obj.$attrs.tabBar.labelStyle.overflow).assertEqual('TextOverflow.None');
      expect(obj.$attrs.tabBar.labelStyle.maxLines).assertEqual('10');
      expect(obj.$attrs.tabBar.labelStyle.minFontSize).assertEqual('5.00fp');
      expect(obj.$attrs.tabBar.labelStyle.maxFontSize).assertEqual('20.00fp');
      expect(obj.$attrs.tabBar.labelStyle.heightAdaptivePolicy).assertEqual('TextHeightAdaptivePolicy.MAX_LINES_FIRST');
      expect(obj.$attrs.tabBar.labelStyle.font.size).assertEqual('15.00fp');
      done();
    });

    /**
     * @tc.name   ArkUI_Tabs_LabelStyle_0600
     * @tc.number ArkUI_Tabs_LabelStyle_0600
     * @tc.desc   set labelStyle to when null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Tabs_LabelStyle_0600', Level.LEVEL1, async (done: Function) => {
      console.info("ArkUI_Tabs_LabelStyle_0600 start");

      let defaultStrJson = getInspectorByKey('indicatorTest5');
      let defaultObj: ESObject = JSON.parse(defaultStrJson);
      console.info("[ArkUI_Tabs_LabelStyle_0600] default labelStyle:" +  JSON.stringify(defaultObj.$attrs.tabBar.labelStyle));
      let defaultLabelStyleObject: ESObject = defaultObj.$attrs.tabBar.labelStyle;
      let defaultFontSize: ESObject = defaultLabelStyleObject.font.size;

      let strJson = getInspectorByKey('indicatorTest6');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Tabs_LabelStyle_0600] labelStyle:" + JSON.stringify(obj.$attrs.tabBar.labelStyle));
      expect(obj.$attrs.tabBar.labelStyle.overflow).assertEqual('TextOverflow.Ellipsis');
      expect(obj.$attrs.tabBar.labelStyle.maxLines).assertEqual('1');
      expect(obj.$attrs.tabBar.labelStyle.minFontSize).assertEqual('0.00vp');
      expect(obj.$attrs.tabBar.labelStyle.maxFontSize).assertEqual('0.00vp');
      expect(obj.$attrs.tabBar.labelStyle.heightAdaptivePolicy).assertEqual('TextHeightAdaptivePolicy.MAX_LINES_FIRST');
      expect(obj.$attrs.tabBar.labelStyle.font.size).assertEqual(defaultFontSize);
      expect(obj.$attrs.tabBar.labelStyle.font.weight).assertEqual('FontWeight.Normal');
      expect(obj.$attrs.tabBar.labelStyle.font.family).assertEqual('HarmonyOS Sans');
      expect(obj.$attrs.tabBar.labelStyle.font.style).assertEqual('FontStyle.Normal');
      done();
    });

    /**
     * @tc.name   ArkUI_Tabs_FadingEdge_0100
     * @tc.number ArkUI_Tabs_FadingEdge_0100
     * @tc.desc   the default fadingEdge parameter is true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Tabs_FadingEdge_0100', Level.LEVEL1, async (done: Function) => {
      console.info("ArkUI_Tabs_FadingEdge_0100 start");      
      let strJson = getInspectorByKey('tabsTest2');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Tabs_FadingEdge_0100] fadingEdge:" + obj.$attrs.fadingEdge);
      expect(obj.$attrs.fadingEdge).assertEqual('true');
      done();
    });

    /**
     * @tc.name   ArkUI_Tabs_FadingEdge_0200
     * @tc.number ArkUI_Tabs_FadingEdge_0200
     * @tc.desc   set fadingEdge to true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Tabs_FadingEdge_0200', Level.LEVEL1, async (done: Function) => {
      console.info("ArkUI_Tabs_FadingEdge_0200 start");

      try {
        let eventData: events_emitter.EventData = {
          data: {
            "overflowFlag": true
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_FadingEdge_0200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_FadingEdge_0200] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('tabsTest');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Tabs_FadingEdge_0200] fadingEdge:" + obj.$attrs.fadingEdge);
      expect(obj.$attrs.fadingEdge).assertEqual('true');
      done();
    });

    /**
     * @tc.name   ArkUI_Tabs_FadingEdge_0300
     * @tc.number ArkUI_Tabs_FadingEdge_0300
     * @tc.desc   set fadingEdge to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Tabs_FadingEdge_0300', Level.LEVEL1, async (done: Function) => {
      console.info("ArkUI_Tabs_FadingEdge_0300 start");

      try {
        let eventData: events_emitter.EventData = {
          data: {
            "overflowFlag": false
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_FadingEdge_0300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_FadingEdge_0300] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('tabsTest');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Tabs_FadingEdge_0300] fadingEdge:" + obj.$attrs.fadingEdge);
      expect(obj.$attrs.fadingEdge).assertEqual('false');
      done();
    });

    /**
     * @tc.name   ArkUI_Tabs_IndicatorColor_0100
     * @tc.number ArkUI_Tabs_IndicatorColor_0100
     * @tc.desc   the default indicator.color parameter is "#FF007DFF"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Tabs_IndicatorColor_0100', Level.LEVEL1, async (done: Function) => {
      console.info("ArkUI_Tabs_IndicatorColor_0100 start");

      await Utils.sleep(2000);
      let defaultStrJson = getInspectorByKey('indicatorTest6');
      let defaultObj: ESObject = JSON.parse(defaultStrJson);
      console.info("[ArkUI_Tabs_IndicatorColor_0100] default indicator:" + defaultObj.$attrs.tabBar.indicator);
      let defaultIndicatorColor: string = defaultObj.$attrs.tabBar.indicator.color;

      let strJson = getInspectorByKey('indicatorTest5');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Tabs_IndicatorColor_0100] indicator:" + obj.$attrs.tabBar.indicator);
      let indicatorColor: string = obj.$attrs.tabBar.indicator.color;
      expect(indicatorColor).assertEqual(defaultIndicatorColor);
      done();
    });

    /**
     * @tc.name   ArkUI_Tabs_IndicatorColor_0200
     * @tc.number ArkUI_Tabs_IndicatorColor_0200
     * @tc.desc   set indicator.color to number type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Tabs_IndicatorColor_0200', Level.LEVEL1, async (done: Function) => {
      console.info("ArkUI_Tabs_IndicatorColor_0200 start");
      let strJson = getInspectorByKey('indicatorTest1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Tabs_IndicatorColor_0200] indicator:" + obj.$attrs.tabBar.indicator);
      let indicatorColor: string = obj.$attrs.tabBar.indicator.color;
      expect(indicatorColor).assertEqual("#FFFF0000");
      done();
    });

    /**
     * @tc.name   ArkUI_Tabs_IndicatorColor_0300
     * @tc.number ArkUI_Tabs_IndicatorColor_0300
     * @tc.desc   set indicator.color to string type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Tabs_IndicatorColor_0300', Level.LEVEL1, async (done: Function) => {
      console.info("ArkUI_Tabs_IndicatorColor_0300 start");
      let strJson = getInspectorByKey('indicatorTest2');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Tabs_IndicatorColor_0300] indicator:" + obj.$attrs.tabBar.indicator);
      let indicatorColor: string = obj.$attrs.tabBar.indicator.color;
      expect(indicatorColor).assertEqual("#FFFF0000");
      done();
    });

    /**
     * @tc.name   ArkUI_Tabs_IndicatorColor_0400
     * @tc.number ArkUI_Tabs_IndicatorColor_0400
     * @tc.desc   set indicator.color to Resource type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Tabs_IndicatorColor_0400', Level.LEVEL1, async (done: Function) => {
      console.info("ArkUI_Tabs_IndicatorColor_0400 start");
      let strJson = getInspectorByKey('indicatorTest3');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Tabs_IndicatorColor_0400] indicator:" + obj.$attrs.tabBar.indicator);
      let indicatorColor: string = obj.$attrs.tabBar.indicator.color;
      expect(indicatorColor).assertEqual("#FFFF0000");
      done();
    });

    /**
     * @tc.name   ArkUI_Tabs_IndicatorColor_0500
     * @tc.number ArkUI_Tabs_IndicatorColor_0500
     * @tc.desc   set indicator.color to Color type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Tabs_IndicatorColor_0500', Level.LEVEL1, async (done: Function) => {
      console.info("ArkUI_Tabs_IndicatorColor_0500 start");
      let strJson = getInspectorByKey('indicatorTest4');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Tabs_IndicatorColor_0500] indicator:" + obj.$attrs.tabBar.indicator);
      let indicatorColor: string = obj.$attrs.tabBar.indicator.color;
      expect(indicatorColor).assertEqual("#FFFF0000");
      done();
    });

    /**
     * @tc.name   ArkUI_Tabs_IndicatorColor_0600
     * @tc.number ArkUI_Tabs_IndicatorColor_0600
     * @tc.desc   set indicator.color to abnormol value "xxxxxxxx" then get the default value "#FF007DFF"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Tabs_IndicatorColor_0600', Level.LEVEL1, async (done: Function) => {
      console.info("ArkUI_Tabs_IndicatorColor_0600 start");

      try {
        let eventData: events_emitter.EventData = {
          data: {
            "selfIndicatorColor": "xxxxxxxx"
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_IndicatorColor_0600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_IndicatorColor_0600] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let defaultStrJson = getInspectorByKey('indicatorTest6');
      let defaultObj: ESObject = JSON.parse(defaultStrJson);
      console.info("[ArkUI_Tabs_IndicatorColor_0600] default indicator:" + defaultObj.$attrs.tabBar.indicator);
      let defaultIndicatorColor: string = defaultObj.$attrs.tabBar.indicator.color;

      let strJson = getInspectorByKey('indicatorTest1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Tabs_IndicatorColor_0600] indicator:" + obj.$attrs.tabBar.indicator);
      let indicatorColor: string = obj.$attrs.tabBar.indicator.color;
      expect(indicatorColor).assertEqual(defaultIndicatorColor);
      done();
    });

    /**
     * @tc.name   ArkUI_Tabs_IndicatorColor_0700
     * @tc.number ArkUI_Tabs_IndicatorColor_0700
     * @tc.desc   set indicator property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Tabs_IndicatorColor_0700', Level.LEVEL1, async (done: Function) => {
      console.info("ArkUI_Tabs_IndicatorColor_0700 start");
      
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "selfIndicatorColor": Color.Red,
            "selfIndicatorHeight": 5,
            "selfIndicatorWidth": 20,
            "selfIndicatorBorderRadius": 5,
            "selfMarginTop": 10
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_IndicatorColor_0700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_IndicatorColor_0700] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('indicatorTest1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Tabs_IndicatorColor_0700] indicator:" + obj.$attrs.tabBar.indicator);
      let indicatorColor: string = obj.$attrs.tabBar.indicator.color;
      let indicatorHeight: string = obj.$attrs.tabBar.indicator.height;
      let indicatorWidth: string = obj.$attrs.tabBar.indicator.width;
      let indicatorBorderRadius: string = obj.$attrs.tabBar.indicator.borderRadius;
      let IndicatorMarginTop: string = obj.$attrs.tabBar.indicator.marginTop;
      expect(indicatorColor).assertEqual("#FFFF0000");
      expect(indicatorHeight).assertEqual("5.00vp");
      expect(indicatorWidth).assertEqual("20.00vp");
      expect(indicatorBorderRadius).assertEqual("5.00vp");
      expect(IndicatorMarginTop).assertEqual("10.00vp");
      done();
    });

    /**
     * @tc.name   ArkUI_Tabs_IndicatorHeight_0100
     * @tc.number ArkUI_Tabs_IndicatorHeight_0100
     * @tc.desc   the default indicator.height parameter is "2.00vp".
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Tabs_IndicatorHeight_0100', Level.LEVEL1, async (done: Function) => {
      console.info("ArkUI_Tabs_IndicatorHeight_0100 start ")
      let defaultStrJson = getInspectorByKey('defaultSubTab');
      let defaultObj: ESObject = JSON.parse(defaultStrJson);
      console.info("[ArkUI_Tabs_IndicatorHeight_0100] default indicator:" + defaultObj.$attrs.tabBar.indicator);
      let defaultIndicatorHeight: string = defaultObj.$attrs.tabBar.indicator.height;

      let strJson = getInspectorByKey('indicatorTest5');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Tabs_IndicatorHeight_0100] indicator:" + obj.$attrs.tabBar.indicator);
      let indicatorHeight: string = obj.$attrs.tabBar.indicator.height;
      expect(indicatorHeight).assertEqual(defaultIndicatorHeight);
      done();
    });

    /**
     * @tc.name   ArkUI_Tabs_IndicatorHeight_0200
     * @tc.number ArkUI_Tabs_IndicatorHeight_0200
     * @tc.desc   set indicator.height to number type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Tabs_IndicatorHeight_0200', Level.LEVEL1, async (done: Function) => {
      console.info("ArkUI_Tabs_IndicatorHeight_0200 start ")
      let strJson = getInspectorByKey('indicatorTest1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Tabs_IndicatorHeight_0200] indicator:" + obj.$attrs.tabBar.indicator);
      let indicatorHeight: string = obj.$attrs.tabBar.indicator.height;
      expect(indicatorHeight).assertEqual("10.00vp");
      done();
    });

    /**
     * @tc.name   ArkUI_Tabs_IndicatorHeight_0300
     * @tc.number ArkUI_Tabs_IndicatorHeight_0300
     * @tc.desc   set indicator.height to string type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Tabs_IndicatorHeight_0300', Level.LEVEL1, async (done: Function) => {
      console.info("ArkUI_Tabs_IndicatorHeight_0300 start ")
      let strJson = getInspectorByKey('indicatorTest2');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Tabs_IndicatorHeight_0300] indicator:" + obj.$attrs.tabBar.indicator);
      let indicatorHeight: string = obj.$attrs.tabBar.indicator.height;
      expect(indicatorHeight).assertEqual("10.00vp");
      done();
    });

    /**
     * @tc.name   ArkUI_Tabs_IndicatorHeight_0400
     * @tc.number ArkUI_Tabs_IndicatorHeight_0400
     * @tc.desc   set indicator.height to resource type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Tabs_IndicatorHeight_0400', Level.LEVEL1, async (done: Function) => {
      console.info("ArkUI_Tabs_IndicatorHeight_0400 start ")
      let strJson = getInspectorByKey('indicatorTest3');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Tabs_IndicatorHeight_0400] indicator:" + obj.$attrs.tabBar.indicator);
      let indicatorHeight: string = obj.$attrs.tabBar.indicator.height;
      expect(indicatorHeight).assertEqual("10.00vp");
      done();
    });

    /**
     * @tc.name   ArkUI_Tabs_IndicatorHeight_0500
     * @tc.number ArkUI_Tabs_IndicatorHeight_0500
     * @tc.desc   set indicator.height to abnormol value -1 then get the default value "2.00vp"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Tabs_IndicatorHeight_0500', Level.LEVEL1, async (done: Function) => {
      console.info("ArkUI_Tabs_IndicatorHeight_0300 start");
      
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "selfIndicatorHeight": -1
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_IndicatorHeight_0500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_IndicatorHeight_0500] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let defaultStrJson = getInspectorByKey('defaultSubTab');
      let defaultObj: ESObject = JSON.parse(defaultStrJson);
      console.info("[ArkUI_Tabs_IndicatorHeight_0500] default indicator:" + defaultObj.$attrs.tabBar.indicator);
      let defaultIndicatorHeight: string = defaultObj.$attrs.tabBar.indicator.height;

      let strJson = getInspectorByKey('indicatorTest1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Tabs_IndicatorHeight_0500] indicator:" + obj.$attrs.tabBar.indicator);
      let indicatorHeight: string = obj.$attrs.tabBar.indicator.height;
      expect(indicatorHeight).assertEqual(defaultIndicatorHeight);
      done();
    });

    /**
     * @tc.name   ArkUI_Tabs_IndicatorHeight_0600
     * @tc.number ArkUI_Tabs_IndicatorHeight_0600
     * @tc.desc   set indicator.height with different length's unit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Tabs_IndicatorHeight_0600', Level.LEVEL1, async (done: Function) => {
      console.info("ArkUI_Tabs_IndicatorHeight_0300 start");
      
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "selfIndicatorHeightStr": "10px"
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_IndicatorHeight_0600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_IndicatorHeight_0600] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('indicatorTest2');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Tabs_IndicatorHeight_0600] indicator:" + obj.$attrs.tabBar.indicator);
      let indicatorHeight: string = obj.$attrs.tabBar.indicator.height;
      expect(indicatorHeight).assertEqual("10.00px");

      try {
        let eventData: events_emitter.EventData = {
          data: {
            "selfIndicatorHeightStr": "10fp"
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_IndicatorHeight_0600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_IndicatorHeight_0600] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      strJson = getInspectorByKey('indicatorTest2');
      obj = JSON.parse(strJson);
      console.info("[ArkUI_Tabs_IndicatorHeight_0600] indicator:" + obj.$attrs.tabBar.indicator);
      indicatorHeight = obj.$attrs.tabBar.indicator.height;
      expect(indicatorHeight).assertEqual("10.00fp");

      try {
        let eventData: events_emitter.EventData = {
          data: {
            "selfIndicatorHeightStr": "10lpx"
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_IndicatorHeight_0600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_IndicatorHeight_0600] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      strJson = getInspectorByKey('indicatorTest2');
      obj = JSON.parse(strJson);
      console.info("[ArkUI_Tabs_IndicatorHeight_0600] indicator:" + obj.$attrs.tabBar.indicator);
      indicatorHeight = obj.$attrs.tabBar.indicator.height;
      expect(indicatorHeight).assertEqual("10.00lpx");
      done();
    });

    /**
     * @tc.name   ArkUI_Tabs_IndicatorWidth_0100
     * @tc.number ArkUI_Tabs_IndicatorWidth_0100
     * @tc.desc   the default indicator.width parameter is "0.00vp".
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Tabs_IndicatorWidth_0100', Level.LEVEL1, async (done: Function) => {
      console.info("ArkUI_Tabs_IndicatorWidth_0100 start");
      let strJson = getInspectorByKey('indicatorTest5');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Tabs_IndicatorWidth_0100] indicator:" + obj.$attrs.tabBar.indicator);
      let indicatorWidth: string = obj.$attrs.tabBar.indicator.width;
      expect(indicatorWidth).assertEqual("0.00vp");
      done();
    });

    /**
     * @tc.name   ArkUI_Tabs_IndicatorWidth_0200
     * @tc.number ArkUI_Tabs_IndicatorWidth_0200
     * @tc.desc   set indicator.width to number type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Tabs_IndicatorWidth_0200', Level.LEVEL1, async (done: Function) => {
      console.info("ArkUI_Tabs_IndicatorWidth_0200 start");
      let strJson = getInspectorByKey('indicatorTest1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Tabs_IndicatorWidth_0200] indicator:" + obj.$attrs.tabBar.indicator);
      let indicatorWidth: string = obj.$attrs.tabBar.indicator.width;
      expect(indicatorWidth).assertEqual("30.00vp");
      done();
    });

    /**
     * @tc.name   ArkUI_Tabs_IndicatorWidth_0300
     * @tc.number ArkUI_Tabs_IndicatorWidth_0300
     * @tc.desc   set indicator.width to string type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Tabs_IndicatorWidth_0300', Level.LEVEL1, async (done: Function) => {
      console.info("ArkUI_Tabs_IndicatorWidth_0300 start");
      let strJson = getInspectorByKey('indicatorTest2');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Tabs_IndicatorWidth_0300] indicator:" + obj.$attrs.tabBar.indicator);
      let indicatorWidth: string = obj.$attrs.tabBar.indicator.width;
      expect(indicatorWidth).assertEqual("30.00vp");
      done();
    });

    /**
     * @tc.name   ArkUI_Tabs_IndicatorWidth_0400
     * @tc.number ArkUI_Tabs_IndicatorWidth_0400
     * @tc.desc   set indicator.width to Resource type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Tabs_IndicatorWidth_0400', Level.LEVEL1, async (done: Function) => {
      console.info("ArkUI_Tabs_IndicatorWidth_0400 start");
      let strJson = getInspectorByKey('indicatorTest3');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Tabs_IndicatorWidth_0400] indicator:" + obj.$attrs.tabBar.indicator);
      let indicatorWidth: string = obj.$attrs.tabBar.indicator.width;
      expect(indicatorWidth).assertEqual("30.00vp");
      done();
    });


    /**
     * @tc.name   ArkUI_Tabs_IndicatorWidth_0500
     * @tc.number ArkUI_Tabs_IndicatorWidth_0500
     * @tc.desc   set indicator.color to abnormol value -1 then get the default value "0.00vp"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Tabs_IndicatorWidth_0500', Level.LEVEL1, async (done: Function) => {
      console.info("ArkUI_Tabs_IndicatorWidth_0500 start");
      
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "selfIndicatorWidth": -1
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_IndicatorWidth_0500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_IndicatorWidth_0500] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('indicatorTest1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Tabs_IndicatorWidth_0300] indicator:" + obj.$attrs.tabBar.indicator);
      let indicatorWidth: string = obj.$attrs.tabBar.indicator.width;
      expect(indicatorWidth).assertEqual("0.00vp");
      done();
    });

    /**
     * @tc.name   ArkUI_Tabs_IndicatorWidth_0600
     * @tc.number ArkUI_Tabs_IndicatorWidth_0600
     * @tc.desc   set indicator.width with different length's unit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Tabs_IndicatorWidth_0600', Level.LEVEL1, async (done: Function) => {
      console.info("ArkUI_Tabs_IndicatorHeight_0300 start");
      
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "selfIndicatorWidthStr": "10px"
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_IndicatorWidth_0600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_IndicatorWidth_0600] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('indicatorTest2');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Tabs_IndicatorWidth_0600] indicator:" + obj.$attrs.tabBar.indicator);
      let indicatorWidth: string = obj.$attrs.tabBar.indicator.width;
      expect(indicatorWidth).assertEqual("10.00px");

      try {
        let eventData: events_emitter.EventData = {
          data: {
            "selfIndicatorWidthStr": "10fp"
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_IndicatorWidth_0600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_IndicatorWidth_0600] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      strJson = getInspectorByKey('indicatorTest2');
      obj = JSON.parse(strJson);
      console.info("[ArkUI_Tabs_IndicatorWidth_0600] indicator:" + obj.$attrs.tabBar.indicator);
      indicatorWidth = obj.$attrs.tabBar.indicator.width;
      expect(indicatorWidth).assertEqual("10.00fp");

      try {
        let eventData: events_emitter.EventData = {
          data: {
            "selfIndicatorWidthStr": "10lpx"
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_IndicatorWidth_0600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_IndicatorWidth_0600] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      strJson = getInspectorByKey('indicatorTest2');
      obj = JSON.parse(strJson);
      console.info("[ArkUI_Tabs_IndicatorWidth_0600] indicator:" + obj.$attrs.tabBar.indicator);
      indicatorWidth = obj.$attrs.tabBar.indicator.width;
      expect(indicatorWidth).assertEqual("10.00lpx");
      done();
    });

    /**
     * @tc.name   ArkUI_Tabs_IndicatorBorderRadius_0100
     * @tc.number ArkUI_Tabs_IndicatorBorderRadius_0100
     * @tc.desc   the default indicator.borderRadius parameter is "0.00vp".
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Tabs_IndicatorBorderRadius_0100', Level.LEVEL1, async (done: Function) => {
      console.info("ArkUI_Tabs_IndicatorBorderRadius_0100 start");
      let strJson = getInspectorByKey('indicatorTest5');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Tabs_IndicatorBorderRadius_0100] indicator:" + obj.$attrs.tabBar.indicator);
      let indicatorBorderRadius: string = obj.$attrs.tabBar.indicator.borderRadius
      expect(indicatorBorderRadius).assertEqual("0.00vp");
      done();
    });

    /**
     * @tc.name   ArkUI_Tabs_IndicatorBorderRadius_0200
     * @tc.number ArkUI_Tabs_IndicatorBorderRadius_0200
     * @tc.desc   set indicator.borderRadius to number type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Tabs_IndicatorBorderRadius_0200', Level.LEVEL1, async (done: Function) => {
      console.info("ArkUI_Tabs_IndicatorBorderRadius_0200 start");
      let strJson = getInspectorByKey('indicatorTest1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Tabs_IndicatorBorderRadius_0200] indicator:" + obj.$attrs.tabBar.indicator);
      let indicatorBorderRadius: string = obj.$attrs.tabBar.indicator.borderRadius
      expect(indicatorBorderRadius).assertEqual("5.00vp");
      done();
    });

    /**
     * @tc.name   ArkUI_Tabs_IndicatorBorderRadius_0300
     * @tc.number ArkUI_Tabs_IndicatorBorderRadius_0300
     * @tc.desc   set indicator.borderRadius to string type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Tabs_IndicatorBorderRadius_0300', Level.LEVEL1, async (done: Function) => {
      console.info("ArkUI_Tabs_IndicatorBorderRadius_0300 start");
      let strJson = getInspectorByKey('indicatorTest2');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Tabs_IndicatorBorderRadius_0300] indicator:" + obj.$attrs.tabBar.indicator);
      let indicatorBorderRadius: string = obj.$attrs.tabBar.indicator.borderRadius
      expect(indicatorBorderRadius).assertEqual("5.00vp");
      done();
    });

    /**
     * @tc.name   ArkUI_Tabs_IndicatorBorderRadius_0400
     * @tc.number ArkUI_Tabs_IndicatorBorderRadius_0400
     * @tc.desc   set indicator.borderRadius to Resource type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Tabs_IndicatorBorderRadius_0400', Level.LEVEL1, async (done: Function) => {
      console.info("ArkUI_Tabs_IndicatorBorderRadius_0400 start");
      let strJson = getInspectorByKey('indicatorTest3');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Tabs_IndicatorBorderRadius_0400] indicator:" + obj.$attrs.tabBar.indicator);
      let indicatorBorderRadius: string = obj.$attrs.tabBar.indicator.borderRadius
      expect(indicatorBorderRadius).assertEqual("5.00vp");
      done();
    });

    /**
     * @tc.name   ArkUI_Tabs_IndicatorBorderRadius_0500
     * @tc.number ArkUI_Tabs_IndicatorBorderRadius_0500
     * @tc.desc   set indicator.borderRadius to abnormol value -1 then get the default value "0.00vp"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Tabs_IndicatorBorderRadius_0500', Level.LEVEL1, async (done: Function) => {
      console.info("ArkUI_Tabs_IndicatorBorderRadius_0500 start");
      
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "selfIndicatorBorderRadius": -1
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_IndicatorBorderRadius_0500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_IndicatorBorderRadius_0500] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('indicatorTest1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Tabs_IndicatorBorderRadius_0500] indicator:" + obj.$attrs.tabBar.indicator);
      let indicatorBorderRadius: string = obj.$attrs.tabBar.indicator.borderRadius;
      expect(indicatorBorderRadius).assertEqual("0.00vp");
      done();
    });

    /**
     * @tc.name   ArkUI_Tabs_IndicatorBorderRadius_0600
     * @tc.number ArkUI_Tabs_IndicatorBorderRadius_0600
     * @tc.desc   set indicator.borderRadius with different length's unit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Tabs_IndicatorBorderRadius_0600', Level.LEVEL1, async (done: Function) => {
      console.info("ArkUI_Tabs_IndicatorHeight_0300 start");
      
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "selfIndicatorBorderRadiusStr": "10px"
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_IndicatorBorderRadius_0600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_IndicatorBorderRadius_0600] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('indicatorTest2');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Tabs_IndicatorBorderRadius_0600] indicator:" + obj.$attrs.tabBar.indicator);
      let indicatorBorderRadius: string = obj.$attrs.tabBar.indicator.borderRadius;
      expect(indicatorBorderRadius).assertEqual("10.00px");

      try {
        let eventData: events_emitter.EventData = {
          data: {
            "selfIndicatorBorderRadiusStr": "10fp"
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_IndicatorBorderRadius_0600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_IndicatorBorderRadius_0600] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      strJson = getInspectorByKey('indicatorTest2');
      obj = JSON.parse(strJson);
      console.info("[ArkUI_Tabs_IndicatorBorderRadius_0600] indicator:" + obj.$attrs.tabBar.indicator);
      indicatorBorderRadius = obj.$attrs.tabBar.indicator.borderRadius;
      expect(indicatorBorderRadius).assertEqual("10.00fp");

      try {
        let eventData: events_emitter.EventData = {
          data: {
            "selfIndicatorBorderRadiusStr": "10lpx"
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_IndicatorBorderRadius_0600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_IndicatorBorderRadius_0600] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      strJson = getInspectorByKey('indicatorTest2');
      obj = JSON.parse(strJson);
      console.info("[ArkUI_Tabs_IndicatorBorderRadius_0600] indicator:" + obj.$attrs.tabBar.indicator);
      indicatorBorderRadius = obj.$attrs.tabBar.indicator.borderRadius;
      expect(indicatorBorderRadius).assertEqual("10.00lpx");
      done();
    });

    /**
     * @tc.name   ArkUI_Tabs_SubTabBorderRadius_0100
     * @tc.number ArkUI_Tabs_SubTabBorderRadius_0100
     * @tc.desc   the default indicator.height parameter is "8.00vp".
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Tabs_SubTabBorderRadius_0100', Level.LEVEL1, async (done: Function) => {
      console.info("ArkUI_Tabs_SubTabBorderRadius_0100 start");
      let defaultStrJson = getInspectorByKey('indicatorTest6');
      let defaultObj: ESObject = JSON.parse(defaultStrJson);
      console.info("[ArkUI_Tabs_SubTabBorderRadius_0100] default subTabBorderRadius:" + defaultObj.$attrs.tabBar.board.borderRadius);
      let defaultSubTabBorderRadius: string = defaultObj.$attrs.tabBar.board.borderRadius;

      let strJson = getInspectorByKey('indicatorTest5');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Tabs_SubTabBorderRadius_0100] subTabBorderRadius:" + obj.$attrs.tabBar.board.borderRadius);
      expect(obj.$attrs.tabBar.board.borderRadius).assertEqual(defaultSubTabBorderRadius);
      done();
    });

    /**
     * @tc.name   ArkUI_Tabs_SubTabBorderRadius_0200
     * @tc.number ArkUI_Tabs_SubTabBorderRadius_0200
     * @tc.desc   set indicator.board.borderRadius to number type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Tabs_SubTabBorderRadius_0200', Level.LEVEL1, async (done: Function) => {
      console.info("ArkUI_Tabs_SubTabBorderRadius_0200 start");
      let strJson = getInspectorByKey('indicatorTest1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Tabs_SubTabBorderRadius_0200] subTabBorderRadius:" + obj.$attrs.tabBar.board.borderRadius);
      expect(obj.$attrs.tabBar.board.borderRadius).assertEqual("20.00vp");
      done();
    });

    /**
     * @tc.name   ArkUI_Tabs_SubTabBorderRadius_0300
     * @tc.number ArkUI_Tabs_SubTabBorderRadius_0300
     * @tc.desc   set indicator.board.borderRadius to string type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Tabs_SubTabBorderRadius_0300', Level.LEVEL1, async (done: Function) => {
      console.info("ArkUI_Tabs_SubTabBorderRadius_0300 start");
      let strJson = getInspectorByKey('indicatorTest2');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Tabs_SubTabBorderRadius_0300] subTabBorderRadius:" + obj.$attrs.tabBar.board.borderRadius);
      expect(obj.$attrs.tabBar.board.borderRadius).assertEqual("20.00vp");
      done();
    });

    /**
     * @tc.name   ArkUI_Tabs_SubTabBorderRadius_0400
     * @tc.number ArkUI_Tabs_SubTabBorderRadius_0400
     * @tc.desc   set indicator.board.borderRadius to Resource type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Tabs_SubTabBorderRadius_0400', Level.LEVEL1, async (done: Function) => {
      console.info("ArkUI_Tabs_SubTabBorderRadius_0400 start");
      let strJson = getInspectorByKey('indicatorTest3');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Tabs_SubTabBorderRadius_0400] subTabBorderRadius:" + obj.$attrs.tabBar.board.borderRadius);
      expect(obj.$attrs.tabBar.board.borderRadius).assertEqual("20.00vp");
      done();
    });

    /**
     * @tc.name   ArkUI_Tabs_SubTabBorderRadius_0500
     * @tc.number ArkUI_Tabs_SubTabBorderRadius_0500
     * @tc.desc   set indicator.board.borderRadius to abnormol value -1 then get the default value "8.00vp"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Tabs_SubTabBorderRadius_0500', Level.LEVEL1, async (done: Function) => {
      console.info("ArkUI_Tabs_SubTabBorderRadius_0500 start");
      
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "selfSubTabBorderRadius": -1
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_SubTabBorderRadius_0500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_SubTabBorderRadius_0500] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let defaultStrJson = getInspectorByKey('indicatorTest6');
      let defaultObj: ESObject = JSON.parse(defaultStrJson);
      console.info("[ArkUI_Tabs_SubTabBorderRadius_0500] default subTabBorderRadius:" + defaultObj.$attrs.tabBar.board.borderRadius);
      let defaultSubTabBorderRadius: string = defaultObj.$attrs.tabBar.board.borderRadius;

      let strJson = getInspectorByKey('indicatorTest1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Tabs_SubTabBorderRadius_0500] subTabBorderRadius:" + obj.$attrs.tabBar.board.borderRadius);
      expect(obj.$attrs.tabBar.board.borderRadius).assertEqual(defaultSubTabBorderRadius);
      done();
    });

    /**
     * @tc.name   ArkUI_Tabs_SubTabBorderRadius_0600
     * @tc.number ArkUI_Tabs_SubTabBorderRadius_0600
     * @tc.desc   set indicator.border.borderRadius with different length's unit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Tabs_SubTabBorderRadius_0600', Level.LEVEL1, async (done: Function) => {
      console.info("ArkUI_Tabs_IndicatorHeight_0300 start");
      
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "selfSubTabBorderRadiusStr": "10px"
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_SubTabBorderRadius_0600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_SubTabBorderRadius_0600] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('indicatorTest2');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Tabs_SubTabBorderRadius_0600] indicator:" + obj.$attrs.tabBar.board.borderRadius);
      expect(obj.$attrs.tabBar.board.borderRadius).assertEqual("10.00px");

      try {
        let eventData: events_emitter.EventData = {
          data: {
            "selfSubTabBorderRadiusStr": "10fp"
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_SubTabBorderRadius_0600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_SubTabBorderRadius_0600] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      strJson = getInspectorByKey('indicatorTest2');
      obj = JSON.parse(strJson);
      console.info("[ArkUI_Tabs_SubTabBorderRadius_0600] indicator:" + obj.$attrs.tabBar.indicator);
      expect(obj.$attrs.tabBar.board.borderRadius).assertEqual("10.00fp");

      try {
        let eventData: events_emitter.EventData = {
          data: {
            "selfSubTabBorderRadiusStr": "10lpx"
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_SubTabBorderRadius_0600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_SubTabBorderRadius_0600] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      strJson = getInspectorByKey('indicatorTest2');
      obj = JSON.parse(strJson);
      console.info("[ArkUI_Tabs_SubTabBorderRadius_0600] indicator:" + obj.$attrs.tabBar.indicator);
      expect(obj.$attrs.tabBar.board.borderRadius).assertEqual("10.00lpx");
      done();
    });

    /**
     * @tc.name   ArkUI_Tabs_SubTabBorderRadius_0700
     * @tc.number ArkUI_Tabs_SubTabBorderRadius_0700
     * @tc.desc   set indicator property with SelectedMode.BOARD
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Tabs_SubTabBorderRadius_0700', Level.LEVEL1, async (done: Function) => {
      console.info("ArkUI_Tabs_SubTabBorderRadius_0700 start");
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "selfSubTabBorderRadius": 20,
            "selfSelectedMode": SelectedMode.BOARD
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_SubTabBorderRadius_0700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_SubTabBorderRadius_0700] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('indicatorTest1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Tabs_SubTabBorderRadius_0700] subTabBorderRadius:" + obj.$attrs.tabBar.board.borderRadius);
      expect(obj.$attrs.tabBar.board.borderRadius).assertEqual("20.00vp");
      expect(obj.$attrs.tabBar.selectedMode).assertEqual("SelectedMode.BOARD");
      done();
    });

    /**
     * @tc.name   ArkUI_Tabs_SelectedMode_0100
     * @tc.number ArkUI_Tabs_SelectedMode_0100
     * @tc.desc   the default indicator.selectedMode parameter is "SelectedMode.INDICATOR".
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Tabs_SelectedMode_0100', Level.LEVEL1, async (done: Function) => {
      console.info("ArkUI_Tabs_SelectedMode_0100 start");
      let strJson = getInspectorByKey('indicatorTest5');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Tabs_SelectedMode_0100] selectedMode:" + obj.$attrs.tabBar.selectedMode);
      expect(obj.$attrs.tabBar.selectedMode).assertEqual("SelectedMode.INDICATOR");
      done();
    });

    /**
     * @tc.name   ArkUI_Tabs_SelectedMode_0200
     * @tc.number ArkUI_Tabs_SelectedMode_0200
     * @tc.desc   set indicator.selectedMode to SelectedMode.INDICATOR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Tabs_SelectedMode_0200', Level.LEVEL1, async (done: Function) => {
      console.info("ArkUI_Tabs_SelectedMode_0200 start");
      
      let strJson = getInspectorByKey('indicatorTest1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Tabs_SelectedMode_0200] selectedMode:" + obj.$attrs.tabBar.selectedMode);
      expect(obj.$attrs.tabBar.selectedMode).assertEqual("SelectedMode.INDICATOR");
      done();
    });

    /**
     * @tc.name   ArkUI_Tabs_SelectedMode_0300
     * @tc.number ArkUI_Tabs_SelectedMode_0300
     * @tc.desc   set indicator.selectedMode to SelectedMode.BOARD
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Tabs_SelectedMode_0300', Level.LEVEL1, async (done: Function) => {
      console.info("ArkUI_Tabs_SelectedMode_0300 start");
      
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "selfIndicatorHeight": 10,
            "selfSelectedMode": SelectedMode.BOARD
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_SelectedMode_0300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_SelectedMode_0300] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('indicatorTest1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Tabs_SelectedMode_0300] selectedMode:" + obj.$attrs.tabBar.selectedMode);
      expect(obj.$attrs.tabBar.selectedMode).assertEqual("SelectedMode.BOARD");
      done();
    });

    /**
     * @tc.name   ArkUI_Tabs_IndicatorMarginTop_0100
     * @tc.number ArkUI_Tabs_IndicatorMarginTop_0100
     * @tc.desc   the default indicator.marginTop parameter is "8.00vp".
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Tabs_IndicatorMarginTop_0100', Level.LEVEL1, async (done: Function) => {
      console.info("ArkUI_Tabs_IndicatorMarginTop_0100 start");
      let defaultStrJson = getInspectorByKey('defaultSubTab');
      let defaultObj: ESObject = JSON.parse(defaultStrJson);
      console.info("[ArkUI_Tabs_IndicatorMarginTop_0100] default indicator:" + defaultObj.$attrs.tabBar.indicator);
      let defaultIndicatorMarginTop: string = defaultObj.$attrs.tabBar.indicator.marginTop;

      let strJson = getInspectorByKey('indicatorTest4');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Tabs_IndicatorMarginTop_0100] indicator:" + obj.$attrs.tabBar.indicator);
      let indicatorMarginTop: string = obj.$attrs.tabBar.indicator.marginTop;
      expect(indicatorMarginTop).assertEqual(defaultIndicatorMarginTop);
      done();
    });

    /**
     * @tc.name   ArkUI_Tabs_IndicatorMarginTop_0200
     * @tc.number ArkUI_Tabs_IndicatorMarginTop_0200
     * @tc.desc   set indicator.marginTop to number type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Tabs_IndicatorMarginTop_0200', Level.LEVEL1, async (done: Function) => {
      console.info("ArkUI_Tabs_IndicatorMarginTop_0200 start");
      let strJson = getInspectorByKey('indicatorTest1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Tabs_IndicatorMarginTop_0200] indicator:" + obj.$attrs.tabBar.indicator);
      let indicatorMarginTop: string = obj.$attrs.tabBar.indicator.marginTop;
      expect(indicatorMarginTop).assertEqual("10.00vp");
      done();
    });

    /**
     * @tc.name   ArkUI_Tabs_IndicatorMarginTop_0300
     * @tc.number ArkUI_Tabs_IndicatorMarginTop_0300
     * @tc.desc   set indicator.width to string type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Tabs_IndicatorMarginTop_0300', Level.LEVEL1, async (done: Function) => {
      console.info("ArkUI_Tabs_IndicatorMarginTop_0300 start");
      let strJson = getInspectorByKey('indicatorTest2');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Tabs_IndicatorMarginTop_0300] indicator:" + obj.$attrs.tabBar.indicator);
      let indicatorMarginTop: string = obj.$attrs.tabBar.indicator.marginTop;
      expect(indicatorMarginTop).assertEqual("10.00vp");
      done();
    });

    /**
     * @tc.name   ArkUI_Tabs_IndicatorMarginTop_0400
     * @tc.number ArkUI_Tabs_IndicatorMarginTop_0400
     * @tc.desc   set indicator.width to Resource type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Tabs_IndicatorMarginTop_0400', Level.LEVEL1, async (done: Function) => {
      console.info("ArkUI_Tabs_IndicatorMarginTop_0400 start");
      let strJson = getInspectorByKey('indicatorTest3');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Tabs_IndicatorMarginTop_0400] indicator:" + obj.$attrs.tabBar.indicator);
      let indicatorMarginTop: string = obj.$attrs.tabBar.indicator.marginTop;
      expect(indicatorMarginTop).assertEqual("10.00vp");
      done();
    });

    /**
     * @tc.name   ArkUI_Tabs_IndicatorMarginTop_0500
     * @tc.number ArkUI_Tabs_IndicatorMarginTop_0500
     * @tc.desc   set indicator.marginTop to abnormol value -1 then get the default value "8.00vp"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Tabs_IndicatorMarginTop_0500', Level.LEVEL1, async (done: Function) => {
      console.info("ArkUI_Tabs_IndicatorMarginTop_0500 start");
      
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "selfIndicatorHeight": 10,
            "selfMarginTop": -1
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_IndicatorMarginTop_0500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_IndicatorMarginTop_0500] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let defaultStrJson = getInspectorByKey('defaultSubTab');
      let defaultObj: ESObject = JSON.parse(defaultStrJson);
      console.info("[ArkUI_Tabs_IndicatorMarginTop_0500] default indicator:" + defaultObj.$attrs.tabBar.indicator);
      let defaultIndicatorMarginTop: string = defaultObj.$attrs.tabBar.indicator.marginTop;

      let strJson = getInspectorByKey('indicatorTest1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Tabs_IndicatorMarginTop_0500] indicator:" + obj.$attrs.tabBar.indicator);
      let indicatorMarginTop: string = obj.$attrs.tabBar.indicator.marginTop;
      expect(indicatorMarginTop).assertEqual(defaultIndicatorMarginTop);
      done();
    });

    /**
     * @tc.name   ArkUI_Tabs_IndicatorMarginTop_0600
     * @tc.number ArkUI_Tabs_IndicatorMarginTop_0600
     * @tc.desc   set indicator.marginTop with different length's unit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Tabs_IndicatorMarginTop_0600', Level.LEVEL1, async (done: Function) => {
      console.info("ArkUI_Tabs_IndicatorMarginTop_0600 start");
      
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "selfMarginTopStr": "10px"
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_IndicatorMarginTop_0600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_IndicatorMarginTop_0600] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('indicatorTest2');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Tabs_IndicatorMarginTop_0600] indicator:" + obj.$attrs.tabBar.indicator);
      let indicatorMarginTop: string = obj.$attrs.tabBar.indicator.marginTop;
      expect(indicatorMarginTop).assertEqual("10.00px");

      try {
        let eventData: events_emitter.EventData = {
          data: {
            "selfMarginTopStr": "10fp"
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_IndicatorMarginTop_0600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_IndicatorMarginTop_0600] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      strJson = getInspectorByKey('indicatorTest2');
      obj = JSON.parse(strJson);
      console.info("[ArkUI_Tabs_IndicatorMarginTop_0600] indicator:" + obj.$attrs.tabBar.indicator);
      indicatorMarginTop = obj.$attrs.tabBar.indicator.marginTop;
      expect(indicatorMarginTop).assertEqual("10.00fp");

      try {
        let eventData: events_emitter.EventData = {
          data: {
            "selfMarginTopStr": "10lpx"
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_IndicatorMarginTop_0600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_IndicatorMarginTop_0600] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      strJson = getInspectorByKey('indicatorTest2');
      obj = JSON.parse(strJson);
      console.info("[ArkUI_Tabs_IndicatorMarginTop_0600] indicator:" + obj.$attrs.tabBar.indicator);
      indicatorMarginTop = obj.$attrs.tabBar.indicator.marginTop;
      expect(indicatorMarginTop).assertEqual("10.00lpx");
      done();
    });
  })
}
