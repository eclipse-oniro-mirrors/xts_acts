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
import Utils from '../../MainAbility/common/Utils'
import router from '@ohos.router';

export default function tabsSec() {
  describe('ActsAceTabsTestSec', () => {
      beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Tabs/IndexSec",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get IndexSec state success " + JSON.stringify(pages));
        if (!("IndexSec" == pages.name)) {
          console.info("get IndexSec state success " + JSON.stringify(pages.name));
          let result = await router.push(options)
          console.info("push IndexSec page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push IndexSec page error " + JSON.stringify(err));
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
            "barOverlap": false,
            "barBackgroundColorColor": Color.Red,
            "barBackgroundColorNumber": 0,
            "barBackgroundColorString": "#00000000",
            "barBackgroundColorResource": $r("sys.color.ohos_toggle_bg"),
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
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
     * @tc.number    ArkUI_Tabs_BarOverlap_0100
     * @tc.name      Tests the barOverlap property of the tabs component.
     * @tc.desc      Gets the default values of barOverlap.
     */
    it('ArkUI_Tabs_BarOverlap_0100', Level.LEVEL1, async (done: Function) => {
      console.info("ArkUI_Tabs_BarOverlap_0100 start");
      let strJson = getInspectorByKey('TabsOverlapTest1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Tabs_BarOverlap_0100] barOverlap:" + obj.$attrs.barOverlap);
      let barOverlapObject: ESObject = JSON.parse(obj.$attrs.barOverlap);
      expect(barOverlapObject).assertEqual(false);
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BarOverlap_0200
     * @tc.name      Tests the barOverlap property of the tabs component.
     * @tc.desc      Gets the values of barOverlap, when the value of the barOverlap is true.
     */
    it('ArkUI_Tabs_BarOverlap_0200', Level.LEVEL1, async (done: Function) => {
      console.info("ArkUI_Tabs_BarOverlap_0200 start");
      let strJson = getInspectorByKey('TabsOverlapTest2');
      console.info("ArkUI_Tabs_BarOverlap_0200: " + JSON.stringify(strJson))
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barOverlap": true,
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarOverlap_0200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BarOverlap_0200] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let newJson = getInspectorByKey('TabsOverlapTest2');
      let obj: ESObject = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BarOverlap_0200] barOverlap:" + JSON.stringify(obj.$attrs.barOverlap));
      let barOverlapObject: ESObject = JSON.parse(obj.$attrs.barOverlap);
      expect(barOverlapObject).assertEqual(true);
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BarOverlap_0300
     * @tc.name      Tests the barOverlap property of the tabs component.
     * @tc.desc      Gets the values of barOverlap, when the value of the barOverlap is false.
     */
    it('ArkUI_Tabs_BarOverlap_0300', Level.LEVEL1, async (done: Function) => {
      console.info("ArkUI_Tabs_BarOverlap_0300 start");
      let strJson = getInspectorByKey('TabsOverlapTest2');
      console.info("ArkUI_Tabs_BarOverlap_0300: " + JSON.stringify(strJson))
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barOverlap": false,
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarOverlap_0300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BarOverlap_0300] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let newJson = getInspectorByKey('TabsOverlapTest2');
      let obj: ESObject = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BarOverlap_0300] barOverlap:" + JSON.stringify(obj.$attrs.barOverlap));
      let barOverlapObject: ESObject = JSON.parse(obj.$attrs.barOverlap);
      expect(barOverlapObject).assertEqual(false);
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BarOverlap_0400
     * @tc.name      Tests the barOverlap property of the tabs component.
     * @tc.desc      Gets the values of barOverlap, when the value of the barOverlap is null.
     */
    it('ArkUI_Tabs_BarOverlap_0400', Level.LEVEL1, async (done: Function) => {
      console.info("ArkUI_Tabs_BarOverlap_0400 start");
      let strJson = getInspectorByKey('TabsOverlapTest2');
      console.info("ArkUI_Tabs_BarOverlap_0400: " + JSON.stringify(strJson))
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barOverlap": null,
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarOverlap_0400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BarOverlap_0400] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let newJson = getInspectorByKey('TabsOverlapTest2');
      let obj: ESObject = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BarOverlap_0400] barOverlap:" + JSON.stringify(obj.$attrs.barOverlap));
      let barOverlapObject: ESObject = JSON.parse(obj.$attrs.barOverlap);
      expect(barOverlapObject).assertEqual(false);
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BarOverlap_0500
     * @tc.name      Tests the barOverlap property of the tabs component.
     * @tc.desc      Gets the values of barOverlap, when the value of the barOverlap is undefined.
     */
    it('ArkUI_Tabs_BarOverlap_0500', Level.LEVEL1, async (done: Function) => {
      console.info("ArkUI_Tabs_BarOverlap_0500 start");
      let strJson = getInspectorByKey('TabsOverlapTest2');
      console.info("ArkUI_Tabs_BarOverlap_0500: " + JSON.stringify(strJson))
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barOverlap": undefined,
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarOverlap_0500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BarOverlap_0500] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let newJson = getInspectorByKey('TabsOverlapTest2');
      let obj: ESObject = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BarOverlap_0500] barOverlap:" + JSON.stringify(obj.$attrs.barOverlap));
      let barOverlapObject: ESObject = JSON.parse(obj.$attrs.barOverlap);
      expect(barOverlapObject).assertEqual(false);
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BarOverlap_0600
     * @tc.name      Tests the barOverlap property of the tabs component.
     * @tc.desc      Step1: Gets the values of barOverlap, when the value of the barOverlap is true.
     *               Step2: Gets the values of barOverlap, when the value of the barOverlap is false.
     */
    it('ArkUI_Tabs_BarOverlap_0600', Level.LEVEL1, async (done: Function) => {
      console.info("ArkUI_Tabs_BarOverlap_0600 start");
      let strJson = getInspectorByKey('TabsOverlapTest2');
      console.info("ArkUI_Tabs_BarOverlap_0600: " + JSON.stringify(strJson))
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barOverlap": true,
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarOverlap_0600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BarOverlap_0600] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let newJson = getInspectorByKey('TabsOverlapTest2');
      let obj: ESObject = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BarOverlap_0600] barOverlap:" + JSON.stringify(obj.$attrs.barOverlap));
      let barOverlapObject: ESObject = JSON.parse(obj.$attrs.barOverlap);
      expect(barOverlapObject).assertEqual(true);

      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barOverlap": false,
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarOverlap_0600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BarOverlap_0600] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      newJson = getInspectorByKey('TabsOverlapTest2');
      obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BarOverlap_0600] barOverlap:" + JSON.stringify(obj.$attrs.barOverlap));
      barOverlapObject = JSON.parse(obj.$attrs.barOverlap);
      expect(barOverlapObject).assertEqual(false);
      done();
    });
    
     /**
     * @tc.number    ArkUI_Tabs_BarOverlap_0700
     * @tc.name      Tests the barOverlap property of the tabs component.
     * @tc.desc      Step1: Gets the values of barOverlap, when the value of the barOverlap is true.
     *               Step2: Gets the values of barOverlap, when the value of the barOverlap is null.
     */
    it('ArkUI_Tabs_BarOverlap_0700', Level.LEVEL1, async (done: Function) => {
      console.info("ArkUI_Tabs_BarOverlap_0700 start");
      let strJson = getInspectorByKey('TabsOverlapTest2');
      console.info("ArkUI_Tabs_BarOverlap_0700: " + JSON.stringify(strJson))
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barOverlap": true,
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarOverlap_0700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BarOverlap_0700] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let newJson = getInspectorByKey('TabsOverlapTest2');
      let obj: ESObject = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BarOverlap_0700] barOverlap:" + JSON.stringify(obj.$attrs.barOverlap));
      let barOverlapObject: ESObject = JSON.parse(obj.$attrs.barOverlap);
      expect(barOverlapObject).assertEqual(true);

      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barOverlap": null,
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarOverlap_0700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BarOverlap_0700] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      newJson = getInspectorByKey('TabsOverlapTest2');
      obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BarOverlap_0700] barOverlap:" + JSON.stringify(obj.$attrs.barOverlap));
      barOverlapObject = JSON.parse(obj.$attrs.barOverlap);
      expect(barOverlapObject).assertEqual(false);
      done();
    });
    
    /**
     * @tc.number    ArkUI_Tabs_BarOverlap_0800
     * @tc.name      Tests the barOverlap property of the tabs component.
     * @tc.desc      Step1: Gets the values of barOverlap, when the value of the barOverlap is true.
     *               Step2: Gets the values of barOverlap, when the value of the barOverlap is undefined.
     */
    it('ArkUI_Tabs_BarOverlap_0800', Level.LEVEL1, async (done: Function) => {
      console.info("ArkUI_Tabs_BarOverlap_0800 start");
      let strJson = getInspectorByKey('TabsOverlapTest2');
      console.info("ArkUI_Tabs_BarOverlap_0800: " + JSON.stringify(strJson))
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barOverlap": true,
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarOverlap_0800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BarOverlap_0800] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let newJson = getInspectorByKey('TabsOverlapTest2');
      let obj: ESObject = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BarOverlap_0800] barOverlap:" + JSON.stringify(obj.$attrs.barOverlap));
      let barOverlapObject: ESObject = JSON.parse(obj.$attrs.barOverlap);
      expect(barOverlapObject).assertEqual(true);

      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barOverlap": undefined,
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarOverlap_0800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BarOverlap_0800] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      newJson = getInspectorByKey('TabsOverlapTest2');
      obj = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BarOverlap_0800] barOverlap:" + JSON.stringify(obj.$attrs.barOverlap));
      barOverlapObject = JSON.parse(obj.$attrs.barOverlap);
      expect(barOverlapObject).assertEqual(false);
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BarBackgroundColor_0100
     * @tc.name      Tests the BarBackgroundColor property of the tabs component.
     * @tc.desc      Gets the default values of barBackgroundColor.
     */
    it('ArkUI_Tabs_BarBackgroundColor_0100', Level.LEVEL1, async (done: Function) => {
      console.info("ArkUI_Tabs_BarBackgroundColor start");
      let strJson = getInspectorByKey('TabsOverlapTest1');
      
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Tabs_BarBackgroundColor_0100] barBackgroundColor:" + JSON.stringify(obj.$attrs.barBackgroundColor));
      let barBackgroundColorObject: string = obj.$attrs.barBackgroundColor;
      expect(barBackgroundColorObject).assertEqual("#00000000");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BarBackgroundColor_0200
     * @tc.name      Tests the BarBackgroundColor property of the tabs component.
     * @tc.desc      Gets the values of BarBackgroundColor, when the value of the barBackgroundColor is Color.Blue.
     */
    it('ArkUI_Tabs_BarBackgroundColor_0200', Level.LEVEL1, async (done: Function) => {
      console.info("ArkUI_Tabs_BarBackgroundColor start");
      let strJson = getInspectorByKey('BarBackgroundColorColor');
      console.info("ArkUI_Tabs_BarBackgroundColor: " + JSON.stringify(strJson))
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barBackgroundColorColor": Color.Blue,
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarBackgroundColor_0200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BarBackgroundColor_0200] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let newJson = getInspectorByKey('BarBackgroundColorColor');
      let obj: ESObject = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BarBackgroundColor_0200] barBackgroundColor:" + JSON.stringify(obj.$attrs.barBackgroundColor));
      let barBackgroundColorObject: string = obj.$attrs.barBackgroundColor;
      expect(barBackgroundColorObject).assertEqual("#FF0000FF");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BarBackgroundColor_0300
     * @tc.name      Tests the BarBackgroundColor property of the tabs component.
     * @tc.desc      Gets the values of BarBackgroundColor, when the value of the barBackgroundColor is 123.
     */
    it('ArkUI_Tabs_BarBackgroundColor_0300', Level.LEVEL1, async (done: Function) => {
      console.info("ArkUI_Tabs_BarBackgroundColor start");
      let strJson = getInspectorByKey('BarBackgroundColorNumber');
      console.info("ArkUI_Tabs_BarBackgroundColor: " + JSON.stringify(strJson))
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barBackgroundColorNumber": 123,
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarBackgroundColor_0300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BarBackgroundColor_0300] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let newJson = getInspectorByKey('BarBackgroundColorNumber');
      let obj: ESObject = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BarBackgroundColor_0300] barBackgroundColor:" + JSON.stringify(obj.$attrs.barBackgroundColor));
      let barBackgroundColorObject: string = obj.$attrs.barBackgroundColor;
      expect(barBackgroundColorObject).assertEqual("#FF00007B");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BarBackgroundColor_0400
     * @tc.name      Tests the BarBackgroundColor property of the tabs component.
     * @tc.desc      Gets the values of BarBackgroundColor, when the value of the barBackgroundColor is #0000FF.
     */
    it('ArkUI_Tabs_BarBackgroundColor_0400', Level.LEVEL1, async (done: Function) => {
      console.info("ArkUI_Tabs_BarBackgroundColor start");
      let strJson = getInspectorByKey('BarBackgroundColorString');
      console.info("ArkUI_Tabs_BarBackgroundColor: " + JSON.stringify(strJson))
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barBackgroundColorString": "#0000FF",
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarBackgroundColor_0400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BarBackgroundColor_0400] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let newJson = getInspectorByKey('BarBackgroundColorString');
      let obj: ESObject = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BarBackgroundColor_0400] barBackgroundColor:" + JSON.stringify(obj.$attrs.barBackgroundColor));
      let barBackgroundColorObject: string = obj.$attrs.barBackgroundColor;
      expect(barBackgroundColorObject).assertEqual("#FF0000FF");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BarBackgroundColor_0500
     * @tc.name      Tests the BarBackgroundColor property of the tabs component.
     * @tc.desc      Gets the values of BarBackgroundColor, when the value of the barBackgroundColor is sys.color.ohos_toggle_bg.
     */
    it('ArkUI_Tabs_BarBackgroundColor_0500', Level.LEVEL1, async (done: Function) => {
      console.info("ArkUI_Tabs_BarBackgroundColor start");
      let strJson = getInspectorByKey('BarBackgroundColorResource');
      console.info("ArkUI_Tabs_BarBackgroundColor: " + JSON.stringify(strJson))
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barBackgroundColorResource": $r("sys.color.ohos_toggle_bg"),
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarBackgroundColor_0500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BarBackgroundColor_0500] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let newJson = getInspectorByKey('BarBackgroundColorResource');
      let obj: ESObject = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BarBackgroundColor_0500] barBackgroundColor:" + JSON.stringify(obj.$attrs.barBackgroundColor));
      let barBackgroundColorObject: string = obj.$attrs.barBackgroundColor;
      let newColor = getInspectorByKey('ResourceColor');
      let objColor: ESObject = JSON.parse(newColor);
      console.info("[ArkUI_Tabs_BarBackgroundColor_0500] objColor:" + JSON.stringify(objColor.$attrs.backgroundColor));
      expect(barBackgroundColorObject).assertEqual(objColor.$attrs.backgroundColor);
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BarBackgroundColor_0600
     * @tc.name      Tests the BarBackgroundColor property of the tabs component.
     * @tc.desc      Gets the values of BarBackgroundColor, when the value of the barBackgroundColor is null.
     */
    it('ArkUI_Tabs_BarBackgroundColor_0600', Level.LEVEL1, async (done: Function) => {
      console.info("ArkUI_Tabs_BarBackgroundColor start");
      let strJson = getInspectorByKey('BarBackgroundColorColor');
      console.info("ArkUI_Tabs_BarBackgroundColor: " + JSON.stringify(strJson))
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barBackgroundColorColor": null,
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarBackgroundColor_0600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BarBackgroundColor_0600] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let newJson = getInspectorByKey('BarBackgroundColorColor');
      let obj: ESObject = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BarBackgroundColor_0600] barBackgroundColor:" + JSON.stringify(obj.$attrs.barBackgroundColor));
      let barBackgroundColorObject: string = obj.$attrs.barBackgroundColor;
      expect(barBackgroundColorObject).assertEqual("#00000000");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_BarBackgroundColor_0700
     * @tc.name      Tests the BarBackgroundColor property of the tabs component.
     * @tc.desc      Gets the values of BarBackgroundColor, when the value of the barBackgroundColor is undefined.
     */
    it('ArkUI_Tabs_BarBackgroundColor_0700', Level.LEVEL1, async (done: Function) => {
      console.info("ArkUI_Tabs_BarBackgroundColor start");
      let strJson = getInspectorByKey('BarBackgroundColorColor');
      console.info("ArkUI_Tabs_BarBackgroundColor: " + JSON.stringify(strJson))
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barBackgroundColorColor": undefined,
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarBackgroundColor_0700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BarBackgroundColor_0700] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let newJson = getInspectorByKey('BarBackgroundColorColor');
      let obj: ESObject = JSON.parse(newJson);
      console.info("[ArkUI_Tabs_BarBackgroundColor_0700] barBackgroundColor:" + JSON.stringify(obj.$attrs.barBackgroundColor));
      let barBackgroundColorObject: string = obj.$attrs.barBackgroundColor;
      expect(barBackgroundColorObject).assertEqual("#00000000");
      done();
    });  

  })
}
