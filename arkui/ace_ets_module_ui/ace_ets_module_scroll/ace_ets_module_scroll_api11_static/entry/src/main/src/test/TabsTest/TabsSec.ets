'use static';
/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import { Color, $r } from '@ohos.arkui.component'
import { describe, beforeEach, afterEach, it, expect, beforeAll, Level } from '../../../../hypium/index'
import events_emitter from '@ohos.events.emitter';
import Utils from '../../../ets/MainAbility/common/Utils'
import router from '@ohos.router';
import inspector from '@ohos.arkui.inspector'
import CommonFunc from '../../../ets/MainAbility/common/Common';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest, startAbility, stopApplication } from '../Util.test';
import { RecordData } from '@ohos.base';

let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function tabsSec() {
  describe('ActsAceTabsTestSec', () => {
    beforeAll(() => {
      await UtilsTest.startAbility("com.arkui.ace.scroll.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Tabs/IndexSec",
      }
      try {
        const routerAlp = AppStorage.get<Router>("router") as Router
        routerAlp.clear();
        let pages = routerAlp.getState();
        console.info("get IndexSec state success " + JSON.stringify(pages));
        if (!("IndexSec" == pages.name)) {
          console.info("get IndexSec state success " + JSON.stringify(pages.name));
          // let result = await routerAlp.pushUrl(options)
          routerAlp.pushUrl(options)
          // console.info("push IndexSec page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push IndexSec page error " + JSON.stringify(err));
      }

      await Utils.sleep(2000);
      console.info("tabs beforeEach start");
    })

    afterEach(async (): Promise<void> => {
      console.info("tabs afterEach start");
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barOverlap": false,
            "barBackgroundColorColor": Color.Red,
            "barBackgroundColorNumber": 0 as number,
            "barBackgroundColorString": "#00000000",
            "barBackgroundColorResource": $r("sys.color.ohos_toggle_bg"),
          } as Record<String,RecordData>
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
    })


    
    /**
     * @tc.number   ArkUI_Tabs_BarOverlap_static_0100
     * @tc.name     ArkUI_Tabs_BarOverlap_static_0100
     * @tc.desc     ArkUI_Tabs_BarOverlap_static_0100
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_Tabs_BarOverlap_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Tabs_BarOverlap_static_0100 start");
      let strJson = inspector.getInspectorByKey('TabsOverlapTest1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Tabs_BarOverlap_static_0100] barOverlap:" + strJson);
      let barOverlapObject = obj.getElement('$attrs').getString('barOverlap');
      expect(barOverlapObject).assertEqual('false');
      done();
    });


    
    /**
     * @tc.number   ArkUI_Tabs_BarOverlap_static_0200
     * @tc.name     ArkUI_Tabs_BarOverlap_static_0200
     * @tc.desc     ArkUI_Tabs_BarOverlap_static_0200
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_Tabs_BarOverlap_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Tabs_BarOverlap_static_0200 start");
      let strJson = inspector.getInspectorByKey('TabsOverlapTest2');
      console.info("ArkUI_Tabs_BarOverlap_static_0200: " + JSON.stringify(strJson))
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barOverlap": true,
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarOverlap_static_0200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BarOverlap_static_0200] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let newJson = inspector.getInspectorByKey('TabsOverlapTest2');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BarOverlap_static_0200] barOverlap:" +
      JSON.stringify(obj.getElement('$attrs').getString('barOverlap')));
      let barOverlapObject = obj.getElement('$attrs').getString('barOverlap');
      expect(barOverlapObject).assertEqual('true');
      done();
    });


    
    /**
     * @tc.number   ArkUI_Tabs_BarOverlap_static_0300
     * @tc.name     ArkUI_Tabs_BarOverlap_static_0300
     * @tc.desc     ArkUI_Tabs_BarOverlap_static_0300
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_Tabs_BarOverlap_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Tabs_BarOverlap_static_0300 start");
      let strJson = inspector.getInspectorByKey('TabsOverlapTest2');
      console.info("ArkUI_Tabs_BarOverlap_static_0300: " + JSON.stringify(strJson))
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barOverlap": false,
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarOverlap_static_0300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BarOverlap_static_0300] change component data error: " + err.message);
      }

      await Utils.sleep(2000);
      let newJson = inspector.getInspectorByKey('TabsOverlapTest2');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BarOverlap_static_0300] barOverlap:" +
      JSON.stringify(obj.getElement('$attrs').getString('barOverlap')));
      let barOverlapObject = obj.getElement('$attrs').getString('barOverlap');
      expect(barOverlapObject).assertEqual('false');
      done();
    });


    
    /**
     * @tc.number   ArkUI_Tabs_BarOverlap_static_0400
     * @tc.name     ArkUI_Tabs_BarOverlap_static_0400
     * @tc.desc     ArkUI_Tabs_BarOverlap_static_0400
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_Tabs_BarOverlap_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Tabs_BarOverlap_static_0400 start");
      let strJson = inspector.getInspectorByKey('TabsOverlapTest2');
      console.info("ArkUI_Tabs_BarOverlap_static_0400: " + JSON.stringify(strJson))
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barOverlap": null,
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarOverlap_static_0400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BarOverlap_static_0400] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let newJson = inspector.getInspectorByKey('TabsOverlapTest2');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BarOverlap_static_0400] barOverlap:" +
      JSON.stringify(obj.getElement('$attrs').getString('barOverlap')));
      let barOverlapObject = obj.getElement('$attrs').getString('barOverlap');
      expect(barOverlapObject).assertEqual('false');
      done();
    });


    
    /**
     * @tc.number   ArkUI_Tabs_BarOverlap_static_0500
     * @tc.name     ArkUI_Tabs_BarOverlap_static_0500
     * @tc.desc     ArkUI_Tabs_BarOverlap_static_0500
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_Tabs_BarOverlap_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Tabs_BarOverlap_static_0500 start");
      let strJson = inspector.getInspectorByKey('TabsOverlapTest2');
      console.info("ArkUI_Tabs_BarOverlap_static_0500: " + JSON.stringify(strJson))
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barOverlap": undefined,
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarOverlap_static_0500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BarOverlap_static_0500] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let newJson = inspector.getInspectorByKey('TabsOverlapTest2');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BarOverlap_static_0500] barOverlap:" +
      JSON.stringify(obj.getElement('$attrs').getString('barOverlap')));
      let barOverlapObject = obj.getElement('$attrs').getString('barOverlap');
      expect(barOverlapObject).assertEqual('false');
      done();
    });


    
    /**
     * @tc.number   ArkUI_Tabs_BarOverlap_static_0600
     * @tc.name     ArkUI_Tabs_BarOverlap_static_0600
     * @tc.desc     ArkUI_Tabs_BarOverlap_static_0600
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_Tabs_BarOverlap_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Tabs_BarOverlap_static_0600 start");
      let strJson = inspector.getInspectorByKey('TabsOverlapTest2');
      console.info("ArkUI_Tabs_BarOverlap_static_0600: " + JSON.stringify(strJson))
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barOverlap": true,
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarOverlap_static_0600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BarOverlap_static_0600] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let newJson = inspector.getInspectorByKey('TabsOverlapTest2');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BarOverlap_static_0600] barOverlap:" +
      JSON.stringify(obj.getElement('$attrs').getString('barOverlap')));
      let barOverlapObject = obj.getElement('$attrs').getString('barOverlap');
      expect(barOverlapObject).assertEqual('true');

      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barOverlap": false,
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarOverlap_static_0600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BarOverlap_static_0600] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      newJson = inspector.getInspectorByKey('TabsOverlapTest2');
      obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BarOverlap_static_0600] barOverlap:" +
      JSON.stringify(obj.getElement('$attrs').getString('barOverlap')));
      barOverlapObject = obj.getElement('$attrs').getString('barOverlap');
      expect(barOverlapObject).assertEqual('false');
      done();
    });


    
    /**
     * @tc.number   ArkUI_Tabs_BarOverlap_static_0700
     * @tc.name     ArkUI_Tabs_BarOverlap_static_0700
     * @tc.desc     ArkUI_Tabs_BarOverlap_static_0700
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_Tabs_BarOverlap_static_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Tabs_BarOverlap_static_0700 start");
      let strJson = inspector.getInspectorByKey('TabsOverlapTest2');
      console.info("ArkUI_Tabs_BarOverlap_static_0700: " + JSON.stringify(strJson))
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barOverlap": true,
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarOverlap_static_0700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BarOverlap_static_0700] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let newJson = inspector.getInspectorByKey('TabsOverlapTest2');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BarOverlap_static_0700] barOverlap:" +
      JSON.stringify(obj.getElement('$attrs').getString('barOverlap')));
      let barOverlapObject = obj.getElement('$attrs').getString('barOverlap');
      expect(barOverlapObject).assertEqual('true');

      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barOverlap": null,
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarOverlap_static_0700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BarOverlap_static_0700] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      newJson = inspector.getInspectorByKey('TabsOverlapTest2');
      obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BarOverlap_static_0700] barOverlap:" +
      JSON.stringify(obj.getElement('$attrs').getString('barOverlap')));
      barOverlapObject = obj.getElement('$attrs').getString('barOverlap');
      expect(barOverlapObject).assertEqual('false');
      done();
    });


    
    /**
     * @tc.number   ArkUI_Tabs_BarOverlap_static_0800
     * @tc.name     ArkUI_Tabs_BarOverlap_static_0800
     * @tc.desc     ArkUI_Tabs_BarOverlap_static_0800
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_Tabs_BarOverlap_static_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Tabs_BarOverlap_static_0800 start");
      let strJson = inspector.getInspectorByKey('TabsOverlapTest2');
      console.info("ArkUI_Tabs_BarOverlap_static_0800: " + JSON.stringify(strJson))
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barOverlap": true,
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarOverlap_static_0800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BarOverlap_static_0800] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let newJson = inspector.getInspectorByKey('TabsOverlapTest2');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BarOverlap_static_0800] barOverlap:" +
      JSON.stringify(obj.getElement('$attrs').getString('barOverlap')));
      let barOverlapObject = obj.getElement('$attrs').getString('barOverlap');
      expect(barOverlapObject).assertEqual('true');

      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barOverlap": undefined,
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarOverlap_static_0800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BarOverlap_static_0800] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      newJson = inspector.getInspectorByKey('TabsOverlapTest2');
      obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BarOverlap_static_0800] barOverlap:" +
      JSON.stringify(obj.getElement('$attrs').getString('barOverlap')));
      barOverlapObject = obj.getElement('$attrs').getString('barOverlap');
      expect(barOverlapObject).assertEqual('false');
      done();
    });


    
    /**
     * @tc.number   ArkUI_Tabs_BarBackgroundColor_static_0100
     * @tc.name     ArkUI_Tabs_BarBackgroundColor_static_0100
     * @tc.desc     ArkUI_Tabs_BarBackgroundColor_static_0100
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_Tabs_BarBackgroundColor_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Tabs_BarBackgroundColor start");
      let strJson = inspector.getInspectorByKey('TabsOverlapTest1');

      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Tabs_BarBackgroundColor_static_0100] barBackgroundColor:" +
      JSON.stringify(obj.getElement('$attrs').getString('barBackgroundColor')));
      let barBackgroundColorObject: string = obj.getElement('$attrs').getString('barBackgroundColor');
      expect(barBackgroundColorObject).assertEqual("#00000000");
      done();
    });


    
    /**
     * @tc.number   ArkUI_Tabs_BarBackgroundColor_static_0200
     * @tc.name     ArkUI_Tabs_BarBackgroundColor_static_0200
     * @tc.desc     ArkUI_Tabs_BarBackgroundColor_static_0200
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_Tabs_BarBackgroundColor_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Tabs_BarBackgroundColor start");
      let strJson = inspector.getInspectorByKey('BarBackgroundColorColor');
      console.info("ArkUI_Tabs_BarBackgroundColor: " + JSON.stringify(strJson))
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barBackgroundColorColor": Color.Blue,
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarBackgroundColor_static_0200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BarBackgroundColor_static_0200] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let newJson = inspector.getInspectorByKey('BarBackgroundColorColor');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BarBackgroundColor_static_0200] barBackgroundColor:" +
      JSON.stringify(obj.getElement('$attrs').getString('barBackgroundColor')));
      let barBackgroundColorObject: string = obj.getElement('$attrs').getString('barBackgroundColor');
      expect(barBackgroundColorObject).assertEqual("#FF0000FF");
      done();
    });


    
    /**
     * @tc.number   ArkUI_Tabs_BarBackgroundColor_static_0300
     * @tc.name     ArkUI_Tabs_BarBackgroundColor_static_0300
     * @tc.desc     ArkUI_Tabs_BarBackgroundColor_static_0300
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_Tabs_BarBackgroundColor_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Tabs_BarBackgroundColor start");
      let strJson = inspector.getInspectorByKey('BarBackgroundColorNumber');
      console.info("ArkUI_Tabs_BarBackgroundColor: " + JSON.stringify(strJson))
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barBackgroundColorNumber": 123 as number,
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarBackgroundColor_static_0300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BarBackgroundColor_static_0300] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let newJson = inspector.getInspectorByKey('BarBackgroundColorNumber');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BarBackgroundColor_static_0300] barBackgroundColor:" +
      JSON.stringify(obj.getElement('$attrs').getString('barBackgroundColor')));
      let barBackgroundColorObject: string = obj.getElement('$attrs').getString('barBackgroundColor');
      expect(barBackgroundColorObject).assertEqual("#FF00007B");
      done();
    });


    
    /**
     * @tc.number   ArkUI_Tabs_BarBackgroundColor_static_0400
     * @tc.name     ArkUI_Tabs_BarBackgroundColor_static_0400
     * @tc.desc     ArkUI_Tabs_BarBackgroundColor_static_0400
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_Tabs_BarBackgroundColor_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Tabs_BarBackgroundColor start");
      let strJson = inspector.getInspectorByKey('BarBackgroundColorString');
      console.info("ArkUI_Tabs_BarBackgroundColor: " + JSON.stringify(strJson))
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barBackgroundColorString": "#0000FF",
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarBackgroundColor_static_0400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BarBackgroundColor_static_0400] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let newJson = inspector.getInspectorByKey('BarBackgroundColorString');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BarBackgroundColor_static_0400] barBackgroundColor:" +
      JSON.stringify(obj.getElement('$attrs').getString('barBackgroundColor')));
      let barBackgroundColorObject: string = obj.getElement('$attrs').getString('barBackgroundColor');
      expect(barBackgroundColorObject).assertEqual("#FF0000FF");
      done();
    });


    
    /**
     * @tc.number   ArkUI_Tabs_BarBackgroundColor_static_0500
     * @tc.name     ArkUI_Tabs_BarBackgroundColor_static_0500
     * @tc.desc     ArkUI_Tabs_BarBackgroundColor_static_0500
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_Tabs_BarBackgroundColor_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Tabs_BarBackgroundColor start");
      let strJson = inspector.getInspectorByKey('BarBackgroundColorResource');
      console.info("ArkUI_Tabs_BarBackgroundColor: " + JSON.stringify(strJson))
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barBackgroundColorResource": $r("sys.color.ohos_toggle_bg"),
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarBackgroundColor_static_0500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BarBackgroundColor_static_0500] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let newJson = inspector.getInspectorByKey('BarBackgroundColorResource');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BarBackgroundColor_static_0500] barBackgroundColor:" +
      JSON.stringify(obj.getElement('$attrs').getString('barBackgroundColor')));
      let barBackgroundColorObject: string = obj.getElement('$attrs').getString('barBackgroundColor');
      let newColor = inspector.getInspectorByKey('ResourceColor');
      let objColor = JSON.parseJsonElement(newColor);
      console.info("[ArkUI_Tabs_BarBackgroundColor_static_0500] objColor:" +
      JSON.stringify(objColor.getElement('$attrs').getString('backgroundColor')));
      expect(barBackgroundColorObject).assertEqual(objColor.getElement('$attrs').getString('backgroundColor'));
      done();
    });


    
    /**
     * @tc.number   ArkUI_Tabs_BarBackgroundColor_static_0600
     * @tc.name     ArkUI_Tabs_BarBackgroundColor_static_0600
     * @tc.desc     ArkUI_Tabs_BarBackgroundColor_static_0600
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_Tabs_BarBackgroundColor_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Tabs_BarBackgroundColor start");
      let strJson = inspector.getInspectorByKey('BarBackgroundColorColor');
      console.info("ArkUI_Tabs_BarBackgroundColor: " + JSON.stringify(strJson))
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barBackgroundColorColor": null,
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarBackgroundColor_static_0600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BarBackgroundColor_static_0600] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let newJson = inspector.getInspectorByKey('BarBackgroundColorColor');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BarBackgroundColor_static_0600] barBackgroundColor:" +
      JSON.stringify(obj.getElement('$attrs').getString('barBackgroundColor')));
      let barBackgroundColorObject: string = obj.getElement('$attrs').getString('barBackgroundColor');
      expect(barBackgroundColorObject).assertEqual("#00000000");
      done();
    });


    
    /**
     * @tc.number   ArkUI_Tabs_BarBackgroundColor_static_0700
     * @tc.name     ArkUI_Tabs_BarBackgroundColor_static_0700
     * @tc.desc     ArkUI_Tabs_BarBackgroundColor_static_0700
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_Tabs_BarBackgroundColor_static_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Tabs_BarBackgroundColor start");
      let strJson = inspector.getInspectorByKey('BarBackgroundColorColor');
      console.info("ArkUI_Tabs_BarBackgroundColor: " + JSON.stringify(strJson))
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barBackgroundColorColor": undefined,
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarBackgroundColor_static_0700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_BarBackgroundColor_static_0700] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let newJson = inspector.getInspectorByKey('BarBackgroundColorColor');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BarBackgroundColor_static_0700] barBackgroundColor:" +
      JSON.stringify(obj.getElement('$attrs').getString('barBackgroundColor')));
      let barBackgroundColorObject: string = obj.getElement('$attrs').getString('barBackgroundColor');
      expect(barBackgroundColorObject).assertEqual("#00000000");
      done();
    });

  })
}
