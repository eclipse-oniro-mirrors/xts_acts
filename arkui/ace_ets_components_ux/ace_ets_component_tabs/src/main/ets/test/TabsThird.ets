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
import router from '@system.router';

export default function tabsThird() {
  describe('ActsAceTabsTestThird', function () {
    beforeEach(async function (done) {
      let options = {
        uri:  "TestAbility/pages/IndexThird",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get IndexThird state success " + JSON.stringify(pages));
        if (!("IndexThird" == pages.name)) {
          console.info("get IndexThird state success " + JSON.stringify(pages.name));
          let result = await router.push(options)
          console.info("push IndexThird page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push IndexThird page error " + JSON.stringify(err));
      }
      await Utils.sleep(2000);
      console.info("tabs beforeEach start");
      done();
    })

    afterEach(async function (done) {
      console.info("tabs afterEach start");
      try {
        var eventData = {
          data: {
            "barGridAlignMarginNumber": 0,
            "barGridAlignMarginString": '0.00fp',
            "barGridAlignGutterNumber": 0,
            "barGridAlignGutterString": '0.00fp',
            "barGridAlignSmNumber": 0,
            "barGridAlignMdNumber": 0,
            "barGridAlignLgNumber": 0,
            "barHeightString": '0.00vp',
            "barModeMode": BarMode.Fixed,
            "barModeMarginString": '0.00fp',
            "barModeMarginNumber": 0,
            "barModeNonScrollableLayoutStyle": LayoutStyle.ALWAYS_CENTER,
            "subTabBarStylePaddingNumber": 0,
            "subTabBarStylePaddingString": '0.00fp',
            "bottomTabBarStylePaddingNumber": 0,
            "bottomTabBarStylePaddingString": '0.00fp',
            "subTabBarStylePaddingTopNumber": 0,
            "subTabBarStylePaddingBottomNumber": 0,
            "subTabBarStylePaddingLeftNumber": 0,
            "subTabBarStylePaddingRightNumber": 0,
            "subTabBarStylePaddingTopString": '0.00vp',
            "subTabBarStylePaddingBottomString": '0.00vp',
            "subTabBarStylePaddingLeftString": '0.00vp',
            "subTabBarStylePaddingRightString": '0.00vp',
            "bottomTabBarStylePaddingTopNumber": 0,
            "bottomTabBarStylePaddingBottomNumber": 0,
            "bottomTabBarStylePaddingLeftNumber": 0,
            "bottomTabBarStylePaddingRightNumber": 0,
            "bottomTabBarStylePaddingTopString": '0.00vp',
            "bottomTabBarStylePaddingBottomString": '0.00vp',
            "bottomTabBarStylePaddingLeftString": '0.00vp',
            "bottomTabBarStylePaddingRightString": '0.00vp',
            "bottomTabBarStyleVerticalAlign": VerticalAlign.Center,
            "bottomTabBarStyleLayoutMode": LayoutMode.VERTICAL,
            "bottomTabBarStyleSymmetricExtensible": false,

          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      done();
    })

    /**
     * @tc.number    ArkUI_Tabs_BarGridAlign_0100
     * @tc.name      Tests the BarGridAlign property of the Tabs component.
     * @tc.desc      Gets the default values of barGridAlign.
     */
    it('ArkUI_Tabs_BarGridAlign_0100', 0, async function (done) {
      console.info("[ArkUI_Tabs_BarGridAlign_0100] start");
      let strJson = getInspectorByKey('tabsDefaultTest');
      console.info("[ArkUI_Tabs_BarGridAlign_0100]: " + JSON.stringify(strJson))

      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Tabs_BarGridAlign_0100]: " + JSON.stringify(obj.$attrs.barGridAlign));
      console.info("[ArkUI_Tabs_BarGridAlign_0100]: " + JSON.stringify(obj.$attrs.barGridAlign.margin));
      console.info("[ArkUI_Tabs_BarGridAlign_0100]: " + JSON.stringify(obj.$attrs.barGridAlign.gutter));
      console.info("[ArkUI_Tabs_BarGridAlign_0100]: " + JSON.stringify(obj.$attrs.barGridAlign.sm));
      console.info("[ArkUI_Tabs_BarGridAlign_0100]: " + JSON.stringify(obj.$attrs.barGridAlign.md));
      console.info("[ArkUI_Tabs_BarGridAlign_0100]: " + JSON.stringify(obj.$attrs.barGridAlign.lg));

      expect(obj.$attrs.barGridAlign.margin).assertEqual('24.00vp');
      expect(obj.$attrs.barGridAlign.gutter).assertEqual('24.00vp');
      expect(obj.$attrs.barGridAlign.sm).assertEqual('-1');
      expect(obj.$attrs.barGridAlign.md).assertEqual('-1');
      expect(obj.$attrs.barGridAlign.lg).assertEqual('-1');

      console.info("[ArkUI_Tabs_BarGridAlign_0100] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BarGridAlign_0200
     * @tc.name      Tests the BarGridAlign property of the Tabs component.
     * @tc.desc      Gets the values of barGridAlign, when the value of the barGridAlign is margin:10px.
     */
    it('ArkUI_Tabs_BarGridAlign_0200', 0, async function (done) {
      console.info("[ArkUI_Tabs_BarGridAlign_0200] start");
      let strJson = getInspectorByKey('tabsStringTest');
      console.info("[ArkUI_Tabs_BarGridAlign_0200]: " + JSON.stringify(strJson))
      try {
        var eventData = {
          data: {
            "barGridAlignMarginString": '10px'
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarGridAlign_0200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BarGridAlign_0200] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('tabsStringTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BarGridAlign_0200]: " + JSON.stringify(obj.$attrs.barGridAlign));
      console.info("[ArkUI_Tabs_BarGridAlign_0200]: " + JSON.stringify(obj.$attrs.barGridAlign.margin));
      expect(obj.$attrs.barGridAlign.margin).assertEqual('10.00px');
      console.info("[ArkUI_Tabs_BarGridAlign_0200] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BarGridAlign_0300
     * @tc.name      Tests the BarGridAlign property of the Tabs component.
     * @tc.desc      Gets the values of barGridAlign, when the value of the barGridAlign is margin:10vp.
     */
    it('ArkUI_Tabs_BarGridAlign_0300', 0, async function (done) {
      console.info("[ArkUI_Tabs_BarGridAlign_0300] start");
      let strJson = getInspectorByKey('tabsStringTest');
      console.info("[ArkUI_Tabs_BarGridAlign_0300]: " + JSON.stringify(strJson))
      try {
        var eventData = {
          data: {
            "barGridAlignMarginString": '10vp'
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarGridAlign_0300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BarGridAlign_0300] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('tabsStringTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BarGridAlign_0300]: " + JSON.stringify(obj.$attrs.barGridAlign));
      console.info("[ArkUI_Tabs_BarGridAlign_0300]: " + JSON.stringify(obj.$attrs.barGridAlign.margin));
      expect(obj.$attrs.barGridAlign.margin).assertEqual('10.00vp');
      console.info("[ArkUI_Tabs_BarGridAlign_0300] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BarGridAlign_0400
     * @tc.name      Tests the BarGridAlign property of the Tabs component.
     * @tc.desc      Gets the values of barGridAlign, when the value of the barGridAlign is margin:10.
     */
    it('ArkUI_Tabs_BarGridAlign_0400', 0, async function (done) {
      console.info("[ArkUI_Tabs_BarGridAlign_0400] start");
      let strJson = getInspectorByKey('tabsNumberTest');
      console.info("[ArkUI_Tabs_BarGridAlign_0400]: " + JSON.stringify(strJson))
      try {
        var eventData = {
          data: {
            "barGridAlignMarginNumber": 10
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarGridAlign_0400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BarGridAlign_0400] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('tabsNumberTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BarGridAlign_0400]: " + JSON.stringify(obj.$attrs.barGridAlign));
      console.info("[ArkUI_Tabs_BarGridAlign_0400]: " + JSON.stringify(obj.$attrs.barGridAlign.margin));
      expect(obj.$attrs.barGridAlign.margin).assertEqual('10.00vp');
      console.info("[ArkUI_Tabs_BarGridAlign_0400] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BarGridAlign_0500
     * @tc.name      Tests the BarGridAlign property of the Tabs component.
     * @tc.desc      Gets the values of barGridAlign, when the value of the barGridAlign is margin:-2.
     */
    it('ArkUI_Tabs_BarGridAlign_0500', 0, async function (done) {
      console.info("[ArkUI_Tabs_BarGridAlign_0500] start");
      let strJson = getInspectorByKey('tabsNumberTest');
      console.info("[ArkUI_Tabs_BarGridAlign_0500]: " + JSON.stringify(strJson))
      try {
        var eventData = {
          data: {
            "barGridAlignMarginNumber": -2
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarGridAlign_0500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BarGridAlign_0500] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('tabsNumberTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BarGridAlign_0500]: " + JSON.stringify(obj.$attrs.barGridAlign));
      console.info("[ArkUI_Tabs_BarGridAlign_0500]: " + JSON.stringify(obj.$attrs.barGridAlign.margin));
      expect(obj.$attrs.barGridAlign.margin).assertEqual('24.00vp');
      console.info("[ArkUI_Tabs_BarGridAlign_0500] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BarGridAlign_0600
     * @tc.name      Tests the BarGridAlign property of the Tabs component.
     * @tc.desc      Gets the values of barGridAlign, when the value of the barGridAlign is margin:2 ** 16.
     */
    it('ArkUI_Tabs_BarGridAlign_0600', 0, async function (done) {
      console.info("[ArkUI_Tabs_BarGridAlign_0600] start");
      let strJson = getInspectorByKey('tabsNumberTest');
      console.info("[ArkUI_Tabs_BarGridAlign_0600]: " + JSON.stringify(strJson))
      try {
        var eventData = {
          data: {
            "barGridAlignMarginNumber": 2 ** 16
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarGridAlign_0600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BarGridAlign_0600] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('tabsNumberTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BarGridAlign_0600]: " + JSON.stringify(obj.$attrs.barGridAlign));
      console.info("[ArkUI_Tabs_BarGridAlign_0600]: " + JSON.stringify(obj.$attrs.barGridAlign.margin));
      expect(obj.$attrs.barGridAlign.margin).assertEqual('65536.00vp');
      console.info("[ArkUI_Tabs_BarGridAlign_0600] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BarGridAlign_0700
     * @tc.name      Tests the BarGridAlign property of the Tabs component.
     * @tc.desc      Gets the values of barGridAlign, when the value of the barGridAlign is margin:10fp.
     */
    it('ArkUI_Tabs_BarGridAlign_0700', 0, async function (done) {
      console.info("[ArkUI_Tabs_BarGridAlign_0700] start");
      let strJson = getInspectorByKey('tabsStringTest');
      console.info("[ArkUI_Tabs_BarGridAlign_0700]: " + JSON.stringify(strJson))
      try {
        var eventData = {
          data: {
            "barGridAlignMarginString": '10fp'
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarGridAlign_0700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BarGridAlign_0700] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('tabsStringTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BarGridAlign_0700]: " + JSON.stringify(obj.$attrs.barGridAlign));
      console.info("[ArkUI_Tabs_BarGridAlign_0700]: " + JSON.stringify(obj.$attrs.barGridAlign.margin));
      expect(obj.$attrs.barGridAlign.margin).assertEqual('10.00fp');
      console.info("[ArkUI_Tabs_BarGridAlign_0700] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BarGridAlign_0800
     * @tc.name      Tests the BarGridAlign property of the Tabs component.
     * @tc.desc      Gets the values of barGridAlign, when the value of the barGridAlign is margin:10lpx.
     */
    it('ArkUI_Tabs_BarGridAlign_0800', 0, async function (done) {
      console.info("[ArkUI_Tabs_BarGridAlign_0800] start");
      let strJson = getInspectorByKey('tabsStringTest');
      console.info("[ArkUI_Tabs_BarGridAlign_0800]: " + JSON.stringify(strJson))
      try {
        var eventData = {
          data: {
            "barGridAlignMarginString": '10lpx'
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarGridAlign_0800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BarGridAlign_0800] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('tabsStringTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BarGridAlign_0800]: " + JSON.stringify(obj.$attrs.barGridAlign));
      console.info("[ArkUI_Tabs_BarGridAlign_0800]: " + JSON.stringify(obj.$attrs.barGridAlign.margin));
      expect(obj.$attrs.barGridAlign.margin).assertEqual('10.00lpx');
      console.info("[ArkUI_Tabs_BarGridAlign_0800] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BarGridAlign_0900
     * @tc.name      Tests the BarGridAlign property of the Tabs component.
     * @tc.desc      Gets the values of barGridAlign, when the value of the barGridAlign is margin:$r('app.float.BarGridAlign_Test').
     */
    it('ArkUI_Tabs_BarGridAlign_0900', 0, async function (done) {
      console.info("[ArkUI_Tabs_BarGridAlign_0900] start");
      let strJson = getInspectorByKey('tabsResourceTest');
      console.info("[ArkUI_Tabs_BarGridAlign_0900]: " + JSON.stringify(strJson))

      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Tabs_BarGridAlign_0900]: " + JSON.stringify(obj.$attrs.barGridAlign));
      console.info("[ArkUI_Tabs_BarGridAlign_0900]: " + JSON.stringify(obj.$attrs.barGridAlign.margin));
      expect(obj.$attrs.barGridAlign.margin).assertEqual('15.00px');
      console.info("[ArkUI_Tabs_BarGridAlign_0900] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BarGridAlign_1000
     * @tc.name      Tests the BarGridAlign property of the Tabs component.
     * @tc.desc      Gets the values of barGridAlign, when the value of the barGridAlign is margin:undefined.
     */
    it('ArkUI_Tabs_BarGridAlign_1000', 0, async function (done) {
      console.info("[ArkUI_Tabs_BarGridAlign_1000] start");
      let strJson = getInspectorByKey('tabsNumberTest');
      console.info("[ArkUI_Tabs_BarGridAlign_1000]: " + JSON.stringify(strJson))
      try {
        var eventData = {
          data: {
            "barGridAlignMarginNumber": undefined
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarGridAlign_1000] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BarGridAlign_1000] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('tabsNumberTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BarGridAlign_1000]: " + JSON.stringify(obj.$attrs.barGridAlign));
      console.info("[ArkUI_Tabs_BarGridAlign_1000]: " + JSON.stringify(obj.$attrs.barGridAlign.margin));
      expect(obj.$attrs.barGridAlign.margin).assertEqual('24.00vp');
      console.info("[ArkUI_Tabs_BarGridAlign_1000] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BarGridAlign_1100
     * @tc.name      Tests the BarGridAlign property of the Tabs component.
     * @tc.desc      Gets the values of barGridAlign, when the value of the barGridAlign is margin:null.
     */
    it('ArkUI_Tabs_BarGridAlign_1100', 0, async function (done) {
      console.info("[ArkUI_Tabs_BarGridAlign_1100] start");
      let strJson = getInspectorByKey('tabsNumberTest');
      console.info("[ArkUI_Tabs_BarGridAlign_1100]: " + JSON.stringify(strJson))
      try {
        var eventData = {
          data: {
            "barGridAlignMarginNumber": null
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarGridAlign_1100] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BarGridAlign_1100] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('tabsNumberTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BarGridAlign_1100]: " + JSON.stringify(obj.$attrs.barGridAlign));
      console.info("[ArkUI_Tabs_BarGridAlign_1100]: " + JSON.stringify(obj.$attrs.barGridAlign.margin));
      expect(obj.$attrs.barGridAlign.margin).assertEqual('24.00vp');
      console.info("[ArkUI_Tabs_BarGridAlign_1100] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BarGridAlign_1200
     * @tc.name      Tests the BarGridAlign property of the Tabs component.
     * @tc.desc      Gets the values of barGridAlign, when the value of the barGridAlign is gutter:10px.
     */
    it('ArkUI_Tabs_BarGridAlign_1200', 0, async function (done) {
      console.info("[ArkUI_Tabs_BarGridAlign_1200] start");
      let strJson = getInspectorByKey('tabsStringTest');
      console.info("[ArkUI_Tabs_BarGridAlign_1200]: " + JSON.stringify(strJson))
      try {
        var eventData = {
          data: {
            "barGridAlignGutterString": '10px'
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarGridAlign_1200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BarGridAlign_1200] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('tabsStringTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BarGridAlign_1200]: " + JSON.stringify(obj.$attrs.barGridAlign));
      console.info("[ArkUI_Tabs_BarGridAlign_1200]: " + JSON.stringify(obj.$attrs.barGridAlign.gutter));
      expect(obj.$attrs.barGridAlign.gutter).assertEqual('10.00px');
      console.info("[ArkUI_Tabs_BarGridAlign_1200] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BarGridAlign_1300
     * @tc.name      Tests the BarGridAlign property of the Tabs component.
     * @tc.desc      Gets the values of barGridAlign, when the value of the barGridAlign is gutter:10vp.
     */
    it('ArkUI_Tabs_BarGridAlign_1300', 0, async function (done) {
      console.info("[ArkUI_Tabs_BarGridAlign_1300] start");
      let strJson = getInspectorByKey('tabsStringTest');
      console.info("[ArkUI_Tabs_BarGridAlign_1300]: " + JSON.stringify(strJson))
      try {
        var eventData = {
          data: {
            "barGridAlignGutterString": '10vp'
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarGridAlign_1300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BarGridAlign_1300] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('tabsStringTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BarGridAlign_1300]: " + JSON.stringify(obj.$attrs.barGridAlign));
      console.info("[ArkUI_Tabs_BarGridAlign_1300]: " + JSON.stringify(obj.$attrs.barGridAlign.gutter));
      expect(obj.$attrs.barGridAlign.gutter).assertEqual('10.00vp');
      console.info("[ArkUI_Tabs_BarGridAlign_1300] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BarGridAlign_1400
     * @tc.name      Tests the BarGridAlign property of the Tabs component.
     * @tc.desc      Gets the values of barGridAlign, when the value of the barGridAlign is gutter:10.
     */
    it('ArkUI_Tabs_BarGridAlign_1400', 0, async function (done) {
      console.info("[ArkUI_Tabs_BarGridAlign_1400] start");
      let strJson = getInspectorByKey('tabsNumberTest');
      console.info("[ArkUI_Tabs_BarGridAlign_1400]: " + JSON.stringify(strJson))
      try {
        var eventData = {
          data: {
            "barGridAlignGutterNumber": 10
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarGridAlign_1400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BarGridAlign_1400] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('tabsNumberTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BarGridAlign_1400]: " + JSON.stringify(obj.$attrs.barGridAlign));
      console.info("[ArkUI_Tabs_BarGridAlign_1400]: " + JSON.stringify(obj.$attrs.barGridAlign.gutter));
      expect(obj.$attrs.barGridAlign.gutter).assertEqual('10.00vp');
      console.info("[ArkUI_Tabs_BarGridAlign_1400] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BarGridAlign_1500
     * @tc.name      Tests the BarGridAlign property of the Tabs component.
     * @tc.desc      Gets the values of barGridAlign, when the value of the barGridAlign is gutter:-2.
     */
    it('ArkUI_Tabs_BarGridAlign_1500', 0, async function (done) {
      console.info("[ArkUI_Tabs_BarGridAlign_1500] start");
      let strJson = getInspectorByKey('tabsNumberTest');
      console.info("[ArkUI_Tabs_BarGridAlign_1500]: " + JSON.stringify(strJson))
      try {
        var eventData = {
          data: {
            "barGridAlignGutterNumber": -2
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarGridAlign_1500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BarGridAlign_1500] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('tabsNumberTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BarGridAlign_1500]: " + JSON.stringify(obj.$attrs.barGridAlign));
      console.info("[ArkUI_Tabs_BarGridAlign_1500]: " + JSON.stringify(obj.$attrs.barGridAlign.gutter));
      expect(obj.$attrs.barGridAlign.gutter).assertEqual('24.00vp');
      console.info("[ArkUI_Tabs_BarGridAlign_1500] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BarGridAlign_1600
     * @tc.name      Tests the BarGridAlign property of the Tabs component.
     * @tc.desc      Gets the values of barGridAlign, when the value of the barGridAlign is gutter:2 ** 16.
     */
    it('ArkUI_Tabs_BarGridAlign_1600', 0, async function (done) {
      console.info("[ArkUI_Tabs_BarGridAlign_1600] start");
      let strJson = getInspectorByKey('tabsNumberTest');
      console.info("[ArkUI_Tabs_BarGridAlign_1600]: " + JSON.stringify(strJson))
      try {
        var eventData = {
          data: {
            "barGridAlignGutterNumber": 2 ** 16
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarGridAlign_1600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BarGridAlign_1600] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('tabsNumberTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BarGridAlign_1600]: " + JSON.stringify(obj.$attrs.barGridAlign));
      console.info("[ArkUI_Tabs_BarGridAlign_1600]: " + JSON.stringify(obj.$attrs.barGridAlign.gutter));
      expect(obj.$attrs.barGridAlign.gutter).assertEqual('65536.00vp');
      console.info("[ArkUI_Tabs_BarGridAlign_1600] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BarGridAlign_1700
     * @tc.name      Tests the BarGridAlign property of the Tabs component.
     * @tc.desc      Gets the values of barGridAlign, when the value of the barGridAlign is gutter:10fp.
     */
    it('ArkUI_Tabs_BarGridAlign_1700', 0, async function (done) {
      console.info("[ArkUI_Tabs_BarGridAlign_1700] start");
      let strJson = getInspectorByKey('tabsStringTest');
      console.info("[ArkUI_Tabs_BarGridAlign_1700]: " + JSON.stringify(strJson))
      try {
        var eventData = {
          data: {
            "barGridAlignGutterString": '10fp'
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarGridAlign_1700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BarGridAlign_1700] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('tabsStringTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BarGridAlign_1700]: " + JSON.stringify(obj.$attrs.barGridAlign));
      console.info("[ArkUI_Tabs_BarGridAlign_1700]: " + JSON.stringify(obj.$attrs.barGridAlign.gutter));
      expect(obj.$attrs.barGridAlign.gutter).assertEqual('10.00fp');
      console.info("[ArkUI_Tabs_BarGridAlign_1700] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BarGridAlign_1800
     * @tc.name      Tests the BarGridAlign property of the Tabs component.
     * @tc.desc      Gets the values of barGridAlign, when the value of the barGridAlign is gutter:10lpx.
     */
    it('ArkUI_Tabs_BarGridAlign_1800', 0, async function (done) {
      console.info("[ArkUI_Tabs_BarGridAlign_1800] start");
      let strJson = getInspectorByKey('tabsStringTest');
      console.info("[ArkUI_Tabs_BarGridAlign_1800]: " + JSON.stringify(strJson))
      try {
        var eventData = {
          data: {
            "barGridAlignGutterString": '10lpx'
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarGridAlign_1800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BarGridAlign_1800] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('tabsStringTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BarGridAlign_1800]: " + JSON.stringify(obj.$attrs.barGridAlign));
      console.info("[ArkUI_Tabs_BarGridAlign_1800]: " + JSON.stringify(obj.$attrs.barGridAlign.gutter));
      expect(obj.$attrs.barGridAlign.gutter).assertEqual('10.00lpx');
      console.info("[ArkUI_Tabs_BarGridAlign_1800] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BarGridAlign_1900
     * @tc.name      Tests the BarGridAlign property of the Tabs component.
     * @tc.desc      Gets the values of barGridAlign, when the value of the barGridAlign is gutter:$r('app.float.BarGridAlign_Test').
     */
    it('ArkUI_Tabs_BarGridAlign_1900', 0, async function (done) {
      console.info("[ArkUI_Tabs_BarGridAlign_1900] start");
      let strJson = getInspectorByKey('tabsResourceTest');
      console.info("[ArkUI_Tabs_BarGridAlign_1900]: " + JSON.stringify(strJson))

      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Tabs_BarGridAlign_1900]: " + JSON.stringify(obj.$attrs.barGridAlign));
      console.info("[ArkUI_Tabs_BarGridAlign_1900]: " + JSON.stringify(obj.$attrs.barGridAlign.gutter));
      expect(obj.$attrs.barGridAlign.gutter).assertEqual('15.00px');
      console.info("[ArkUI_Tabs_BarGridAlign_1900] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BarGridAlign_2000
     * @tc.name      Tests the BarGridAlign property of the Tabs component.
     * @tc.desc      Gets the values of barGridAlign, when the value of the barGridAlign is gutter:undefined.
     */
    it('ArkUI_Tabs_BarGridAlign_2000', 0, async function (done) {
      console.info("[ArkUI_Tabs_BarGridAlign_2000] start");
      let strJson = getInspectorByKey('tabsNumberTest');
      console.info("[ArkUI_Tabs_BarGridAlign_2000]: " + JSON.stringify(strJson))
      try {
        var eventData = {
          data: {
            "barGridAlignGutterNumber": undefined
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarGridAlign_2000] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BarGridAlign_2000] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('tabsNumberTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BarGridAlign_2000]: " + JSON.stringify(obj.$attrs.barGridAlign));
      console.info("[ArkUI_Tabs_BarGridAlign_2000]: " + JSON.stringify(obj.$attrs.barGridAlign.gutter));
      expect(obj.$attrs.barGridAlign.gutter).assertEqual('24.00vp');
      console.info("[ArkUI_Tabs_BarGridAlign_2000] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BarGridAlign_2100
     * @tc.name      Tests the BarGridAlign property of the Tabs component.
     * @tc.desc      Gets the values of barGridAlign, when the value of the barGridAlign is gutter:null.
     */
    it('ArkUI_Tabs_BarGridAlign_2100', 0, async function (done) {
      console.info("[ArkUI_Tabs_BarGridAlign_2100] start");
      let strJson = getInspectorByKey('tabsNumberTest');
      console.info("[ArkUI_Tabs_BarGridAlign_2100]: " + JSON.stringify(strJson))
      try {
        var eventData = {
          data: {
            "barGridAlignGutterNumber": null
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarGridAlign_2100] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BarGridAlign_2100] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('tabsNumberTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BarGridAlign_2100]: " + JSON.stringify(obj.$attrs.barGridAlign));
      console.info("[ArkUI_Tabs_BarGridAlign_2100]: " + JSON.stringify(obj.$attrs.barGridAlign.gutter));
      expect(obj.$attrs.barGridAlign.gutter).assertEqual('24.00vp');
      console.info("[ArkUI_Tabs_BarGridAlign_2100] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BarGridAlign_2200
     * @tc.name      Tests the BarGridAlign property of the Tabs component.
     * @tc.desc      Gets the values of barGridAlign, when the value of the barGridAlign is sm:2, md:4, lg:6.
     */
    it('[ArkUI_Tabs_BarGridAlign_2200]', 0, async function (done) {
      console.info("[ArkUI_Tabs_BarGridAlign_2200] start");
      let strJson = getInspectorByKey('tabsNumberTest');
      console.info("[ArkUI_Tabs_BarGridAlign_2200]: " + JSON.stringify(strJson))
      try {
        var eventData = {
          data: {
            "barGridAlignSmNumber": 2,
            "barGridAlignMdNumber": 4,
            "barGridAlignLgNumber": 6
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarGridAlign_2200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BarGridAlign_2200] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('tabsNumberTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BarGridAlign_2200]: " + JSON.stringify(obj.$attrs.barGridAlign));
      console.info("[ArkUI_Tabs_BarGridAlign_2200]: " + JSON.stringify(obj.$attrs.barGridAlign.sm));
      console.info("[ArkUI_Tabs_BarGridAlign_2200]: " + JSON.stringify(obj.$attrs.barGridAlign.md));
      console.info("[ArkUI_Tabs_BarGridAlign_2200]: " + JSON.stringify(obj.$attrs.barGridAlign.lg));
      expect(obj.$attrs.barGridAlign.sm).assertEqual('2');
      expect(obj.$attrs.barGridAlign.md).assertEqual('4');
      expect(obj.$attrs.barGridAlign.lg).assertEqual('6');
      console.info("[ArkUI_Tabs_BarGridAlign_2200] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BarGridAlign_2300
     * @tc.name      Tests the BarGridAlign property of the Tabs component.
     * @tc.desc      Gets the values of barGridAlign, when the value of the barGridAlign is sm:3, md:4, lg:6.
     */
    it('[ArkUI_Tabs_BarGridAlign_2300]', 0, async function (done) {
      console.info("[ArkUI_Tabs_BarGridAlign_2300] start");
      let strJson = getInspectorByKey('tabsNumberTest');
      console.info("[ArkUI_Tabs_BarGridAlign_2300]: " + JSON.stringify(strJson))
      try {
        var eventData = {
          data: {
            "barGridAlignSmNumber": 3,
            "barGridAlignMdNumber": 4,
            "barGridAlignLgNumber": 6
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarGridAlign_2300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BarGridAlign_2300] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('tabsNumberTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BarGridAlign_2300]: " + JSON.stringify(obj.$attrs.barGridAlign));
      console.info("[ArkUI_Tabs_BarGridAlign_2300]: " + JSON.stringify(obj.$attrs.barGridAlign.sm));
      console.info("[ArkUI_Tabs_BarGridAlign_2300]: " + JSON.stringify(obj.$attrs.barGridAlign.md));
      console.info("[ArkUI_Tabs_BarGridAlign_2300]: " + JSON.stringify(obj.$attrs.barGridAlign.lg));
      expect(obj.$attrs.barGridAlign.sm).assertEqual('-1');
      expect(obj.$attrs.barGridAlign.md).assertEqual('4');
      expect(obj.$attrs.barGridAlign.lg).assertEqual('6');
      console.info("[ArkUI_Tabs_BarGridAlign_2300] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BarGridAlign_2400
     * @tc.name      Tests the BarGridAlign property of the Tabs component.
     * @tc.desc      Gets the values of barGridAlign, when the value of the barGridAlign is sm:-2, md:4, lg:6.
     */
    it('[ArkUI_Tabs_BarGridAlign_2400]', 0, async function (done) {
      console.info("[ArkUI_Tabs_BarGridAlign_2400] start");
      let strJson = getInspectorByKey('tabsNumberTest');
      console.info("[ArkUI_Tabs_BarGridAlign_2400]: " + JSON.stringify(strJson))
      try {
        var eventData = {
          data: {
            "barGridAlignSmNumber": -2,
            "barGridAlignMdNumber": 4,
            "barGridAlignLgNumber": 6
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarGridAlign_2400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BarGridAlign_2400] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('tabsNumberTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BarGridAlign_2400]: " + JSON.stringify(obj.$attrs.barGridAlign));
      console.info("[ArkUI_Tabs_BarGridAlign_2400]: " + JSON.stringify(obj.$attrs.barGridAlign.sm));
      console.info("[ArkUI_Tabs_BarGridAlign_2400]: " + JSON.stringify(obj.$attrs.barGridAlign.md));
      console.info("[ArkUI_Tabs_BarGridAlign_2400]: " + JSON.stringify(obj.$attrs.barGridAlign.lg));
      expect(obj.$attrs.barGridAlign.sm).assertEqual('-1');
      expect(obj.$attrs.barGridAlign.md).assertEqual('4');
      expect(obj.$attrs.barGridAlign.lg).assertEqual('6');
      console.info("[ArkUI_Tabs_BarGridAlign_2400] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BarGridAlign_2500
     * @tc.name      Tests the BarGridAlign property of the Tabs component.
     * @tc.desc      Gets the values of barGridAlign, when the value of the barGridAlign is sm:100000, md:4, lg:6.
     */
    it('[ArkUI_Tabs_BarGridAlign_2500]', 0, async function (done) {
      console.info("[ArkUI_Tabs_BarGridAlign_2500] start");
      let strJson = getInspectorByKey('tabsNumberTest');
      console.info("[ArkUI_Tabs_BarGridAlign_2500]: " + JSON.stringify(strJson))
      try {
        var eventData = {
          data: {
            "barGridAlignSmNumber": 100000,
            "barGridAlignMdNumber": 4,
            "barGridAlignLgNumber": 6
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarGridAlign_2500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BarGridAlign_2500] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('tabsNumberTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BarGridAlign_2500]: " + JSON.stringify(obj.$attrs.barGridAlign));
      console.info("[ArkUI_Tabs_BarGridAlign_2500]: " + JSON.stringify(obj.$attrs.barGridAlign.sm));
      console.info("[ArkUI_Tabs_BarGridAlign_2500]: " + JSON.stringify(obj.$attrs.barGridAlign.md));
      console.info("[ArkUI_Tabs_BarGridAlign_2500]: " + JSON.stringify(obj.$attrs.barGridAlign.lg));
      expect(obj.$attrs.barGridAlign.sm).assertEqual('-1');
      expect(obj.$attrs.barGridAlign.md).assertEqual('4');
      expect(obj.$attrs.barGridAlign.lg).assertEqual('6');
      console.info("[ArkUI_Tabs_BarGridAlign_2500] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BarGridAlign_2600
     * @tc.name      Tests the BarGridAlign property of the Tabs component.
     * @tc.desc      Gets the values of barGridAlign, when the value of the barGridAlign is sm:undefined, md:4, lg:6.
     */
    it('[ArkUI_Tabs_BarGridAlign_2600]', 0, async function (done) {
      console.info("[ArkUI_Tabs_BarGridAlign_2600] start");
      let strJson = getInspectorByKey('tabsNumberTest');
      console.info("[ArkUI_Tabs_BarGridAlign_2600]: " + JSON.stringify(strJson))
      try {
        var eventData = {
          data: {
            "barGridAlignSmNumber": undefined,
            "barGridAlignMdNumber": 4,
            "barGridAlignLgNumber": 6
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarGridAlign_2600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BarGridAlign_2600] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('tabsNumberTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BarGridAlign_2600]: " + JSON.stringify(obj.$attrs.barGridAlign));
      console.info("[ArkUI_Tabs_BarGridAlign_2600]: " + JSON.stringify(obj.$attrs.barGridAlign.sm));
      console.info("[ArkUI_Tabs_BarGridAlign_2600]: " + JSON.stringify(obj.$attrs.barGridAlign.md));
      console.info("[ArkUI_Tabs_BarGridAlign_2600]: " + JSON.stringify(obj.$attrs.barGridAlign.lg));
      expect(obj.$attrs.barGridAlign.sm).assertEqual('-1');
      expect(obj.$attrs.barGridAlign.md).assertEqual('4');
      expect(obj.$attrs.barGridAlign.lg).assertEqual('6');
      console.info("[ArkUI_Tabs_BarGridAlign_2600] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BarGridAlign_2700
     * @tc.name      Tests the BarGridAlign property of the Tabs component.
     * @tc.desc      Gets the values of barGridAlign, when the value of the barGridAlign is sm:null, md:4, lg:6.
     */
    it('[ArkUI_Tabs_BarGridAlign_2700]', 0, async function (done) {
      console.info("[ArkUI_Tabs_BarGridAlign_2700] start");
      let strJson = getInspectorByKey('tabsNumberTest');
      console.info("[ArkUI_Tabs_BarGridAlign_2700]: " + JSON.stringify(strJson))
      try {
        var eventData = {
          data: {
            "barGridAlignSmNumber": null,
            "barGridAlignMdNumber": 4,
            "barGridAlignLgNumber": 6
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarGridAlign_2700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BarGridAlign_2700] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('tabsNumberTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BarGridAlign_2700]: " + JSON.stringify(obj.$attrs.barGridAlign));
      console.info("[ArkUI_Tabs_BarGridAlign_2700]: " + JSON.stringify(obj.$attrs.barGridAlign.sm));
      console.info("[ArkUI_Tabs_BarGridAlign_2700]: " + JSON.stringify(obj.$attrs.barGridAlign.md));
      console.info("[ArkUI_Tabs_BarGridAlign_2700]: " + JSON.stringify(obj.$attrs.barGridAlign.lg));
      expect(obj.$attrs.barGridAlign.sm).assertEqual('-1');
      expect(obj.$attrs.barGridAlign.md).assertEqual('4');
      expect(obj.$attrs.barGridAlign.lg).assertEqual('6');
      console.info("[ArkUI_Tabs_BarGridAlign_2700] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BarGridAlign_2800
     * @tc.name      Tests the BarGridAlign property of the Tabs component.
     * @tc.desc      Gets the values of barGridAlign, when the value of the barGridAlign is sm:2, md:3, lg:6.
     */
    it('[ArkUI_Tabs_BarGridAlign_2800]', 0, async function (done) {
      console.info("[ArkUI_Tabs_BarGridAlign_2800] start");
      let strJson = getInspectorByKey('tabsNumberTest');
      console.info("[ArkUI_Tabs_BarGridAlign_2800]: " + JSON.stringify(strJson))
      try {
        var eventData = {
          data: {
            "barGridAlignSmNumber": 2,
            "barGridAlignMdNumber": 3,
            "barGridAlignLgNumber": 6
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarGridAlign_2800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BarGridAlign_2800] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('tabsNumberTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BarGridAlign_2800]: " + JSON.stringify(obj.$attrs.barGridAlign));
      console.info("[ArkUI_Tabs_BarGridAlign_2800]: " + JSON.stringify(obj.$attrs.barGridAlign.sm));
      console.info("[ArkUI_Tabs_BarGridAlign_2800]: " + JSON.stringify(obj.$attrs.barGridAlign.md));
      console.info("[ArkUI_Tabs_BarGridAlign_2800]: " + JSON.stringify(obj.$attrs.barGridAlign.lg));
      expect(obj.$attrs.barGridAlign.sm).assertEqual('2');
      expect(obj.$attrs.barGridAlign.md).assertEqual('-1');
      expect(obj.$attrs.barGridAlign.lg).assertEqual('6');
      console.info("[ArkUI_Tabs_BarGridAlign_2800] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BarGridAlign_2900
     * @tc.name      Tests the BarGridAlign property of the Tabs component.
     * @tc.desc      Gets the values of barGridAlign, when the value of the barGridAlign is sm:2, md:-2, lg:6.
     */
    it('[ArkUI_Tabs_BarGridAlign_2900]', 0, async function (done) {
      console.info("[ArkUI_Tabs_BarGridAlign_2900] start");
      let strJson = getInspectorByKey('tabsNumberTest');
      console.info("[ArkUI_Tabs_BarGridAlign_2900]: " + JSON.stringify(strJson))
      try {
        var eventData = {
          data: {
            "barGridAlignSmNumber": 2,
            "barGridAlignMdNumber": -2,
            "barGridAlignLgNumber": 6
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarGridAlign_2900] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BarGridAlign_2900] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('tabsNumberTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BarGridAlign_2900]: " + JSON.stringify(obj.$attrs.barGridAlign));
      console.info("[ArkUI_Tabs_BarGridAlign_2900]: " + JSON.stringify(obj.$attrs.barGridAlign.sm));
      console.info("[ArkUI_Tabs_BarGridAlign_2900]: " + JSON.stringify(obj.$attrs.barGridAlign.md));
      console.info("[ArkUI_Tabs_BarGridAlign_2900]: " + JSON.stringify(obj.$attrs.barGridAlign.lg));
      expect(obj.$attrs.barGridAlign.sm).assertEqual('2');
      expect(obj.$attrs.barGridAlign.md).assertEqual('-1');
      expect(obj.$attrs.barGridAlign.lg).assertEqual('6');
      console.info("[ArkUI_Tabs_BarGridAlign_2900] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BarGridAlign_3000
     * @tc.name      Tests the BarGridAlign property of the Tabs component.
     * @tc.desc      Gets the values of barGridAlign, when the value of the barGridAlign is sm:2, md:100000, lg:6.
     */
    it('[ArkUI_Tabs_BarGridAlign_3000]', 0, async function (done) {
      console.info("[ArkUI_Tabs_BarGridAlign_3000] start");
      let strJson = getInspectorByKey('tabsNumberTest');
      console.info("[ArkUI_Tabs_BarGridAlign_3000]: " + JSON.stringify(strJson))
      try {
        var eventData = {
          data: {
            "barGridAlignSmNumber": 2,
            "barGridAlignMdNumber": 100000,
            "barGridAlignLgNumber": 6
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarGridAlign_3000] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BarGridAlign_3000] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('tabsNumberTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BarGridAlign_3000]: " + JSON.stringify(obj.$attrs.barGridAlign));
      console.info("[ArkUI_Tabs_BarGridAlign_3000]: " + JSON.stringify(obj.$attrs.barGridAlign.sm));
      console.info("[ArkUI_Tabs_BarGridAlign_3000]: " + JSON.stringify(obj.$attrs.barGridAlign.md));
      console.info("[ArkUI_Tabs_BarGridAlign_3000]: " + JSON.stringify(obj.$attrs.barGridAlign.lg));
      expect(obj.$attrs.barGridAlign.sm).assertEqual('2');
      expect(obj.$attrs.barGridAlign.md).assertEqual('-1');
      expect(obj.$attrs.barGridAlign.lg).assertEqual('6');
      console.info("[ArkUI_Tabs_BarGridAlign_3000] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BarGridAlign_3100
     * @tc.name      Tests the BarGridAlign property of the Tabs component.
     * @tc.desc      Gets the values of barGridAlign, when the value of the barGridAlign is sm:2, md:undefined, lg:6.
     */
    it('[ArkUI_Tabs_BarGridAlign_3100]', 0, async function (done) {
      console.info("[ArkUI_Tabs_BarGridAlign_3100] start");
      let strJson = getInspectorByKey('tabsNumberTest');
      console.info("[ArkUI_Tabs_BarGridAlign_3100]: " + JSON.stringify(strJson))
      try {
        var eventData = {
          data: {
            "barGridAlignSmNumber": 2,
            "barGridAlignMdNumber": undefined,
            "barGridAlignLgNumber": 6
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarGridAlign_3100] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BarGridAlign_3100] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('tabsNumberTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BarGridAlign_3100]: " + JSON.stringify(obj.$attrs.barGridAlign));
      console.info("[ArkUI_Tabs_BarGridAlign_3100]: " + JSON.stringify(obj.$attrs.barGridAlign.sm));
      console.info("[ArkUI_Tabs_BarGridAlign_3100]: " + JSON.stringify(obj.$attrs.barGridAlign.md));
      console.info("[ArkUI_Tabs_BarGridAlign_3100]: " + JSON.stringify(obj.$attrs.barGridAlign.lg));
      expect(obj.$attrs.barGridAlign.sm).assertEqual('2');
      expect(obj.$attrs.barGridAlign.md).assertEqual('-1');
      expect(obj.$attrs.barGridAlign.lg).assertEqual('6');
      console.info("[ArkUI_Tabs_BarGridAlign_3100] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BarGridAlign_3200
     * @tc.name      Tests the BarGridAlign property of the Tabs component.
     * @tc.desc      Gets the values of barGridAlign, when the value of the barGridAlign is sm:2, md:null, lg:6.
     */
    it('[ArkUI_Tabs_BarGridAlign_3200]', 0, async function (done) {
      console.info("[ArkUI_Tabs_BarGridAlign_3200] start");
      let strJson = getInspectorByKey('tabsNumberTest');
      console.info("[ArkUI_Tabs_BarGridAlign_3200]: " + JSON.stringify(strJson))
      try {
        var eventData = {
          data: {
            "barGridAlignSmNumber": 2,
            "barGridAlignMdNumber": null,
            "barGridAlignLgNumber": 6
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarGridAlign_3200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BarGridAlign_3200] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('tabsNumberTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BarGridAlign_3200]: " + JSON.stringify(obj.$attrs.barGridAlign));
      console.info("[ArkUI_Tabs_BarGridAlign_3200]: " + JSON.stringify(obj.$attrs.barGridAlign.sm));
      console.info("[ArkUI_Tabs_BarGridAlign_3200]: " + JSON.stringify(obj.$attrs.barGridAlign.md));
      console.info("[ArkUI_Tabs_BarGridAlign_3200]: " + JSON.stringify(obj.$attrs.barGridAlign.lg));
      expect(obj.$attrs.barGridAlign.sm).assertEqual('2');
      expect(obj.$attrs.barGridAlign.md).assertEqual('-1');
      expect(obj.$attrs.barGridAlign.lg).assertEqual('6');
      console.info("[ArkUI_Tabs_BarGridAlign_3200] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BarGridAlign_3300
     * @tc.name      Tests the BarGridAlign property of the Tabs component.
     * @tc.desc      Gets the values of barGridAlign, when the value of the barGridAlign is sm:2, md:4, lg:5.
     */
    it('[ArkUI_Tabs_BarGridAlign_3300]', 0, async function (done) {
      console.info("[ArkUI_Tabs_BarGridAlign_3300] start");
      let strJson = getInspectorByKey('tabsNumberTest');
      console.info("[ArkUI_Tabs_BarGridAlign_3300]: " + JSON.stringify(strJson))
      try {
        var eventData = {
          data: {
            "barGridAlignSmNumber": 2,
            "barGridAlignMdNumber": 4,
            "barGridAlignLgNumber": 5
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarGridAlign_3300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BarGridAlign_3300] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('tabsNumberTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BarGridAlign_3300]: " + JSON.stringify(obj.$attrs.barGridAlign));
      console.info("[ArkUI_Tabs_BarGridAlign_3300]: " + JSON.stringify(obj.$attrs.barGridAlign.sm));
      console.info("[ArkUI_Tabs_BarGridAlign_3300]: " + JSON.stringify(obj.$attrs.barGridAlign.md));
      console.info("[ArkUI_Tabs_BarGridAlign_3300]: " + JSON.stringify(obj.$attrs.barGridAlign.lg));
      expect(obj.$attrs.barGridAlign.sm).assertEqual('2');
      expect(obj.$attrs.barGridAlign.md).assertEqual('4');
      expect(obj.$attrs.barGridAlign.lg).assertEqual('-1');
      console.info("[ArkUI_Tabs_BarGridAlign_3300] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BarGridAlign_3400
     * @tc.name      Tests the BarGridAlign property of the Tabs component.
     * @tc.desc      Gets the values of barGridAlign, when the value of the barGridAlign is sm:2, md:4, lg:-2.
     */
    it('[ArkUI_Tabs_BarGridAlign_3400]', 0, async function (done) {
      console.info("[ArkUI_Tabs_BarGridAlign_3400] start");
      let strJson = getInspectorByKey('tabsNumberTest');
      console.info("[ArkUI_Tabs_BarGridAlign_3400]: " + JSON.stringify(strJson))
      try {
        var eventData = {
          data: {
            "barGridAlignSmNumber": 2,
            "barGridAlignMdNumber": 4,
            "barGridAlignLgNumber": -2
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarGridAlign_3400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BarGridAlign_3400] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('tabsNumberTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BarGridAlign_3400]: " + JSON.stringify(obj.$attrs.barGridAlign));
      console.info("[ArkUI_Tabs_BarGridAlign_3400]: " + JSON.stringify(obj.$attrs.barGridAlign.sm));
      console.info("[ArkUI_Tabs_BarGridAlign_3400]: " + JSON.stringify(obj.$attrs.barGridAlign.md));
      console.info("[ArkUI_Tabs_BarGridAlign_3400]: " + JSON.stringify(obj.$attrs.barGridAlign.lg));
      expect(obj.$attrs.barGridAlign.sm).assertEqual('2');
      expect(obj.$attrs.barGridAlign.md).assertEqual('4');
      expect(obj.$attrs.barGridAlign.lg).assertEqual('-1');
      console.info("[ArkUI_Tabs_BarGridAlign_3400] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BarGridAlign_3500
     * @tc.name      Tests the BarGridAlign property of the Tabs component.
     * @tc.desc      Gets the values of barGridAlign, when the value of the barGridAlign is sm:2, md:4, lg:100000.
     */
    it('[ArkUI_Tabs_BarGridAlign_3500]', 0, async function (done) {
      console.info("[ArkUI_Tabs_BarGridAlign_3500] start");
      let strJson = getInspectorByKey('tabsNumberTest');
      console.info("[ArkUI_Tabs_BarGridAlign_3500]: " + JSON.stringify(strJson))
      try {
        var eventData = {
          data: {
            "barGridAlignSmNumber": 2,
            "barGridAlignMdNumber": 4,
            "barGridAlignLgNumber": 100000
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarGridAlign_3500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BarGridAlign_3500] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('tabsNumberTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BarGridAlign_3500]: " + JSON.stringify(obj.$attrs.barGridAlign));
      console.info("[ArkUI_Tabs_BarGridAlign_3500]: " + JSON.stringify(obj.$attrs.barGridAlign.sm));
      console.info("[ArkUI_Tabs_BarGridAlign_3500]: " + JSON.stringify(obj.$attrs.barGridAlign.md));
      console.info("[ArkUI_Tabs_BarGridAlign_3500]: " + JSON.stringify(obj.$attrs.barGridAlign.lg));
      expect(obj.$attrs.barGridAlign.sm).assertEqual('2');
      expect(obj.$attrs.barGridAlign.md).assertEqual('4');
      expect(obj.$attrs.barGridAlign.lg).assertEqual('-1');
      console.info("[ArkUI_Tabs_BarGridAlign_3500] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BarGridAlign_3600
     * @tc.name      Tests the BarGridAlign property of the Tabs component.
     * @tc.desc      Gets the values of barGridAlign, when the value of the barGridAlign is sm:2, md:4, lg:undefined.
     */
    it('[ArkUI_Tabs_BarGridAlign_3600]', 0, async function (done) {
      console.info("[ArkUI_Tabs_BarGridAlign_3600] start");
      let strJson = getInspectorByKey('tabsNumberTest');
      console.info("[ArkUI_Tabs_BarGridAlign_3600]: " + JSON.stringify(strJson))
      try {
        var eventData = {
          data: {
            "barGridAlignSmNumber": 2,
            "barGridAlignMdNumber": 4,
            "barGridAlignLgNumber": undefined
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarGridAlign_3600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BarGridAlign_3600] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('tabsNumberTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BarGridAlign_3600]: " + JSON.stringify(obj.$attrs.barGridAlign));
      console.info("[ArkUI_Tabs_BarGridAlign_3600]: " + JSON.stringify(obj.$attrs.barGridAlign.sm));
      console.info("[ArkUI_Tabs_BarGridAlign_3600]: " + JSON.stringify(obj.$attrs.barGridAlign.md));
      console.info("[ArkUI_Tabs_BarGridAlign_3600]: " + JSON.stringify(obj.$attrs.barGridAlign.lg));
      expect(obj.$attrs.barGridAlign.sm).assertEqual('2');
      expect(obj.$attrs.barGridAlign.md).assertEqual('4');
      expect(obj.$attrs.barGridAlign.lg).assertEqual('-1');
      console.info("[ArkUI_Tabs_BarGridAlign_3600] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BarGridAlign_3700
     * @tc.name      Tests the BarGridAlign property of the Tabs component.
     * @tc.desc      Gets the values of barGridAlign, when the value of the barGridAlign is sm:2, md:4, lg:null.
     */
    it('[ArkUI_Tabs_BarGridAlign_3700]', 0, async function (done) {
      console.info("[ArkUI_Tabs_BarGridAlign_3700] start");
      let strJson = getInspectorByKey('tabsNumberTest');
      console.info("[ArkUI_Tabs_BarGridAlign_3700]: " + JSON.stringify(strJson))
      try {
        var eventData = {
          data: {
            "barGridAlignSmNumber": 2,
            "barGridAlignMdNumber": 4,
            "barGridAlignLgNumber": null
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarGridAlign_3700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BarGridAlign_3700] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('tabsNumberTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BarGridAlign_3700]: " + JSON.stringify(obj.$attrs.barGridAlign));
      console.info("[ArkUI_Tabs_BarGridAlign_3700]: " + JSON.stringify(obj.$attrs.barGridAlign.sm));
      console.info("[ArkUI_Tabs_BarGridAlign_3700]: " + JSON.stringify(obj.$attrs.barGridAlign.md));
      console.info("[ArkUI_Tabs_BarGridAlign_3700]: " + JSON.stringify(obj.$attrs.barGridAlign.lg));
      expect(obj.$attrs.barGridAlign.sm).assertEqual('2');
      expect(obj.$attrs.barGridAlign.md).assertEqual('4');
      expect(obj.$attrs.barGridAlign.lg).assertEqual('-1');
      console.info("[ArkUI_Tabs_BarGridAlign_3700] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BarHeight_0100
     * @tc.name      Tests the BarHeight property of the Tabs component.
     * @tc.desc      Gets the values of barHeight, when the value of the barHeight is "auto".
     */
    it('ArkUI_Tabs_BarHeight_0100', 0, async function (done) {
      console.info("[ArkUI_Tabs_BarHeight_0100] start");
      let strJson = getInspectorByKey('tabsStringTest');
      console.info("ArkUI_Tabs_BarHeight: " + JSON.stringify(strJson))
      try {
        var eventData = {
          data: {
            "barHeightString": "auto"
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarHeight_0100] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BarHeight_0100] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('tabsStringTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BarHeight_0100] barHeight: " + JSON.stringify(obj.$attrs.barHeight));
      expect(obj.$attrs.barHeight).assertEqual("auto");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BarMode_0100
     * @tc.name      Tests the BarMode property of the Tabs component.
     * @tc.desc      Gets the default values of barMode.
     */
    it('[ArkUI_Tabs_BarMode_0100]', 0, async function (done) {
      console.info("[ArkUI_Tabs_BarMode_0100] start");
      let strJson = getInspectorByKey('tabsDefaultTest');
      console.info("[ArkUI_Tabs_BarMode_0100]: " + JSON.stringify(strJson));

      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Tabs_BarMode_0100]: " + JSON.stringify(obj.$attrs.barMode));
      expect(obj.$attrs.barMode).assertEqual('BarMode.Fixed');
      console.info("[ArkUI_Tabs_BarMode_0100] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BarMode_0200
     * @tc.name      Tests the BarMode property of the Tabs component.
     * @tc.desc      Gets the values of barMode, when the value of the barMode is BarMode.Fixed.
     */
    it('ArkUI_Tabs_BarMode_0200', 0, async function (done) {
      console.info("[ArkUI_Tabs_BarMode_0200] start");
      let strJson = getInspectorByKey('tabsNumberTest');
      console.info("[ArkUI_Tabs_BarMode_0200]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "barModeMode": BarMode.Fixed
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarMode_0200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BarMode_0200] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('tabsNumberTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BarMode_0200]: " + JSON.stringify(obj.$attrs.barMode));
      expect(obj.$attrs.barMode).assertEqual('BarMode.Fixed');
      console.info("[ArkUI_Tabs_BarMode_0200] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BarMode_0300
     * @tc.name      Tests the BarMode property of the Tabs component.
     * @tc.desc      Gets the values of barMode, when the value of the barMode is BarMode.Scrollable.
     */
    it('ArkUI_Tabs_BarMode_0300', 0, async function (done) {
      console.info("[ArkUI_Tabs_BarMode_0300] start");
      let strJson = getInspectorByKey('tabsNumberTest');
      console.info("[ArkUI_Tabs_BarMode_0300]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "barModeMode": BarMode.Scrollable
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarMode_0300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BarMode_0300] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('tabsNumberTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BarMode_0300]: " + JSON.stringify(obj.$attrs.barMode));
      expect(obj.$attrs.barMode).assertEqual('BarMode.Scrollable,{"margin":"0.00vp","nonScrollableLayoutStyle":"LayoutStyle.ALWAYS_CENTER"}');
      console.info("[ArkUI_Tabs_BarMode_0300] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BarMode_0400
     * @tc.name      Tests the BarMode property of the Tabs component.
     * @tc.desc      Gets the values of barMode, when the value of the barMode is BarMode.Scrollable, margin:'10px'.
     */
    it('ArkUI_Tabs_BarMode_0400', 0, async function (done) {
      console.info("[ArkUI_Tabs_BarMode_0400] start");
      let strJson = getInspectorByKey('tabsStringTest');
      console.info("[ArkUI_Tabs_BarMode_0400]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "barModeMode": BarMode.Scrollable,
            "barModeMarginString": '10px'
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarMode_0400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BarMode_0400] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('tabsStringTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BarMode_0400]: " + JSON.stringify(obj.$attrs.barMode));
      expect(obj.$attrs.barMode).assertEqual('BarMode.Scrollable,{"margin":"10.00px","nonScrollableLayoutStyle":"LayoutStyle.ALWAYS_CENTER"}');
      console.info("[ArkUI_Tabs_BarMode_0400] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BarMode_0500
     * @tc.name      Tests the BarMode property of the Tabs component.
     * @tc.desc      Gets the values of barMode, when the value of the barMode is BarMode.Scrollable, margin:'10vp'.
     */
    it('ArkUI_Tabs_BarMode_0500', 0, async function (done) {
      console.info("[ArkUI_Tabs_BarMode_0500] start");
      let strJson = getInspectorByKey('tabsStringTest');
      console.info("[ArkUI_Tabs_BarMode_0500]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "barModeMode": BarMode.Scrollable,
            "barModeMarginString": '10vp'
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarMode_0500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BarMode_0500] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('tabsStringTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BarMode_0500]: " + JSON.stringify(obj.$attrs.barMode));
      expect(obj.$attrs.barMode).assertEqual('BarMode.Scrollable,{"margin":"10.00vp","nonScrollableLayoutStyle":"LayoutStyle.ALWAYS_CENTER"}');
      console.info("[ArkUI_Tabs_BarMode_0500] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BarMode_0600
     * @tc.name      Tests the BarMode property of the Tabs component.
     * @tc.desc      Gets the values of barMode, when the value of the barMode is BarMode.Scrollable, margin:10.
     */
    it('ArkUI_Tabs_BarMode_0600', 0, async function (done) {
      console.info("[ArkUI_Tabs_BarMode_0600] start");
      let strJson = getInspectorByKey('tabsNumberTest');
      console.info("[ArkUI_Tabs_BarMode_0600]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "barModeMode": BarMode.Scrollable,
            "barModeMarginNumber": 10
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarMode_0600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BarMode_0600] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('tabsNumberTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BarMode_0600]: " + JSON.stringify(obj.$attrs.barMode));
      expect(obj.$attrs.barMode).assertEqual('BarMode.Scrollable,{"margin":"10.00vp","nonScrollableLayoutStyle":"LayoutStyle.ALWAYS_CENTER"}');
      console.info("[ArkUI_Tabs_BarMode_0600] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BarMode_0700
     * @tc.name      Tests the BarMode property of the Tabs component.
     * @tc.desc      Gets the values of barMode, when the value of the barMode is BarMode.Scrollable, margin:-1.
     */
    it('ArkUI_Tabs_BarMode_0700', 0, async function (done) {
      console.info("[ArkUI_Tabs_BarMode_0700] start");
      let strJson = getInspectorByKey('tabsNumberTest');
      console.info("[ArkUI_Tabs_BarMode_0700]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "barModeMode": BarMode.Scrollable,
            "barModeMarginNumber": -1
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarMode_0700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BarMode_0700] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('tabsNumberTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BarMode_0600]: " + JSON.stringify(obj.$attrs.barMode));
      expect(obj.$attrs.barMode).assertEqual('BarMode.Scrollable,{"margin":"0.00vp","nonScrollableLayoutStyle":"LayoutStyle.ALWAYS_CENTER"}');
      console.info("[ArkUI_Tabs_BarMode_0600] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BarMode_0800
     * @tc.name      Tests the BarMode property of the Tabs component.
     * @tc.desc      Gets the values of barMode, when the value of the barMode is BarMode.Scrollable, margin:100000.
     */
    it('ArkUI_Tabs_BarMode_0800', 0, async function (done) {
      console.info("[ArkUI_Tabs_BarMode_0800] start");
      let strJson = getInspectorByKey('tabsNumberTest');
      console.info("[ArkUI_Tabs_BarMode_0800]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "barModeMode": BarMode.Scrollable,
            "barModeMarginNumber": 100000
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarMode_0800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BarMode_0800] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('tabsNumberTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BarMode_0800]: " + JSON.stringify(obj.$attrs.barMode));
      expect(obj.$attrs.barMode).assertEqual('BarMode.Scrollable,{"margin":"100000.00vp","nonScrollableLayoutStyle":"LayoutStyle.ALWAYS_CENTER"}');
      console.info("[ArkUI_Tabs_BarMode_0800] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BarMode_0900
     * @tc.name      Tests the BarMode property of the Tabs component.
     * @tc.desc      Gets the values of barMode, when the value of the barMode is BarMode.Scrollable, margin:'10fp'.
     */
    it('ArkUI_Tabs_BarMode_0900', 0, async function (done) {
      console.info("[ArkUI_Tabs_BarMode_0900] start");
      let strJson = getInspectorByKey('tabsStringTest');
      console.info("[ArkUI_Tabs_BarMode_0900]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "barModeMode": BarMode.Scrollable,
            "barModeMarginString": '10fp'
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarMode_0900] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BarMode_0900] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('tabsStringTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BarMode_0900]: " + JSON.stringify(obj.$attrs.barMode));
      expect(obj.$attrs.barMode).assertEqual('BarMode.Scrollable,{"margin":"10.00fp","nonScrollableLayoutStyle":"LayoutStyle.ALWAYS_CENTER"}');
      console.info("[ArkUI_Tabs_BarMode_0900] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BarMode_1000
     * @tc.name      Tests the BarMode property of the Tabs component.
     * @tc.desc      Gets the values of barMode, when the value of the barMode is BarMode.Scrollable, margin:'10lpx'.
     */
    it('ArkUI_Tabs_BarMode_1000', 0, async function (done) {
      console.info("[ArkUI_Tabs_BarMode_1000] start");
      let strJson = getInspectorByKey('tabsStringTest');
      console.info("[ArkUI_Tabs_BarMode_1000]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "barModeMode": BarMode.Scrollable,
            "barModeMarginString": '10lpx'
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarMode_1000] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BarMode_1000] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('tabsStringTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BarMode_1000]: " + JSON.stringify(obj.$attrs.barMode));
      expect(obj.$attrs.barMode).assertEqual('BarMode.Scrollable,{"margin":"10.00lpx","nonScrollableLayoutStyle":"LayoutStyle.ALWAYS_CENTER"}');
      console.info("[ArkUI_Tabs_BarMode_1000] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BarMode_1100
     * @tc.name      Tests the BarMode property of the Tabs component.
     * @tc.desc      Gets the values of barMode, when the value of the barMode is BarMode.Scrollable, margin:$r('app.float.BarMode_Test').
     */
    it('ArkUI_Tabs_BarMode_1100', 0, async function (done) {
      console.info("[ArkUI_Tabs_BarMode_1100] start");
      let strJson = getInspectorByKey('tabsResourceTest');
      console.info("[ArkUI_Tabs_BarMode_1100]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "barModeMode": BarMode.Scrollable
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarMode_1000] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BarMode_1000] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('tabsResourceTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BarMode_1100]: " + JSON.stringify(obj.$attrs.barMode));
      expect(obj.$attrs.barMode).assertEqual('BarMode.Scrollable,{"margin":"8.00px","nonScrollableLayoutStyle":"LayoutStyle.ALWAYS_CENTER"}');
      console.info("[ArkUI_Tabs_BarMode_1100] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BarMode_1200
     * @tc.name      Tests the BarMode property of the Tabs component.
     * @tc.desc      Gets the values of barMode, when the value of the barMode is BarMode.Scrollable, margin:undefined.
     */
    it('ArkUI_Tabs_BarMode_1200', 0, async function (done) {
      console.info("[ArkUI_Tabs_BarMode_1200] start");
      let strJson = getInspectorByKey('tabsNumberTest');
      console.info("[ArkUI_Tabs_BarMode_1200]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "barModeMode": BarMode.Scrollable,
            "barModeMarginNumber": undefined
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarMode_1200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BarMode_1200] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('tabsNumberTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BarMode_1200]: " + JSON.stringify(obj.$attrs.barMode));
      expect(obj.$attrs.barMode).assertEqual('BarMode.Scrollable,{"margin":"0.00vp","nonScrollableLayoutStyle":"LayoutStyle.ALWAYS_CENTER"}');
      console.info("[ArkUI_Tabs_BarMode_1200] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BarMode_1300
     * @tc.name      Tests the BarMode property of the Tabs component.
     * @tc.desc      Gets the values of barMode, when the value of the barMode is BarMode.Scrollable, margin:null.
     */
    it('ArkUI_Tabs_BarMode_1300', 0, async function (done) {
      console.info("[ArkUI_Tabs_BarMode_1300] start");
      let strJson = getInspectorByKey('tabsNumberTest');
      console.info("[ArkUI_Tabs_BarMode_1300]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "barModeMode": BarMode.Scrollable,
            "barModeMarginNumber": null
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarMode_1300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BarMode_1300] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('tabsNumberTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BarMode_1300]: " + JSON.stringify(obj.$attrs.barMode));
      expect(obj.$attrs.barMode).assertEqual('BarMode.Scrollable,{"margin":"0.00vp","nonScrollableLayoutStyle":"LayoutStyle.ALWAYS_CENTER"}');
      console.info("[ArkUI_Tabs_BarMode_1300] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BarMode_1400
     * @tc.name      Tests the BarMode property of the Tabs component.
     * @tc.desc      Gets the values of barMode, when the value of the barMode is BarMode.Scrollable, nonScrollableLayoutStyle:LayoutStyle.ALWAYS_CENTER.
     */
    it('ArkUI_Tabs_BarMode_1400', 0, async function (done) {
      console.info("[ArkUI_Tabs_BarMode_1400] start");
      let strJson = getInspectorByKey('tabsNumberTest');
      console.info("[ArkUI_Tabs_BarMode_1400]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "barModeMode": BarMode.Scrollable,
            "barModeNonScrollableLayoutStyle": LayoutStyle.ALWAYS_CENTER
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarMode_1400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BarMode_1400] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('tabsNumberTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BarMode_1400]: " + JSON.stringify(obj.$attrs.barMode));
      expect(obj.$attrs.barMode).assertEqual('BarMode.Scrollable,{"margin":"0.00vp","nonScrollableLayoutStyle":"LayoutStyle.ALWAYS_CENTER"}');
      console.info("[ArkUI_Tabs_BarMode_1400] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BarMode_1500
     * @tc.name      Tests the BarMode property of the Tabs component.
     * @tc.desc      Gets the values of barMode, when the value of the barMode is BarMode.Scrollable, nonScrollableLayoutStyle:LayoutStyle.ALWAYS_AVERAGE_SPLIT.
     */
    it('ArkUI_Tabs_BarMode_1500', 0, async function (done) {
      console.info("[ArkUI_Tabs_BarMode_1500] start");
      let strJson = getInspectorByKey('tabsNumberTest');
      console.info("[ArkUI_Tabs_BarMode_1500]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "barModeMode": BarMode.Scrollable,
            "barModeNonScrollableLayoutStyle": LayoutStyle.ALWAYS_AVERAGE_SPLIT
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarMode_1500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BarMode_1500] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('tabsNumberTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BarMode_1500]: " + JSON.stringify(obj.$attrs.barMode));
      expect(obj.$attrs.barMode).assertEqual('BarMode.Scrollable,{"margin":"0.00vp","nonScrollableLayoutStyle":"LayoutStyle.ALWAYS_AVERAGE_SPLIT"}');
      console.info("[ArkUI_Tabs_BarMode_1500] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BarMode_1600
     * @tc.name      Tests the BarMode property of the Tabs component.
     * @tc.desc      Gets the values of barMode, when the value of the barMode is BarMode.Scrollable, nonScrollableLayoutStyle:LayoutStyle.SPACE_BETWEEN_OR_CENTER.
     */
    it('ArkUI_Tabs_BarMode_1600', 0, async function (done) {
      console.info("[ArkUI_Tabs_BarMode_1600] start");
      let strJson = getInspectorByKey('tabsNumberTest');
      console.info("[ArkUI_Tabs_BarMode_1600]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "barModeMode": BarMode.Scrollable,
            "barModeNonScrollableLayoutStyle": LayoutStyle.SPACE_BETWEEN_OR_CENTER
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarMode_1600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BarMode_1600] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('tabsNumberTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BarMode_1600]: " + JSON.stringify(obj.$attrs.barMode));
      expect(obj.$attrs.barMode).assertEqual('BarMode.Scrollable,{"margin":"0.00vp","nonScrollableLayoutStyle":"LayoutStyle.SPACE_BETWEEN_OR_CENTER"}');
      console.info("[ArkUI_Tabs_BarMode_1600] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BarMode_1700
     * @tc.name      Tests the BarMode property of the Tabs component.
     * @tc.desc      Gets the values of barMode, when the value of the barMode is BarMode.Scrollable, nonScrollableLayoutStyle:undefined.
     */
    it('ArkUI_Tabs_BarMode_1700', 0, async function (done) {
      console.info("[ArkUI_Tabs_BarMode_1700] start");
      let strJson = getInspectorByKey('tabsNumberTest');
      console.info("[ArkUI_Tabs_BarMode_1700]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "barModeMode": BarMode.Scrollable,
            "barModeNonScrollableLayoutStyle": undefined
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarMode_1700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BarMode_1700] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('tabsNumberTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BarMode_1700]: " + JSON.stringify(obj.$attrs.barMode));
      expect(obj.$attrs.barMode).assertEqual('BarMode.Scrollable,{"margin":"0.00vp","nonScrollableLayoutStyle":"LayoutStyle.ALWAYS_CENTER"}');
      console.info("[ArkUI_Tabs_BarMode_1700] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BarMode_1800
     * @tc.name      Tests the BarMode property of the Tabs component.
     * @tc.desc      Gets the values of barMode, when the value of the barMode is BarMode.Scrollable, nonScrollableLayoutStyle:null.
     */
    it('ArkUI_Tabs_BarMode_1800', 0, async function (done) {
      console.info("[ArkUI_Tabs_BarMode_1800] start");
      let strJson = getInspectorByKey('tabsNumberTest');
      console.info("[ArkUI_Tabs_BarMode_1800]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "barModeMode": BarMode.Scrollable,
            "barModeNonScrollableLayoutStyle": null
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarMode_1800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BarMode_1800] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('tabsNumberTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BarMode_1800]: " + JSON.stringify(obj.$attrs.barMode));
      expect(obj.$attrs.barMode).assertEqual('BarMode.Scrollable,{"margin":"0.00vp","nonScrollableLayoutStyle":"LayoutStyle.ALWAYS_CENTER"}');
      console.info("[ArkUI_Tabs_BarMode_1800] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BarMode_1900
     * @tc.name      Tests the BarMode property of the Tabs component.
     * @tc.desc      Gets the values of barMode, when the value of the barMode is BarMode.Fixed, margin:'10px', nonScrollableLayoutStyle:null.
     */
    it('ArkUI_Tabs_BarMode_1900', 0, async function (done) {
      console.info("[ArkUI_Tabs_BarMode_1900] start");
      let strJson = getInspectorByKey('tabsNumberTest');
      console.info("[ArkUI_Tabs_BarMode_1900]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "barModeMode": BarMode.Fixed,
            "barModeMarginString": '10px',
            "barModeNonScrollableLayoutStyle": LayoutStyle.ALWAYS_CENTER
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarMode_1900] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BarMode_1900] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('tabsNumberTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BarMode_1900]: " + JSON.stringify(obj.$attrs.barMode));
      expect(obj.$attrs.barMode).assertEqual('BarMode.Fixed');
      console.info("[ArkUI_Tabs_BarMode_1900] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_SubTabBarStylePadding_0100
     * @tc.name      Tests the SubTabBarStylePadding property of the Tabs component.
     * @tc.desc      Gets the default values of subTabBarStylePadding.
     */
    it('[ArkUI_Tabs_SubTabBarStylePadding_0100]', 0, async function (done) {
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0100] start");
      let strJson = getInspectorByKey('subTabBarDefaultTest');
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0100]: " + JSON.stringify(strJson));

      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0100]: " + JSON.stringify(obj.$attrs.tabBar));
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0100]: " + JSON.stringify(obj.$attrs.tabBar.padding));
      let topJsonJudge = getInspectorByKey('subTabBarDefaultTestTopJudge');
      let objTopJudge = JSON.parse(topJsonJudge);
      let rightJsonJudge = getInspectorByKey('subTabBarDefaultTestRightJudge');
      let objRightJudge = JSON.parse(rightJsonJudge);
      let bottomJsonJudge = getInspectorByKey('subTabBarDefaultTestBottomJudge');
      let objBottomJudge = JSON.parse(bottomJsonJudge);
      let leftJsonJudge = getInspectorByKey('subTabBarDefaultTestLeftJudge');
      let objLeftJudge = JSON.parse(leftJsonJudge);
      let resultString =  '{"top":"' + objTopJudge.$attrs.width + '","right":"' + objRightJudge.$attrs.width + '","bottom":"' + objBottomJudge.$attrs.width + '","left":"' + objLeftJudge.$attrs.width + '"}';
      expect(obj.$attrs.tabBar.padding).assertEqual(resultString);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0100] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_SubTabBarStylePadding_0200
     * @tc.name      Tests the SubTabBarStylePadding property of the Tabs component.
     * @tc.desc      Gets the values of subTabBarStylePadding, when the value of the subTabBarStylePadding is 10.
     */
    it('ArkUI_Tabs_SubTabBarStylePadding_0200', 0, async function (done) {
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0200] start");
      let strJson = getInspectorByKey('subTabBarNumberTest');
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0200]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "subTabBarStylePaddingNumber": 10
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_SubTabBarStylePadding_0200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_SubTabBarStylePadding_0200] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('subTabBarNumberTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0200]: " + JSON.stringify(obj.$attrs.tabBar));
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0200]: " + JSON.stringify(obj.$attrs.tabBar.padding));
      expect(obj.$attrs.tabBar.padding).assertEqual('10.00vp');
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0200] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_SubTabBarStylePadding_0300
     * @tc.name      Tests the SubTabBarStylePadding property of the Tabs component.
     * @tc.desc      Gets the values of subTabBarStylePadding, when the value of the subTabBarStylePadding is '10.00px'.
     */
    it('ArkUI_Tabs_SubTabBarStylePadding_0300', 0, async function (done) {
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0300] start");
      let strJson = getInspectorByKey('subTabBarStringTest');
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0300]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "subTabBarStylePaddingString": '10.00px',
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_SubTabBarStylePadding_0300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_SubTabBarStylePadding_0300] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('subTabBarStringTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0300]: " + JSON.stringify(obj.$attrs.tabBar));
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0300]: " + JSON.stringify(obj.$attrs.tabBar.padding));
      expect(obj.$attrs.tabBar.padding).assertEqual('10.00px');
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0300] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_SubTabBarStylePadding_0400
     * @tc.name      Tests the SubTabBarStylePadding property of the Tabs component.
     * @tc.desc      Gets the values of subTabBarStylePadding, when the value of the subTabBarStylePadding is $r('app.float.SubTabBarStylePadding_Test')).
     */
    it('ArkUI_Tabs_SubTabBarStylePadding_0400', 0, async function (done) {
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0400] start");
      let strJson = getInspectorByKey('subTabBarResourceTest');
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0400]: " + JSON.stringify(strJson));

      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0400]: " + JSON.stringify(obj.$attrs.tabBar));
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0400]: " + JSON.stringify(obj.$attrs.tabBar.padding));
      expect(obj.$attrs.tabBar.padding).assertEqual('10.00vp');
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0400] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_SubTabBarStylePadding_0500
     * @tc.name      Tests the SubTabBarStylePadding property of the Tabs component.
     * @tc.desc      Gets the values of subTabBarStylePadding, when the value of the subTabBarStylePadding is -1.
     */
    it('ArkUI_Tabs_SubTabBarStylePadding_0500', 0, async function (done) {
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0500] start");
      let strJson = getInspectorByKey('subTabBarNumberTest');
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0500]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "subTabBarStylePaddingNumber": -1
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_SubTabBarStylePadding_0500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_SubTabBarStylePadding_0500] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('subTabBarNumberTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0500]: " + JSON.stringify(obj.$attrs.tabBar));
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0500]: " + JSON.stringify(obj.$attrs.tabBar.padding));
      let topJsonJudge = getInspectorByKey('subTabBarDefaultTestTopJudge');
      let objTopJudge = JSON.parse(topJsonJudge);
      let rightJsonJudge = getInspectorByKey('subTabBarDefaultTestRightJudge');
      let objRightJudge = JSON.parse(rightJsonJudge);
      let bottomJsonJudge = getInspectorByKey('subTabBarDefaultTestBottomJudge');
      let objBottomJudge = JSON.parse(bottomJsonJudge);
      let leftJsonJudge = getInspectorByKey('subTabBarDefaultTestLeftJudge');
      let objLeftJudge = JSON.parse(leftJsonJudge);
      let resultString =  '{"top":"' + objTopJudge.$attrs.width + '","right":"' + objRightJudge.$attrs.width + '","bottom":"' + objBottomJudge.$attrs.width + '","left":"' + objLeftJudge.$attrs.width + '"}';
      expect(obj.$attrs.tabBar.padding).assertEqual(resultString);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0500] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_SubTabBarStylePadding_0600
     * @tc.name      Tests the SubTabBarStylePadding property of the Tabs component.
     * @tc.desc      Gets the values of subTabBarStylePadding, when the value of the subTabBarStylePadding is 100000.
     */
    it('ArkUI_Tabs_SubTabBarStylePadding_0600', 0, async function (done) {
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0600] start");
      let strJson = getInspectorByKey('subTabBarNumberTest');
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0600]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "subTabBarStylePaddingNumber": 100000
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_SubTabBarStylePadding_0600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_SubTabBarStylePadding_0600] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('subTabBarNumberTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0600]: " + JSON.stringify(obj.$attrs.tabBar));
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0600]: " + JSON.stringify(obj.$attrs.tabBar.padding));
      expect(obj.$attrs.tabBar.padding).assertEqual('100000.00vp');
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0600] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_SubTabBarStylePadding_0700
     * @tc.name      Tests the SubTabBarStylePadding property of the Tabs component.
     * @tc.desc      Gets the values of subTabBarStylePadding, when the value of the subTabBarStylePadding is undefined.
     */
    it('ArkUI_Tabs_SubTabBarStylePadding_0700', 0, async function (done) {
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0700] start");
      let strJson = getInspectorByKey('subTabBarNumberTest');
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0700]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "subTabBarStylePaddingNumber": undefined
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_SubTabBarStylePadding_0700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_SubTabBarStylePadding_0700] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('subTabBarNumberTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0700]: " + JSON.stringify(obj.$attrs.tabBar));
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0700]: " + JSON.stringify(obj.$attrs.tabBar.padding));
      let topJsonJudge = getInspectorByKey('subTabBarDefaultTestTopJudge');
      let objTopJudge = JSON.parse(topJsonJudge);
      let rightJsonJudge = getInspectorByKey('subTabBarDefaultTestRightJudge');
      let objRightJudge = JSON.parse(rightJsonJudge);
      let bottomJsonJudge = getInspectorByKey('subTabBarDefaultTestBottomJudge');
      let objBottomJudge = JSON.parse(bottomJsonJudge);
      let leftJsonJudge = getInspectorByKey('subTabBarDefaultTestLeftJudge');
      let objLeftJudge = JSON.parse(leftJsonJudge);
      let resultString =  '{"top":"' + objTopJudge.$attrs.width + '","right":"' + objRightJudge.$attrs.width + '","bottom":"' + objBottomJudge.$attrs.width + '","left":"' + objLeftJudge.$attrs.width + '"}';
      expect(obj.$attrs.tabBar.padding).assertEqual(resultString);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0700] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_SubTabBarStylePadding_0800
     * @tc.name      Tests the SubTabBarStylePadding property of the Tabs component.
     * @tc.desc      Gets the values of subTabBarStylePadding, when the value of the subTabBarStylePadding is null.
     */
    it('ArkUI_Tabs_SubTabBarStylePadding_0800', 0, async function (done) {
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0800] start");
      let strJson = getInspectorByKey('subTabBarNumberTest');
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0800]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "subTabBarStylePaddingNumber": null
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_SubTabBarStylePadding_0800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_SubTabBarStylePadding_0800] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('subTabBarNumberTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0800]: " + JSON.stringify(obj.$attrs.tabBar));
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0800]: " + JSON.stringify(obj.$attrs.tabBar.padding));
      let topJsonJudge = getInspectorByKey('subTabBarDefaultTestTopJudge');
      let objTopJudge = JSON.parse(topJsonJudge);
      let rightJsonJudge = getInspectorByKey('subTabBarDefaultTestRightJudge');
      let objRightJudge = JSON.parse(rightJsonJudge);
      let bottomJsonJudge = getInspectorByKey('subTabBarDefaultTestBottomJudge');
      let objBottomJudge = JSON.parse(bottomJsonJudge);
      let leftJsonJudge = getInspectorByKey('subTabBarDefaultTestLeftJudge');
      let objLeftJudge = JSON.parse(leftJsonJudge);
      let resultString =  '{"top":"' + objTopJudge.$attrs.width + '","right":"' + objRightJudge.$attrs.width + '","bottom":"' + objBottomJudge.$attrs.width + '","left":"' + objLeftJudge.$attrs.width + '"}';
      expect(obj.$attrs.tabBar.padding).assertEqual(resultString);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0800] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_SubTabBarStylePadding_0900
     * @tc.name      Tests the SubTabBarStylePadding property of the Tabs component.
     * @tc.desc      Gets the values of subTabBarStylePadding, when the value of the subTabBarStylePadding is {top:6, right:6, bottom:6, left:6}.
     */
    it('ArkUI_Tabs_SubTabBarStylePadding_0900', 0, async function (done) {
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0900] start");
      let strJson = getInspectorByKey('subTabBarStylePaddingNumberTest');
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0900]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "subTabBarStylePaddingTopNumber": 6,
            "subTabBarStylePaddingRightNumber": 6,
            "subTabBarStylePaddingBottomNumber": 6,
            "subTabBarStylePaddingLeftNumber": 6
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_SubTabBarStylePadding_0900] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_SubTabBarStylePadding_0900] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('subTabBarStylePaddingNumberTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0900]: " + JSON.stringify(obj.$attrs.tabBar));
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0900]: " + JSON.stringify(obj.$attrs.tabBar.padding));
      expect(obj.$attrs.tabBar.padding).assertEqual('6.00vp');
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0900] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_SubTabBarStylePadding_1000
     * @tc.name      Tests the SubTabBarStylePadding property of the Tabs component.
     * @tc.desc      Gets the values of subTabBarStylePadding, when the value of the subTabBarStylePadding is {top:10.00px, right:10.00px, bottom:10.00px, left:10.00px}.
     */
    it('ArkUI_Tabs_SubTabBarStylePadding_1000', 0, async function (done) {
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1000] start");
      let strJson = getInspectorByKey('subTabBarStylePaddingStringTest');
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1000]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "subTabBarStylePaddingTopString": '10.00px',
            "subTabBarStylePaddingRightString": '10.00px',
            "subTabBarStylePaddingBottomString": '10.00px',
            "subTabBarStylePaddingLeftString": '10.00px'
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_SubTabBarStylePadding_1000] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_SubTabBarStylePadding_1000] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('subTabBarStylePaddingStringTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1000]: " + JSON.stringify(obj.$attrs.tabBar));
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1000]: " + JSON.stringify(obj.$attrs.tabBar.padding));
      expect(obj.$attrs.tabBar.padding).assertEqual('10.00px');
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1000] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_SubTabBarStylePadding_1100
     * @tc.name      Tests the SubTabBarStylePadding property of the Tabs component.
     * @tc.desc      Gets the values of subTabBarStylePadding, when the value of the subTabBarStylePadding is {top:$r('app.float.subTabBarStylePadding_Test'), right:$r('app.float.subTabBarStylePadding_Test'), bottom:$r('app.float.subTabBarStylePadding_Test'), left:$r('app.float.subTabBarStylePadding_Test')}.
     */
    it('ArkUI_Tabs_SubTabBarStylePadding_1100', 0, async function (done) {
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1100] start");
      let strJson = getInspectorByKey('subTabBarStylePaddingResourceTest');
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1100]: " + JSON.stringify(strJson));

      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1100]: " + JSON.stringify(obj.$attrs.tabBar));
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1100]: " + JSON.stringify(obj.$attrs.tabBar.padding));
      expect(obj.$attrs.tabBar.padding).assertEqual('10.00vp');
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1100] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_SubTabBarStylePadding_1200
     * @tc.name      Tests the SubTabBarStylePadding property of the Tabs component.
     * @tc.desc      Gets the values of subTabBarStylePadding, when the value of the subTabBarStylePadding is {top:-1, right:6, bottom:6, left:6}.
     */
    it('ArkUI_Tabs_SubTabBarStylePadding_1200', 0, async function (done) {
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1200] start");
      let strJson = getInspectorByKey('subTabBarStylePaddingNumberTest');
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1200]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "subTabBarStylePaddingTopNumber": -1,
            "subTabBarStylePaddingRightNumber": 6,
            "subTabBarStylePaddingBottomNumber": 6,
            "subTabBarStylePaddingLeftNumber": 6
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_SubTabBarStylePadding_1200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_SubTabBarStylePadding_1200] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('subTabBarStylePaddingNumberTest');
      let obj = JSON.parse(newJson);
      let newJsonJudge = getInspectorByKey('subTabBarDefaultTestTopJudge');
      let objJudge = JSON.parse(newJsonJudge);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1200]: " + JSON.stringify(obj.$attrs.tabBar));
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1200]: " + JSON.stringify(obj.$attrs.tabBar.padding));
      let resultString =  '{"top":"' + objJudge.$attrs.width + '","right":"6.00vp","bottom":"6.00vp","left":"6.00vp"}';
      expect(obj.$attrs.tabBar.padding).assertEqual(resultString);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1200] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_SubTabBarStylePadding_1300
     * @tc.name      Tests the SubTabBarStylePadding property of the Tabs component.
     * @tc.desc      Gets the values of subTabBarStylePadding, when the value of the subTabBarStylePadding is {top:100000, right:6, bottom:6, left:6}.
     */
    it('ArkUI_Tabs_SubTabBarStylePadding_1300', 0, async function (done) {
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1300] start");
      let strJson = getInspectorByKey('subTabBarStylePaddingNumberTest');
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1300]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "subTabBarStylePaddingTopNumber": 100000,
            "subTabBarStylePaddingRightNumber": 6,
            "subTabBarStylePaddingBottomNumber": 6,
            "subTabBarStylePaddingLeftNumber": 6
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_SubTabBarStylePadding_1300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_SubTabBarStylePadding_1300] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('subTabBarStylePaddingNumberTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1300]: " + JSON.stringify(obj.$attrs.tabBar));
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1300]: " + JSON.stringify(obj.$attrs.tabBar.padding));
      let resultString =  '{"top":"100000.00vp","right":"6.00vp","bottom":"6.00vp","left":"6.00vp"}';
      expect(obj.$attrs.tabBar.padding).assertEqual(resultString);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1300] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_SubTabBarStylePadding_1400
     * @tc.name      Tests the SubTabBarStylePadding property of the Tabs component.
     * @tc.desc      Gets the values of subTabBarStylePadding, when the value of the subTabBarStylePadding is {top:undefined, right:6, bottom:6, left:6}.
     */
    it('ArkUI_Tabs_SubTabBarStylePadding_1400', 0, async function (done) {
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1400] start");
      let strJson = getInspectorByKey('subTabBarStylePaddingNumberTest');
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1400]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "subTabBarStylePaddingTopNumber": undefined,
            "subTabBarStylePaddingRightNumber": 6,
            "subTabBarStylePaddingBottomNumber": 6,
            "subTabBarStylePaddingLeftNumber": 6
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_SubTabBarStylePadding_1400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_SubTabBarStylePadding_1400] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('subTabBarStylePaddingNumberTest');
      let obj = JSON.parse(newJson);
      let newJsonJudge = getInspectorByKey('subTabBarDefaultTestTopJudge');
      let objJudge = JSON.parse(newJsonJudge);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1400]: " + JSON.stringify(obj.$attrs.tabBar));
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1400]: " + JSON.stringify(obj.$attrs.tabBar.padding));
      let resultString =  '{"top":"' + objJudge.$attrs.width + '","right":"6.00vp","bottom":"6.00vp","left":"6.00vp"}';
      expect(obj.$attrs.tabBar.padding).assertEqual(resultString);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1400] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_SubTabBarStylePadding_1500
     * @tc.name      Tests the SubTabBarStylePadding property of the Tabs component.
     * @tc.desc      Gets the values of subTabBarStylePadding, when the value of the subTabBarStylePadding is {top:null, right:6, bottom:6, left:6}.
     */
    it('ArkUI_Tabs_SubTabBarStylePadding_1500', 0, async function (done) {
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1500] start");
      let strJson = getInspectorByKey('subTabBarStylePaddingNumberTest');
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1500]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "subTabBarStylePaddingTopNumber": null,
            "subTabBarStylePaddingRightNumber": 6,
            "subTabBarStylePaddingBottomNumber": 6,
            "subTabBarStylePaddingLeftNumber": 6
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_SubTabBarStylePadding_1500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_SubTabBarStylePadding_1500] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('subTabBarStylePaddingNumberTest');
      let obj = JSON.parse(newJson);
      let newJsonJudge = getInspectorByKey('subTabBarDefaultTestTopJudge');
      let objJudge = JSON.parse(newJsonJudge);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1500]: " + JSON.stringify(obj.$attrs.tabBar));
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1500]: " + JSON.stringify(obj.$attrs.tabBar.padding));
      let resultString =  '{"top":"' + objJudge.$attrs.width + '","right":"6.00vp","bottom":"6.00vp","left":"6.00vp"}';
      expect(obj.$attrs.tabBar.padding).assertEqual(resultString);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1500] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_SubTabBarStylePadding_1600
     * @tc.name      Tests the SubTabBarStylePadding property of the Tabs component.
     * @tc.desc      Gets the values of subTabBarStylePadding, when the value of the subTabBarStylePadding is {top:6, right:-1, bottom:6, left:6}.
     */
    it('ArkUI_Tabs_SubTabBarStylePadding_1600', 0, async function (done) {
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1600] start");
      let strJson = getInspectorByKey('subTabBarStylePaddingNumberTest');
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1600]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "subTabBarStylePaddingTopNumber": 6,
            "subTabBarStylePaddingRightNumber": -1,
            "subTabBarStylePaddingBottomNumber": 6,
            "subTabBarStylePaddingLeftNumber": 6
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_SubTabBarStylePadding_1600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_SubTabBarStylePadding_1600] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('subTabBarStylePaddingNumberTest');
      let obj = JSON.parse(newJson);
      let newJsonJudge = getInspectorByKey('subTabBarDefaultTestRightJudge');
      let objJudge = JSON.parse(newJsonJudge);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1600]: " + JSON.stringify(obj.$attrs.tabBar));
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1600]: " + JSON.stringify(obj.$attrs.tabBar.padding));
      let resultString =  '{"top":"6.00vp","right":"' + objJudge.$attrs.width + '","bottom":"6.00vp","left":"6.00vp"}';
      expect(obj.$attrs.tabBar.padding).assertEqual(resultString);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1600] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_SubTabBarStylePadding_1700
     * @tc.name      Tests the SubTabBarStylePadding property of the Tabs component.
     * @tc.desc      Gets the values of subTabBarStylePadding, when the value of the subTabBarStylePadding is {top:6, right:100000, bottom:6, left:6}.
     */
    it('ArkUI_Tabs_SubTabBarStylePadding_1700', 0, async function (done) {
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1700] start");
      let strJson = getInspectorByKey('subTabBarStylePaddingNumberTest');
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1700]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "subTabBarStylePaddingTopNumber": 6,
            "subTabBarStylePaddingRightNumber": 100000,
            "subTabBarStylePaddingBottomNumber": 6,
            "subTabBarStylePaddingLeftNumber": 6
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_SubTabBarStylePadding_1700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_SubTabBarStylePadding_1700] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('subTabBarStylePaddingNumberTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1700]: " + JSON.stringify(obj.$attrs.tabBar));
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1700]: " + JSON.stringify(obj.$attrs.tabBar.padding));
      let resultString =  '{"top":"6.00vp","right":"100000.00vp","bottom":"6.00vp","left":"6.00vp"}';
      expect(obj.$attrs.tabBar.padding).assertEqual(resultString);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1700] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_SubTabBarStylePadding_1800
     * @tc.name      Tests the SubTabBarStylePadding property of the Tabs component.
     * @tc.desc      Gets the values of subTabBarStylePadding, when the value of the subTabBarStylePadding is {top:6, right:undefined, bottom:6, left:6}.
     */
    it('ArkUI_Tabs_SubTabBarStylePadding_1800', 0, async function (done) {
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1800] start");
      let strJson = getInspectorByKey('subTabBarStylePaddingNumberTest');
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1800]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "subTabBarStylePaddingTopNumber": 6,
            "subTabBarStylePaddingRightNumber": undefined,
            "subTabBarStylePaddingBottomNumber": 6,
            "subTabBarStylePaddingLeftNumber": 6
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_SubTabBarStylePadding_1800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_SubTabBarStylePadding_1800] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('subTabBarStylePaddingNumberTest');
      let obj = JSON.parse(newJson);
      let newJsonJudge = getInspectorByKey('subTabBarDefaultTestRightJudge');
      let objJudge = JSON.parse(newJsonJudge);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1800]: " + JSON.stringify(obj.$attrs.tabBar));
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1800]: " + JSON.stringify(obj.$attrs.tabBar.padding));
      let resultString =  '{"top":"6.00vp","right":"' + objJudge.$attrs.width + '","bottom":"6.00vp","left":"6.00vp"}';
      expect(obj.$attrs.tabBar.padding).assertEqual(resultString);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1800] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_SubTabBarStylePadding_1900
     * @tc.name      Tests the SubTabBarStylePadding property of the Tabs component.
     * @tc.desc      Gets the values of subTabBarStylePadding, when the value of the subTabBarStylePadding is {top:6, right:null, bottom:6, left:6}.
     */
    it('ArkUI_Tabs_SubTabBarStylePadding_1900', 0, async function (done) {
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1900] start");
      let strJson = getInspectorByKey('subTabBarStylePaddingNumberTest');
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1900]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "subTabBarStylePaddingTopNumber": 6,
            "subTabBarStylePaddingRightNumber": null,
            "subTabBarStylePaddingBottomNumber": 6,
            "subTabBarStylePaddingLeftNumber": 6
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_SubTabBarStylePadding_1900] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_SubTabBarStylePadding_1900] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('subTabBarStylePaddingNumberTest');
      let obj = JSON.parse(newJson);
      let newJsonJudge = getInspectorByKey('subTabBarDefaultTestRightJudge');
      let objJudge = JSON.parse(newJsonJudge);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1900]: " + JSON.stringify(obj.$attrs.tabBar));
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1900]: " + JSON.stringify(obj.$attrs.tabBar.padding));
      let resultString =  '{"top":"6.00vp","right":"' + objJudge.$attrs.width + '","bottom":"6.00vp","left":"6.00vp"}';
      expect(obj.$attrs.tabBar.padding).assertEqual(resultString);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1900] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_SubTabBarStylePadding_2000
     * @tc.name      Tests the SubTabBarStylePadding property of the Tabs component.
     * @tc.desc      Gets the values of subTabBarStylePadding, when the value of the subTabBarStylePadding is {top:6, right:6, bottom:-1, left:6}.
     */
    it('ArkUI_Tabs_SubTabBarStylePadding_2000', 0, async function (done) {
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_2000] start");
      let strJson = getInspectorByKey('subTabBarStylePaddingNumberTest');
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_2000]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "subTabBarStylePaddingTopNumber": 6,
            "subTabBarStylePaddingRightNumber": 6,
            "subTabBarStylePaddingBottomNumber": -1,
            "subTabBarStylePaddingLeftNumber": 6
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_SubTabBarStylePadding_2000] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_SubTabBarStylePadding_2000] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('subTabBarStylePaddingNumberTest');
      let obj = JSON.parse(newJson);
      let newJsonJudge = getInspectorByKey('subTabBarDefaultTestBottomJudge');
      let objJudge = JSON.parse(newJsonJudge);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_2000]: " + JSON.stringify(obj.$attrs.tabBar));
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_2000]: " + JSON.stringify(obj.$attrs.tabBar.padding));
      let resultString =  '{"top":"6.00vp","right":"6.00vp","bottom":"' + objJudge.$attrs.width + '","left":"6.00vp"}';
      expect(obj.$attrs.tabBar.padding).assertEqual(resultString);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_2000] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_SubTabBarStylePadding_2100
     * @tc.name      Tests the SubTabBarStylePadding property of the Tabs component.
     * @tc.desc      Gets the values of subTabBarStylePadding, when the value of the subTabBarStylePadding is {top:6, right:6, bottom:100000, left:6}.
     */
    it('ArkUI_Tabs_SubTabBarStylePadding_2100', 0, async function (done) {
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_2100] start");
      let strJson = getInspectorByKey('subTabBarStylePaddingNumberTest');
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_2100]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "subTabBarStylePaddingTopNumber": 6,
            "subTabBarStylePaddingRightNumber": 6,
            "subTabBarStylePaddingBottomNumber": 100000,
            "subTabBarStylePaddingLeftNumber": 6
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_SubTabBarStylePadding_2100] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_SubTabBarStylePadding_2100] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('subTabBarStylePaddingNumberTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_2100]: " + JSON.stringify(obj.$attrs.tabBar));
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_2100]: " + JSON.stringify(obj.$attrs.tabBar.padding));
      let resultString =  '{"top":"6.00vp","right":"6.00vp","bottom":"100000.00vp","left":"6.00vp"}';
      expect(obj.$attrs.tabBar.padding).assertEqual(resultString);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_2100] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_SubTabBarStylePadding_2200
     * @tc.name      Tests the SubTabBarStylePadding property of the Tabs component.
     * @tc.desc      Gets the values of subTabBarStylePadding, when the value of the subTabBarStylePadding is {top:6, right:6, bottom:undefined, left:6}.
     */
    it('ArkUI_Tabs_SubTabBarStylePadding_2200', 0, async function (done) {
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_2200] start");
      let strJson = getInspectorByKey('subTabBarStylePaddingNumberTest');
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_2200]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "subTabBarStylePaddingTopNumber": 6,
            "subTabBarStylePaddingRightNumber": 6,
            "subTabBarStylePaddingBottomNumber": undefined,
            "subTabBarStylePaddingLeftNumber": 6
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_SubTabBarStylePadding_2200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_SubTabBarStylePadding_2200] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('subTabBarStylePaddingNumberTest');
      let obj = JSON.parse(newJson);
      let newJsonJudge = getInspectorByKey('subTabBarDefaultTestBottomJudge');
      let objJudge = JSON.parse(newJsonJudge);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_2200]: " + JSON.stringify(obj.$attrs.tabBar));
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_2200]: " + JSON.stringify(obj.$attrs.tabBar.padding));
      let resultString =  '{"top":"6.00vp","right":"6.00vp","bottom":"' + objJudge.$attrs.width + '","left":"6.00vp"}';
      expect(obj.$attrs.tabBar.padding).assertEqual(resultString);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_2200] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_SubTabBarStylePadding_2300
     * @tc.name      Tests the SubTabBarStylePadding property of the Tabs component.
     * @tc.desc      Gets the values of subTabBarStylePadding, when the value of the subTabBarStylePadding is {top:6, right:6, bottom:null, left:6}.
     */
    it('ArkUI_Tabs_SubTabBarStylePadding_2300', 0, async function (done) {
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_2300] start");
      let strJson = getInspectorByKey('subTabBarStylePaddingNumberTest');
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_2300]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "subTabBarStylePaddingTopNumber": 6,
            "subTabBarStylePaddingRightNumber": 6,
            "subTabBarStylePaddingBottomNumber": null,
            "subTabBarStylePaddingLeftNumber": 6
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_SubTabBarStylePadding_2300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_SubTabBarStylePadding_2300] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('subTabBarStylePaddingNumberTest');
      let obj = JSON.parse(newJson);
      let newJsonJudge = getInspectorByKey('subTabBarDefaultTestBottomJudge');
      let objJudge = JSON.parse(newJsonJudge);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_2300]: " + JSON.stringify(obj.$attrs.tabBar));
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_2300]: " + JSON.stringify(obj.$attrs.tabBar.padding));
      let resultString =  '{"top":"6.00vp","right":"6.00vp","bottom":"' + objJudge.$attrs.width + '","left":"6.00vp"}';
      expect(obj.$attrs.tabBar.padding).assertEqual(resultString);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_2300] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_SubTabBarStylePadding_2400
     * @tc.name      Tests the SubTabBarStylePadding property of the Tabs component.
     * @tc.desc      Gets the values of subTabBarStylePadding, when the value of the subTabBarStylePadding is {top:6, right:6, bottom:6, left:-1}.
     */
    it('ArkUI_Tabs_SubTabBarStylePadding_2400', 0, async function (done) {
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_2400] start");
      let strJson = getInspectorByKey('subTabBarStylePaddingNumberTest');
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_2400]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "subTabBarStylePaddingTopNumber": 6,
            "subTabBarStylePaddingRightNumber": 6,
            "subTabBarStylePaddingBottomNumber": 6,
            "subTabBarStylePaddingLeftNumber": -1
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_SubTabBarStylePadding_2400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_SubTabBarStylePadding_2400] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('subTabBarStylePaddingNumberTest');
      let obj = JSON.parse(newJson);
      let newJsonJudge = getInspectorByKey('subTabBarDefaultTestLeftJudge');
      let objJudge = JSON.parse(newJsonJudge);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_2400]: " + JSON.stringify(obj.$attrs.tabBar));
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_2400]: " + JSON.stringify(obj.$attrs.tabBar.padding));
      let resultString =  '{"top":"6.00vp","right":"6.00vp","bottom":"6.00vp","left":"' + objJudge.$attrs.width + '"}';
      expect(obj.$attrs.tabBar.padding).assertEqual(resultString);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_2400] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_SubTabBarStylePadding_2500
     * @tc.name      Tests the SubTabBarStylePadding property of the Tabs component.
     * @tc.desc      Gets the values of subTabBarStylePadding, when the value of the subTabBarStylePadding is {top:6, right:6, bottom:6, left:100000}.
     */
    it('ArkUI_Tabs_SubTabBarStylePadding_2500', 0, async function (done) {
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_2500] start");
      let strJson = getInspectorByKey('subTabBarStylePaddingNumberTest');
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_2500]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "subTabBarStylePaddingTopNumber": 6,
            "subTabBarStylePaddingRightNumber": 6,
            "subTabBarStylePaddingBottomNumber": 6,
            "subTabBarStylePaddingLeftNumber": 100000
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_SubTabBarStylePadding_2500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_SubTabBarStylePadding_2500] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('subTabBarStylePaddingNumberTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_2500]: " + JSON.stringify(obj.$attrs.tabBar));
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_2500]: " + JSON.stringify(obj.$attrs.tabBar.padding));
      let resultString =  '{"top":"6.00vp","right":"6.00vp","bottom":"6.00vp","left":"100000.00vp"}';
      expect(obj.$attrs.tabBar.padding).assertEqual(resultString);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_2500] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_SubTabBarStylePadding_2600
     * @tc.name      Tests the SubTabBarStylePadding property of the Tabs component.
     * @tc.desc      Gets the values of subTabBarStylePadding, when the value of the subTabBarStylePadding is {top:6, right:6, bottom:6, left:undefined}.
     */
    it('ArkUI_Tabs_SubTabBarStylePadding_2600', 0, async function (done) {
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_2600] start");
      let strJson = getInspectorByKey('subTabBarStylePaddingNumberTest');
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_2600]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "subTabBarStylePaddingTopNumber": 6,
            "subTabBarStylePaddingRightNumber": 6,
            "subTabBarStylePaddingBottomNumber": 6,
            "subTabBarStylePaddingLeftNumber": undefined
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_SubTabBarStylePadding_2600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_SubTabBarStylePadding_2600] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('subTabBarStylePaddingNumberTest');
      let obj = JSON.parse(newJson);
      let newJsonJudge = getInspectorByKey('subTabBarDefaultTestLeftJudge');
      let objJudge = JSON.parse(newJsonJudge);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_2600]: " + JSON.stringify(obj.$attrs.tabBar));
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_2600]: " + JSON.stringify(obj.$attrs.tabBar.padding));
      let resultString =  '{"top":"6.00vp","right":"6.00vp","bottom":"6.00vp","left":"' + objJudge.$attrs.width + '"}';
      expect(obj.$attrs.tabBar.padding).assertEqual(resultString);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_2600] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_SubTabBarStylePadding_2700
     * @tc.name      Tests the SubTabBarStylePadding property of the Tabs component.
     * @tc.desc      Gets the values of subTabBarStylePadding, when the value of the subTabBarStylePadding is {top:6, right:6, bottom:6, left:null}.
     */
    it('ArkUI_Tabs_SubTabBarStylePadding_2700', 0, async function (done) {
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_2700] start");
      let strJson = getInspectorByKey('subTabBarStylePaddingNumberTest');
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_2700]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "subTabBarStylePaddingTopNumber": 6,
            "subTabBarStylePaddingRightNumber": 6,
            "subTabBarStylePaddingBottomNumber": 6,
            "subTabBarStylePaddingLeftNumber": null
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_SubTabBarStylePadding_2700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_SubTabBarStylePadding_2700] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('subTabBarStylePaddingNumberTest');
      let obj = JSON.parse(newJson);
      let newJsonJudge = getInspectorByKey('subTabBarDefaultTestLeftJudge');
      let objJudge = JSON.parse(newJsonJudge);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_2700]: " + JSON.stringify(obj.$attrs.tabBar));
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_2700]: " + JSON.stringify(obj.$attrs.tabBar.padding));
      let resultString =  '{"top":"6.00vp","right":"6.00vp","bottom":"6.00vp","left":"' + objJudge.$attrs.width + '"}';
      expect(obj.$attrs.tabBar.padding).assertEqual(resultString);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_2700] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStylePadding_0100
     * @tc.name      Tests the BottomTabBarStylePadding property of the Tabs component.
     * @tc.desc      Gets the default values of bottomTabBarStylePadding.
     */
    it('[ArkUI_Tabs_BottomTabBarStylePadding_0100]', 0, async function (done) {
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0100] start");
      let strJson = getInspectorByKey('bottomTabBarDefaultTest');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0100]: " + JSON.stringify(strJson));

      let obj = JSON.parse(strJson);
      let newJsonJudge = getInspectorByKey('bottomTabBarDefaultTestJudge');
      let objJudge = JSON.parse(newJsonJudge);
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0100]: " + JSON.stringify(obj.$attrs.tabBar));
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0100]: " + JSON.stringify(obj.$attrs.tabBar.padding));
      expect(obj.$attrs.tabBar.padding).assertEqual('{"top":"0.00vp","right":"4.00vp","bottom":"0.00vp","left":"4.00vp"}');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0100] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStylePadding_0200
     * @tc.name      Tests the BottomTabBarStylePadding property of the Tabs component.
     * @tc.desc      Gets the values of bottomTabBarStylePadding, when the value of the bottomTabBarStylePadding is 10.
     */
    it('ArkUI_Tabs_BottomTabBarStylePadding_0200', 0, async function (done) {
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0200] start");
      let strJson = getInspectorByKey('bottomTabBarNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0200]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "bottomTabBarStylePaddingNumber": 10,
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BottomTabBarStylePadding_0200] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('bottomTabBarNumberTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0200]: " + JSON.stringify(obj.$attrs.tabBar));
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0200]: " + JSON.stringify(obj.$attrs.tabBar.padding));
      expect(obj.$attrs.tabBar.padding).assertEqual('10.00vp');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0200] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStylePadding_0300
     * @tc.name      Tests the BottomTabBarStylePadding property of the Tabs component.
     * @tc.desc      Gets the values of bottomTabBarStylePadding, when the value of the bottomTabBarStylePadding is '10.00px'.
     */
    it('ArkUI_Tabs_BottomTabBarStylePadding_0300', 0, async function (done) {
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0300] start");
      let strJson = getInspectorByKey('bottomTabBarStringTest');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0300]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "bottomTabBarStylePaddingString": '10.00px',
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BottomTabBarStylePadding_0300] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('bottomTabBarStringTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0300]: " + JSON.stringify(obj.$attrs.tabBar));
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0300]: " + JSON.stringify(obj.$attrs.tabBar.padding));
      expect(obj.$attrs.tabBar.padding).assertEqual('10.00px');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0300] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStylePadding_0400
     * @tc.name      Tests the BottomTabBarStylePadding property of the Tabs component.
     * @tc.desc      Gets the values of bottomTabBarStylePadding, when the value of the bottomTabBarStylePadding is $r('app.float.BottomTabBarStylePadding_Test').
     */
    it('ArkUI_Tabs_BottomTabBarStylePadding_0400', 0, async function (done) {
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0400] start");
      let strJson = getInspectorByKey('bottomTabBarResourceTest');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0400]: " + JSON.stringify(strJson));

      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0400]: " + JSON.stringify(obj.$attrs.tabBar));
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0400]: " + JSON.stringify(obj.$attrs.tabBar.padding));
      expect(obj.$attrs.tabBar.padding).assertEqual('8.00vp');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0400] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStylePadding_0500
     * @tc.name      Tests the BottomTabBarStylePadding property of the Tabs component.
     * @tc.desc      Gets the values of bottomTabBarStylePadding, when the value of the bottomTabBarStylePadding is -1.
     */
    it('ArkUI_Tabs_BottomTabBarStylePadding_0500', 0, async function (done) {
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0500] start");
      let strJson = getInspectorByKey('bottomTabBarNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0500]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "bottomTabBarStylePaddingNumber": -1,
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BottomTabBarStylePadding_0500] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('bottomTabBarNumberTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0500]: " + JSON.stringify(obj.$attrs.tabBar));
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0500]: " + JSON.stringify(obj.$attrs.tabBar.padding));
      expect(obj.$attrs.tabBar.padding).assertEqual('{"top":"0.00vp","right":"4.00vp","bottom":"0.00vp","left":"4.00vp"}');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0500] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStylePadding_0600
     * @tc.name      Tests the BottomTabBarStylePadding property of the Tabs component.
     * @tc.desc      Gets the values of bottomTabBarStylePadding, when the value of the bottomTabBarStylePadding is 100000.
     */
    it('ArkUI_Tabs_BottomTabBarStylePadding_0600', 0, async function (done) {
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0600] start");
      let strJson = getInspectorByKey('bottomTabBarNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0600]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "bottomTabBarStylePaddingNumber": 100000,
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BottomTabBarStylePadding_0600] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('bottomTabBarNumberTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0600]: " + JSON.stringify(obj.$attrs.tabBar));
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0600]: " + JSON.stringify(obj.$attrs.tabBar.padding));
      expect(obj.$attrs.tabBar.padding).assertEqual('100000.00vp');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0600] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStylePadding_0700
     * @tc.name      Tests the BottomTabBarStylePadding property of the Tabs component.
     * @tc.desc      Gets the values of bottomTabBarStylePadding, when the value of the bottomTabBarStylePadding is undefined.
     */
    it('ArkUI_Tabs_BottomTabBarStylePadding_0700', 0, async function (done) {
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0700] start");
      let strJson = getInspectorByKey('bottomTabBarNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0700]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "bottomTabBarStylePaddingNumber": undefined,
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BottomTabBarStylePadding_0700] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('bottomTabBarNumberTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0700]: " + JSON.stringify(obj.$attrs.tabBar));
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0700]: " + JSON.stringify(obj.$attrs.tabBar.padding));
      expect(obj.$attrs.tabBar.padding).assertEqual('{"top":"0.00vp","right":"4.00vp","bottom":"0.00vp","left":"4.00vp"}');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0700] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStylePadding_0800
     * @tc.name      Tests the BottomTabBarStylePadding property of the Tabs component.
     * @tc.desc      Gets the values of bottomTabBarStylePadding, when the value of the bottomTabBarStylePadding is null.
     */
    it('ArkUI_Tabs_BottomTabBarStylePadding_0800', 0, async function (done) {
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0800] start");
      let strJson = getInspectorByKey('bottomTabBarNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0800]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "bottomTabBarStylePaddingNumber": null,
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BottomTabBarStylePadding_0800] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('bottomTabBarNumberTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0800]: " + JSON.stringify(obj.$attrs.tabBar));
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0800]: " + JSON.stringify(obj.$attrs.tabBar.padding));
      expect(obj.$attrs.tabBar.padding).assertEqual('{"top":"0.00vp","right":"4.00vp","bottom":"0.00vp","left":"4.00vp"}');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0800] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStylePadding_0900
     * @tc.name      Tests the BottomTabBarStylePadding property of the Tabs component.
     * @tc.desc      Gets the values of bottomTabBarStylePadding, when the value of the bottomTabBarStylePadding is {top:6, right:6, bottom:6, left:6}.
     */
    it('ArkUI_Tabs_BottomTabBarStylePadding_0900', 0, async function (done) {
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0900] start");
      let strJson = getInspectorByKey('bottomTabBarStylePaddingNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0900]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "bottomTabBarStylePaddingTopNumber": 6,
            "bottomTabBarStylePaddingRightNumber": 6,
            "bottomTabBarStylePaddingBottomNumber": 6,
            "bottomTabBarStylePaddingLeftNumber": 6
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0900] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BottomTabBarStylePadding_0900] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('bottomTabBarStylePaddingNumberTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0900]: " + JSON.stringify(obj.$attrs.tabBar));
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0900]: " + JSON.stringify(obj.$attrs.tabBar.padding));
      expect(obj.$attrs.tabBar.padding).assertEqual('6.00vp');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0900] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStylePadding_1000
     * @tc.name      Tests the BottomTabBarStylePadding property of the Tabs component.
     * @tc.desc      Gets the values of bottomTabBarStylePadding, when the value of the bottomTabBarStylePadding is {top:10.00px, right:10.00px, bottom:10.00px, left:10.00px}.
     */
    it('ArkUI_Tabs_BottomTabBarStylePadding_1000', 0, async function (done) {
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1000] start");
      let strJson = getInspectorByKey('bottomTabBarStylePaddingStringTest');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1000]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "bottomTabBarStylePaddingTopString": '10.00px',
            "bottomTabBarStylePaddingRightString": '10.00px',
            "bottomTabBarStylePaddingBottomString": '10.00px',
            "bottomTabBarStylePaddingLeftString": '10.00px'
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1000] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BottomTabBarStylePadding_1000] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('bottomTabBarStylePaddingStringTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1000]: " + JSON.stringify(obj.$attrs.tabBar));
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1000]: " + JSON.stringify(obj.$attrs.tabBar.padding));
      expect(obj.$attrs.tabBar.padding).assertEqual('10.00px');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1000] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStylePadding_1100
     * @tc.name      Tests the BottomTabBarStylePadding property of the Tabs component.
     * @tc.desc      Gets the values of bottomTabBarStylePadding, when the value of the bottomTabBarStylePadding is {top:$r('app.float.bottomTabBarStylePadding_Test'), right:$r('app.float.bottomTabBarStylePadding_Test'), bottom:$r('app.float.bottomTabBarStylePadding_Test'), left:$r('app.float.bottomTabBarStylePadding_Test')}.
     */
    it('ArkUI_Tabs_BottomTabBarStylePadding_1100', 0, async function (done) {
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1100] start");
      let strJson = getInspectorByKey('bottomTabBarStylePaddingResourceTest');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1100]: " + JSON.stringify(strJson));

      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1100]: " + JSON.stringify(obj.$attrs.tabBar));
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1100]: " + JSON.stringify(obj.$attrs.tabBar.padding));
      expect(obj.$attrs.tabBar.padding).assertEqual('8.00vp');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1100] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStylePadding_1200
     * @tc.name      Tests the BottomTabBarStylePadding property of the Tabs component.
     * @tc.desc      Gets the values of bottomTabBarStylePadding, when the value of the bottomTabBarStylePadding is {top:-1, right:6, bottom:6, left:6}.
     */
    it('ArkUI_Tabs_BottomTabBarStylePadding_1200', 0, async function (done) {
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1200] start");
      let strJson = getInspectorByKey('bottomTabBarStylePaddingNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1200]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "bottomTabBarStylePaddingTopNumber": -1,
            "bottomTabBarStylePaddingRightNumber": 6,
            "bottomTabBarStylePaddingBottomNumber": 6,
            "bottomTabBarStylePaddingLeftNumber": 6
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BottomTabBarStylePadding_1200] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('bottomTabBarStylePaddingNumberTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1200]: " + JSON.stringify(obj.$attrs.tabBar));
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1200]: " + JSON.stringify(obj.$attrs.tabBar.padding));
      expect(obj.$attrs.tabBar.padding).assertEqual('{"top":"0.00vp","right":"6.00vp","bottom":"6.00vp","left":"6.00vp"}');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1200] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStylePadding_1300
     * @tc.name      Tests the BottomTabBarStylePadding property of the Tabs component.
     * @tc.desc      Gets the values of bottomTabBarStylePadding, when the value of the bottomTabBarStylePadding is {top:100000, bottom:6, left:6, right:6}.
     */
    it('ArkUI_Tabs_BottomTabBarStylePadding_1300', 0, async function (done) {
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1300] start");
      let strJson = getInspectorByKey('bottomTabBarStylePaddingNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1300]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "bottomTabBarStylePaddingTopNumber": 100000,
            "bottomTabBarStylePaddingRightNumber": 6,
            "bottomTabBarStylePaddingBottomNumber": 6,
            "bottomTabBarStylePaddingLeftNumber": 6
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BottomTabBarStylePadding_1300] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('bottomTabBarStylePaddingNumberTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1300]: " + JSON.stringify(obj.$attrs.tabBar));
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1300]: " + JSON.stringify(obj.$attrs.tabBar.padding));
      expect(obj.$attrs.tabBar.padding).assertEqual('{"top":"100000.00vp","right":"6.00vp","bottom":"6.00vp","left":"6.00vp"}');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1300] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStylePadding_1400
     * @tc.name      Tests the BottomTabBarStylePadding property of the Tabs component.
     * @tc.desc      Gets the values of bottomTabBarStylePadding, when the value of the bottomTabBarStylePadding is {top:undefined, right:6, bottom:6, left:6}.
     */
    it('ArkUI_Tabs_BottomTabBarStylePadding_1400', 0, async function (done) {
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1400] start");
      let strJson = getInspectorByKey('bottomTabBarStylePaddingNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1400]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "bottomTabBarStylePaddingTopNumber": undefined,
            "bottomTabBarStylePaddingRightNumber": 6,
            "bottomTabBarStylePaddingBottomNumber": 6,
            "bottomTabBarStylePaddingLeftNumber": 6
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BottomTabBarStylePadding_1400] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('bottomTabBarStylePaddingNumberTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1400]: " + JSON.stringify(obj.$attrs.tabBar));
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1400]: " + JSON.stringify(obj.$attrs.tabBar.padding));
      expect(obj.$attrs.tabBar.padding).assertEqual('{"top":"0.00vp","right":"6.00vp","bottom":"6.00vp","left":"6.00vp"}');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1400] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStylePadding_1500
     * @tc.name      Tests the BottomTabBarStylePadding property of the Tabs component.
     * @tc.desc      Gets the values of bottomTabBarStylePadding, when the value of the bottomTabBarStylePadding is {top:null, right:6, bottom:6, left:6}.
     */
    it('ArkUI_Tabs_BottomTabBarStylePadding_1500', 0, async function (done) {
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1500] start");
      let strJson = getInspectorByKey('bottomTabBarStylePaddingNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1500]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "bottomTabBarStylePaddingTopNumber": null,
            "bottomTabBarStylePaddingRightNumber": 6,
            "bottomTabBarStylePaddingBottomNumber": 6,
            "bottomTabBarStylePaddingLeftNumber": 6
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BottomTabBarStylePadding_1500] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('bottomTabBarStylePaddingNumberTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1500]: " + JSON.stringify(obj.$attrs.tabBar));
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1500]: " + JSON.stringify(obj.$attrs.tabBar.padding));
      expect(obj.$attrs.tabBar.padding).assertEqual('{"top":"0.00vp","right":"6.00vp","bottom":"6.00vp","left":"6.00vp"}');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1500] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStylePadding_1600
     * @tc.name      Tests the BottomTabBarStylePadding property of the Tabs component.
     * @tc.desc      Gets the values of bottomTabBarStylePadding, when the value of the bottomTabBarStylePadding is {top:6, right:-1, bottom:6, left:6}.
     */
    it('ArkUI_Tabs_BottomTabBarStylePadding_1600', 0, async function (done) {
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1600] start");
      let strJson = getInspectorByKey('bottomTabBarStylePaddingNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1600]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "bottomTabBarStylePaddingTopNumber": 6,
            "bottomTabBarStylePaddingRightNumber": -1,
            "bottomTabBarStylePaddingBottomNumber": 6,
            "bottomTabBarStylePaddingLeftNumber": 6
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BottomTabBarStylePadding_1600] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('bottomTabBarStylePaddingNumberTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1600]: " + JSON.stringify(obj.$attrs.tabBar));
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1600]: " + JSON.stringify(obj.$attrs.tabBar.padding));
      expect(obj.$attrs.tabBar.padding).assertEqual('{"top":"6.00vp","right":"4.00vp","bottom":"6.00vp","left":"6.00vp"}');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1600] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStylePadding_1700
     * @tc.name      Tests the BottomTabBarStylePadding property of the Tabs component.
     * @tc.desc      Gets the values of bottomTabBarStylePadding, when the value of the bottomTabBarStylePadding is {top:6, right:100000, bottom:6, left:6}.
     */
    it('ArkUI_Tabs_BottomTabBarStylePadding_1700', 0, async function (done) {
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1700] start");
      let strJson = getInspectorByKey('bottomTabBarStylePaddingNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1700]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "bottomTabBarStylePaddingTopNumber": 6,
            "bottomTabBarStylePaddingRightNumber": 100000,
            "bottomTabBarStylePaddingBottomNumber": 6,
            "bottomTabBarStylePaddingLeftNumber": 6
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BottomTabBarStylePadding_1700] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('bottomTabBarStylePaddingNumberTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1700]: " + JSON.stringify(obj.$attrs.tabBar));
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1700]: " + JSON.stringify(obj.$attrs.tabBar.padding));
      expect(obj.$attrs.tabBar.padding).assertEqual('{"top":"6.00vp","right":"100000.00vp","bottom":"6.00vp","left":"6.00vp"}');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1700] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStylePadding_1800
     * @tc.name      Tests the BottomTabBarStylePadding property of the Tabs component.
     * @tc.desc      Gets the values of bottomTabBarStylePadding, when the value of the bottomTabBarStylePadding is {top:6, right:undefined, bottom:6, left:6}.
     */
    it('ArkUI_Tabs_BottomTabBarStylePadding_1800', 0, async function (done) {
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1800] start");
      let strJson = getInspectorByKey('bottomTabBarStylePaddingNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1800]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "bottomTabBarStylePaddingTopNumber": 6,
            "bottomTabBarStylePaddingRightNumber": undefined,
            "bottomTabBarStylePaddingBottomNumber": 6,
            "bottomTabBarStylePaddingLeftNumber": 6
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BottomTabBarStylePadding_1800] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('bottomTabBarStylePaddingNumberTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1800]: " + JSON.stringify(obj.$attrs.tabBar));
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1800]: " + JSON.stringify(obj.$attrs.tabBar.padding));
      expect(obj.$attrs.tabBar.padding).assertEqual('{"top":"6.00vp","right":"4.00vp","bottom":"6.00vp","left":"6.00vp"}');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1800] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStylePadding_1900
     * @tc.name      Tests the BottomTabBarStylePadding property of the Tabs component.
     * @tc.desc      Gets the values of bottomTabBarStylePadding, when the value of the bottomTabBarStylePadding is {top:6, right:null, bottom:6, left:6}.
     */
    it('ArkUI_Tabs_BottomTabBarStylePadding_1900', 0, async function (done) {
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1900] start");
      let strJson = getInspectorByKey('bottomTabBarStylePaddingNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1900]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "bottomTabBarStylePaddingTopNumber": 6,
            "bottomTabBarStylePaddingRightNumber": null,
            "bottomTabBarStylePaddingBottomNumber": 6,
            "bottomTabBarStylePaddingLeftNumber": 6
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1900] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BottomTabBarStylePadding_1900] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('bottomTabBarStylePaddingNumberTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1900]: " + JSON.stringify(obj.$attrs.tabBar));
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1900]: " + JSON.stringify(obj.$attrs.tabBar.padding));
      expect(obj.$attrs.tabBar.padding).assertEqual('{"top":"6.00vp","right":"4.00vp","bottom":"6.00vp","left":"6.00vp"}');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1900] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStylePadding_2000
     * @tc.name      Tests the BottomTabBarStylePadding property of the Tabs component.
     * @tc.desc      Gets the values of bottomTabBarStylePadding, when the value of the bottomTabBarStylePadding is {top:6, right:6, bottom:-1, left:6}.
     */
    it('ArkUI_Tabs_BottomTabBarStylePadding_2000', 0, async function (done) {
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2000] start");
      let strJson = getInspectorByKey('bottomTabBarStylePaddingNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2000]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "bottomTabBarStylePaddingTopNumber": 6,
            "bottomTabBarStylePaddingRightNumber": 6,
            "bottomTabBarStylePaddingBottomNumber": -1,
            "bottomTabBarStylePaddingLeftNumber": 6
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2000] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BottomTabBarStylePadding_2000] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('bottomTabBarStylePaddingNumberTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2000]: " + JSON.stringify(obj.$attrs.tabBar));
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2000]: " + JSON.stringify(obj.$attrs.tabBar.padding));
      expect(obj.$attrs.tabBar.padding).assertEqual('{"top":"6.00vp","right":"6.00vp","bottom":"0.00vp","left":"6.00vp"}');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2000] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStylePadding_2100
     * @tc.name      Tests the BottomTabBarStylePadding property of the Tabs component.
     * @tc.desc      Gets the values of bottomTabBarStylePadding, when the value of the bottomTabBarStylePadding is {top:6, right:6, bottom:100000, left:6}.
     */
    it('ArkUI_Tabs_BottomTabBarStylePadding_2100', 0, async function (done) {
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2100] start");
      let strJson = getInspectorByKey('bottomTabBarStylePaddingNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2100]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "bottomTabBarStylePaddingTopNumber": 6,
            "bottomTabBarStylePaddingRightNumber": 6,
            "bottomTabBarStylePaddingBottomNumber": 100000,
            "bottomTabBarStylePaddingLeftNumber": 6
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2100] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BottomTabBarStylePadding_2100] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('bottomTabBarStylePaddingNumberTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2100]: " + JSON.stringify(obj.$attrs.tabBar));
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2100]: " + JSON.stringify(obj.$attrs.tabBar.padding));
      expect(obj.$attrs.tabBar.padding).assertEqual('{"top":"6.00vp","right":"6.00vp","bottom":"100000.00vp","left":"6.00vp"}');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2100] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStylePadding_2200
     * @tc.name      Tests the BottomTabBarStylePadding property of the Tabs component.
     * @tc.desc      Gets the values of bottomTabBarStylePadding, when the value of the bottomTabBarStylePadding is {top:6, right:6, bottom:undefined, left:6}.
     */
    it('ArkUI_Tabs_BottomTabBarStylePadding_2200', 0, async function (done) {
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2200] start");
      let strJson = getInspectorByKey('bottomTabBarStylePaddingNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2200]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "bottomTabBarStylePaddingTopNumber": 6,
            "bottomTabBarStylePaddingRightNumber": 6,
            "bottomTabBarStylePaddingBottomNumber": undefined,
            "bottomTabBarStylePaddingLeftNumber": 6
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BottomTabBarStylePadding_2200] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('bottomTabBarStylePaddingNumberTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2200]: " + JSON.stringify(obj.$attrs.tabBar));
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2200]: " + JSON.stringify(obj.$attrs.tabBar.padding));
      expect(obj.$attrs.tabBar.padding).assertEqual('{"top":"6.00vp","right":"6.00vp","bottom":"0.00vp","left":"6.00vp"}');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2200] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStylePadding_2300
     * @tc.name      Tests the BottomTabBarStylePadding property of the Tabs component.
     * @tc.desc      Gets the values of bottomTabBarStylePadding, when the value of the bottomTabBarStylePadding is {top:6, right:6, bottom:null, left:6}.
     */
    it('ArkUI_Tabs_BottomTabBarStylePadding_2300', 0, async function (done) {
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2300] start");
      let strJson = getInspectorByKey('bottomTabBarStylePaddingNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2300]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "bottomTabBarStylePaddingTopNumber": 6,
            "bottomTabBarStylePaddingRightNumber": 6,
            "bottomTabBarStylePaddingBottomNumber": null,
            "bottomTabBarStylePaddingLeftNumber": 6
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BottomTabBarStylePadding_2300] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('bottomTabBarStylePaddingNumberTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2300]: " + JSON.stringify(obj.$attrs.tabBar));
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2300]: " + JSON.stringify(obj.$attrs.tabBar.padding));
      expect(obj.$attrs.tabBar.padding).assertEqual('{"top":"6.00vp","right":"6.00vp","bottom":"0.00vp","left":"6.00vp"}');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2300] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStylePadding_2400
     * @tc.name      Tests the BottomTabBarStylePadding property of the Tabs component.
     * @tc.desc      Gets the values of bottomTabBarStylePadding, when the value of the bottomTabBarStylePadding is {top:6, right:6, bottom:6, left:-1}.
     */
    it('ArkUI_Tabs_BottomTabBarStylePadding_2400', 0, async function (done) {
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2400] start");
      let strJson = getInspectorByKey('bottomTabBarStylePaddingNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2400]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "bottomTabBarStylePaddingTopNumber": 6,
            "bottomTabBarStylePaddingRightNumber": 6,
            "bottomTabBarStylePaddingBottomNumber": 6,
            "bottomTabBarStylePaddingLeftNumber": -1
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BottomTabBarStylePadding_2400] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('bottomTabBarStylePaddingNumberTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2400]: " + JSON.stringify(obj.$attrs.tabBar));
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2400]: " + JSON.stringify(obj.$attrs.tabBar.padding));
      expect(obj.$attrs.tabBar.padding).assertEqual('{"top":"6.00vp","right":"6.00vp","bottom":"6.00vp","left":"4.00vp"}');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2400] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStylePadding_2500
     * @tc.name      Tests the BottomTabBarStylePadding property of the Tabs component.
     * @tc.desc      Gets the values of bottomTabBarStylePadding, when the value of the bottomTabBarStylePadding is {top:6, right:6, bottom:6, left:100000}.
     */
    it('ArkUI_Tabs_BottomTabBarStylePadding_2500', 0, async function (done) {
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2500] start");
      let strJson = getInspectorByKey('bottomTabBarStylePaddingNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2500]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "bottomTabBarStylePaddingTopNumber": 6,
            "bottomTabBarStylePaddingRightNumber": 6,
            "bottomTabBarStylePaddingBottomNumber": 6,
            "bottomTabBarStylePaddingLeftNumber": 100000
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BottomTabBarStylePadding_2500] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('bottomTabBarStylePaddingNumberTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2500]: " + JSON.stringify(obj.$attrs.tabBar));
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2500]: " + JSON.stringify(obj.$attrs.tabBar.padding));
      expect(obj.$attrs.tabBar.padding).assertEqual('{"top":"6.00vp","right":"6.00vp","bottom":"6.00vp","left":"100000.00vp"}');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2500] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStylePadding_2600
     * @tc.name      Tests the BottomTabBarStylePadding property of the Tabs component.
     * @tc.desc      Gets the values of bottomTabBarStylePadding, when the value of the bottomTabBarStylePadding is {top:6, right:6, bottom:6, left:undefined}.
     */
    it('ArkUI_Tabs_BottomTabBarStylePadding_2600', 0, async function (done) {
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2600] start");
      let strJson = getInspectorByKey('bottomTabBarStylePaddingNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2600]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "bottomTabBarStylePaddingTopNumber": 6,
            "bottomTabBarStylePaddingRightNumber": 6,
            "bottomTabBarStylePaddingBottomNumber": 6,
            "bottomTabBarStylePaddingLeftNumber": undefined
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BottomTabBarStylePadding_2600] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('bottomTabBarStylePaddingNumberTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2600]: " + JSON.stringify(obj.$attrs.tabBar));
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2600]: " + JSON.stringify(obj.$attrs.tabBar.padding));
      expect(obj.$attrs.tabBar.padding).assertEqual('{"top":"6.00vp","right":"6.00vp","bottom":"6.00vp","left":"4.00vp"}');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2600] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStylePadding_2700
     * @tc.name      Tests the BottomTabBarStylePadding property of the Tabs component.
     * @tc.desc      Gets the values of bottomTabBarStylePadding, when the value of the bottomTabBarStylePadding is {top:6, right:6, bottom:6, left:null}.
     */
    it('ArkUI_Tabs_BottomTabBarStylePadding_2700', 0, async function (done) {
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2700] start");
      let strJson = getInspectorByKey('bottomTabBarStylePaddingNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2700]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "bottomTabBarStylePaddingTopNumber": 6,
            "bottomTabBarStylePaddingRightNumber": 6,
            "bottomTabBarStylePaddingBottomNumber": 6,
            "bottomTabBarStylePaddingLeftNumber": null
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BottomTabBarStylePadding_2700] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('bottomTabBarStylePaddingNumberTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2700]: " + JSON.stringify(obj.$attrs.tabBar));
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2700]: " + JSON.stringify(obj.$attrs.tabBar.padding));
      expect(obj.$attrs.tabBar.padding).assertEqual('{"top":"6.00vp","right":"6.00vp","bottom":"6.00vp","left":"4.00vp"}');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2700] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleVerticalAlign_0100
     * @tc.name      Tests the BottomTabBarStyleVerticalAlign property of the Tabs component.
     * @tc.desc      Gets the default values of bottomTabBarStyleVerticalAlign.
     */
    it('[ArkUI_Tabs_BottomTabBarStyleVerticalAlign_0100]', 0, async function (done) {
      console.info("[ArkUI_Tabs_BottomTabBarStyleVerticalAlign_0100] start");
      let strJson = getInspectorByKey('bottomTabBarDefaultTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleVerticalAlign_0100]: " + JSON.stringify(strJson));

      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleVerticalAlign_0100]: " + JSON.stringify(obj.$attrs.tabBar));
      console.info("[ArkUI_Tabs_BottomTabBarStyleVerticalAlign_0100]: " + JSON.stringify(obj.$attrs.tabBar.verticalAlign));
      expect(obj.$attrs.tabBar.verticalAlign).assertEqual("VerticalAlign.Center");
      console.info("[ArkUI_Tabs_BottomTabBarStyleVerticalAlign_0100] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleVerticalAlign_0200
     * @tc.name      Tests the BottomTabBarStyleVerticalAlign property of the Tabs component.
     * @tc.desc      Gets the values of bottomTabBarStyleVerticalAlign, when the value of the bottomTabBarStyleVerticalAlign is VerticalAlign.Top.
     */
    it('ArkUI_Tabs_BottomTabBarStyleVerticalAlign_0200', 0, async function (done) {
      console.info("[ArkUI_Tabs_BottomTabBarStyleVerticalAlign_0200] start");
      let strJson = getInspectorByKey('bottomTabBarStyleVerticalAlignTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleVerticalAlign_0200]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "bottomTabBarStyleVerticalAlign": VerticalAlign.Top
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleVerticalAlign_0200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleVerticalAlign_0200] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('bottomTabBarStyleVerticalAlignTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleVerticalAlign_0200]: " + JSON.stringify(obj.$attrs.tabBar));
      console.info("[ArkUI_Tabs_BottomTabBarStyleVerticalAlign_0200]: " + JSON.stringify(obj.$attrs.tabBar.verticalAlign));
      expect(obj.$attrs.tabBar.verticalAlign).assertEqual("VerticalAlign.Top");
      console.info("[ArkUI_Tabs_BottomTabBarStyleVerticalAlign_0200] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleVerticalAlign_0300
     * @tc.name      Tests the BottomTabBarStyleVerticalAlign property of the Tabs component.
     * @tc.desc      Gets the values of bottomTabBarStyleVerticalAlign, when the value of the bottomTabBarStyleVerticalAlign is VerticalAlign.Center.
     */
    it('ArkUI_Tabs_BottomTabBarStyleVerticalAlign_0300', 0, async function (done) {
      console.info("[ArkUI_Tabs_BottomTabBarStyleVerticalAlign_0300] start");
      let strJson = getInspectorByKey('bottomTabBarStyleVerticalAlignTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleVerticalAlign_0300]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "bottomTabBarStyleVerticalAlign": VerticalAlign.Center
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleVerticalAlign_0300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleVerticalAlign_0300] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('bottomTabBarStyleVerticalAlignTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleVerticalAlign_0300]: " + JSON.stringify(obj.$attrs.tabBar));
      console.info("[ArkUI_Tabs_BottomTabBarStyleVerticalAlign_0300]: " + JSON.stringify(obj.$attrs.tabBar.verticalAlign));
      expect(obj.$attrs.tabBar.verticalAlign).assertEqual("VerticalAlign.Center");
      console.info("[ArkUI_Tabs_BottomTabBarStyleVerticalAlign_0300] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleVerticalAlign_0400
     * @tc.name      Tests the BottomTabBarStyleVerticalAlign property of the Tabs component.
     * @tc.desc      Gets the values of bottomTabBarStyleVerticalAlign, when the value of the bottomTabBarStyleVerticalAlign is VerticalAlign.Bottom.
     */
    it('ArkUI_Tabs_BottomTabBarStyleVerticalAlign_0400', 0, async function (done) {
      console.info("[ArkUI_Tabs_BottomTabBarStyleVerticalAlign_0400] start");
      let strJson = getInspectorByKey('bottomTabBarStyleVerticalAlignTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleVerticalAlign_0400]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "bottomTabBarStyleVerticalAlign": VerticalAlign.Bottom
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleVerticalAlign_0400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleVerticalAlign_0400] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('bottomTabBarStyleVerticalAlignTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleVerticalAlign_0400]: " + JSON.stringify(obj.$attrs.tabBar));
      console.info("[ArkUI_Tabs_BottomTabBarStyleVerticalAlign_0400]: " + JSON.stringify(obj.$attrs.tabBar.verticalAlign));
      expect(obj.$attrs.tabBar.verticalAlign).assertEqual("VerticalAlign.Bottom");
      console.info("[ArkUI_Tabs_BottomTabBarStyleVerticalAlign_0400] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleVerticalAlign_0500
     * @tc.name      Tests the BottomTabBarStyleVerticalAlign property of the Tabs component.
     * @tc.desc      Gets the values of bottomTabBarStyleVerticalAlign, when the value of the bottomTabBarStyleVerticalAlign is undefined.
     */
    it('ArkUI_Tabs_BottomTabBarStyleVerticalAlign_0500', 0, async function (done) {
      console.info("[ArkUI_Tabs_BottomTabBarStyleVerticalAlign_0500] start");
      let strJson = getInspectorByKey('bottomTabBarStyleVerticalAlignTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleVerticalAlign_0500]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "bottomTabBarStyleVerticalAlign": undefined
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleVerticalAlign_0500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleVerticalAlign_0500] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('bottomTabBarStyleVerticalAlignTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleVerticalAlign_0500]: " + JSON.stringify(obj.$attrs.tabBar));
      console.info("[ArkUI_Tabs_BottomTabBarStyleVerticalAlign_0500]: " + JSON.stringify(obj.$attrs.tabBar.verticalAlign));
      expect(obj.$attrs.tabBar.verticalAlign).assertEqual("VerticalAlign.Center");
      console.info("[ArkUI_Tabs_BottomTabBarStyleVerticalAlign_0500] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleVerticalAlign_0600
     * @tc.name      Tests the BottomTabBarStyleVerticalAlign property of the Tabs component.
     * @tc.desc      Gets the values of bottomTabBarStyleVerticalAlign, when the value of the bottomTabBarStyleVerticalAlign is null.
     */
    it('ArkUI_Tabs_BottomTabBarStyleVerticalAlign_0600', 0, async function (done) {
      console.info("[ArkUI_Tabs_BottomTabBarStyleVerticalAlign_0600] start");
      let strJson = getInspectorByKey('bottomTabBarStyleVerticalAlignTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleVerticalAlign_0600]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "bottomTabBarStyleVerticalAlign": null
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleVerticalAlign_0600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleVerticalAlign_0600] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('bottomTabBarStyleVerticalAlignTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleVerticalAlign_0600]: " + JSON.stringify(obj.$attrs.tabBar));
      console.info("[ArkUI_Tabs_BottomTabBarStyleVerticalAlign_0600]: " + JSON.stringify(obj.$attrs.tabBar.verticalAlign));
      expect(obj.$attrs.tabBar.verticalAlign).assertEqual("VerticalAlign.Center");
      console.info("[ArkUI_Tabs_BottomTabBarStyleVerticalAlign_0600] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleLayoutMode_0100
     * @tc.name      Tests the BottomTabBarStyleLayoutMode property of the Tabs component.
     * @tc.desc      Gets the default values of bottomTabBarStyleLayoutMode.
     */
    it('[ArkUI_Tabs_BottomTabBarStyleLayoutMode_0100]', 0, async function (done) {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLayoutMode_0100] start");
      let strJson = getInspectorByKey('bottomTabBarDefaultTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLayoutMode_0100]: " + JSON.stringify(strJson));

      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLayoutMode_0100]: " + JSON.stringify(obj.$attrs.tabBar));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLayoutMode_0100]: " + JSON.stringify(obj.$attrs.tabBar.layoutMode));
      expect(obj.$attrs.tabBar.layoutMode).assertEqual("LayoutMode.VERTICAL");
      console.info("[ArkUI_Tabs_BottomTabBarStyleLayoutMode_0100] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleLayoutMode_0200
     * @tc.name      Tests the BottomTabBarStyleLayoutMode property of the Tabs component.
     * @tc.desc      Gets the values of bottomTabBarStyleLayoutMode, when the value of the bottomTabBarStyleLayoutMode is LayoutMode.HORIZONTAL.
     */
    it('ArkUI_Tabs_BottomTabBarStyleLayoutMode_0200', 0, async function (done) {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLayoutMode_0200] start");
      let strJson = getInspectorByKey('bottomTabBarStyleLayoutModeTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLayoutMode_0200]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "bottomTabBarStyleLayoutMode": LayoutMode.HORIZONTAL
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLayoutMode_0200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLayoutMode_0200] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('bottomTabBarStyleLayoutModeTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLayoutMode_0200]: " + JSON.stringify(obj.$attrs.tabBar));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLayoutMode_0200]: " + JSON.stringify(obj.$attrs.tabBar.layoutMode));
      expect(obj.$attrs.tabBar.layoutMode).assertEqual("LayoutMode.HORIZONTAL");
      console.info("[ArkUI_Tabs_BottomTabBarStyleLayoutMode_0200] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleLayoutMode_0300
     * @tc.name      Tests the BottomTabBarStyleLayoutMode property of the Tabs component.
     * @tc.desc      Gets the values of bottomTabBarStyleLayoutMode, when the value of the bottomTabBarStyleLayoutMode is LayoutMode.VERTICAL.
     */
    it('ArkUI_Tabs_BottomTabBarStyleLayoutMode_0300', 0, async function (done) {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLayoutMode_0300] start");
      let strJson = getInspectorByKey('bottomTabBarStyleLayoutModeTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLayoutMode_0300]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "bottomTabBarStyleLayoutMode": LayoutMode.VERTICAL
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLayoutMode_0300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLayoutMode_0300] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('bottomTabBarStyleLayoutModeTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLayoutMode_0300]: " + JSON.stringify(obj.$attrs.tabBar));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLayoutMode_0300]: " + JSON.stringify(obj.$attrs.tabBar.layoutMode));
      expect(obj.$attrs.tabBar.layoutMode).assertEqual("LayoutMode.VERTICAL");
      console.info("[ArkUI_Tabs_BottomTabBarStyleLayoutMode_0300] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleLayoutMode_0400
     * @tc.name      Tests the BottomTabBarStyleLayoutMode property of the Tabs component.
     * @tc.desc      Gets the values of bottomTabBarStyleLayoutMode, when the value of the bottomTabBarStyleLayoutMode is LayoutMode.AUTO.
     */
    it('ArkUI_Tabs_BottomTabBarStyleLayoutMode_0400', 0, async function (done) {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLayoutMode_0400] start");
      let strJson = getInspectorByKey('bottomTabBarStyleLayoutModeTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLayoutMode_0400]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "bottomTabBarStyleLayoutMode": LayoutMode.AUTO
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLayoutMode_0400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLayoutMode_0400] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('bottomTabBarStyleLayoutModeTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLayoutMode_0400]: " + JSON.stringify(obj.$attrs.tabBar));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLayoutMode_0400]: " + JSON.stringify(obj.$attrs.tabBar.layoutMode));
      expect(obj.$attrs.tabBar.layoutMode).assertEqual("LayoutMode.AUTO");
      console.info("[ArkUI_Tabs_BottomTabBarStyleLayoutMode_0400] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleLayoutMode_0500
     * @tc.name      Tests the BottomTabBarStyleLayoutMode property of the Tabs component.
     * @tc.desc      Gets the values of bottomTabBarStyleLayoutMode, when the value of the bottomTabBarStyleLayoutMode is undefined.
     */
    it('ArkUI_Tabs_BottomTabBarStyleLayoutMode_0500', 0, async function (done) {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLayoutMode_0500] start");
      let strJson = getInspectorByKey('bottomTabBarStyleLayoutModeTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLayoutMode_0500]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "bottomTabBarStyleLayoutMode": undefined
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLayoutMode_0500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLayoutMode_0500] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('bottomTabBarStyleLayoutModeTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLayoutMode_0500]: " + JSON.stringify(obj.$attrs.tabBar));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLayoutMode_0500]: " + JSON.stringify(obj.$attrs.tabBar.layoutMode));
      expect(obj.$attrs.tabBar.layoutMode).assertEqual("LayoutMode.VERTICAL");
      console.info("[ArkUI_Tabs_BottomTabBarStyleLayoutMode_0500] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleLayoutMode_0600
     * @tc.name      Tests the BottomTabBarStyleLayoutMode property of the Tabs component.
     * @tc.desc      Gets the values of bottomTabBarStyleLayoutMode, when the value of the bottomTabBarStyleLayoutMode is null.
     */
    it('ArkUI_Tabs_BottomTabBarStyleLayoutMode_0600', 0, async function (done) {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLayoutMode_0600] start");
      let strJson = getInspectorByKey('bottomTabBarStyleLayoutModeTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLayoutMode_0600]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "bottomTabBarStyleLayoutMode": null
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLayoutMode_0600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLayoutMode_0600] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('bottomTabBarStyleLayoutModeTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLayoutMode_0600]: " + JSON.stringify(obj.$attrs.tabBar));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLayoutMode_0600]: " + JSON.stringify(obj.$attrs.tabBar.layoutMode));
      expect(obj.$attrs.tabBar.layoutMode).assertEqual("LayoutMode.VERTICAL");
      console.info("[ArkUI_Tabs_BottomTabBarStyleLayoutMode_0600] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_0100
     * @tc.name      Tests the BottomTabBarStyleSymmetricExtensible property of the Tabs component.
     * @tc.desc      Gets the default values of bottomTabBarStyleSymmetricExtensible.
     */
    it('[ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_0100]', 0, async function (done) {
      console.info("[ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_0100] start");
      let strJson = getInspectorByKey('bottomTabBarDefaultTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_0100]: " + JSON.stringify(strJson));

      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_0100]: " + JSON.stringify(obj.$attrs.tabBar));
      console.info("[ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_0100]: " + JSON.stringify(obj.$attrs.tabBar.symmetricExtensible));
      expect(obj.$attrs.tabBar.symmetricExtensible).assertEqual("false");
      console.info("[ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_0100] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_0200
     * @tc.name      Tests the BottomTabBarStyleSymmetricExtensible property of the Tabs component.
     * @tc.desc      Gets the values of bottomTabBarStyleSymmetricExtensible, when the value of the bottomTabBarStyleSymmetricExtensible is true.
     */
    it('ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_0200', 0, async function (done) {
      console.info("[ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_0200] start");
      let strJson = getInspectorByKey('bottomTabBarStyleSymmetricExtensibleTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_0200]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "bottomTabBarStyleSymmetricExtensible": true
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_0200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_0200] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('bottomTabBarStyleSymmetricExtensibleTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_0200]: " + JSON.stringify(obj.$attrs.tabBar));
      console.info("[ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_0200]: " + JSON.stringify(obj.$attrs.tabBar.symmetricExtensible));
      expect(obj.$attrs.tabBar.symmetricExtensible).assertEqual("true");
      console.info("[ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_0200] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_0300
     * @tc.name      Tests the BottomTabBarStyleSymmetricExtensible property of the Tabs component.
     * @tc.desc      Gets the values of bottomTabBarStyleSymmetricExtensible, when the value of the bottomTabBarStyleSymmetricExtensible is false.
     */
    it('ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_0300', 0, async function (done) {
      console.info("[ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_0300] start");
      let strJson = getInspectorByKey('bottomTabBarStyleSymmetricExtensibleTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_0300]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "bottomTabBarStyleSymmetricExtensible": false
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_0300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_0300] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('bottomTabBarStyleSymmetricExtensibleTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_0300]: " + JSON.stringify(obj.$attrs.tabBar));
      console.info("[ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_0300]: " + JSON.stringify(obj.$attrs.tabBar.symmetricExtensible));
      expect(obj.$attrs.tabBar.symmetricExtensible).assertEqual("false");
      console.info("[ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_0300] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_0400
     * @tc.name      Tests the BottomTabBarStyleSymmetricExtensible property of the Tabs component.
     * @tc.desc      Gets the values of bottomTabBarStyleSymmetricExtensible, when the value of the bottomTabBarStyleSymmetricExtensible is undefined.
     */
    it('ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_0400', 0, async function (done) {
      console.info("[ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_0400] start");
      let strJson = getInspectorByKey('bottomTabBarStyleSymmetricExtensibleTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_0400]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "bottomTabBarStyleSymmetricExtensible": undefined
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_0400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_0400] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('bottomTabBarStyleSymmetricExtensibleTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_0400]: " + JSON.stringify(obj.$attrs.tabBar));
      console.info("[ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_0400]: " + JSON.stringify(obj.$attrs.tabBar.symmetricExtensible));
      expect(obj.$attrs.tabBar.symmetricExtensible).assertEqual("false");
      console.info("[ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_0400] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_0500
     * @tc.name      Tests the BottomTabBarStyleSymmetricExtensible property of the Tabs component.
     * @tc.desc      Gets the values of bottomTabBarStyleSymmetricExtensible, when the value of the bottomTabBarStyleSymmetricExtensible is null.
     */
    it('ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_0500', 0, async function (done) {
      console.info("[ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_0500] start");
      let strJson = getInspectorByKey('bottomTabBarStyleSymmetricExtensibleTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_0500]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "bottomTabBarStyleSymmetricExtensible": null
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_0500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_0500] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('bottomTabBarStyleSymmetricExtensibleTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_0500]: " + JSON.stringify(obj.$attrs.tabBar));
      console.info("[ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_0500]: " + JSON.stringify(obj.$attrs.tabBar.symmetricExtensible));
      expect(obj.$attrs.tabBar.symmetricExtensible).assertEqual("false");
      console.info("[ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_0500] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleLabelStyle_0100
     * @tc.name      Tests the BottomTabBarStyleLabelStyle property of the Tabs component.
     * @tc.desc      Gets the default values of bottomTabBarStyleLabelStyle.
     */
    it('[ArkUI_Tabs_BottomTabBarStyleLabelStyle_0100]', 0, async function (done) {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_0100] start");
      let strJson = getInspectorByKey('bottomTabBarDefaultTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_0100]: " + JSON.stringify(strJson));

      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_0100]: " + JSON.stringify(obj.$attrs.tabBar));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_0100]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_0100]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle.overflow));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_0100]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle.maxLines));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_0100]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle.minFontSize));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_0100]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle.maxFontSize));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_0100]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle.heightAdaptivePolicy));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_0100]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle.font));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_0100]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle.font.size));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_0100]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle.font.weight));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_0100]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle.font.family));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_0100]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle.font.style));

      let newJsonJudge = getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      let objJudge = JSON.parse(newJsonJudge);
      expect(obj.$attrs.tabBar.labelStyle.overflow).assertEqual('TextOverflow.Ellipsis');
      expect(obj.$attrs.tabBar.labelStyle.maxLines).assertEqual('1');
      expect(obj.$attrs.tabBar.labelStyle.minFontSize).assertEqual('0.00vp');
      expect(obj.$attrs.tabBar.labelStyle.maxFontSize).assertEqual('0.00vp');
      expect(obj.$attrs.tabBar.labelStyle.heightAdaptivePolicy).assertEqual('TextHeightAdaptivePolicy.MAX_LINES_FIRST');
      expect(obj.$attrs.tabBar.labelStyle.font.size).assertEqual(objJudge.$attrs.tabBar.labelStyle.font.size);
      expect(obj.$attrs.tabBar.labelStyle.font.weight).assertEqual('FontWeight.Medium');
      expect(obj.$attrs.tabBar.labelStyle.font.family).assertEqual('HarmonyOS Sans');
      expect(obj.$attrs.tabBar.labelStyle.font.style).assertEqual('FontStyle.Normal');

      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_0100] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleLabelStyle_0200
     * @tc.name      Tests the BottomTabBarStyleLabelStyle property of the Tabs component.
     * @tc.desc      Gets the values of tabBar.labelStyle.overflow, when the value of the tabBar.labelStyle.overflow is TextOverflow.None.
     */
    it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_0200', 0, async function (done) {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_0200] start");
      let strJson = getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_0200]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "bottomTabBarStyleLabelStyleOverflow": TextOverflow.None
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_0200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_0200] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_0200]: " + JSON.stringify(obj.$attrs.tabBar));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_0200]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_0200]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle.overflow));
      expect(obj.$attrs.tabBar.labelStyle.overflow).assertEqual("TextOverflow.None");
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_0200] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleLabelStyle_0300
     * @tc.name      Tests the BottomTabBarStyleLabelStyle property of the Tabs component.
     * @tc.desc      Gets the values of tabBar.labelStyle.overflow, when the value of the tabBar.labelStyle.overflow is TextOverflow.Clip.
     */
    it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_0300', 0, async function (done) {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_0300] start");
      let strJson = getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_0300]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "bottomTabBarStyleLabelStyleOverflow": TextOverflow.Clip
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_0300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_0300] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_0300]: " + JSON.stringify(obj.$attrs.tabBar));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_0300]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_0300]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle.overflow));
      expect(obj.$attrs.tabBar.labelStyle.overflow).assertEqual("TextOverflow.Clip");
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_0300] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleLabelStyle_0400
     * @tc.name      Tests the BottomTabBarStyleLabelStyle property of the Tabs component.
     * @tc.desc      Gets the values of tabBar.labelStyle.overflow, when the value of the tabBar.labelStyle.overflow is TextOverflow.Ellipsis.
     */
    it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_0400', 0, async function (done) {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_0400] start");
      let strJson = getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_0400]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "bottomTabBarStyleLabelStyleOverflow": TextOverflow.Ellipsis
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_0400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_0400] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_0400]: " + JSON.stringify(obj.$attrs.tabBar));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_0400]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_0400]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle.overflow));
      expect(obj.$attrs.tabBar.labelStyle.overflow).assertEqual("TextOverflow.Ellipsis");
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_0400] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleLabelStyle_0500
     * @tc.name      Tests the BottomTabBarStyleLabelStyle property of the Tabs component.
     * @tc.desc      Gets the values of tabBar.labelStyle.overflow, when the value of the tabBar.labelStyle.overflow is TextOverflow.MARQUEE.
     */
    it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_0500', 0, async function (done) {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_0500] start");
      let strJson = getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_0500]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "bottomTabBarStyleLabelStyleOverflow": TextOverflow.MARQUEE
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_0500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_0500] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_0500]: " + JSON.stringify(obj.$attrs.tabBar));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_0500]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_0500]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle.overflow));
      expect(obj.$attrs.tabBar.labelStyle.overflow).assertEqual("TextOverflow.Marquee");
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_0500] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleLabelStyle_0600
     * @tc.name      Tests the BottomTabBarStyleLabelStyle property of the Tabs component.
     * @tc.desc      Gets the values of tabBar.labelStyle.overflow, when the value of the tabBar.labelStyle.overflow is undefined.
     */
    it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_0600', 0, async function (done) {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_0600] start");
      let strJson = getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_0600]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "bottomTabBarStyleLabelStyleOverflow": undefined
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_0600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_0600] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_0600]: " + JSON.stringify(obj.$attrs.tabBar));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_0600]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_0600]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle.overflow));
      expect(obj.$attrs.tabBar.labelStyle.overflow).assertEqual("TextOverflow.Ellipsis");
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_0600] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleLabelStyle_0700
     * @tc.name      Tests the BottomTabBarStyleLabelStyle property of the Tabs component.
     * @tc.desc      Gets the values of tabBar.labelStyle.overflow, when the value of the tabBar.labelStyle.overflow is null.
     */
    it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_0700', 0, async function (done) {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_0700] start");
      let strJson = getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_0700]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "bottomTabBarStyleLabelStyleOverflow": null
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_0700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_0700] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_0700]: " + JSON.stringify(obj.$attrs.tabBar));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_0700]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_0700]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle.overflow));
      expect(obj.$attrs.tabBar.labelStyle.overflow).assertEqual("TextOverflow.Ellipsis");
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_0700] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleLabelStyle_0800
     * @tc.name      Tests the BottomTabBarStyleLabelStyle property of the Tabs component.
     * @tc.desc      Gets the values of tabBar.labelStyle.maxLines, when the value of the tabBar.labelStyle.maxLines is 2.
     */
    it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_0800', 0, async function (done) {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_0800] start");
      let strJson = getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_0800]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "bottomTabBarStyleLabelStyleMaxLines": 2
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_0800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_0800] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_0800]: " + JSON.stringify(obj.$attrs.tabBar));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_0800]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_0800]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle.maxLines));
      expect(obj.$attrs.tabBar.labelStyle.maxLines).assertEqual("2");
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_0800] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleLabelStyle_0900
     * @tc.name      Tests the BottomTabBarStyleLabelStyle property of the Tabs component.
     * @tc.desc      Gets the values of tabBar.labelStyle.maxLines, when the value of the tabBar.labelStyle.maxLines is -1.
     */
    it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_0900', 0, async function (done) {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_0900] start");
      let strJson = getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_0900]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "bottomTabBarStyleLabelStyleMaxLines": -1
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_0900] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_0900] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_0900]: " + JSON.stringify(obj.$attrs.tabBar));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_0900]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_0900]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle.maxLines));
      expect(obj.$attrs.tabBar.labelStyle.maxLines).assertEqual("1");
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_0900] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleLabelStyle_1000
     * @tc.name      Tests the BottomTabBarStyleLabelStyle property of the Tabs component.
     * @tc.desc      Gets the values of tabBar.labelStyle.maxLines, when the value of the tabBar.labelStyle.maxLines is 100000.
     */
    it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_1000', 0, async function (done) {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_1000] start");
      let strJson = getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_1000]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "bottomTabBarStyleLabelStyleMaxLines": 100000
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_1000] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_1000] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_1000]: " + JSON.stringify(obj.$attrs.tabBar));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_1000]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_1000]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle.maxLines));
      expect(obj.$attrs.tabBar.labelStyle.maxLines).assertEqual("100000");
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_1000] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleLabelStyle_1100
     * @tc.name      Tests the BottomTabBarStyleLabelStyle property of the Tabs component.
     * @tc.desc      Gets the values of tabBar.labelStyle.maxLines, when the value of the tabBar.labelStyle.maxLines is undefined.
     */
    it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_1100', 0, async function (done) {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_1100] start");
      let strJson = getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_1100]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "bottomTabBarStyleLabelStyleMaxLines": undefined
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_1100] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_1100] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_1100]: " + JSON.stringify(obj.$attrs.tabBar));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_1100]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_1100]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle.maxLines));
      expect(obj.$attrs.tabBar.labelStyle.maxLines).assertEqual("1");
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_1100] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleLabelStyle_1200
     * @tc.name      Tests the BottomTabBarStyleLabelStyle property of the Tabs component.
     * @tc.desc      Gets the values of tabBar.labelStyle.maxLines, when the value of the tabBar.labelStyle.maxLines is null.
     */
    it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_1200', 0, async function (done) {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_1200] start");
      let strJson = getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_1200]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "bottomTabBarStyleLabelStyleMaxLines": null
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_1200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_1200] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_1200]: " + JSON.stringify(obj.$attrs.tabBar));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_1200]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_1200]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle.maxLines));
      expect(obj.$attrs.tabBar.labelStyle.maxLines).assertEqual("1");
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_1200] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleLabelStyle_1300
     * @tc.name      Tests the BottomTabBarStyleLabelStyle property of the Tabs component.
     * @tc.desc      Gets the values of tabBar.labelStyle.minFontSize, when the value of the tabBar.labelStyle.minFontSize is 3.
     */
    it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_1300', 0, async function (done) {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_1300] start");
      let strJson = getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_1300]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "bottomTabBarStyleLabelStyleMinFontSizeNumber": 3
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_1300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_1300] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_1300]: " + JSON.stringify(obj.$attrs.tabBar));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_1300]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_1300]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle.minFontSize));
      expect(obj.$attrs.tabBar.labelStyle.minFontSize).assertEqual("3.00fp");
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_1300] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleLabelStyle_1400
     * @tc.name      Tests the BottomTabBarStyleLabelStyle property of the Tabs component.
     * @tc.desc      Gets the values of tabBar.labelStyle.minFontSize, when the value of the tabBar.labelStyle.minFontSize is '3.00fp'.
     */
    it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_1400', 0, async function (done) {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_1400] start");
      let strJson = getInspectorByKey('bottomTabBarStyleLabelStyleStringTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_1400]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "bottomTabBarStyleLabelStyleMinFontSizeString": '3.00fp'
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_1400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_1400] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('bottomTabBarStyleLabelStyleStringTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_1400]: " + JSON.stringify(obj.$attrs.tabBar));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_1400]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_1400]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle.minFontSize));
      expect(obj.$attrs.tabBar.labelStyle.minFontSize).assertEqual("3.00fp");
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_1400] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleLabelStyle_1500
     * @tc.name      Tests the BottomTabBarStyleLabelStyle property of the Tabs component.
     * @tc.desc      Gets the values of tabBar.labelStyle.minFontSize, when the value of the tabBar.labelStyle.minFontSize is ($r('app.float.BottomTabBarStyleLabelStyle_minFontSize_Test')).
     */
    it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_1500', 0, async function (done) {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_1500] start");
      let strJson = getInspectorByKey('bottomTabBarStyleLabelStyleResourceTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_1500]: " + JSON.stringify(strJson));

      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_1500]: " + JSON.stringify(obj.$attrs.tabBar));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_1500]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_1500]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle.minFontSize));
      expect(obj.$attrs.tabBar.labelStyle.minFontSize).assertEqual("4.00fp");
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_1500] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleLabelStyle_1600
     * @tc.name      Tests the BottomTabBarStyleLabelStyle property of the Tabs component.
     * @tc.desc      Gets the values of tabBar.labelStyle.minFontSize, when the value of the tabBar.labelStyle.minFontSize is -1.
     */
    it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_1600', 0, async function (done) {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_1600] start");
      let strJson = getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_1600]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "bottomTabBarStyleLabelStyleMinFontSizeNumber": -1
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_1600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_1600] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_1600]: " + JSON.stringify(obj.$attrs.tabBar));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_1600]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_1600]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle.minFontSize));
      expect(obj.$attrs.tabBar.labelStyle.minFontSize).assertEqual("0.00vp");
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_1600] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleLabelStyle_1700
     * @tc.name      Tests the BottomTabBarStyleLabelStyle property of the Tabs component.
     * @tc.desc      Gets the values of tabBar.labelStyle.minFontSize, when the value of the tabBar.labelStyle.minFontSize is 100000.
     */
    it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_1700', 0, async function (done) {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_1700] start");
      let strJson = getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_1700]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "bottomTabBarStyleLabelStyleMinFontSizeNumber": 100000
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_1700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_1700] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_1700]: " + JSON.stringify(obj.$attrs.tabBar));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_1700]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_1700]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle.minFontSize));
      expect(obj.$attrs.tabBar.labelStyle.minFontSize).assertEqual("100000.00fp");
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_1700] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleLabelStyle_1800
     * @tc.name      Tests the BottomTabBarStyleLabelStyle property of the Tabs component.
     * @tc.desc      Gets the values of tabBar.labelStyle.minFontSize, when the value of the tabBar.labelStyle.minFontSize is undefined.
     */
    it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_1800', 0, async function (done) {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_1800] start");
      let strJson = getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_1800]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "bottomTabBarStyleLabelStyleMinFontSizeNumber": undefined
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_1800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_1800] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_1800]: " + JSON.stringify(obj.$attrs.tabBar));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_1800]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_1800]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle.minFontSize));
      expect(obj.$attrs.tabBar.labelStyle.minFontSize).assertEqual("0.00vp");
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_1800] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleLabelStyle_1900
     * @tc.name      Tests the BottomTabBarStyleLabelStyle property of the Tabs component.
     * @tc.desc      Gets the values of tabBar.labelStyle.minFontSize, when the value of the tabBar.labelStyle.minFontSize is null.
     */
    it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_1900', 0, async function (done) {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_1900] start");
      let strJson = getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_1900]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "bottomTabBarStyleLabelStyleMinFontSizeNumber": null
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_1900] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_1900] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_1900]: " + JSON.stringify(obj.$attrs.tabBar));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_1900]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_1900]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle.minFontSize));
      expect(obj.$attrs.tabBar.labelStyle.minFontSize).assertEqual("0.00vp");
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_1900] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleLabelStyle_2000
     * @tc.name      Tests the BottomTabBarStyleLabelStyle property of the Tabs component.
     * @tc.desc      Gets the values of tabBar.labelStyle.maxFontSize, when the value of the tabBar.labelStyle.maxFontSize is 3.
     */
    it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_2000', 0, async function (done) {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_2000] start");
      let strJson = getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_2000]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "bottomTabBarStyleLabelStyleMaxFontSizeNumber": 3
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_2000] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_2000] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_2000]: " + JSON.stringify(obj.$attrs.tabBar));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_2000]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_2000]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle.maxFontSize));
      expect(obj.$attrs.tabBar.labelStyle.maxFontSize).assertEqual("3.00fp");
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_2000] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleLabelStyle_2100
     * @tc.name      Tests the BottomTabBarStyleLabelStyle property of the Tabs component.
     * @tc.desc      Gets the values of tabBar.labelStyle.maxFontSize, when the value of the tabBar.labelStyle.maxFontSize is '3.00fp'.
     */
    it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_2100', 0, async function (done) {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_2100] start");
      let strJson = getInspectorByKey('bottomTabBarStyleLabelStyleStringTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_2100]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "bottomTabBarStyleLabelStyleMaxFontSizeString": '3.00fp'
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_2100] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_2100] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('bottomTabBarStyleLabelStyleStringTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_2100]: " + JSON.stringify(obj.$attrs.tabBar));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_2100]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_2100]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle.maxFontSize));
      expect(obj.$attrs.tabBar.labelStyle.maxFontSize).assertEqual('3.00fp');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_2100] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleLabelStyle_2200
     * @tc.name      Tests the BottomTabBarStyleLabelStyle property of the Tabs component.
     * @tc.desc      Gets the values of tabBar.labelStyle.maxFontSize, when the value of the tabBar.labelStyle.maxFontSize is ($r('app.float.BottomTabBarStyleLabelStyle_maxFontSize_Test')).
     */
    it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_2200', 0, async function (done) {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_2200] start");
      let strJson = getInspectorByKey('bottomTabBarStyleLabelStyleResourceTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_2200]: " + JSON.stringify(strJson));

      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_2200]: " + JSON.stringify(obj.$attrs.tabBar));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_2200]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_2200]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle.maxFontSize));
      expect(obj.$attrs.tabBar.labelStyle.maxFontSize).assertEqual('5.00fp');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_2200] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleLabelStyle_2300
     * @tc.name      Tests the BottomTabBarStyleLabelStyle property of the Tabs component.
     * @tc.desc      Gets the values of tabBar.labelStyle.maxFontSize, when the value of the tabBar.labelStyle.maxFontSize is -1.
     */
    it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_2300', 0, async function (done) {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_2300] start");
      let strJson = getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_2300]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "bottomTabBarStyleLabelStyleMaxFontSizeNumber": -1
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_2300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_2300] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_2300]: " + JSON.stringify(obj.$attrs.tabBar));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_2300]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_2300]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle.maxFontSize));
      expect(obj.$attrs.tabBar.labelStyle.maxFontSize).assertEqual('0.00vp');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_2300] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleLabelStyle_2400
     * @tc.name      Tests the BottomTabBarStyleLabelStyle property of the Tabs component.
     * @tc.desc      Gets the values of tabBar.labelStyle.maxFontSize, when the value of the tabBar.labelStyle.maxFontSize is 100000.
     */
    it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_2400', 0, async function (done) {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_2400] start");
      let strJson = getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_2400]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "bottomTabBarStyleLabelStyleMaxFontSizeNumber": 100000
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_2400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_2400] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_2400]: " + JSON.stringify(obj.$attrs.tabBar));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_2400]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_2400]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle.maxFontSize));
      expect(obj.$attrs.tabBar.labelStyle.maxFontSize).assertEqual('100000.00fp');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_2400] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleLabelStyle_2500
     * @tc.name      Tests the BottomTabBarStyleLabelStyle property of the Tabs component.
     * @tc.desc      Gets the values of tabBar.labelStyle.maxFontSize, when the value of the tabBar.labelStyle.maxFontSize is undefined.
     */
    it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_2500', 0, async function (done) {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_2500] start");
      let strJson = getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_2500]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "bottomTabBarStyleLabelStyleMaxFontSizeNumber": undefined
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_2500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_2500] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_2500]: " + JSON.stringify(obj.$attrs.tabBar));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_2500]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_2500]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle.maxFontSize));
      expect(obj.$attrs.tabBar.labelStyle.maxFontSize).assertEqual('0.00vp');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_2500] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleLabelStyle_2600
     * @tc.name      Tests the BottomTabBarStyleLabelStyle property of the Tabs component.
     * @tc.desc      Gets the values of tabBar.labelStyle.maxFontSize, when the value of the tabBar.labelStyle.maxFontSize is null.
     */
    it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_2600', 0, async function (done) {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_2600] start");
      let strJson = getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_2600]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "bottomTabBarStyleLabelStyleMaxFontSizeNumber": null
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_2600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_2600] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_2600]: " + JSON.stringify(obj.$attrs.tabBar));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_2600]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_2600]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle.maxFontSize));
      expect(obj.$attrs.tabBar.labelStyle.maxFontSize).assertEqual('0.00vp');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_2600] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleLabelStyle_2700
     * @tc.name      Tests the BottomTabBarStyleLabelStyle property of the Tabs component.
     * @tc.desc      Gets the values of tabBar.labelStyle.heightAdaptivePolicy, when the value of the tabBar.labelStyle.heightAdaptivePolicy is TextHeightAdaptivePolicy.MAX_LINES_FIRST.
     */
    it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_2700', 0, async function (done) {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_2700] start");
      let strJson = getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_2700]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "bottomTabBarStyleLabelStyleHeightAdaptivePolicy": TextHeightAdaptivePolicy.MAX_LINES_FIRST
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_2700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_2700] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_2700]: " + JSON.stringify(obj.$attrs.tabBar));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_2700]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_2700]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle.heightAdaptivePolicy));
      expect(obj.$attrs.tabBar.labelStyle.heightAdaptivePolicy).assertEqual('TextHeightAdaptivePolicy.MAX_LINES_FIRST');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_2700] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleLabelStyle_2800
     * @tc.name      Tests the BottomTabBarStyleLabelStyle property of the Tabs component.
     * @tc.desc      Gets the values of tabBar.labelStyle.heightAdaptivePolicy, when the value of the tabBar.labelStyle.heightAdaptivePolicy is TextHeightAdaptivePolicy.MIN_FONT_SIZE_FIRST.
     */
    it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_2800', 0, async function (done) {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_2800] start");
      let strJson = getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_2800]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "bottomTabBarStyleLabelStyleHeightAdaptivePolicy": TextHeightAdaptivePolicy.MIN_FONT_SIZE_FIRST
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_2700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_2700] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_2800]: " + JSON.stringify(obj.$attrs.tabBar));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_2800]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_2800]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle.heightAdaptivePolicy));
      expect(obj.$attrs.tabBar.labelStyle.heightAdaptivePolicy).assertEqual('TextHeightAdaptivePolicy.MAX_LINES_FIRST');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_2800] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleLabelStyle_2900
     * @tc.name      Tests the BottomTabBarStyleLabelStyle property of the Tabs component.
     * @tc.desc      Gets the values of tabBar.labelStyle.heightAdaptivePolicy, when the value of the tabBar.labelStyle.heightAdaptivePolicy is TextHeightAdaptivePolicy.LAYOUT_CONSTRAINT_FIRST.
     */
    it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_2900', 0, async function (done) {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_2900] start");
      let strJson = getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_2900]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "bottomTabBarStyleLabelStyleHeightAdaptivePolicy": TextHeightAdaptivePolicy.LAYOUT_CONSTRAINT_FIRST
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_2700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_2700] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_2900]: " + JSON.stringify(obj.$attrs.tabBar));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_2900]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_2900]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle.heightAdaptivePolicy));
      expect(obj.$attrs.tabBar.labelStyle.heightAdaptivePolicy).assertEqual('TextHeightAdaptivePolicy.MAX_LINES_FIRST');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_2900] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleLabelStyle_3000
     * @tc.name      Tests the BottomTabBarStyleLabelStyle property of the Tabs component.
     * @tc.desc      Gets the values of tabBar.labelStyle.heightAdaptivePolicy, when the value of the tabBar.labelStyle.heightAdaptivePolicy is undefined.
     */
    it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_3000', 0, async function (done) {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_3000] start");
      let strJson = getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_3000]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "bottomTabBarStyleLabelStyleHeightAdaptivePolicy": undefined
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_2700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_2700] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_3000]: " + JSON.stringify(obj.$attrs.tabBar));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_3000]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_3000]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle.heightAdaptivePolicy));
      expect(obj.$attrs.tabBar.labelStyle.heightAdaptivePolicy).assertEqual('TextHeightAdaptivePolicy.MAX_LINES_FIRST');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_3000] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleLabelStyle_3100
     * @tc.name      Tests the BottomTabBarStyleLabelStyle property of the Tabs component.
     * @tc.desc      Gets the values of tabBar.labelStyle.heightAdaptivePolicy, when the value of the tabBar.labelStyle.heightAdaptivePolicy is null.
     */
    it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_3100', 0, async function (done) {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_3100] start");
      let strJson = getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_3100]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "bottomTabBarStyleLabelStyleHeightAdaptivePolicy": null
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_2700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_2700] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_3100]: " + JSON.stringify(obj.$attrs.tabBar));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_3100]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_3100]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle.heightAdaptivePolicy));
      expect(obj.$attrs.tabBar.labelStyle.heightAdaptivePolicy).assertEqual('TextHeightAdaptivePolicy.MAX_LINES_FIRST');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_3100] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleLabelStyle_3200
     * @tc.name      Tests the BottomTabBarStyleLabelStyle property of the Tabs component.
     * @tc.desc      Gets the values of tabBar.labelStyle.font.size, when the value of the tabBar.labelStyle.font.size is 15.0.
     */
    it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_3200', 0, async function (done) {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_3200] start");
      let strJson = getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_3200]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "bottomTabBarStyleLabelStyleFontSizeNumber": 15.0
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_3200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_3200] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_3200]: " + JSON.stringify(obj.$attrs.tabBar));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_3200]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_3200]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle.font));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_3200]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle.font.size));
      expect(obj.$attrs.tabBar.labelStyle.font.size).assertEqual('15.00fp');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_3200] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleLabelStyle_3300
     * @tc.name      Tests the BottomTabBarStyleLabelStyle property of the Tabs component.
     * @tc.desc      Gets the values of tabBar.labelStyle.font.size, when the value of the tabBar.labelStyle.font.size is '17.0fp'.
     */
    it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_3300', 0, async function (done) {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_3300] start");
      let strJson = getInspectorByKey('bottomTabBarStyleLabelStyleStringTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_3300]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "bottomTabBarStyleLabelStyleFontSizeString": '17.0fp'
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_3300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_3300] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('bottomTabBarStyleLabelStyleStringTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_3300]: " + JSON.stringify(obj.$attrs.tabBar));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_3300]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_3300]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle.font));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_3300]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle.font.size));
      expect(obj.$attrs.tabBar.labelStyle.font.size).assertEqual('17.00fp');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_3300] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleLabelStyle_3400
     * @tc.name      Tests the BottomTabBarStyleLabelStyle property of the Tabs component.
     * @tc.desc      Gets the values of tabBar.labelStyle.font.size, when the value of the tabBar.labelStyle.font.size is 15.0.
     */
    it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_3400', 0, async function (done) {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_3400] start");
      let strJson = getInspectorByKey('bottomTabBarStyleLabelStyleResourceTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_3400]: " + JSON.stringify(strJson));

      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_3400]: " + JSON.stringify(obj.$attrs.tabBar));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_3400]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_3400]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle.font));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_3400]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle.font.size));
      expect(obj.$attrs.tabBar.labelStyle.font.size).assertEqual('18.00fp');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_3400] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleLabelStyle_3500
     * @tc.name      Tests the BottomTabBarStyleLabelStyle property of the Tabs component.
     * @tc.desc      Gets the values of tabBar.labelStyle.font.size, when the value of the tabBar.labelStyle.font.size is -1.
     */
    it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_3500', 0, async function (done) {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_3500] start");
      let strJson = getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_3500]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "bottomTabBarStyleLabelStyleFontSizeNumber": -1
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_3500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_3500] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      let obj = JSON.parse(newJson);
      let newJsonJudge = getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      let objJudge = JSON.parse(newJsonJudge);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_3500]: " + JSON.stringify(obj.$attrs.tabBar));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_3500]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_3500]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle.font));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_3500]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle.font.size));
      expect(obj.$attrs.tabBar.labelStyle.font.size).assertEqual(objJudge.$attrs.tabBar.labelStyle.font.size);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_3500] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleLabelStyle_3600
     * @tc.name      Tests the BottomTabBarStyleLabelStyle property of the Tabs component.
     * @tc.desc      Gets the values of tabBar.labelStyle.font.size, when the value of the tabBar.labelStyle.font.size is 100000.
     */
    it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_3600', 0, async function (done) {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_3600] start");
      let strJson = getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_3600]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "bottomTabBarStyleLabelStyleFontSizeNumber": 100000
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_3600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_3600] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_3600]: " + JSON.stringify(obj.$attrs.tabBar));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_3600]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_3600]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle.font));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_3600]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle.font.size));
      expect(obj.$attrs.tabBar.labelStyle.font.size).assertEqual('100000.00fp');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_3600] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleLabelStyle_3700
     * @tc.name      Tests the BottomTabBarStyleLabelStyle property of the Tabs component.
     * @tc.desc      Gets the values of tabBar.labelStyle.font.size, when the value of the tabBar.labelStyle.font.size is undefined.
     */
    it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_3700', 0, async function (done) {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_3700] start");
      let strJson = getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_3700]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "bottomTabBarStyleLabelStyleFontSizeNumber": undefined
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_3700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_3700] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      let obj = JSON.parse(newJson);
      let newJsonJudge = getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      let objJudge = JSON.parse(newJsonJudge);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_3700]: " + JSON.stringify(obj.$attrs.tabBar));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_3700]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_3700]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle.font));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_3700]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle.font.size));
      expect(obj.$attrs.tabBar.labelStyle.font.size).assertEqual(objJudge.$attrs.tabBar.labelStyle.font.size);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_3700] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleLabelStyle_3800
     * @tc.name      Tests the BottomTabBarStyleLabelStyle property of the Tabs component.
     * @tc.desc      Gets the values of tabBar.labelStyle.font.size, when the value of the tabBar.labelStyle.font.size is null.
     */
    it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_3800', 0, async function (done) {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_3800] start");
      let strJson = getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_3800]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "bottomTabBarStyleLabelStyleFontSizeNumber": null
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_3800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_3800] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      let obj = JSON.parse(newJson);
      let newJsonJudge = getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      let objJudge = JSON.parse(newJsonJudge);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_3800]: " + JSON.stringify(obj.$attrs.tabBar));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_3800]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_3800]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle.font));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_3800]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle.font.size));
      expect(obj.$attrs.tabBar.labelStyle.font.size).assertEqual(objJudge.$attrs.tabBar.labelStyle.font.size);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_3800] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleLabelStyle_3900
     * @tc.name      Tests the BottomTabBarStyleLabelStyle property of the Tabs component.
     * @tc.desc      Gets the values of tabBar.labelStyle.font.weight, when the value of the tabBar.labelStyle.font.weight is FontWeight.Lighter.
     */
    it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_3900', 0, async function (done) {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_3900] start");
      let strJson = getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_3900]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "bottomTabBarStyleLabelStyleFontWeight": FontWeight.Lighter
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_3900] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_3900] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_3900]: " + JSON.stringify(obj.$attrs.tabBar));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_3900]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_3900]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle.font));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_3900]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle.font.weight));
      expect(obj.$attrs.tabBar.labelStyle.font.weight).assertEqual('FontWeight.Lighter');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_3900] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleLabelStyle_4000
     * @tc.name      Tests the BottomTabBarStyleLabelStyle property of the Tabs component.
     * @tc.desc      Gets the values of tabBar.labelStyle.font.weight, when the value of the tabBar.labelStyle.font.weight is FontWeight.Normal.
     */
    it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_4000', 0, async function (done) {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_4000] start");
      let strJson = getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_4000]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "bottomTabBarStyleLabelStyleFontWeight": FontWeight.Normal
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_4000] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_4000] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_4000]: " + JSON.stringify(obj.$attrs.tabBar));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_4000]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_4000]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle.font));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_4000]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle.font.weight));
      expect(obj.$attrs.tabBar.labelStyle.font.weight).assertEqual('FontWeight.Normal');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_4000] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleLabelStyle_4100
     * @tc.name      Tests the BottomTabBarStyleLabelStyle property of the Tabs component.
     * @tc.desc      Gets the values of tabBar.labelStyle.font.weight, when the value of the tabBar.labelStyle.font.weight is FontWeight.Regular.
     */
    it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_4100', 0, async function (done) {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_4100] start");
      let strJson = getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_4100]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "bottomTabBarStyleLabelStyleFontWeight": FontWeight.Regular
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_4100] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_4100] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_4100]: " + JSON.stringify(obj.$attrs.tabBar));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_4100]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_4100]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle.font));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_4100]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle.font.weight));
      expect(obj.$attrs.tabBar.labelStyle.font.weight).assertEqual('FontWeight.Regular');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_4100] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleLabelStyle_4200
     * @tc.name      Tests the BottomTabBarStyleLabelStyle property of the Tabs component.
     * @tc.desc      Gets the values of tabBar.labelStyle.font.weight, when the value of the tabBar.labelStyle.font.weight is FontWeight.Medium.
     */
    it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_4200', 0, async function (done) {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_4200] start");
      let strJson = getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_4200]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "bottomTabBarStyleLabelStyleFontWeight": FontWeight.Medium
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_4200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_4200] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_4200]: " + JSON.stringify(obj.$attrs.tabBar));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_4200]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_4200]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle.font));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_4200]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle.font.weight));
      expect(obj.$attrs.tabBar.labelStyle.font.weight).assertEqual('FontWeight.Medium');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_4200] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleLabelStyle_4300
     * @tc.name      Tests the BottomTabBarStyleLabelStyle property of the Tabs component.
     * @tc.desc      Gets the values of tabBar.labelStyle.font.weight, when the value of the tabBar.labelStyle.font.weight is FontWeight.Bold.
     */
    it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_4300', 0, async function (done) {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_4300] start");
      let strJson = getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_4300]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "bottomTabBarStyleLabelStyleFontWeight": FontWeight.Bold
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_4300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_4300] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_4300]: " + JSON.stringify(obj.$attrs.tabBar));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_4300]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_4300]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle.font));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_4300]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle.font.weight));
      expect(obj.$attrs.tabBar.labelStyle.font.weight).assertEqual('FontWeight.Bold');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_4300] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleLabelStyle_4400
     * @tc.name      Tests the BottomTabBarStyleLabelStyle property of the Tabs component.
     * @tc.desc      Gets the values of tabBar.labelStyle.font.weight, when the value of the tabBar.labelStyle.font.weight is FontWeight.Bolder.
     */
    it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_4400', 0, async function (done) {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_4400] start");
      let strJson = getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_4400]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "bottomTabBarStyleLabelStyleFontWeight": FontWeight.Bolder
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_4400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_4400] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_4400]: " + JSON.stringify(obj.$attrs.tabBar));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_4400]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_4400]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle.font));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_4400]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle.font.weight));
      expect(obj.$attrs.tabBar.labelStyle.font.weight).assertEqual('FontWeight.Bolder');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_4400] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleLabelStyle_4500
     * @tc.name      Tests the BottomTabBarStyleLabelStyle property of the Tabs component.
     * @tc.desc      Gets the values of tabBar.labelStyle.font.weight, when the value of the tabBar.labelStyle.font.weight is 500.
     */
    it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_4500', 0, async function (done) {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_4500] start");
      let strJson = getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_4500]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "bottomTabBarStyleLabelStyleFontWeightNumber": 500
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_4500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_4500] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_4500]: " + JSON.stringify(obj.$attrs.tabBar));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_4500]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_4500]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle.font));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_4500]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle.font.weight));
      expect(obj.$attrs.tabBar.labelStyle.font.weight).assertEqual('500');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_4500] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleLabelStyle_4600
     * @tc.name      Tests the BottomTabBarStyleLabelStyle property of the Tabs component.
     * @tc.desc      Gets the values of tabBar.labelStyle.font.weight, when the value of the tabBar.labelStyle.font.weight is '2.0fp'.
     */
    it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_4600', 0, async function (done) {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_4600] start");
      let strJson = getInspectorByKey('bottomTabBarStyleLabelStyleStringTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_4600]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "bottomTabBarStyleLabelStyleFontWeightString": '200'
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_4600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_4600] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('bottomTabBarStyleLabelStyleStringTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_4600]: " + JSON.stringify(obj.$attrs.tabBar));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_4600]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_4600]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle.font));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_4600]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle.font.weight));
      expect(obj.$attrs.tabBar.labelStyle.font.weight).assertEqual('200');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_4600] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleLabelStyle_4700
     * @tc.name      Tests the BottomTabBarStyleLabelStyle property of the Tabs component.
     * @tc.desc      Gets the values of tabBar.labelStyle.font.weight, when the value of the tabBar.labelStyle.font.weight is 150.
     */
    it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_4700', 0, async function (done) {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_4700] start");
      let strJson = getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_4700]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "bottomTabBarStyleLabelStyleFontWeightNumber": 150
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_4700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_4700] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_4700]: " + JSON.stringify(obj.$attrs.tabBar));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_4700]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_4700]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle.font));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_4700]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle.font.weight));
      expect(obj.$attrs.tabBar.labelStyle.font.weight).assertEqual('FontWeight.Normal');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_4700] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleLabelStyle_4800
     * @tc.name      Tests the BottomTabBarStyleLabelStyle property of the Tabs component.
     * @tc.desc      Gets the values of tabBar.labelStyle.font.weight, when the value of the tabBar.labelStyle.font.weight is -1.
     */
    it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_4800', 0, async function (done) {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_4800] start");
      let strJson = getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_4800]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "bottomTabBarStyleLabelStyleFontWeightNumber": -1
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_4800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_4800] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_4800]: " + JSON.stringify(obj.$attrs.tabBar));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_4800]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_4800]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle.font));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_4800]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle.font.weight));
      expect(obj.$attrs.tabBar.labelStyle.font.weight).assertEqual('FontWeight.Normal');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_4800] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleLabelStyle_4900
     * @tc.name      Tests the BottomTabBarStyleLabelStyle property of the Tabs component.
     * @tc.desc      Gets the values of tabBar.labelStyle.font.weight, when the value of the tabBar.labelStyle.font.weight is 100000.
     */
    it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_4900', 0, async function (done) {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_4900] start");
      let strJson = getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_4900]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "bottomTabBarStyleLabelStyleFontWeightNumber": 100000
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_4900] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_4900] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_4900]: " + JSON.stringify(obj.$attrs.tabBar));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_4900]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_4900]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle.font));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_4900]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle.font.weight));
      expect(obj.$attrs.tabBar.labelStyle.font.weight).assertEqual('FontWeight.Normal');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_4900] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleLabelStyle_5000
     * @tc.name      Tests the BottomTabBarStyleLabelStyle property of the Tabs component.
     * @tc.desc      Gets the values of tabBar.labelStyle.font.weight, when the value of the tabBar.labelStyle.font.weight is undefined.
     */
    it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_5000', 0, async function (done) {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_5000] start");
      let strJson = getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_5000]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "bottomTabBarStyleLabelStyleFontWeightNumber": undefined
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_5000] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_5000] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_5000]: " + JSON.stringify(obj.$attrs.tabBar));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_5000]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_5000]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle.font));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_5000]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle.font.weight));
      expect(obj.$attrs.tabBar.labelStyle.font.weight).assertEqual('FontWeight.Medium');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_5000] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleLabelStyle_5100
     * @tc.name      Tests the BottomTabBarStyleLabelStyle property of the Tabs component.
     * @tc.desc      Gets the values of tabBar.labelStyle.font.weight, when the value of the tabBar.labelStyle.font.weight is null.
     */
    it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_5100', 0, async function (done) {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_5100] start");
      let strJson = getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_5100]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "bottomTabBarStyleLabelStyleFontWeightNumber": null
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_5100] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_5100] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_5100]: " + JSON.stringify(obj.$attrs.tabBar));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_5100]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_5100]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle.font));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_5100]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle.font.weight));
      expect(obj.$attrs.tabBar.labelStyle.font.weight).assertEqual('FontWeight.Medium');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_5100] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleLabelStyle_5200
     * @tc.name      Tests the BottomTabBarStyleLabelStyle property of the Tabs component.
     * @tc.desc      Gets the values of tabBar.labelStyle.font.family, when the value of the tabBar.labelStyle.font.family is 'HarmonyOS Sans'.
     */
    it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_5200', 0, async function (done) {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_5200] start");
      let strJson = getInspectorByKey('bottomTabBarStyleLabelStyleStringTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_5200]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "bottomTabBarStyleLabelStyleFontFamilyString": 'HarmonyOS Sans'
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_5200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_5200] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('bottomTabBarStyleLabelStyleStringTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_5200]: " + JSON.stringify(obj.$attrs.tabBar));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_5200]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_5200]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle.font));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_5200]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle.font.family));
      expect(obj.$attrs.tabBar.labelStyle.font.family).assertEqual('HarmonyOS Sans');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_5200] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleLabelStyle_5300
     * @tc.name      Tests the BottomTabBarStyleLabelStyle property of the Tabs component.
     * @tc.desc      Gets the values of tabBar.labelStyle.font.family, when the value of the tabBar.labelStyle.font.family is ($r('app.string.BottomTabBarStyleLabelStyle_family_Test')).
     */
    it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_5300', 0, async function (done) {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_5300] start");
      let strJson = getInspectorByKey('bottomTabBarStyleLabelStyleResourceTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_5300]: " + JSON.stringify(strJson));

      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_5300]: " + JSON.stringify(obj.$attrs.tabBar));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_5300]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_5300]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle.font));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_5300]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle.font.family));
      expect(obj.$attrs.tabBar.labelStyle.font.family).assertEqual('HarmonyOS Sans');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_5300] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleLabelStyle_5400
     * @tc.name      Tests the BottomTabBarStyleLabelStyle property of the Tabs component.
     * @tc.desc      Gets the values of tabBar.labelStyle.font.family, when the value of the tabBar.labelStyle.font.family is undefined.
     */
    it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_5400', 0, async function (done) {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_5400] start");
      let strJson = getInspectorByKey('bottomTabBarStyleLabelStyleStringTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_5400]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "bottomTabBarStyleLabelStyleFontFamilyString": undefined
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_5400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_5400] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('bottomTabBarStyleLabelStyleStringTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_5400]: " + JSON.stringify(obj.$attrs.tabBar));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_5400]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_5400]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle.font));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_5400]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle.font.family));
      expect(obj.$attrs.tabBar.labelStyle.font.family).assertEqual('HarmonyOS Sans');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_5400] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleLabelStyle_5500
     * @tc.name      Tests the BottomTabBarStyleLabelStyle property of the Tabs component.
     * @tc.desc      Gets the values of tabBar.labelStyle.font.family, when the value of the tabBar.labelStyle.font.family is null.
     */
    it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_5500', 0, async function (done) {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_5500] start");
      let strJson = getInspectorByKey('bottomTabBarStyleLabelStyleStringTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_5500]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "bottomTabBarStyleLabelStyleFontFamilyString": null
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_5500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_5500] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('bottomTabBarStyleLabelStyleStringTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_5500]: " + JSON.stringify(obj.$attrs.tabBar));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_5500]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_5500]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle.font));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_5500]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle.font.family));
      expect(obj.$attrs.tabBar.labelStyle.font.family).assertEqual('HarmonyOS Sans');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_5500] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleLabelStyle_5600
     * @tc.name      Tests the BottomTabBarStyleLabelStyle property of the Tabs component.
     * @tc.desc      Gets the values of tabBar.labelStyle.font.style, when the value of the tabBar.labelStyle.font.style is FontStyle.Normal.
     */
    it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_5600', 0, async function (done) {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_5600] start");
      let strJson = getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_5600]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "bottomTabBarStyleLabelStyleFontStyle": FontStyle.Normal
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_5600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_5600] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_5600]: " + JSON.stringify(obj.$attrs.tabBar));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_5600]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_5600]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle.font));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_5600]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle.font.style));
      expect(obj.$attrs.tabBar.labelStyle.font.style).assertEqual('FontStyle.Normal');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_5600] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleLabelStyle_5700
     * @tc.name      Tests the BottomTabBarStyleLabelStyle property of the Tabs component.
     * @tc.desc      Gets the values of tabBar.labelStyle.font.style, when the value of the tabBar.labelStyle.font.style is FontStyle.Italic.
     */
    it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_5700', 0, async function (done) {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_5700] start");
      let strJson = getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_5700]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "bottomTabBarStyleLabelStyleFontStyle": FontStyle.Italic
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_5700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_5700] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_5700]: " + JSON.stringify(obj.$attrs.tabBar));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_5700]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_5700]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle.font));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_5700]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle.font.style));
      expect(obj.$attrs.tabBar.labelStyle.font.style).assertEqual('FontStyle.Italic');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_5700] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleLabelStyle_5800
     * @tc.name      Tests the BottomTabBarStyleLabelStyle property of the Tabs component.
     * @tc.desc      Gets the values of tabBar.labelStyle.font.style, when the value of the tabBar.labelStyle.font.style is undefined.
     */
    it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_5800', 0, async function (done) {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_5800] start");
      let strJson = getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_5800]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "bottomTabBarStyleLabelStyleFontStyle": undefined
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_5800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_5800] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_5800]: " + JSON.stringify(obj.$attrs.tabBar));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_5800]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_5800]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle.font));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_5800]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle.font.style));
      expect(obj.$attrs.tabBar.labelStyle.font.style).assertEqual('FontStyle.Normal');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_5800] end");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BottomTabBarStyleLabelStyle_5900
     * @tc.name      Tests the BottomTabBarStyleLabelStyle property of the Tabs component.
     * @tc.desc      Gets the values of tabBar.labelStyle.font.style, when the value of the tabBar.labelStyle.font.style is null.
     */
    it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_5900', 0, async function (done) {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_5900] start");
      let strJson = getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_5900]: " + JSON.stringify(strJson));
      try {
        var eventData = {
          data: {
            "bottomTabBarStyleLabelStyleFontStyle": null
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_5900] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_5900] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      let obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_5900]: " + JSON.stringify(obj.$attrs.tabBar));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_5900]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_5900]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle.font));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_5900]: " + JSON.stringify(obj.$attrs.tabBar.labelStyle.font.style));
      expect(obj.$attrs.tabBar.labelStyle.font.style).assertEqual('FontStyle.Normal');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_5900] end");
      done();
    });

  })
}