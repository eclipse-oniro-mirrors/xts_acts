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
import {
  Resource,
  BarMode,
  LayoutStyle,
  VerticalAlign,
  LayoutMode,
  TextOverflow,
  TextHeightAdaptivePolicy,
  FontWeight,
  FontStyle
} from '@ohos.arkui.component'
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
import { Color, FontWeight, $r, Resource } from '@ohos.arkui.component'
import { RecordData } from '@ohos.base';

let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

function tabsDefaultFontSize(sysWidth: Resource) {
  const context = AppStorage.get<common.UIAbilityContext>('UIAbilityContext');
  let resourceFontSize = context?.resourceManager.getDouble(sysWidth.id)
  const uiContext = AppStorage.get<UIContext>('uiContext')!;
  let newFontSize: string = Math.round(uiContext.px2vp(resourceFontSize ?? 0)) + '.00vp'
  return newFontSize;
}

export default function tabsThird() {
  describe('ActsAceTabsTestThird', () => {
    let count: int = 0
    beforeAll(() => {
      await UtilsTest.startAbility("com.arkui.ace.scroll.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Tabs/IndexThird",
      }
      try {
        const routerAlp = AppStorage.get<Router>("router") as Router
        routerAlp.clear();
        let pages = routerAlp.getState();
        console.info("get IndexThird state success " + JSON.stringify(pages));
        if (!("IndexThird" == pages.name)) {
          console.info("get IndexThird state success " + JSON.stringify(pages.name));
          // let result = await routerAlp.pushUrl(options)
          routerAlp.pushUrl(options)
          await Utils.sleep(2000);
          // console.info("push IndexThird page success " + JSON.stringify(result));
        }
      } catch (err: Error) {
        console.error("push IndexThird page error " + JSON.stringify(err));
      }

      console.info("tabs beforeEach start");
    })

    afterEach(async (): Promise<void> => {
      count++;
      console.info("tabs afterEach start " + count);
      try {
        let eventData: events_emitter.EventData = {
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

          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
    })

    
    /**
     * @tc.number   ArkUI_Tabs_BarGridAlign_static_0100
     * @tc.name     ArkUI_Tabs_BarGridAlign_static_0100
     * @tc.desc     ArkUI_Tabs_BarGridAlign_static_0100
     * @tc.level    0
     */
it('ArkUI_Tabs_BarGridAlign_static_0100', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BarGridAlign_static_0100] start");
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('tabsDefaultTest');
      console.info("[ArkUI_Tabs_BarGridAlign_static_0100]: " + strJson)

      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Tabs_BarGridAlign_static_0100]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign')));
      console.info("[ArkUI_Tabs_BarGridAlign_static_0100]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('margin')));
      console.info("[ArkUI_Tabs_BarGridAlign_static_0100]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('gutter')));
      console.info("[ArkUI_Tabs_BarGridAlign_static_0100]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('sm')));
      console.info("[ArkUI_Tabs_BarGridAlign_static_0100]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('md')));
      console.info("[ArkUI_Tabs_BarGridAlign_static_0100]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('lg')));

      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('margin')).assertEqual('24.00vp');
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('gutter')).assertEqual('24.00vp');
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('sm')).assertEqual('-1');
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('md')).assertEqual('-1');
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('lg')).assertEqual('-1');

      console.info("[ArkUI_Tabs_BarGridAlign_static_0100] end");
      done();
    });
    
    /**
     * @tc.number   ArkUI_Tabs_BarGridAlign_static_0200
     * @tc.name     ArkUI_Tabs_BarGridAlign_static_0200
     * @tc.desc     ArkUI_Tabs_BarGridAlign_static_0200
     * @tc.level    0
     */
it('ArkUI_Tabs_BarGridAlign_static_0200', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BarGridAlign_static_0200] start");
      let strJson = inspector.getInspectorByKey('tabsStringTest');
      console.info("[ArkUI_Tabs_BarGridAlign_static_0200]: " + strJson)
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barGridAlignMarginString": '10px'
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarGridAlign_static_0200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BarGridAlign_static_0200] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('tabsStringTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BarGridAlign_static_0200]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign')));
      console.info("[ArkUI_Tabs_BarGridAlign_static_0200]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('margin')));
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('margin')).assertEqual('10.00px');
      console.info("[ArkUI_Tabs_BarGridAlign_static_0200] end");
      done();
    });
    
    /**
     * @tc.number   ArkUI_Tabs_BarGridAlign_static_0300
     * @tc.name     ArkUI_Tabs_BarGridAlign_static_0300
     * @tc.desc     ArkUI_Tabs_BarGridAlign_static_0300
     * @tc.level    0
     */
it('ArkUI_Tabs_BarGridAlign_static_0300', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BarGridAlign_static_0300] start");
      let strJson = inspector.getInspectorByKey('tabsStringTest');
      console.info("[ArkUI_Tabs_BarGridAlign_static_0300]: " + strJson)
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barGridAlignMarginString": '10vp'
           } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarGridAlign_static_0300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BarGridAlign_static_0300] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('tabsStringTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BarGridAlign_static_0300]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign')));
      console.info("[ArkUI_Tabs_BarGridAlign_static_0300]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('margin')));
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('margin')).assertEqual('10.00vp');
      console.info("[ArkUI_Tabs_BarGridAlign_static_0300] end");
      done();
    });
    
    /**
     * @tc.number   ArkUI_Tabs_BarGridAlign_static_0400
     * @tc.name     ArkUI_Tabs_BarGridAlign_static_0400
     * @tc.desc     ArkUI_Tabs_BarGridAlign_static_0400
     * @tc.level    0
     */
it('ArkUI_Tabs_BarGridAlign_static_0400', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BarGridAlign_static_0400] start");
      let strJson = inspector.getInspectorByKey('tabsNumberTest');
      console.info("[ArkUI_Tabs_BarGridAlign_static_0400]: " + strJson)
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barGridAlignMarginNumber": 10 as number
           } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarGridAlign_static_0400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BarGridAlign_static_0400] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('tabsNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BarGridAlign_static_0400]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign')));
      console.info("[ArkUI_Tabs_BarGridAlign_static_0400]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('margin')));
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('margin')).assertEqual('10.00vp');
      console.info("[ArkUI_Tabs_BarGridAlign_static_0400] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BarGridAlign_static_0500
     * @tc.name     ArkUI_Tabs_BarGridAlign_static_0500
     * @tc.desc     ArkUI_Tabs_BarGridAlign_static_0500
     * @tc.level    0
     */
it('ArkUI_Tabs_BarGridAlign_static_0500', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BarGridAlign_static_0500] start");
      let strJson = inspector.getInspectorByKey('tabsNumberTest');
      console.info("[ArkUI_Tabs_BarGridAlign_static_0500]: " + strJson)
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barGridAlignMarginNumber": -2 as number
           } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarGridAlign_static_0500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BarGridAlign_static_0500] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('tabsNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BarGridAlign_static_0500]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign')));
      console.info("[ArkUI_Tabs_BarGridAlign_static_0500]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('margin')));
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('margin')).assertEqual('24.00vp');
      console.info("[ArkUI_Tabs_BarGridAlign_static_0500] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BarGridAlign_static_0600
     * @tc.name     ArkUI_Tabs_BarGridAlign_static_0600
     * @tc.desc     ArkUI_Tabs_BarGridAlign_static_0600
     * @tc.level    0
     */
it('ArkUI_Tabs_BarGridAlign_static_0600', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BarGridAlign_static_0600] start");
      let strJson = inspector.getInspectorByKey('tabsNumberTest');
      console.info("[ArkUI_Tabs_BarGridAlign_static_0600]: " + strJson)
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barGridAlignMarginNumber": Math.pow(2, 16)
           } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarGridAlign_static_0600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BarGridAlign_static_0600] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('tabsNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BarGridAlign_static_0600]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign')));
      console.info("[ArkUI_Tabs_BarGridAlign_static_0600]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('margin')));
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('margin')).assertEqual('65536.00vp');
      console.info("[ArkUI_Tabs_BarGridAlign_static_0600] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BarGridAlign_static_0700
     * @tc.name     ArkUI_Tabs_BarGridAlign_static_0700
     * @tc.desc     ArkUI_Tabs_BarGridAlign_static_0700
     * @tc.level    0
     */
it('ArkUI_Tabs_BarGridAlign_static_0700', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BarGridAlign_static_0700] start");
      let strJson = inspector.getInspectorByKey('tabsStringTest');
      console.info("[ArkUI_Tabs_BarGridAlign_static_0700]: " + strJson)
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barGridAlignMarginString": '10fp'
           } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarGridAlign_static_0700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BarGridAlign_static_0700] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('tabsStringTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BarGridAlign_static_0700]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign')));
      console.info("[ArkUI_Tabs_BarGridAlign_static_0700]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('margin')));
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('margin')).assertEqual('10.00fp');
      console.info("[ArkUI_Tabs_BarGridAlign_static_0700] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BarGridAlign_static_0800
     * @tc.name     ArkUI_Tabs_BarGridAlign_static_0800
     * @tc.desc     ArkUI_Tabs_BarGridAlign_static_0800
     * @tc.level    0
     */
it('ArkUI_Tabs_BarGridAlign_static_0800', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BarGridAlign_static_0800] start");
      let strJson = inspector.getInspectorByKey('tabsStringTest');
      console.info("[ArkUI_Tabs_BarGridAlign_static_0800]: " + strJson)
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barGridAlignMarginString": '10lpx'
           } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarGridAlign_static_0800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BarGridAlign_static_0800] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('tabsStringTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BarGridAlign_static_0800]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign')));
      console.info("[ArkUI_Tabs_BarGridAlign_static_0800]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('margin')));
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('margin')).assertEqual('10.00lpx');
      console.info("[ArkUI_Tabs_BarGridAlign_static_0800] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BarGridAlign_static_0900
     * @tc.name     ArkUI_Tabs_BarGridAlign_static_0900
     * @tc.desc     ArkUI_Tabs_BarGridAlign_static_0900
     * @tc.level    0
     */
it('ArkUI_Tabs_BarGridAlign_static_0900', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BarGridAlign_static_0900] start");
      let strJson = inspector.getInspectorByKey('tabsResourceTest');
      console.info("[ArkUI_Tabs_BarGridAlign_static_0900]: " + strJson)

      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Tabs_BarGridAlign_static_0900]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('margin')));
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('margin')).assertEqual('15.00px');
      console.info("[ArkUI_Tabs_BarGridAlign_static_0900] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BarGridAlign_1000
     * @tc.name     ArkUI_Tabs_BarGridAlign_1000
     * @tc.desc     ArkUI_Tabs_BarGridAlign_1000
     * @tc.level    0
     */
it('ArkUI_Tabs_BarGridAlign_1000', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BarGridAlign_1000] start");
      let strJson = inspector.getInspectorByKey('tabsNumberTest');
      console.info("[ArkUI_Tabs_BarGridAlign_1000]: " + strJson)
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barGridAlignMarginNumber": undefined
           } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarGridAlign_1000] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BarGridAlign_1000] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('tabsNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BarGridAlign_1000]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign')));
      console.info("[ArkUI_Tabs_BarGridAlign_1000]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('margin')));
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('margin')).assertEqual('24.00vp');
      console.info("[ArkUI_Tabs_BarGridAlign_1000] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BarGridAlign_1100
     * @tc.name     ArkUI_Tabs_BarGridAlign_1100
     * @tc.desc     ArkUI_Tabs_BarGridAlign_1100
     * @tc.level    0
     */
it('ArkUI_Tabs_BarGridAlign_1100', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BarGridAlign_1100] start");
      let strJson = inspector.getInspectorByKey('tabsNumberTest');
      console.info("[ArkUI_Tabs_BarGridAlign_1100]: " + strJson)
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barGridAlignMarginNumber": 'null'
           } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarGridAlign_1100] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BarGridAlign_1100] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('tabsNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BarGridAlign_1100]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign')));
      console.info("[ArkUI_Tabs_BarGridAlign_1100]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('margin')));
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('margin')).assertEqual('24.00vp');
      console.info("[ArkUI_Tabs_BarGridAlign_1100] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BarGridAlign_1200
     * @tc.name     ArkUI_Tabs_BarGridAlign_1200
     * @tc.desc     ArkUI_Tabs_BarGridAlign_1200
     * @tc.level    0
     */
it('ArkUI_Tabs_BarGridAlign_1200', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BarGridAlign_1200] start");
      let strJson = inspector.getInspectorByKey('tabsStringTest');
      console.info("[ArkUI_Tabs_BarGridAlign_1200]: " + strJson)
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barGridAlignGutterString": '10px'
           } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarGridAlign_1200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BarGridAlign_1200] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('tabsStringTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BarGridAlign_1200]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign')));
      console.info("[ArkUI_Tabs_BarGridAlign_1200]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('gutter')));
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('gutter')).assertEqual('10.00px');
      console.info("[ArkUI_Tabs_BarGridAlign_1200] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BarGridAlign_1300
     * @tc.name     ArkUI_Tabs_BarGridAlign_1300
     * @tc.desc     ArkUI_Tabs_BarGridAlign_1300
     * @tc.level    0
     */
it('ArkUI_Tabs_BarGridAlign_1300', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BarGridAlign_1300] start");
      let strJson = inspector.getInspectorByKey('tabsStringTest');
      console.info("[ArkUI_Tabs_BarGridAlign_1300]: " + strJson)
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barGridAlignGutterString": '10vp'
           } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarGridAlign_1300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BarGridAlign_1300] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('tabsStringTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BarGridAlign_1300]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign')));
      console.info("[ArkUI_Tabs_BarGridAlign_1300]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('gutter')));
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('gutter')).assertEqual('10.00vp');
      console.info("[ArkUI_Tabs_BarGridAlign_1300] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BarGridAlign_1400
     * @tc.name     ArkUI_Tabs_BarGridAlign_1400
     * @tc.desc     ArkUI_Tabs_BarGridAlign_1400
     * @tc.level    0
     */
it('ArkUI_Tabs_BarGridAlign_1400', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BarGridAlign_1400] start");
      let strJson = inspector.getInspectorByKey('tabsNumberTest');
      console.info("[ArkUI_Tabs_BarGridAlign_1400]: " + strJson)
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barGridAlignGutterNumber": 10 as number
           } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarGridAlign_1400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BarGridAlign_1400] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('tabsNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BarGridAlign_1400]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign')));
      console.info("[ArkUI_Tabs_BarGridAlign_1400]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('gutter')));
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('gutter')).assertEqual('10.00vp');
      console.info("[ArkUI_Tabs_BarGridAlign_1400] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BarGridAlign_1500
     * @tc.name     ArkUI_Tabs_BarGridAlign_1500
     * @tc.desc     ArkUI_Tabs_BarGridAlign_1500
     * @tc.level    0
     */
it('ArkUI_Tabs_BarGridAlign_1500', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BarGridAlign_1500] start");
      let strJson = inspector.getInspectorByKey('tabsNumberTest');
      console.info("[ArkUI_Tabs_BarGridAlign_1500]: " + strJson)
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barGridAlignGutterNumber": -2 as number
           } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarGridAlign_1500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BarGridAlign_1500] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('tabsNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BarGridAlign_1500]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign')));
      console.info("[ArkUI_Tabs_BarGridAlign_1500]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('gutter')));
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('gutter')).assertEqual('24.00vp');
      console.info("[ArkUI_Tabs_BarGridAlign_1500] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BarGridAlign_1600
     * @tc.name     ArkUI_Tabs_BarGridAlign_1600
     * @tc.desc     ArkUI_Tabs_BarGridAlign_1600
     * @tc.level    0
     */
it('ArkUI_Tabs_BarGridAlign_1600', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BarGridAlign_1600] start");
      let strJson = inspector.getInspectorByKey('tabsNumberTest');
      console.info("[ArkUI_Tabs_BarGridAlign_1600]: " + strJson)
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barGridAlignGutterNumber": Math.pow(2, 16)
           } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarGridAlign_1600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BarGridAlign_1600] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('tabsNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BarGridAlign_1600]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign')));
      console.info("[ArkUI_Tabs_BarGridAlign_1600]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('gutter')));
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('gutter')).assertEqual('65536.00vp');
      console.info("[ArkUI_Tabs_BarGridAlign_1600] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BarGridAlign_1700
     * @tc.name     ArkUI_Tabs_BarGridAlign_1700
     * @tc.desc     ArkUI_Tabs_BarGridAlign_1700
     * @tc.level    0
     */
it('ArkUI_Tabs_BarGridAlign_1700', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BarGridAlign_1700] start");
      let strJson = inspector.getInspectorByKey('tabsStringTest');
      console.info("[ArkUI_Tabs_BarGridAlign_1700]: " + strJson)
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barGridAlignGutterString": '10fp'
           } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarGridAlign_1700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BarGridAlign_1700] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('tabsStringTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BarGridAlign_1700]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign')));
      console.info("[ArkUI_Tabs_BarGridAlign_1700]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('gutter')));
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('gutter')).assertEqual('10.00fp');
      console.info("[ArkUI_Tabs_BarGridAlign_1700] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BarGridAlign_1800
     * @tc.name     ArkUI_Tabs_BarGridAlign_1800
     * @tc.desc     ArkUI_Tabs_BarGridAlign_1800
     * @tc.level    0
     */
it('ArkUI_Tabs_BarGridAlign_1800', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BarGridAlign_1800] start");
      let strJson = inspector.getInspectorByKey('tabsStringTest');
      console.info("[ArkUI_Tabs_BarGridAlign_1800]: " + strJson)
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barGridAlignGutterString": '10lpx'
           } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarGridAlign_1800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BarGridAlign_1800] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('tabsStringTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BarGridAlign_1800]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign')));
      console.info("[ArkUI_Tabs_BarGridAlign_1800]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('gutter')));
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('gutter')).assertEqual('10.00lpx');
      console.info("[ArkUI_Tabs_BarGridAlign_1800] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BarGridAlign_1900
     * @tc.name     ArkUI_Tabs_BarGridAlign_1900
     * @tc.desc     ArkUI_Tabs_BarGridAlign_1900
     * @tc.level    0
     */
it('ArkUI_Tabs_BarGridAlign_1900', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BarGridAlign_1900] start");
      let strJson = inspector.getInspectorByKey('tabsResourceTest');
      console.info("[ArkUI_Tabs_BarGridAlign_1900]: " + strJson)

      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Tabs_BarGridAlign_1900]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign')));
      console.info("[ArkUI_Tabs_BarGridAlign_1900]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('gutter')));
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('gutter')).assertEqual('15.00px');
      console.info("[ArkUI_Tabs_BarGridAlign_1900] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BarGridAlign_2000
     * @tc.name     ArkUI_Tabs_BarGridAlign_2000
     * @tc.desc     ArkUI_Tabs_BarGridAlign_2000
     * @tc.level    0
     */
it('ArkUI_Tabs_BarGridAlign_2000', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BarGridAlign_2000] start");
      let strJson = inspector.getInspectorByKey('tabsNumberTest');
      console.info("[ArkUI_Tabs_BarGridAlign_2000]: " + strJson)
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barGridAlignGutterNumber": undefined
           } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarGridAlign_2000] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BarGridAlign_2000] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('tabsNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BarGridAlign_2000]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign')));
      console.info("[ArkUI_Tabs_BarGridAlign_2000]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('gutter')));
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('gutter')).assertEqual('24.00vp');
      console.info("[ArkUI_Tabs_BarGridAlign_2000] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BarGridAlign_2100
     * @tc.name     ArkUI_Tabs_BarGridAlign_2100
     * @tc.desc     ArkUI_Tabs_BarGridAlign_2100
     * @tc.level    0
     */
it('ArkUI_Tabs_BarGridAlign_2100', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BarGridAlign_2100] start");
      let strJson = inspector.getInspectorByKey('tabsNumberTest');
      console.info("[ArkUI_Tabs_BarGridAlign_2100]: " + strJson)
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barGridAlignGutterNumber": null
           } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarGridAlign_2100] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BarGridAlign_2100] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('tabsNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BarGridAlign_2100]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign')));
      console.info("[ArkUI_Tabs_BarGridAlign_2100]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('gutter')));
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('gutter')).assertEqual('24.00vp');
      console.info("[ArkUI_Tabs_BarGridAlign_2100] end");
      done();
    });

    
    /**
     * @tc.number   [ArkUI_Tabs_BarGridAlign_2200]
     * @tc.name     [ArkUI_Tabs_BarGridAlign_2200]
     * @tc.desc     [ArkUI_Tabs_BarGridAlign_2200]
     * @tc.level    0
     */
it('[ArkUI_Tabs_BarGridAlign_2200]', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BarGridAlign_2200] start");
      let strJson = inspector.getInspectorByKey('tabsNumberTest');
      console.info("[ArkUI_Tabs_BarGridAlign_2200]: " + strJson)
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barGridAlignSmNumber": 2 as number,
            "barGridAlignMdNumber": 4 as number,
            "barGridAlignLgNumber": 6 as number
           } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarGridAlign_2200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BarGridAlign_2200] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('tabsNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BarGridAlign_2200]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign')));
      console.info("[ArkUI_Tabs_BarGridAlign_2200]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('sm')));
      console.info("[ArkUI_Tabs_BarGridAlign_2200]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('md')));
      console.info("[ArkUI_Tabs_BarGridAlign_2200]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('lg')));
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('sm')).assertEqual('2');
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('md')).assertEqual('4');
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('lg')).assertEqual('6');
      console.info("[ArkUI_Tabs_BarGridAlign_2200] end");
      done();
    });

    
    /**
     * @tc.number   [ArkUI_Tabs_BarGridAlign_2300]
     * @tc.name     [ArkUI_Tabs_BarGridAlign_2300]
     * @tc.desc     [ArkUI_Tabs_BarGridAlign_2300]
     * @tc.level    0
     */
it('[ArkUI_Tabs_BarGridAlign_2300]', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BarGridAlign_2300] start");
      let strJson = inspector.getInspectorByKey('tabsNumberTest');
      console.info("[ArkUI_Tabs_BarGridAlign_2300]: " + strJson)
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barGridAlignSmNumber": 3 as number,
            "barGridAlignMdNumber": 4 as number,
            "barGridAlignLgNumber": 6 as number
           } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarGridAlign_2300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BarGridAlign_2300] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('tabsNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BarGridAlign_2300]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign')));
      console.info("[ArkUI_Tabs_BarGridAlign_2300]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('sm')));
      console.info("[ArkUI_Tabs_BarGridAlign_2300]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('md')));
      console.info("[ArkUI_Tabs_BarGridAlign_2300]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('lg')));
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('sm')).assertEqual('-1');
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('md')).assertEqual('4');
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('lg')).assertEqual('6');
      console.info("[ArkUI_Tabs_BarGridAlign_2300] end");
      done();
    });

    
    /**
     * @tc.number   [ArkUI_Tabs_BarGridAlign_2400]
     * @tc.name     [ArkUI_Tabs_BarGridAlign_2400]
     * @tc.desc     [ArkUI_Tabs_BarGridAlign_2400]
     * @tc.level    0
     */
it('[ArkUI_Tabs_BarGridAlign_2400]', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BarGridAlign_2400] start");
      let strJson = inspector.getInspectorByKey('tabsNumberTest');
      console.info("[ArkUI_Tabs_BarGridAlign_2400]: " + strJson)
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barGridAlignSmNumber": -2.0,
            "barGridAlignMdNumber": 4.0,
            "barGridAlignLgNumber": 6.0
           } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarGridAlign_2400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BarGridAlign_2400] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('tabsNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BarGridAlign_2400]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign')));
      console.info("[ArkUI_Tabs_BarGridAlign_2400]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('sm')));
      console.info("[ArkUI_Tabs_BarGridAlign_2400]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('md')));
      console.info("[ArkUI_Tabs_BarGridAlign_2400]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('lg')));
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('sm')).assertEqual('-1');
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('md')).assertEqual('4');
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('lg')).assertEqual('6');
      console.info("[ArkUI_Tabs_BarGridAlign_2400] end");
      done();
    });

    
    /**
     * @tc.number   [ArkUI_Tabs_BarGridAlign_2500]
     * @tc.name     [ArkUI_Tabs_BarGridAlign_2500]
     * @tc.desc     [ArkUI_Tabs_BarGridAlign_2500]
     * @tc.level    0
     */
it('[ArkUI_Tabs_BarGridAlign_2500]', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BarGridAlign_2500] start");
      let strJson = inspector.getInspectorByKey('tabsNumberTest');
      console.info("[ArkUI_Tabs_BarGridAlign_2500]: " + strJson)
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barGridAlignSmNumber": 100000.0,
            "barGridAlignMdNumber": 4.0,
            "barGridAlignLgNumber": 6.0
           } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarGridAlign_2500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BarGridAlign_2500] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('tabsNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BarGridAlign_2500]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign')));
      console.info("[ArkUI_Tabs_BarGridAlign_2500]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('sm')));
      console.info("[ArkUI_Tabs_BarGridAlign_2500]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('md')));
      console.info("[ArkUI_Tabs_BarGridAlign_2500]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('lg')));
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('sm')).assertEqual('-1');
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('md')).assertEqual('4');
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('lg')).assertEqual('6');
      console.info("[ArkUI_Tabs_BarGridAlign_2500] end");
      done();
    });

    
    /**
     * @tc.number   [ArkUI_Tabs_BarGridAlign_2600]
     * @tc.name     [ArkUI_Tabs_BarGridAlign_2600]
     * @tc.desc     [ArkUI_Tabs_BarGridAlign_2600]
     * @tc.level    0
     */
it('[ArkUI_Tabs_BarGridAlign_2600]', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BarGridAlign_2600] start");
      let strJson = inspector.getInspectorByKey('tabsNumberTest');
      console.info("[ArkUI_Tabs_BarGridAlign_2600]: " + strJson)
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barGridAlignSmNumber": 'undefined',
            "barGridAlignMdNumber": 4.0,
            "barGridAlignLgNumber": 6.0
           } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarGridAlign_2600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BarGridAlign_2600] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('tabsNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BarGridAlign_2600]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign')));
      console.info("[ArkUI_Tabs_BarGridAlign_2600]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('sm')));
      console.info("[ArkUI_Tabs_BarGridAlign_2600]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('md')));
      console.info("[ArkUI_Tabs_BarGridAlign_2600]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('lg')));
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('sm')).assertEqual('-1');
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('md')).assertEqual('4');
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('lg')).assertEqual('6');
      console.info("[ArkUI_Tabs_BarGridAlign_2600] end");
      done();
    });

    
    /**
     * @tc.number   [ArkUI_Tabs_BarGridAlign_2700]
     * @tc.name     [ArkUI_Tabs_BarGridAlign_2700]
     * @tc.desc     [ArkUI_Tabs_BarGridAlign_2700]
     * @tc.level    0
     */
it('[ArkUI_Tabs_BarGridAlign_2700]', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BarGridAlign_2700] start");
      let strJson = inspector.getInspectorByKey('tabsNumberTest');
      console.info("[ArkUI_Tabs_BarGridAlign_2700]: " + strJson)
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barGridAlignSmNumber": 'null',
            "barGridAlignMdNumber": 4.0,
            "barGridAlignLgNumber": 6.0
           } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarGridAlign_2700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BarGridAlign_2700] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('tabsNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BarGridAlign_2700]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign')));
      console.info("[ArkUI_Tabs_BarGridAlign_2700]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('sm')));
      console.info("[ArkUI_Tabs_BarGridAlign_2700]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('md')));
      console.info("[ArkUI_Tabs_BarGridAlign_2700]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('lg')));
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('sm')).assertEqual('-1');
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('md')).assertEqual('4');
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('lg')).assertEqual('6');
      console.info("[ArkUI_Tabs_BarGridAlign_2700] end");
      done();
    });

    
    /**
     * @tc.number   [ArkUI_Tabs_BarGridAlign_2800]
     * @tc.name     [ArkUI_Tabs_BarGridAlign_2800]
     * @tc.desc     [ArkUI_Tabs_BarGridAlign_2800]
     * @tc.level    0
     */
it('[ArkUI_Tabs_BarGridAlign_2800]', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BarGridAlign_2800] start");
      let strJson = inspector.getInspectorByKey('tabsNumberTest');
      console.info("[ArkUI_Tabs_BarGridAlign_2800]: " + strJson)
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barGridAlignSmNumber": 2 as number,
            "barGridAlignMdNumber": 3 as number,
            "barGridAlignLgNumber": 6 as number
           } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarGridAlign_2800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BarGridAlign_2800] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('tabsNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BarGridAlign_2800]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign')));
      console.info("[ArkUI_Tabs_BarGridAlign_2800]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('sm')));
      console.info("[ArkUI_Tabs_BarGridAlign_2800]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('md')));
      console.info("[ArkUI_Tabs_BarGridAlign_2800]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('lg')));
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('sm')).assertEqual('2');
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('md')).assertEqual('-1');
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('lg')).assertEqual('6');
      console.info("[ArkUI_Tabs_BarGridAlign_2800] end");
      done();
    });

    
    /**
     * @tc.number   [ArkUI_Tabs_BarGridAlign_2900]
     * @tc.name     [ArkUI_Tabs_BarGridAlign_2900]
     * @tc.desc     [ArkUI_Tabs_BarGridAlign_2900]
     * @tc.level    0
     */
it('[ArkUI_Tabs_BarGridAlign_2900]', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BarGridAlign_2900] start");
      let strJson = inspector.getInspectorByKey('tabsNumberTest');
      console.info("[ArkUI_Tabs_BarGridAlign_2900]: " + strJson)
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barGridAlignSmNumber": 2 as number,
            "barGridAlignMdNumber": -2 as number,
            "barGridAlignLgNumber": 6 as number
           } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarGridAlign_2900] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BarGridAlign_2900] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('tabsNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BarGridAlign_2900]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign')));
      console.info("[ArkUI_Tabs_BarGridAlign_2900]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('sm')));
      console.info("[ArkUI_Tabs_BarGridAlign_2900]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('md')));
      console.info("[ArkUI_Tabs_BarGridAlign_2900]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('lg')));
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('sm')).assertEqual('2');
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('md')).assertEqual('-1');
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('lg')).assertEqual('6');
      console.info("[ArkUI_Tabs_BarGridAlign_2900] end");
      done();
    });

    
    /**
     * @tc.number   [ArkUI_Tabs_BarGridAlign_3000]
     * @tc.name     [ArkUI_Tabs_BarGridAlign_3000]
     * @tc.desc     [ArkUI_Tabs_BarGridAlign_3000]
     * @tc.level    0
     */
it('[ArkUI_Tabs_BarGridAlign_3000]', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BarGridAlign_3000] start");
      let strJson = inspector.getInspectorByKey('tabsNumberTest');
      console.info("[ArkUI_Tabs_BarGridAlign_3000]: " + strJson)
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barGridAlignSmNumber": 2 as number,
            "barGridAlignMdNumber": 100000 as number,
            "barGridAlignLgNumber": 6 as number
           } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarGridAlign_3000] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BarGridAlign_3000] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('tabsNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BarGridAlign_3000]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign')));
      console.info("[ArkUI_Tabs_BarGridAlign_3000]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('sm')));
      console.info("[ArkUI_Tabs_BarGridAlign_3000]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('md')));
      console.info("[ArkUI_Tabs_BarGridAlign_3000]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('lg')));
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('sm')).assertEqual('2');
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('md')).assertEqual('-1');
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('lg')).assertEqual('6');
      console.info("[ArkUI_Tabs_BarGridAlign_3000] end");
      done();
    });

    
    /**
     * @tc.number   [ArkUI_Tabs_BarGridAlign_3100]
     * @tc.name     [ArkUI_Tabs_BarGridAlign_3100]
     * @tc.desc     [ArkUI_Tabs_BarGridAlign_3100]
     * @tc.level    0
     */
it('[ArkUI_Tabs_BarGridAlign_3100]', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BarGridAlign_3100] start");
      let strJson = inspector.getInspectorByKey('tabsNumberTest');
      console.info("[ArkUI_Tabs_BarGridAlign_3100]: " + strJson)
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barGridAlignSmNumber": 2 as number,
            "barGridAlignMdNumber": undefined,
            "barGridAlignLgNumber": 6 as number
           } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarGridAlign_3100] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BarGridAlign_3100] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('tabsNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BarGridAlign_3100]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign')));
      console.info("[ArkUI_Tabs_BarGridAlign_3100]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('sm')));
      console.info("[ArkUI_Tabs_BarGridAlign_3100]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('md')));
      console.info("[ArkUI_Tabs_BarGridAlign_3100]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('lg')));
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('sm')).assertEqual('2');
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('md')).assertEqual('-1');
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('lg')).assertEqual('6');
      console.info("[ArkUI_Tabs_BarGridAlign_3100] end");
      done();
    });

    
    /**
     * @tc.number   [ArkUI_Tabs_BarGridAlign_3200]
     * @tc.name     [ArkUI_Tabs_BarGridAlign_3200]
     * @tc.desc     [ArkUI_Tabs_BarGridAlign_3200]
     * @tc.level    0
     */
it('[ArkUI_Tabs_BarGridAlign_3200]', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BarGridAlign_3200] start");
      let strJson = inspector.getInspectorByKey('tabsNumberTest');
      console.info("[ArkUI_Tabs_BarGridAlign_3200]: " + strJson)
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barGridAlignSmNumber": 2 as number,
            "barGridAlignMdNumber": null,
            "barGridAlignLgNumber": 6 as number
           } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarGridAlign_3200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BarGridAlign_3200] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('tabsNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BarGridAlign_3200]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign')));
      console.info("[ArkUI_Tabs_BarGridAlign_3200]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('sm')));
      console.info("[ArkUI_Tabs_BarGridAlign_3200]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('md')));
      console.info("[ArkUI_Tabs_BarGridAlign_3200]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('lg')));
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('sm')).assertEqual('2');
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('md')).assertEqual('-1');
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('lg')).assertEqual('6');
      console.info("[ArkUI_Tabs_BarGridAlign_3200] end");
      done();
    });

    
    /**
     * @tc.number   [ArkUI_Tabs_BarGridAlign_3300]
     * @tc.name     [ArkUI_Tabs_BarGridAlign_3300]
     * @tc.desc     [ArkUI_Tabs_BarGridAlign_3300]
     * @tc.level    0
     */
it('[ArkUI_Tabs_BarGridAlign_3300]', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BarGridAlign_3300] start");
      let strJson = inspector.getInspectorByKey('tabsNumberTest');
      console.info("[ArkUI_Tabs_BarGridAlign_3300]: " + strJson)
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barGridAlignSmNumber": 2 as number,
            "barGridAlignMdNumber": 4 as number,
            "barGridAlignLgNumber": 5 as number
           } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarGridAlign_3300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BarGridAlign_3300] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('tabsNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BarGridAlign_3300]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign')));
      console.info("[ArkUI_Tabs_BarGridAlign_3300]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('sm')));
      console.info("[ArkUI_Tabs_BarGridAlign_3300]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('md')));
      console.info("[ArkUI_Tabs_BarGridAlign_3300]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('lg')));
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('sm')).assertEqual('2');
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('md')).assertEqual('4');
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('lg')).assertEqual('-1');
      console.info("[ArkUI_Tabs_BarGridAlign_3300] end");
      done();
    });

    
    /**
     * @tc.number   [ArkUI_Tabs_BarGridAlign_3400]
     * @tc.name     [ArkUI_Tabs_BarGridAlign_3400]
     * @tc.desc     [ArkUI_Tabs_BarGridAlign_3400]
     * @tc.level    0
     */
it('[ArkUI_Tabs_BarGridAlign_3400]', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BarGridAlign_3400] start");
      let strJson = inspector.getInspectorByKey('tabsNumberTest');
      console.info("[ArkUI_Tabs_BarGridAlign_3400]: " + strJson)
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barGridAlignSmNumber": 2 as number,
            "barGridAlignMdNumber": 4 as number,
            "barGridAlignLgNumber": -2 as number
           } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarGridAlign_3400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BarGridAlign_3400] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('tabsNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BarGridAlign_3400]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign')));
      console.info("[ArkUI_Tabs_BarGridAlign_3400]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('sm')));
      console.info("[ArkUI_Tabs_BarGridAlign_3400]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('md')));
      console.info("[ArkUI_Tabs_BarGridAlign_3400]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('lg')));
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('sm')).assertEqual('2');
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('md')).assertEqual('4');
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('lg')).assertEqual('-1');
      console.info("[ArkUI_Tabs_BarGridAlign_3400] end");
      done();
    });

    
    /**
     * @tc.number   [ArkUI_Tabs_BarGridAlign_3500]
     * @tc.name     [ArkUI_Tabs_BarGridAlign_3500]
     * @tc.desc     [ArkUI_Tabs_BarGridAlign_3500]
     * @tc.level    0
     */
it('[ArkUI_Tabs_BarGridAlign_3500]', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BarGridAlign_3500] start");
      let strJson = inspector.getInspectorByKey('tabsNumberTest');
      console.info("[ArkUI_Tabs_BarGridAlign_3500]: " + strJson)
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barGridAlignSmNumber": 2 as number,
            "barGridAlignMdNumber": 4 as number,
            "barGridAlignLgNumber": 100000 as number
           } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarGridAlign_3500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BarGridAlign_3500] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('tabsNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BarGridAlign_3500]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign')));
      console.info("[ArkUI_Tabs_BarGridAlign_3500]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('sm')));
      console.info("[ArkUI_Tabs_BarGridAlign_3500]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('md')));
      console.info("[ArkUI_Tabs_BarGridAlign_3500]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('lg')));
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('sm')).assertEqual('2');
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('md')).assertEqual('4');
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('lg')).assertEqual('-1');
      console.info("[ArkUI_Tabs_BarGridAlign_3500] end");
      done();
    });

    
    /**
     * @tc.number   [ArkUI_Tabs_BarGridAlign_3600]
     * @tc.name     [ArkUI_Tabs_BarGridAlign_3600]
     * @tc.desc     [ArkUI_Tabs_BarGridAlign_3600]
     * @tc.level    0
     */
it('[ArkUI_Tabs_BarGridAlign_3600]', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BarGridAlign_3600] start");
      let strJson = inspector.getInspectorByKey('tabsNumberTest');
      console.info("[ArkUI_Tabs_BarGridAlign_3600]: " + strJson)
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barGridAlignSmNumber": 2 as number,
            "barGridAlignMdNumber": 4 as number,
            "barGridAlignLgNumber": undefined
           } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarGridAlign_3600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BarGridAlign_3600] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('tabsNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BarGridAlign_3600]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign')));
      console.info("[ArkUI_Tabs_BarGridAlign_3600]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('sm')));
      console.info("[ArkUI_Tabs_BarGridAlign_3600]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('md')));
      console.info("[ArkUI_Tabs_BarGridAlign_3600]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('lg')));
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('sm')).assertEqual('2');
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('md')).assertEqual('4');
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('lg')).assertEqual('-1');
      console.info("[ArkUI_Tabs_BarGridAlign_3600] end");
      done();
    });

    
    /**
     * @tc.number   [ArkUI_Tabs_BarGridAlign_3700]
     * @tc.name     [ArkUI_Tabs_BarGridAlign_3700]
     * @tc.desc     [ArkUI_Tabs_BarGridAlign_3700]
     * @tc.level    0
     */
it('[ArkUI_Tabs_BarGridAlign_3700]', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BarGridAlign_3700] start");
      let strJson = inspector.getInspectorByKey('tabsNumberTest');
      console.info("[ArkUI_Tabs_BarGridAlign_3700]: " + strJson)
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barGridAlignSmNumber": 2 as number,
            "barGridAlignMdNumber": 4 as number,
            "barGridAlignLgNumber": null
           } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarGridAlign_3700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BarGridAlign_3700] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('tabsNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BarGridAlign_3700]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign')));
      console.info("[ArkUI_Tabs_BarGridAlign_3700]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('sm')));
      console.info("[ArkUI_Tabs_BarGridAlign_3700]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('md')));
      console.info("[ArkUI_Tabs_BarGridAlign_3700]: " + JSON.stringify(obj.getElement('$attrs').getElement('barGridAlign').getString('lg')));
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('sm')).assertEqual('2');
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('md')).assertEqual('4');
      expect(obj.getElement('$attrs').getElement('barGridAlign').getString('lg')).assertEqual('-1');
      console.info("[ArkUI_Tabs_BarGridAlign_3700] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BarHeight_0100
     * @tc.name     ArkUI_Tabs_BarHeight_0100
     * @tc.desc     ArkUI_Tabs_BarHeight_0100
     * @tc.level    0
     */
it('ArkUI_Tabs_BarHeight_0100', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BarHeight_0100] start");
      let strJson = inspector.getInspectorByKey('tabsStringTest');
      console.info("ArkUI_Tabs_BarHeight: " + strJson)
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barHeightString": "auto"
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarHeight_0100] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BarHeight_0100] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('tabsStringTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BarHeight_0100] barHeight: " + JSON.stringify(obj.getElement('$attrs').getString('barHeight')));
      expect(obj.getElement('$attrs').getString('barHeight')).assertEqual("auto");
      done();
    });

    
    /**
     * @tc.number   [ArkUI_Tabs_BarMode_static_0100]
     * @tc.name     [ArkUI_Tabs_BarMode_static_0100]
     * @tc.desc     [ArkUI_Tabs_BarMode_static_0100]
     * @tc.level    0
     */
it('[ArkUI_Tabs_BarMode_static_0100]', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BarMode_static_0100] start");
      let strJson = inspector.getInspectorByKey('tabsDefaultTest');
      console.info("[ArkUI_Tabs_BarMode_static_0100]: " + strJson);

      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Tabs_BarMode_static_0100]: " + JSON.stringify(obj.getElement('$attrs').getString('barMode')));
      expect(obj.getElement('$attrs').getString('barMode')).assertEqual('BarMode.Fixed');
      console.info("[ArkUI_Tabs_BarMode_static_0100] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BarMode_static_0200
     * @tc.name     ArkUI_Tabs_BarMode_static_0200
     * @tc.desc     ArkUI_Tabs_BarMode_static_0200
     * @tc.level    0
     */
it('ArkUI_Tabs_BarMode_static_0200', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BarMode_static_0200] start");
      let strJson = inspector.getInspectorByKey('tabsNumberTest');
      console.info("[ArkUI_Tabs_BarMode_static_0200]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barModeMode": BarMode.Fixed
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarMode_static_0200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BarMode_static_0200] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('tabsNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BarMode_static_0200]: " + JSON.stringify(obj.getElement('$attrs').getString('barMode')));
      expect(obj.getElement('$attrs').getString('barMode')).assertEqual('BarMode.Fixed');
      console.info("[ArkUI_Tabs_BarMode_static_0200] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BarMode_static_0300
     * @tc.name     ArkUI_Tabs_BarMode_static_0300
     * @tc.desc     ArkUI_Tabs_BarMode_static_0300
     * @tc.level    0
     */
it('ArkUI_Tabs_BarMode_static_0300', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BarMode_static_0300] start");
      let strJson = inspector.getInspectorByKey('tabsNumberTest');
      console.info("[ArkUI_Tabs_BarMode_static_0300]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barModeMode": BarMode.Scrollable
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarMode_static_0300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BarMode_static_0300] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('tabsNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BarMode_static_0300]: " + JSON.stringify(obj.getElement('$attrs').getString('barMode')));
      expect(obj.getElement('$attrs').getString('barMode')).assertEqual('BarMode.Scrollable,{"margin":"0.00vp","nonScrollableLayoutStyle":"LayoutStyle.ALWAYS_CENTER"}');
      console.info("[ArkUI_Tabs_BarMode_static_0300] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BarMode_static_0400
     * @tc.name     ArkUI_Tabs_BarMode_static_0400
     * @tc.desc     ArkUI_Tabs_BarMode_static_0400
     * @tc.level    0
     */
it('ArkUI_Tabs_BarMode_static_0400', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BarMode_static_0400] start");
      let strJson = inspector.getInspectorByKey('tabsStringTest');
      console.info("[ArkUI_Tabs_BarMode_static_0400]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barModeMode": BarMode.Scrollable,
            "barModeMarginString": '10px'
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarMode_static_0400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BarMode_static_0400] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('tabsStringTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BarMode_static_0400]: " + JSON.stringify(obj.getElement('$attrs').getString('barMode')));
      expect(obj.getElement('$attrs').getString('barMode')).assertEqual('BarMode.Scrollable,{"margin":"10.00px","nonScrollableLayoutStyle":"LayoutStyle.ALWAYS_CENTER"}');
      console.info("[ArkUI_Tabs_BarMode_static_0400] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BarMode_static_0500
     * @tc.name     ArkUI_Tabs_BarMode_static_0500
     * @tc.desc     ArkUI_Tabs_BarMode_static_0500
     * @tc.level    0
     */
it('ArkUI_Tabs_BarMode_static_0500', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BarMode_static_0500] start");
      let strJson = inspector.getInspectorByKey('tabsStringTest');
      console.info("[ArkUI_Tabs_BarMode_static_0500]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barModeMode": BarMode.Scrollable,
            "barModeMarginString": '10vp'
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarMode_static_0500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BarMode_static_0500] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('tabsStringTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BarMode_static_0500]: " + JSON.stringify(obj.getElement('$attrs').getString('barMode')));
      expect(obj.getElement('$attrs').getString('barMode')).assertEqual('BarMode.Scrollable,{"margin":"10.00vp","nonScrollableLayoutStyle":"LayoutStyle.ALWAYS_CENTER"}');
      console.info("[ArkUI_Tabs_BarMode_static_0500] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BarMode_static_0600
     * @tc.name     ArkUI_Tabs_BarMode_static_0600
     * @tc.desc     ArkUI_Tabs_BarMode_static_0600
     * @tc.level    0
     */
it('ArkUI_Tabs_BarMode_static_0600', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BarMode_static_0600] start");
      let strJson = inspector.getInspectorByKey('tabsNumberTest');
      console.info("[ArkUI_Tabs_BarMode_static_0600]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barModeMode": BarMode.Scrollable,
            "barModeMarginNumber": 10 as number
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarMode_static_0600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BarMode_static_0600] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('tabsNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BarMode_static_0600]: " + JSON.stringify(obj.getElement('$attrs').getString('barMode')));
      expect(obj.getElement('$attrs').getString('barMode')).assertEqual('BarMode.Scrollable,{"margin":"10.00vp","nonScrollableLayoutStyle":"LayoutStyle.ALWAYS_CENTER"}');
      console.info("[ArkUI_Tabs_BarMode_static_0600] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BarMode_static_0700
     * @tc.name     ArkUI_Tabs_BarMode_static_0700
     * @tc.desc     ArkUI_Tabs_BarMode_static_0700
     * @tc.level    0
     */
it('ArkUI_Tabs_BarMode_static_0700', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BarMode_static_0700] start");
      let strJson = inspector.getInspectorByKey('tabsNumberTest');
      console.info("[ArkUI_Tabs_BarMode_static_0700]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barModeMode": BarMode.Scrollable,
            "barModeMarginNumber": -1 as number
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarMode_static_0700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BarMode_static_0700] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('tabsNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BarMode_static_0600]: " + JSON.stringify(obj.getElement('$attrs').getString('barMode')));
      expect(obj.getElement('$attrs').getString('barMode')).assertEqual('BarMode.Scrollable,{"margin":"0.00vp","nonScrollableLayoutStyle":"LayoutStyle.ALWAYS_CENTER"}');
      console.info("[ArkUI_Tabs_BarMode_static_0600] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BarMode_static_0800
     * @tc.name     ArkUI_Tabs_BarMode_static_0800
     * @tc.desc     ArkUI_Tabs_BarMode_static_0800
     * @tc.level    0
     */
it('ArkUI_Tabs_BarMode_static_0800', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BarMode_static_0800] start");
      let strJson = inspector.getInspectorByKey('tabsNumberTest');
      console.info("[ArkUI_Tabs_BarMode_static_0800]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barModeMode": BarMode.Scrollable,
            "barModeMarginNumber": 100000 as number
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarMode_static_0800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BarMode_static_0800] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('tabsNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BarMode_static_0800]: " + JSON.stringify(obj.getElement('$attrs').getString('barMode')));
      expect(obj.getElement('$attrs').getString('barMode')).assertEqual('BarMode.Scrollable,{"margin":"100000.00vp","nonScrollableLayoutStyle":"LayoutStyle.ALWAYS_CENTER"}');
      console.info("[ArkUI_Tabs_BarMode_static_0800] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BarMode_static_0900
     * @tc.name     ArkUI_Tabs_BarMode_static_0900
     * @tc.desc     ArkUI_Tabs_BarMode_static_0900
     * @tc.level    0
     */
it('ArkUI_Tabs_BarMode_static_0900', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BarMode_static_0900] start");
      let strJson = inspector.getInspectorByKey('tabsStringTest');
      console.info("[ArkUI_Tabs_BarMode_static_0900]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barModeMode": BarMode.Scrollable,
            "barModeMarginString": '10fp'
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarMode_static_0900] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BarMode_static_0900] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('tabsStringTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BarMode_static_0900]: " + JSON.stringify(obj.getElement('$attrs').getString('barMode')));
      expect(obj.getElement('$attrs').getString('barMode')).assertEqual('BarMode.Scrollable,{"margin":"10.00fp","nonScrollableLayoutStyle":"LayoutStyle.ALWAYS_CENTER"}');
      console.info("[ArkUI_Tabs_BarMode_static_0900] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BarMode_1000
     * @tc.name     ArkUI_Tabs_BarMode_1000
     * @tc.desc     ArkUI_Tabs_BarMode_1000
     * @tc.level    0
     */
it('ArkUI_Tabs_BarMode_1000', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BarMode_1000] start");
      let strJson = inspector.getInspectorByKey('tabsStringTest');
      console.info("[ArkUI_Tabs_BarMode_1000]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barModeMode": BarMode.Scrollable,
            "barModeMarginString": '10lpx'
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarMode_1000] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BarMode_1000] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('tabsStringTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BarMode_1000]: " + JSON.stringify(obj.getElement('$attrs').getString('barMode')));
      expect(obj.getElement('$attrs').getString('barMode')).assertEqual('BarMode.Scrollable,{"margin":"10.00lpx","nonScrollableLayoutStyle":"LayoutStyle.ALWAYS_CENTER"}');
      console.info("[ArkUI_Tabs_BarMode_1000] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BarMode_1100
     * @tc.name     ArkUI_Tabs_BarMode_1100
     * @tc.desc     ArkUI_Tabs_BarMode_1100
     * @tc.level    0
     */
it('ArkUI_Tabs_BarMode_1100', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BarMode_1100] start");
      let strJson = inspector.getInspectorByKey('tabsResourceTest');
      console.info("[ArkUI_Tabs_BarMode_1100]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barModeMode": BarMode.Scrollable
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarMode_1000] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BarMode_1000] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('tabsResourceTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BarMode_1100]: " + JSON.stringify(obj.getElement('$attrs').getString('barMode')));
      expect(obj.getElement('$attrs').getString('barMode')).assertEqual('BarMode.Scrollable,{"margin":"8.00px","nonScrollableLayoutStyle":"LayoutStyle.ALWAYS_CENTER"}');
      console.info("[ArkUI_Tabs_BarMode_1100] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BarMode_1200
     * @tc.name     ArkUI_Tabs_BarMode_1200
     * @tc.desc     ArkUI_Tabs_BarMode_1200
     * @tc.level    0
     */
it('ArkUI_Tabs_BarMode_1200', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BarMode_1200] start");
      let strJson = inspector.getInspectorByKey('tabsNumberTest');
      console.info("[ArkUI_Tabs_BarMode_1200]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barModeMode": BarMode.Scrollable,
            "barModeMarginNumber": undefined
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarMode_1200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BarMode_1200] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('tabsNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BarMode_1200]: " + JSON.stringify(obj.getElement('$attrs').getString('barMode')));
      expect(obj.getElement('$attrs').getString('barMode')).assertEqual('BarMode.Scrollable,{"margin":"0.00vp","nonScrollableLayoutStyle":"LayoutStyle.ALWAYS_CENTER"}');
      console.info("[ArkUI_Tabs_BarMode_1200] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BarMode_1300
     * @tc.name     ArkUI_Tabs_BarMode_1300
     * @tc.desc     ArkUI_Tabs_BarMode_1300
     * @tc.level    0
     */
it('ArkUI_Tabs_BarMode_1300', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BarMode_1300] start");
      let strJson = inspector.getInspectorByKey('tabsNumberTest');
      console.info("[ArkUI_Tabs_BarMode_1300]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barModeMode": BarMode.Scrollable,
            "barModeMarginNumber": null
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarMode_1300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BarMode_1300] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('tabsNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BarMode_1300]: " + JSON.stringify(obj.getElement('$attrs').getString('barMode')));
      expect(obj.getElement('$attrs').getString('barMode')).assertEqual('BarMode.Scrollable,{"margin":"0.00vp","nonScrollableLayoutStyle":"LayoutStyle.ALWAYS_CENTER"}');
      console.info("[ArkUI_Tabs_BarMode_1300] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BarMode_1400
     * @tc.name     ArkUI_Tabs_BarMode_1400
     * @tc.desc     ArkUI_Tabs_BarMode_1400
     * @tc.level    0
     */
it('ArkUI_Tabs_BarMode_1400', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BarMode_1400] start");
      let strJson = inspector.getInspectorByKey('tabsNumberTest');
      console.info("[ArkUI_Tabs_BarMode_1400]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barModeMode": BarMode.Scrollable,
            "barModeNonScrollableLayoutStyle": LayoutStyle.ALWAYS_CENTER
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarMode_1400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BarMode_1400] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('tabsNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BarMode_1400]: " + JSON.stringify(obj.getElement('$attrs').getString('barMode')));
      expect(obj.getElement('$attrs').getString('barMode')).assertEqual('BarMode.Scrollable,{"margin":"0.00vp","nonScrollableLayoutStyle":"LayoutStyle.ALWAYS_CENTER"}');
      console.info("[ArkUI_Tabs_BarMode_1400] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BarMode_1500
     * @tc.name     ArkUI_Tabs_BarMode_1500
     * @tc.desc     ArkUI_Tabs_BarMode_1500
     * @tc.level    0
     */
it('ArkUI_Tabs_BarMode_1500', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BarMode_1500] start");
      let strJson = inspector.getInspectorByKey('tabsNumberTest');
      console.info("[ArkUI_Tabs_BarMode_1500]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barModeMode": BarMode.Scrollable,
            "barModeNonScrollableLayoutStyle": LayoutStyle.ALWAYS_AVERAGE_SPLIT
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarMode_1500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BarMode_1500] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('tabsNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BarMode_1500]: " + JSON.stringify(obj.getElement('$attrs').getString('barMode')));
      expect(obj.getElement('$attrs').getString('barMode')).assertEqual('BarMode.Scrollable,{"margin":"0.00vp","nonScrollableLayoutStyle":"LayoutStyle.ALWAYS_AVERAGE_SPLIT"}');
      console.info("[ArkUI_Tabs_BarMode_1500] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BarMode_1600
     * @tc.name     ArkUI_Tabs_BarMode_1600
     * @tc.desc     ArkUI_Tabs_BarMode_1600
     * @tc.level    0
     */
it('ArkUI_Tabs_BarMode_1600', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BarMode_1600] start");
      let strJson = inspector.getInspectorByKey('tabsNumberTest');
      console.info("[ArkUI_Tabs_BarMode_1600]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barModeMode": BarMode.Scrollable,
            "barModeNonScrollableLayoutStyle": LayoutStyle.SPACE_BETWEEN_OR_CENTER
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarMode_1600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BarMode_1600] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('tabsNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BarMode_1600]: " + JSON.stringify(obj.getElement('$attrs').getString('barMode')));
      expect(obj.getElement('$attrs').getString('barMode')).assertEqual('BarMode.Scrollable,{"margin":"0.00vp","nonScrollableLayoutStyle":"LayoutStyle.SPACE_BETWEEN_OR_CENTER"}');
      console.info("[ArkUI_Tabs_BarMode_1600] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BarMode_1700
     * @tc.name     ArkUI_Tabs_BarMode_1700
     * @tc.desc     ArkUI_Tabs_BarMode_1700
     * @tc.level    0
     */
it('ArkUI_Tabs_BarMode_1700', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BarMode_1700] start");
      let strJson = inspector.getInspectorByKey('tabsNumberTest');
      console.info("[ArkUI_Tabs_BarMode_1700]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barModeMode": BarMode.Scrollable,
            "barModeNonScrollableLayoutStyle": undefined
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarMode_1700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BarMode_1700] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('tabsNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BarMode_1700]: " + JSON.stringify(obj.getElement('$attrs').getString('barMode')));
      expect(obj.getElement('$attrs').getString('barMode')).assertEqual('BarMode.Scrollable,{"margin":"0.00vp","nonScrollableLayoutStyle":"LayoutStyle.ALWAYS_CENTER"}');
      console.info("[ArkUI_Tabs_BarMode_1700] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BarMode_1800
     * @tc.name     ArkUI_Tabs_BarMode_1800
     * @tc.desc     ArkUI_Tabs_BarMode_1800
     * @tc.level    0
     */
it('ArkUI_Tabs_BarMode_1800', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BarMode_1800] start");
      let strJson = inspector.getInspectorByKey('tabsNumberTest');
      console.info("[ArkUI_Tabs_BarMode_1800]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barModeMode": BarMode.Scrollable,
            "barModeNonScrollableLayoutStyle": null
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarMode_1800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BarMode_1800] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('tabsNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BarMode_1800]: " + JSON.stringify(obj.getElement('$attrs').getString('barMode')));
      expect(obj.getElement('$attrs').getString('barMode')).assertEqual('BarMode.Scrollable,{"margin":"0.00vp","nonScrollableLayoutStyle":"LayoutStyle.ALWAYS_CENTER"}');
      console.info("[ArkUI_Tabs_BarMode_1800] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BarMode_1900
     * @tc.name     ArkUI_Tabs_BarMode_1900
     * @tc.desc     ArkUI_Tabs_BarMode_1900
     * @tc.level    0
     */
it('ArkUI_Tabs_BarMode_1900', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BarMode_1900] start");
      let strJson = inspector.getInspectorByKey('tabsNumberTest');
      console.info("[ArkUI_Tabs_BarMode_1900]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barModeMode": BarMode.Fixed,
            "barModeMarginString": '10px',
            "barModeNonScrollableLayoutStyle": LayoutStyle.ALWAYS_CENTER
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BarMode_1900] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BarMode_1900] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('tabsNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BarMode_1900]: " + JSON.stringify(obj.getElement('$attrs').getString('barMode')));
      expect(obj.getElement('$attrs').getString('barMode')).assertEqual('BarMode.Fixed');
      console.info("[ArkUI_Tabs_BarMode_1900] end");
      done();
    });

    
    /**
     * @tc.number   [ArkUI_Tabs_SubTabBarStylePadding_0100]
     * @tc.name     [ArkUI_Tabs_SubTabBarStylePadding_0100]
     * @tc.desc     [ArkUI_Tabs_SubTabBarStylePadding_0100]
     * @tc.level    0
     */
it('[ArkUI_Tabs_SubTabBarStylePadding_0100]', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0100] start");
      let strJson = inspector.getInspectorByKey('subTabBarDefaultTest');
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0100]: " + strJson);

      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0100]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0100]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('padding')));
      let topJsonJudge = inspector.getInspectorByKey('subTabBarDefaultTestTopJudge');
      let objTopJudge = JSON.parseJsonElement(topJsonJudge);
      let rightJsonJudge = inspector.getInspectorByKey('subTabBarDefaultTestRightJudge');
      let objRightJudge = JSON.parseJsonElement(rightJsonJudge);
      let bottomJsonJudge = inspector.getInspectorByKey('subTabBarDefaultTestBottomJudge');
      let objBottomJudge = JSON.parseJsonElement(bottomJsonJudge);
      let leftJsonJudge = inspector.getInspectorByKey('subTabBarDefaultTestLeftJudge');
      let objLeftJudge = JSON.parseJsonElement(leftJsonJudge);
      let resultString =  '{"top":"' + objTopJudge.getElement('$attrs').getString('width') + '","right":"' + objRightJudge.getElement('$attrs').getString('width') + '","bottom":"' + objBottomJudge.getElement('$attrs').getString('width') + '","left":"' + objLeftJudge.getElement('$attrs').getString('width') + '"}';
      expect(obj.getElement('$attrs').getElement('tabBar').getString('padding')).assertEqual(resultString);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0100] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_SubTabBarStylePadding_0200
     * @tc.name     ArkUI_Tabs_SubTabBarStylePadding_0200
     * @tc.desc     ArkUI_Tabs_SubTabBarStylePadding_0200
     * @tc.level    0
     */
it('ArkUI_Tabs_SubTabBarStylePadding_0200', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0200] start");
      let strJson = inspector.getInspectorByKey('subTabBarNumberTest');
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0200]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "subTabBarStylePaddingNumber": 10 as number
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_SubTabBarStylePadding_0200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_SubTabBarStylePadding_0200] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('subTabBarNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0200]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0200]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('padding')));
      expect(obj.getElement('$attrs').getElement('tabBar').getString('padding')).assertEqual('10.00vp');
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0200] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_SubTabBarStylePadding_0300
     * @tc.name     ArkUI_Tabs_SubTabBarStylePadding_0300
     * @tc.desc     ArkUI_Tabs_SubTabBarStylePadding_0300
     * @tc.level    0
     */
it('ArkUI_Tabs_SubTabBarStylePadding_0300', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0300] start");
      let strJson = inspector.getInspectorByKey('subTabBarStringTest');
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0300]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "subTabBarStylePaddingString": '10.00px',
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_SubTabBarStylePadding_0300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_SubTabBarStylePadding_0300] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('subTabBarStringTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0300]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0300]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('padding')));
      expect(obj.getElement('$attrs').getElement('tabBar').getString('padding')).assertEqual('10.00px');
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0300] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_SubTabBarStylePadding_0400
     * @tc.name     ArkUI_Tabs_SubTabBarStylePadding_0400
     * @tc.desc     ArkUI_Tabs_SubTabBarStylePadding_0400
     * @tc.level    0
     */
it('ArkUI_Tabs_SubTabBarStylePadding_0400', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0400] start");
      let strJson = inspector.getInspectorByKey('subTabBarResourceTest');
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0400]: " + strJson);

      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0400]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0400]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('padding')));
      expect(obj.getElement('$attrs').getElement('tabBar').getString('padding')).assertEqual('10.00vp');
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0400] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_SubTabBarStylePadding_0500
     * @tc.name     ArkUI_Tabs_SubTabBarStylePadding_0500
     * @tc.desc     ArkUI_Tabs_SubTabBarStylePadding_0500
     * @tc.level    0
     */
it('ArkUI_Tabs_SubTabBarStylePadding_0500', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0500] start");
      let strJson = inspector.getInspectorByKey('subTabBarNumberTest');
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0500]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "subTabBarStylePaddingNumber": -1 as number
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_SubTabBarStylePadding_0500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_SubTabBarStylePadding_0500] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('subTabBarNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0500]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0500]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('padding')));
      let topJsonJudge = inspector.getInspectorByKey('subTabBarDefaultTestTopJudge');
      let objTopJudge = JSON.parseJsonElement(topJsonJudge);
      let rightJsonJudge = inspector.getInspectorByKey('subTabBarDefaultTestRightJudge');
      let objRightJudge = JSON.parseJsonElement(rightJsonJudge);
      let bottomJsonJudge = inspector.getInspectorByKey('subTabBarDefaultTestBottomJudge');
      let objBottomJudge = JSON.parseJsonElement(bottomJsonJudge);
      let leftJsonJudge = inspector.getInspectorByKey('subTabBarDefaultTestLeftJudge');
      let objLeftJudge = JSON.parseJsonElement(leftJsonJudge);
      let resultString =  '{"top":"' + objTopJudge.getElement('$attrs').getString('width') + '","right":"' + objRightJudge.getElement('$attrs').getString('width') + '","bottom":"' + objBottomJudge.getElement('$attrs').getString('width') + '","left":"' + objLeftJudge.getElement('$attrs').getString('width') + '"}';
      expect(obj.getElement('$attrs').getElement('tabBar').getString('padding')).assertEqual(resultString);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0500] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_SubTabBarStylePadding_0600
     * @tc.name     ArkUI_Tabs_SubTabBarStylePadding_0600
     * @tc.desc     ArkUI_Tabs_SubTabBarStylePadding_0600
     * @tc.level    0
     */
it('ArkUI_Tabs_SubTabBarStylePadding_0600', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0600] start");
      let strJson = inspector.getInspectorByKey('subTabBarNumberTest');
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0600]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "subTabBarStylePaddingNumber": 100000 as number
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_SubTabBarStylePadding_0600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_SubTabBarStylePadding_0600] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('subTabBarNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0600]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0600]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('padding')));
      expect(obj.getElement('$attrs').getElement('tabBar').getString('padding')).assertEqual('100000.00vp');
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0600] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_SubTabBarStylePadding_0700
     * @tc.name     ArkUI_Tabs_SubTabBarStylePadding_0700
     * @tc.desc     ArkUI_Tabs_SubTabBarStylePadding_0700
     * @tc.level    0
     */
it('ArkUI_Tabs_SubTabBarStylePadding_0700', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0700] start");
      let strJson = inspector.getInspectorByKey('subTabBarNumberTest');
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0700]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "subTabBarStylePaddingNumber": undefined
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_SubTabBarStylePadding_0700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_SubTabBarStylePadding_0700] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('subTabBarNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0700]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0700]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('padding')));
      let topJsonJudge = inspector.getInspectorByKey('subTabBarDefaultTestTopJudge');
      let objTopJudge = JSON.parseJsonElement(topJsonJudge);
      let rightJsonJudge = inspector.getInspectorByKey('subTabBarDefaultTestRightJudge');
      let objRightJudge = JSON.parseJsonElement(rightJsonJudge);
      let bottomJsonJudge = inspector.getInspectorByKey('subTabBarDefaultTestBottomJudge');
      let objBottomJudge = JSON.parseJsonElement(bottomJsonJudge);
      let leftJsonJudge = inspector.getInspectorByKey('subTabBarDefaultTestLeftJudge');
      let objLeftJudge = JSON.parseJsonElement(leftJsonJudge);
      let resultString =  '{"top":"' + objTopJudge.getElement('$attrs').getString('width') + '","right":"' + objRightJudge.getElement('$attrs').getString('width') + '","bottom":"' + objBottomJudge.getElement('$attrs').getString('width') + '","left":"' + objLeftJudge.getElement('$attrs').getString('width') + '"}';
      expect(obj.getElement('$attrs').getElement('tabBar').getString('padding')).assertEqual(resultString);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0700] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_SubTabBarStylePadding_0800
     * @tc.name     ArkUI_Tabs_SubTabBarStylePadding_0800
     * @tc.desc     ArkUI_Tabs_SubTabBarStylePadding_0800
     * @tc.level    0
     */
it('ArkUI_Tabs_SubTabBarStylePadding_0800', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0800] start");
      let strJson = inspector.getInspectorByKey('subTabBarNumberTest');
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0800]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "subTabBarStylePaddingNumber": null
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_SubTabBarStylePadding_0800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_SubTabBarStylePadding_0800] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('subTabBarNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0800]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0800]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('padding')));
      let topJsonJudge = inspector.getInspectorByKey('subTabBarDefaultTestTopJudge');
      let objTopJudge = JSON.parseJsonElement(topJsonJudge);
      let rightJsonJudge = inspector.getInspectorByKey('subTabBarDefaultTestRightJudge');
      let objRightJudge = JSON.parseJsonElement(rightJsonJudge);
      let bottomJsonJudge = inspector.getInspectorByKey('subTabBarDefaultTestBottomJudge');
      let objBottomJudge = JSON.parseJsonElement(bottomJsonJudge);
      let leftJsonJudge = inspector.getInspectorByKey('subTabBarDefaultTestLeftJudge');
      let objLeftJudge = JSON.parseJsonElement(leftJsonJudge);
      let resultString =  '{"top":"' + objTopJudge.getElement('$attrs').getString('width') + '","right":"' + objRightJudge.getElement('$attrs').getString('width') + '","bottom":"' + objBottomJudge.getElement('$attrs').getString('width') + '","left":"' + objLeftJudge.getElement('$attrs').getString('width') + '"}';
      expect(obj.getElement('$attrs').getElement('tabBar').getString('padding')).assertEqual(resultString);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0800] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_SubTabBarStylePadding_0900
     * @tc.name     ArkUI_Tabs_SubTabBarStylePadding_0900
     * @tc.desc     ArkUI_Tabs_SubTabBarStylePadding_0900
     * @tc.level    0
     */
it('ArkUI_Tabs_SubTabBarStylePadding_0900', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0900] start");
      let strJson = inspector.getInspectorByKey('subTabBarStylePaddingNumberTest');
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0900]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "subTabBarStylePaddingTopNumber": 6 as number,
            "subTabBarStylePaddingRightNumber": 6 as number,
            "subTabBarStylePaddingBottomNumber": 6 as number,
            "subTabBarStylePaddingLeftNumber": 6 as number
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_SubTabBarStylePadding_0900] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_SubTabBarStylePadding_0900] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('subTabBarStylePaddingNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0900]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0900]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('padding')));
      expect(obj.getElement('$attrs').getElement('tabBar').getString('padding')).assertEqual('6.00vp');
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_0900] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_SubTabBarStylePadding_1000
     * @tc.name     ArkUI_Tabs_SubTabBarStylePadding_1000
     * @tc.desc     ArkUI_Tabs_SubTabBarStylePadding_1000
     * @tc.level    0
     */
it('ArkUI_Tabs_SubTabBarStylePadding_1000', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1000] start");
      let strJson = inspector.getInspectorByKey('subTabBarStylePaddingStringTest');
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1000]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "subTabBarStylePaddingTopString": '10.00px',
            "subTabBarStylePaddingRightString": '10.00px',
            "subTabBarStylePaddingBottomString": '10.00px',
            "subTabBarStylePaddingLeftString": '10.00px'
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_SubTabBarStylePadding_1000] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_SubTabBarStylePadding_1000] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('subTabBarStylePaddingStringTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1000]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1000]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('padding')));
      expect(obj.getElement('$attrs').getElement('tabBar').getString('padding')).assertEqual('10.00px');
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1000] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_SubTabBarStylePadding_1100
     * @tc.name     ArkUI_Tabs_SubTabBarStylePadding_1100
     * @tc.desc     ArkUI_Tabs_SubTabBarStylePadding_1100
     * @tc.level    0
     */
it('ArkUI_Tabs_SubTabBarStylePadding_1100', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1100] start");
      let strJson = inspector.getInspectorByKey('subTabBarStylePaddingResourceTest');
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1100]: " + strJson);

      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1100]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1100]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('padding')));
      expect(obj.getElement('$attrs').getElement('tabBar').getString('padding')).assertEqual('10.00vp');
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1100] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_SubTabBarStylePadding_1200
     * @tc.name     ArkUI_Tabs_SubTabBarStylePadding_1200
     * @tc.desc     ArkUI_Tabs_SubTabBarStylePadding_1200
     * @tc.level    0
     */
it('ArkUI_Tabs_SubTabBarStylePadding_1200', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1200] start");
      let strJson = inspector.getInspectorByKey('subTabBarStylePaddingNumberTest');
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1200]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "subTabBarStylePaddingTopNumber": -1 as number,
            "subTabBarStylePaddingRightNumber": 6 as number,
            "subTabBarStylePaddingBottomNumber": 6 as number,
            "subTabBarStylePaddingLeftNumber": 6 as number
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_SubTabBarStylePadding_1200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_SubTabBarStylePadding_1200] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('subTabBarStylePaddingNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      let newJsonJudge = inspector.getInspectorByKey('subTabBarDefaultTestTopJudge');
      let objJudge = JSON.parseJsonElement(newJsonJudge);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1200]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1200]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('padding')));
      let resultString =  '{"top":"' + objJudge.getElement('$attrs').getString('width') + '","right":"6.00vp","bottom":"6.00vp","left":"6.00vp"}';
      expect(obj.getElement('$attrs').getElement('tabBar').getString('padding')).assertEqual(resultString);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1200] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_SubTabBarStylePadding_1300
     * @tc.name     ArkUI_Tabs_SubTabBarStylePadding_1300
     * @tc.desc     ArkUI_Tabs_SubTabBarStylePadding_1300
     * @tc.level    0
     */
it('ArkUI_Tabs_SubTabBarStylePadding_1300', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1300] start");
      let strJson = inspector.getInspectorByKey('subTabBarStylePaddingNumberTest');
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1300]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "subTabBarStylePaddingTopNumber": 100000 as number,
            "subTabBarStylePaddingRightNumber": 6 as number,
            "subTabBarStylePaddingBottomNumber": 6 as number,
            "subTabBarStylePaddingLeftNumber": 6 as number
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_SubTabBarStylePadding_1300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_SubTabBarStylePadding_1300] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('subTabBarStylePaddingNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1300]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1300]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('padding')));
      let resultString =  '{"top":"100000.00vp","right":"6.00vp","bottom":"6.00vp","left":"6.00vp"}';
      expect(obj.getElement('$attrs').getElement('tabBar').getString('padding')).assertEqual(resultString);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1300] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_SubTabBarStylePadding_1400
     * @tc.name     ArkUI_Tabs_SubTabBarStylePadding_1400
     * @tc.desc     ArkUI_Tabs_SubTabBarStylePadding_1400
     * @tc.level    0
     */
it('ArkUI_Tabs_SubTabBarStylePadding_1400', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1400] start");
      let strJson = inspector.getInspectorByKey('subTabBarStylePaddingNumberTest');
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1400]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "subTabBarStylePaddingTopNumber": undefined,
            "subTabBarStylePaddingRightNumber": 6 as number,
            "subTabBarStylePaddingBottomNumber": 6 as number,
            "subTabBarStylePaddingLeftNumber": 6 as number
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_SubTabBarStylePadding_1400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_SubTabBarStylePadding_1400] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('subTabBarStylePaddingNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      let newJsonJudge = inspector.getInspectorByKey('subTabBarDefaultTestTopJudge');
      let objJudge = JSON.parseJsonElement(newJsonJudge);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1400]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1400]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('padding')));
      let resultString =  '{"top":"' + objJudge.getElement('$attrs').getString('width') + '","right":"6.00vp","bottom":"6.00vp","left":"6.00vp"}';
      expect(obj.getElement('$attrs').getElement('tabBar').getString('padding')).assertEqual(resultString);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1400] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_SubTabBarStylePadding_1500
     * @tc.name     ArkUI_Tabs_SubTabBarStylePadding_1500
     * @tc.desc     ArkUI_Tabs_SubTabBarStylePadding_1500
     * @tc.level    0
     */
it('ArkUI_Tabs_SubTabBarStylePadding_1500', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1500] start");
      let strJson = inspector.getInspectorByKey('subTabBarStylePaddingNumberTest');
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1500]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "subTabBarStylePaddingTopNumber": null,
            "subTabBarStylePaddingRightNumber": 6 as number,
            "subTabBarStylePaddingBottomNumber": 6 as number,
            "subTabBarStylePaddingLeftNumber": 6 as number
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_SubTabBarStylePadding_1500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_SubTabBarStylePadding_1500] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('subTabBarStylePaddingNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      let newJsonJudge = inspector.getInspectorByKey('subTabBarDefaultTestTopJudge');
      let objJudge = JSON.parseJsonElement(newJsonJudge);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1500]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1500]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('padding')));
      let resultString =  '{"top":"' + objJudge.getElement('$attrs').getString('width') + '","right":"6.00vp","bottom":"6.00vp","left":"6.00vp"}';
      expect(obj.getElement('$attrs').getElement('tabBar').getString('padding')).assertEqual(resultString);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1500] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_SubTabBarStylePadding_1600
     * @tc.name     ArkUI_Tabs_SubTabBarStylePadding_1600
     * @tc.desc     ArkUI_Tabs_SubTabBarStylePadding_1600
     * @tc.level    0
     */
it('ArkUI_Tabs_SubTabBarStylePadding_1600', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1600] start");
      let strJson = inspector.getInspectorByKey('subTabBarStylePaddingNumberTest');
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1600]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "subTabBarStylePaddingTopNumber": 6 as number,
            "subTabBarStylePaddingRightNumber": -1 as number,
            "subTabBarStylePaddingBottomNumber": 6 as number,
            "subTabBarStylePaddingLeftNumber": 6 as number
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_SubTabBarStylePadding_1600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_SubTabBarStylePadding_1600] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('subTabBarStylePaddingNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      let newJsonJudge = inspector.getInspectorByKey('subTabBarDefaultTestRightJudge');
      let objJudge = JSON.parseJsonElement(newJsonJudge);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1600]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1600]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('padding')));
      let resultString =  '{"top":"6.00vp","right":"' + objJudge.getElement('$attrs').getString('width') + '","bottom":"6.00vp","left":"6.00vp"}';
      expect(obj.getElement('$attrs').getElement('tabBar').getString('padding')).assertEqual(resultString);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1600] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_SubTabBarStylePadding_1700
     * @tc.name     ArkUI_Tabs_SubTabBarStylePadding_1700
     * @tc.desc     ArkUI_Tabs_SubTabBarStylePadding_1700
     * @tc.level    0
     */
it('ArkUI_Tabs_SubTabBarStylePadding_1700', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1700] start");
      let strJson = inspector.getInspectorByKey('subTabBarStylePaddingNumberTest');
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1700]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "subTabBarStylePaddingTopNumber": 6 as number,
            "subTabBarStylePaddingRightNumber": 100000 as number,
            "subTabBarStylePaddingBottomNumber": 6 as number,
            "subTabBarStylePaddingLeftNumber": 6 as number
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_SubTabBarStylePadding_1700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_SubTabBarStylePadding_1700] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('subTabBarStylePaddingNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1700]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1700]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('padding')));
      let resultString =  '{"top":"6.00vp","right":"100000.00vp","bottom":"6.00vp","left":"6.00vp"}';
      expect(obj.getElement('$attrs').getElement('tabBar').getString('padding')).assertEqual(resultString);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1700] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_SubTabBarStylePadding_1800
     * @tc.name     ArkUI_Tabs_SubTabBarStylePadding_1800
     * @tc.desc     ArkUI_Tabs_SubTabBarStylePadding_1800
     * @tc.level    0
     */
it('ArkUI_Tabs_SubTabBarStylePadding_1800', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1800] start");
      let strJson = inspector.getInspectorByKey('subTabBarStylePaddingNumberTest');
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1800]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "subTabBarStylePaddingTopNumber": 6 as number,
            "subTabBarStylePaddingRightNumber": undefined,
            "subTabBarStylePaddingBottomNumber": 6 as number,
            "subTabBarStylePaddingLeftNumber": 6 as number
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_SubTabBarStylePadding_1800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_SubTabBarStylePadding_1800] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('subTabBarStylePaddingNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      let newJsonJudge = inspector.getInspectorByKey('subTabBarDefaultTestRightJudge');
      let objJudge = JSON.parseJsonElement(newJsonJudge);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1800]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1800]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('padding')));
      let resultString =  '{"top":"6.00vp","right":"' + objJudge.getElement('$attrs').getString('width') + '","bottom":"6.00vp","left":"6.00vp"}';
      expect(obj.getElement('$attrs').getElement('tabBar').getString('padding')).assertEqual(resultString);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1800] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_SubTabBarStylePadding_1900
     * @tc.name     ArkUI_Tabs_SubTabBarStylePadding_1900
     * @tc.desc     ArkUI_Tabs_SubTabBarStylePadding_1900
     * @tc.level    0
     */
it('ArkUI_Tabs_SubTabBarStylePadding_1900', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1900] start");
      let strJson = inspector.getInspectorByKey('subTabBarStylePaddingNumberTest');
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1900]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "subTabBarStylePaddingTopNumber": 6 as number,
            "subTabBarStylePaddingRightNumber": null,
            "subTabBarStylePaddingBottomNumber": 6 as number,
            "subTabBarStylePaddingLeftNumber": 6 as number
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_SubTabBarStylePadding_1900] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_SubTabBarStylePadding_1900] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('subTabBarStylePaddingNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      let newJsonJudge = inspector.getInspectorByKey('subTabBarDefaultTestRightJudge');
      let objJudge = JSON.parseJsonElement(newJsonJudge);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1900]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1900]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('padding')));
      let resultString =  '{"top":"6.00vp","right":"' + objJudge.getElement('$attrs').getString('width') + '","bottom":"6.00vp","left":"6.00vp"}';
      expect(obj.getElement('$attrs').getElement('tabBar').getString('padding')).assertEqual(resultString);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_1900] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_SubTabBarStylePadding_2000
     * @tc.name     ArkUI_Tabs_SubTabBarStylePadding_2000
     * @tc.desc     ArkUI_Tabs_SubTabBarStylePadding_2000
     * @tc.level    0
     */
it('ArkUI_Tabs_SubTabBarStylePadding_2000', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_2000] start");
      let strJson = inspector.getInspectorByKey('subTabBarStylePaddingNumberTest');
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_2000]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "subTabBarStylePaddingTopNumber": 6 as number,
            "subTabBarStylePaddingRightNumber": 6 as number,
            "subTabBarStylePaddingBottomNumber": -1 as number,
            "subTabBarStylePaddingLeftNumber": 6 as number
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_SubTabBarStylePadding_2000] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_SubTabBarStylePadding_2000] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('subTabBarStylePaddingNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      let newJsonJudge = inspector.getInspectorByKey('subTabBarDefaultTestBottomJudge');
      let objJudge = JSON.parseJsonElement(newJsonJudge);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_2000]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_2000]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('padding')));
      let resultString =  '{"top":"6.00vp","right":"6.00vp","bottom":"' + objJudge.getElement('$attrs').getString('width') + '","left":"6.00vp"}';
      expect(obj.getElement('$attrs').getElement('tabBar').getString('padding')).assertEqual(resultString);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_2000] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_SubTabBarStylePadding_2100
     * @tc.name     ArkUI_Tabs_SubTabBarStylePadding_2100
     * @tc.desc     ArkUI_Tabs_SubTabBarStylePadding_2100
     * @tc.level    0
     */
it('ArkUI_Tabs_SubTabBarStylePadding_2100', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_2100] start");
      let strJson = inspector.getInspectorByKey('subTabBarStylePaddingNumberTest');
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_2100]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "subTabBarStylePaddingTopNumber": 6 as number,
            "subTabBarStylePaddingRightNumber": 6 as number,
            "subTabBarStylePaddingBottomNumber": 100000 as number,
            "subTabBarStylePaddingLeftNumber": 6 as number
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_SubTabBarStylePadding_2100] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_SubTabBarStylePadding_2100] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('subTabBarStylePaddingNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_2100]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_2100]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('padding')));
      let resultString =  '{"top":"6.00vp","right":"6.00vp","bottom":"100000.00vp","left":"6.00vp"}';
      expect(obj.getElement('$attrs').getElement('tabBar').getString('padding')).assertEqual(resultString);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_2100] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_SubTabBarStylePadding_2200
     * @tc.name     ArkUI_Tabs_SubTabBarStylePadding_2200
     * @tc.desc     ArkUI_Tabs_SubTabBarStylePadding_2200
     * @tc.level    0
     */
it('ArkUI_Tabs_SubTabBarStylePadding_2200', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_2200] start");
      let strJson = inspector.getInspectorByKey('subTabBarStylePaddingNumberTest');
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_2200]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "subTabBarStylePaddingTopNumber": 6 as number,
            "subTabBarStylePaddingRightNumber": 6 as number,
            "subTabBarStylePaddingBottomNumber": undefined,
            "subTabBarStylePaddingLeftNumber": 6 as number
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_SubTabBarStylePadding_2200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_SubTabBarStylePadding_2200] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('subTabBarStylePaddingNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      let newJsonJudge = inspector.getInspectorByKey('subTabBarDefaultTestBottomJudge');
      let objJudge = JSON.parseJsonElement(newJsonJudge);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_2200]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_2200]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('padding')));
      let resultString =  '{"top":"6.00vp","right":"6.00vp","bottom":"' + objJudge.getElement('$attrs').getString('width') + '","left":"6.00vp"}';
      expect(obj.getElement('$attrs').getElement('tabBar').getString('padding')).assertEqual(resultString);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_2200] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_SubTabBarStylePadding_2300
     * @tc.name     ArkUI_Tabs_SubTabBarStylePadding_2300
     * @tc.desc     ArkUI_Tabs_SubTabBarStylePadding_2300
     * @tc.level    0
     */
it('ArkUI_Tabs_SubTabBarStylePadding_2300', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_2300] start");
      let strJson = inspector.getInspectorByKey('subTabBarStylePaddingNumberTest');
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_2300]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "subTabBarStylePaddingTopNumber": 6 as number,
            "subTabBarStylePaddingRightNumber": 6 as number,
            "subTabBarStylePaddingBottomNumber": null,
            "subTabBarStylePaddingLeftNumber": 6 as number
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_SubTabBarStylePadding_2300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_SubTabBarStylePadding_2300] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('subTabBarStylePaddingNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      let newJsonJudge = inspector.getInspectorByKey('subTabBarDefaultTestBottomJudge');
      let objJudge = JSON.parseJsonElement(newJsonJudge);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_2300]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_2300]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('padding')));
      let resultString =  '{"top":"6.00vp","right":"6.00vp","bottom":"' + objJudge.getElement('$attrs').getString('width') + '","left":"6.00vp"}';
      expect(obj.getElement('$attrs').getElement('tabBar').getString('padding')).assertEqual(resultString);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_2300] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_SubTabBarStylePadding_2400
     * @tc.name     ArkUI_Tabs_SubTabBarStylePadding_2400
     * @tc.desc     ArkUI_Tabs_SubTabBarStylePadding_2400
     * @tc.level    0
     */
it('ArkUI_Tabs_SubTabBarStylePadding_2400', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_2400] start");
      let strJson = inspector.getInspectorByKey('subTabBarStylePaddingNumberTest');
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_2400]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "subTabBarStylePaddingTopNumber": 6 as number,
            "subTabBarStylePaddingRightNumber": 6 as number,
            "subTabBarStylePaddingBottomNumber": 6 as number,
            "subTabBarStylePaddingLeftNumber": -1 as number
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_SubTabBarStylePadding_2400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_SubTabBarStylePadding_2400] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('subTabBarStylePaddingNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      let newJsonJudge = inspector.getInspectorByKey('subTabBarDefaultTestLeftJudge');
      let objJudge = JSON.parseJsonElement(newJsonJudge);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_2400]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_2400]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('padding')));
      let resultString =  '{"top":"6.00vp","right":"6.00vp","bottom":"6.00vp","left":"' + objJudge.getElement('$attrs').getString('width') + '"}';
      expect(obj.getElement('$attrs').getElement('tabBar').getString('padding')).assertEqual(resultString);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_2400] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_SubTabBarStylePadding_2500
     * @tc.name     ArkUI_Tabs_SubTabBarStylePadding_2500
     * @tc.desc     ArkUI_Tabs_SubTabBarStylePadding_2500
     * @tc.level    0
     */
it('ArkUI_Tabs_SubTabBarStylePadding_2500', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_2500] start");
      let strJson = inspector.getInspectorByKey('subTabBarStylePaddingNumberTest');
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_2500]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "subTabBarStylePaddingTopNumber": 6 as number,
            "subTabBarStylePaddingRightNumber": 6 as number,
            "subTabBarStylePaddingBottomNumber": 6 as number,
            "subTabBarStylePaddingLeftNumber": 100000 as number
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_SubTabBarStylePadding_2500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_SubTabBarStylePadding_2500] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('subTabBarStylePaddingNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_2500]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_2500]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('padding')));
      let resultString =  '{"top":"6.00vp","right":"6.00vp","bottom":"6.00vp","left":"100000.00vp"}';
      expect(obj.getElement('$attrs').getElement('tabBar').getString('padding')).assertEqual(resultString);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_2500] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_SubTabBarStylePadding_2600
     * @tc.name     ArkUI_Tabs_SubTabBarStylePadding_2600
     * @tc.desc     ArkUI_Tabs_SubTabBarStylePadding_2600
     * @tc.level    0
     */
it('ArkUI_Tabs_SubTabBarStylePadding_2600', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_2600] start");
      let strJson = inspector.getInspectorByKey('subTabBarStylePaddingNumberTest');
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_2600]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "subTabBarStylePaddingTopNumber": 6 as number,
            "subTabBarStylePaddingRightNumber": 6 as number,
            "subTabBarStylePaddingBottomNumber": 6 as number,
            "subTabBarStylePaddingLeftNumber": undefined
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_SubTabBarStylePadding_2600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_SubTabBarStylePadding_2600] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('subTabBarStylePaddingNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      let newJsonJudge = inspector.getInspectorByKey('subTabBarDefaultTestLeftJudge');
      let objJudge = JSON.parseJsonElement(newJsonJudge);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_2600]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_2600]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('padding')));
      let resultString =  '{"top":"6.00vp","right":"6.00vp","bottom":"6.00vp","left":"' + objJudge.getElement('$attrs').getString('width') + '"}';
      expect(obj.getElement('$attrs').getElement('tabBar').getString('padding')).assertEqual(resultString);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_2600] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_SubTabBarStylePadding_2700
     * @tc.name     ArkUI_Tabs_SubTabBarStylePadding_2700
     * @tc.desc     ArkUI_Tabs_SubTabBarStylePadding_2700
     * @tc.level    0
     */
it('ArkUI_Tabs_SubTabBarStylePadding_2700', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_2700] start");
      let strJson = inspector.getInspectorByKey('subTabBarStylePaddingNumberTest');
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_2700]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "subTabBarStylePaddingTopNumber": 6 as number,
            "subTabBarStylePaddingRightNumber": 6 as number,
            "subTabBarStylePaddingBottomNumber": 6 as number,
            "subTabBarStylePaddingLeftNumber": null
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_SubTabBarStylePadding_2700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_SubTabBarStylePadding_2700] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('subTabBarStylePaddingNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      let newJsonJudge = inspector.getInspectorByKey('subTabBarDefaultTestLeftJudge');
      let objJudge = JSON.parseJsonElement(newJsonJudge);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_2700]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_2700]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('padding')));
      let resultString =  '{"top":"6.00vp","right":"6.00vp","bottom":"6.00vp","left":"' + objJudge.getElement('$attrs').getString('width') + '"}';
      expect(obj.getElement('$attrs').getElement('tabBar').getString('padding')).assertEqual(resultString);
      console.info("[ArkUI_Tabs_SubTabBarStylePadding_2700] end");
      done();
    });

    
    /**
     * @tc.number   [ArkUI_Tabs_BottomTabBarStylePadding_0100]
     * @tc.name     [ArkUI_Tabs_BottomTabBarStylePadding_0100]
     * @tc.desc     [ArkUI_Tabs_BottomTabBarStylePadding_0100]
     * @tc.level    0
     */
it('[ArkUI_Tabs_BottomTabBarStylePadding_0100]', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0100] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarDefaultTest');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0100]: " + strJson);

      let obj = JSON.parseJsonElement(strJson);
      let newJsonJudge = inspector.getInspectorByKey('bottomTabBarDefaultTestJudge');
      let objJudge = JSON.parseJsonElement(newJsonJudge);
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0100]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0100]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('padding')));
      expect(obj.getElement('$attrs').getElement('tabBar').getString('padding')).assertEqual('{"top":"0.00vp","right":"4.00vp","bottom":"0.00vp","left":"4.00vp"}');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0100] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BottomTabBarStylePadding_0200
     * @tc.name     ArkUI_Tabs_BottomTabBarStylePadding_0200
     * @tc.desc     ArkUI_Tabs_BottomTabBarStylePadding_0200
     * @tc.level    0
     */
it('ArkUI_Tabs_BottomTabBarStylePadding_0200', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0200] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0200]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStylePaddingNumber": 10 as number,
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStylePadding_0200] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0200]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0200]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('padding')));
      expect(obj.getElement('$attrs').getElement('tabBar').getString('padding')).assertEqual('10.00vp');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0200] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BottomTabBarStylePadding_0300
     * @tc.name     ArkUI_Tabs_BottomTabBarStylePadding_0300
     * @tc.desc     ArkUI_Tabs_BottomTabBarStylePadding_0300
     * @tc.level    0
     */
it('ArkUI_Tabs_BottomTabBarStylePadding_0300', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0300] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStringTest');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0300]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStylePaddingString": '10.00px',
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStylePadding_0300] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStringTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0300]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0300]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('padding')));
      expect(obj.getElement('$attrs').getElement('tabBar').getString('padding')).assertEqual('10.00px');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0300] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BottomTabBarStylePadding_0400
     * @tc.name     ArkUI_Tabs_BottomTabBarStylePadding_0400
     * @tc.desc     ArkUI_Tabs_BottomTabBarStylePadding_0400
     * @tc.level    0
     */
it('ArkUI_Tabs_BottomTabBarStylePadding_0400', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0400] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarResourceTest');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0400]: " + strJson);

      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0400]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0400]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('padding')));
      expect(obj.getElement('$attrs').getElement('tabBar').getString('padding')).assertEqual('8.00vp');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0400] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BottomTabBarStylePadding_0500
     * @tc.name     ArkUI_Tabs_BottomTabBarStylePadding_0500
     * @tc.desc     ArkUI_Tabs_BottomTabBarStylePadding_0500
     * @tc.level    0
     */
it('ArkUI_Tabs_BottomTabBarStylePadding_0500', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0500] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0500]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStylePaddingNumber": -1 as number,
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStylePadding_0500] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0500]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0500]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('padding')));
      expect(obj.getElement('$attrs').getElement('tabBar').getString('padding')).assertEqual('{"top":"0.00vp","right":"4.00vp","bottom":"0.00vp","left":"4.00vp"}');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0500] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BottomTabBarStylePadding_0600
     * @tc.name     ArkUI_Tabs_BottomTabBarStylePadding_0600
     * @tc.desc     ArkUI_Tabs_BottomTabBarStylePadding_0600
     * @tc.level    0
     */
it('ArkUI_Tabs_BottomTabBarStylePadding_0600', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0600] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0600]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStylePaddingNumber": 100000 as number,
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStylePadding_0600] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0600]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0600]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('padding')));
      expect(obj.getElement('$attrs').getElement('tabBar').getString('padding')).assertEqual('100000.00vp');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0600] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BottomTabBarStylePadding_0700
     * @tc.name     ArkUI_Tabs_BottomTabBarStylePadding_0700
     * @tc.desc     ArkUI_Tabs_BottomTabBarStylePadding_0700
     * @tc.level    0
     */
it('ArkUI_Tabs_BottomTabBarStylePadding_0700', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0700] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0700]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStylePaddingNumber": undefined,
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStylePadding_0700] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0700]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0700]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('padding')));
      expect(obj.getElement('$attrs').getElement('tabBar').getString('padding')).assertEqual('{"top":"0.00vp","right":"4.00vp","bottom":"0.00vp","left":"4.00vp"}');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0700] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BottomTabBarStylePadding_0800
     * @tc.name     ArkUI_Tabs_BottomTabBarStylePadding_0800
     * @tc.desc     ArkUI_Tabs_BottomTabBarStylePadding_0800
     * @tc.level    0
     */
it('ArkUI_Tabs_BottomTabBarStylePadding_0800', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0800] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0800]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStylePaddingNumber": null,
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStylePadding_0800] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0800]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0800]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('padding')));
      expect(obj.getElement('$attrs').getElement('tabBar').getString('padding')).assertEqual('{"top":"0.00vp","right":"4.00vp","bottom":"0.00vp","left":"4.00vp"}');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0800] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BottomTabBarStylePadding_0900
     * @tc.name     ArkUI_Tabs_BottomTabBarStylePadding_0900
     * @tc.desc     ArkUI_Tabs_BottomTabBarStylePadding_0900
     * @tc.level    0
     */
it('ArkUI_Tabs_BottomTabBarStylePadding_0900', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0900] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStylePaddingNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0900]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStylePaddingTopNumber": 6 as number,
            "bottomTabBarStylePaddingRightNumber": 6 as number,
            "bottomTabBarStylePaddingBottomNumber": 6 as number,
            "bottomTabBarStylePaddingLeftNumber": 6 as number
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0900] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStylePadding_0900] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStylePaddingNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0900]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0900]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('padding')));
      expect(obj.getElement('$attrs').getElement('tabBar').getString('padding')).assertEqual('6.00vp');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_0900] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BottomTabBarStylePadding_1000
     * @tc.name     ArkUI_Tabs_BottomTabBarStylePadding_1000
     * @tc.desc     ArkUI_Tabs_BottomTabBarStylePadding_1000
     * @tc.level    0
     */
it('ArkUI_Tabs_BottomTabBarStylePadding_1000', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1000] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStylePaddingStringTest');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1000]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStylePaddingTopString": '10.00px',
            "bottomTabBarStylePaddingRightString": '10.00px',
            "bottomTabBarStylePaddingBottomString": '10.00px',
            "bottomTabBarStylePaddingLeftString": '10.00px'
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1000] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStylePadding_1000] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStylePaddingStringTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1000]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1000]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('padding')));
      expect(obj.getElement('$attrs').getElement('tabBar').getString('padding')).assertEqual('10.00px');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1000] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BottomTabBarStylePadding_1100
     * @tc.name     ArkUI_Tabs_BottomTabBarStylePadding_1100
     * @tc.desc     ArkUI_Tabs_BottomTabBarStylePadding_1100
     * @tc.level    0
     */
it('ArkUI_Tabs_BottomTabBarStylePadding_1100', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1100] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStylePaddingResourceTest');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1100]: " + strJson);

      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1100]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1100]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('padding')));
      expect(obj.getElement('$attrs').getElement('tabBar').getString('padding')).assertEqual('8.00vp');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1100] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BottomTabBarStylePadding_1200
     * @tc.name     ArkUI_Tabs_BottomTabBarStylePadding_1200
     * @tc.desc     ArkUI_Tabs_BottomTabBarStylePadding_1200
     * @tc.level    0
     */
it('ArkUI_Tabs_BottomTabBarStylePadding_1200', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1200] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStylePaddingNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1200]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStylePaddingTopNumber": -1 as number,
            "bottomTabBarStylePaddingRightNumber": 6 as number,
            "bottomTabBarStylePaddingBottomNumber": 6 as number,
            "bottomTabBarStylePaddingLeftNumber": 6 as number
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStylePadding_1200] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStylePaddingNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1200]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1200]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('padding')));
      expect(obj.getElement('$attrs').getElement('tabBar').getString('padding')).assertEqual('{"top":"0.00vp","right":"6.00vp","bottom":"6.00vp","left":"6.00vp"}');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1200] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BottomTabBarStylePadding_1300
     * @tc.name     ArkUI_Tabs_BottomTabBarStylePadding_1300
     * @tc.desc     ArkUI_Tabs_BottomTabBarStylePadding_1300
     * @tc.level    0
     */
it('ArkUI_Tabs_BottomTabBarStylePadding_1300', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1300] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStylePaddingNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1300]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStylePaddingTopNumber": 100000 as number,
            "bottomTabBarStylePaddingRightNumber": 6 as number,
            "bottomTabBarStylePaddingBottomNumber": 6 as number,
            "bottomTabBarStylePaddingLeftNumber": 6 as number
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStylePadding_1300] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStylePaddingNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1300]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1300]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('padding')));
      expect(obj.getElement('$attrs').getElement('tabBar').getString('padding')).assertEqual('{"top":"100000.00vp","right":"6.00vp","bottom":"6.00vp","left":"6.00vp"}');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1300] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BottomTabBarStylePadding_1400
     * @tc.name     ArkUI_Tabs_BottomTabBarStylePadding_1400
     * @tc.desc     ArkUI_Tabs_BottomTabBarStylePadding_1400
     * @tc.level    0
     */
it('ArkUI_Tabs_BottomTabBarStylePadding_1400', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1400] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStylePaddingNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1400]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStylePaddingTopNumber": undefined,
            "bottomTabBarStylePaddingRightNumber": 6 as number,
            "bottomTabBarStylePaddingBottomNumber": 6 as number,
            "bottomTabBarStylePaddingLeftNumber": 6 as number
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStylePadding_1400] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStylePaddingNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1400]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1400]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('padding')));
      expect(obj.getElement('$attrs').getElement('tabBar').getString('padding')).assertEqual('{"top":"0.00vp","right":"6.00vp","bottom":"6.00vp","left":"6.00vp"}');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1400] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BottomTabBarStylePadding_1500
     * @tc.name     ArkUI_Tabs_BottomTabBarStylePadding_1500
     * @tc.desc     ArkUI_Tabs_BottomTabBarStylePadding_1500
     * @tc.level    0
     */
it('ArkUI_Tabs_BottomTabBarStylePadding_1500', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1500] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStylePaddingNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1500]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStylePaddingTopNumber": null,
            "bottomTabBarStylePaddingRightNumber": 6 as number,
            "bottomTabBarStylePaddingBottomNumber": 6 as number,
            "bottomTabBarStylePaddingLeftNumber": 6 as number
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStylePadding_1500] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStylePaddingNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1500]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1500]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('padding')));
      expect(obj.getElement('$attrs').getElement('tabBar').getString('padding')).assertEqual('{"top":"0.00vp","right":"6.00vp","bottom":"6.00vp","left":"6.00vp"}');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1500] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BottomTabBarStylePadding_1600
     * @tc.name     ArkUI_Tabs_BottomTabBarStylePadding_1600
     * @tc.desc     ArkUI_Tabs_BottomTabBarStylePadding_1600
     * @tc.level    0
     */
it('ArkUI_Tabs_BottomTabBarStylePadding_1600', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1600] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStylePaddingNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1600]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStylePaddingTopNumber": 6 as number,
            "bottomTabBarStylePaddingRightNumber": -1 as number,
            "bottomTabBarStylePaddingBottomNumber": 6 as number,
            "bottomTabBarStylePaddingLeftNumber": 6 as number
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStylePadding_1600] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStylePaddingNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1600]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1600]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('padding')));
      expect(obj.getElement('$attrs').getElement('tabBar').getString('padding')).assertEqual('{"top":"6.00vp","right":"4.00vp","bottom":"6.00vp","left":"6.00vp"}');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1600] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BottomTabBarStylePadding_1700
     * @tc.name     ArkUI_Tabs_BottomTabBarStylePadding_1700
     * @tc.desc     ArkUI_Tabs_BottomTabBarStylePadding_1700
     * @tc.level    0
     */
it('ArkUI_Tabs_BottomTabBarStylePadding_1700', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1700] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStylePaddingNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1700]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStylePaddingTopNumber": 6 as number,
            "bottomTabBarStylePaddingRightNumber": 100000 as number,
            "bottomTabBarStylePaddingBottomNumber": 6 as number,
            "bottomTabBarStylePaddingLeftNumber": 6 as number
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStylePadding_1700] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStylePaddingNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1700]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1700]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('padding')));
      expect(obj.getElement('$attrs').getElement('tabBar').getString('padding')).assertEqual('{"top":"6.00vp","right":"100000.00vp","bottom":"6.00vp","left":"6.00vp"}');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1700] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BottomTabBarStylePadding_1800
     * @tc.name     ArkUI_Tabs_BottomTabBarStylePadding_1800
     * @tc.desc     ArkUI_Tabs_BottomTabBarStylePadding_1800
     * @tc.level    0
     */
it('ArkUI_Tabs_BottomTabBarStylePadding_1800', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1800] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStylePaddingNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1800]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStylePaddingTopNumber": 6 as number,
            "bottomTabBarStylePaddingRightNumber": undefined,
            "bottomTabBarStylePaddingBottomNumber": 6 as number,
            "bottomTabBarStylePaddingLeftNumber": 6 as number
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStylePadding_1800] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStylePaddingNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1800]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1800]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('padding')));
      expect(obj.getElement('$attrs').getElement('tabBar').getString('padding')).assertEqual('{"top":"6.00vp","right":"4.00vp","bottom":"6.00vp","left":"6.00vp"}');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1800] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BottomTabBarStylePadding_1900
     * @tc.name     ArkUI_Tabs_BottomTabBarStylePadding_1900
     * @tc.desc     ArkUI_Tabs_BottomTabBarStylePadding_1900
     * @tc.level    0
     */
it('ArkUI_Tabs_BottomTabBarStylePadding_1900', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1900] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStylePaddingNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1900]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStylePaddingTopNumber": 6 as number,
            "bottomTabBarStylePaddingRightNumber": null ,
            "bottomTabBarStylePaddingBottomNumber": 6 as number,
            "bottomTabBarStylePaddingLeftNumber": 6 as number
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1900] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStylePadding_1900] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStylePaddingNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1900]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1900]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('padding')));
      expect(obj.getElement('$attrs').getElement('tabBar').getString('padding')).assertEqual('{"top":"6.00vp","right":"4.00vp","bottom":"6.00vp","left":"6.00vp"}');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_1900] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BottomTabBarStylePadding_2000
     * @tc.name     ArkUI_Tabs_BottomTabBarStylePadding_2000
     * @tc.desc     ArkUI_Tabs_BottomTabBarStylePadding_2000
     * @tc.level    0
     */
it('ArkUI_Tabs_BottomTabBarStylePadding_2000', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2000] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStylePaddingNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2000]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStylePaddingTopNumber": 6 as number,
            "bottomTabBarStylePaddingRightNumber": 6 as number,
            "bottomTabBarStylePaddingBottomNumber": -1 as number,
            "bottomTabBarStylePaddingLeftNumber": 6 as number
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2000] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStylePadding_2000] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStylePaddingNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2000]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2000]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('padding')));
      expect(obj.getElement('$attrs').getElement('tabBar').getString('padding')).assertEqual('{"top":"6.00vp","right":"6.00vp","bottom":"0.00vp","left":"6.00vp"}');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2000] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BottomTabBarStylePadding_2100
     * @tc.name     ArkUI_Tabs_BottomTabBarStylePadding_2100
     * @tc.desc     ArkUI_Tabs_BottomTabBarStylePadding_2100
     * @tc.level    0
     */
it('ArkUI_Tabs_BottomTabBarStylePadding_2100', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2100] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStylePaddingNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2100]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStylePaddingTopNumber": 6 as number,
            "bottomTabBarStylePaddingRightNumber": 6 as number,
            "bottomTabBarStylePaddingBottomNumber": 100000 as number,
            "bottomTabBarStylePaddingLeftNumber": 6 as number
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2100] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStylePadding_2100] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStylePaddingNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2100]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2100]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('padding')));
      expect(obj.getElement('$attrs').getElement('tabBar').getString('padding')).assertEqual('{"top":"6.00vp","right":"6.00vp","bottom":"100000.00vp","left":"6.00vp"}');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2100] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BottomTabBarStylePadding_2200
     * @tc.name     ArkUI_Tabs_BottomTabBarStylePadding_2200
     * @tc.desc     ArkUI_Tabs_BottomTabBarStylePadding_2200
     * @tc.level    0
     */
it('ArkUI_Tabs_BottomTabBarStylePadding_2200', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2200] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStylePaddingNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2200]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStylePaddingTopNumber": 6 as number,
            "bottomTabBarStylePaddingRightNumber": 6 as number,
            "bottomTabBarStylePaddingBottomNumber": undefined,
            "bottomTabBarStylePaddingLeftNumber": 6 as number
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStylePadding_2200] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStylePaddingNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2200]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2200]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('padding')));
      expect(obj.getElement('$attrs').getElement('tabBar').getString('padding')).assertEqual('{"top":"6.00vp","right":"6.00vp","bottom":"0.00vp","left":"6.00vp"}');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2200] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BottomTabBarStylePadding_2300
     * @tc.name     ArkUI_Tabs_BottomTabBarStylePadding_2300
     * @tc.desc     ArkUI_Tabs_BottomTabBarStylePadding_2300
     * @tc.level    0
     */
it('ArkUI_Tabs_BottomTabBarStylePadding_2300', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2300] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStylePaddingNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2300]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStylePaddingTopNumber": 6 as number,
            "bottomTabBarStylePaddingRightNumber": 6 as number,
            "bottomTabBarStylePaddingBottomNumber": null,
            "bottomTabBarStylePaddingLeftNumber": 6 as number
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStylePadding_2300] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStylePaddingNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2300]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2300]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('padding')));
      expect(obj.getElement('$attrs').getElement('tabBar').getString('padding')).assertEqual('{"top":"6.00vp","right":"6.00vp","bottom":"0.00vp","left":"6.00vp"}');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2300] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BottomTabBarStylePadding_2400
     * @tc.name     ArkUI_Tabs_BottomTabBarStylePadding_2400
     * @tc.desc     ArkUI_Tabs_BottomTabBarStylePadding_2400
     * @tc.level    0
     */
it('ArkUI_Tabs_BottomTabBarStylePadding_2400', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2400] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStylePaddingNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2400]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStylePaddingTopNumber": 6 as number,
            "bottomTabBarStylePaddingRightNumber": 6 as number,
            "bottomTabBarStylePaddingBottomNumber": 6 as number,
            "bottomTabBarStylePaddingLeftNumber": -1 as number
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStylePadding_2400] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStylePaddingNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2400]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2400]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('padding')));
      expect(obj.getElement('$attrs').getElement('tabBar').getString('padding')).assertEqual('{"top":"6.00vp","right":"6.00vp","bottom":"6.00vp","left":"4.00vp"}');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2400] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BottomTabBarStylePadding_2500
     * @tc.name     ArkUI_Tabs_BottomTabBarStylePadding_2500
     * @tc.desc     ArkUI_Tabs_BottomTabBarStylePadding_2500
     * @tc.level    0
     */
it('ArkUI_Tabs_BottomTabBarStylePadding_2500', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2500] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStylePaddingNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2500]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStylePaddingTopNumber": 6 as number,
            "bottomTabBarStylePaddingRightNumber": 6 as number,
            "bottomTabBarStylePaddingBottomNumber": 6 as number,
            "bottomTabBarStylePaddingLeftNumber": 100000 as number
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStylePadding_2500] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStylePaddingNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2500]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2500]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('padding')));
      expect(obj.getElement('$attrs').getElement('tabBar').getString('padding')).assertEqual('{"top":"6.00vp","right":"6.00vp","bottom":"6.00vp","left":"100000.00vp"}');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2500] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BottomTabBarStylePadding_2600
     * @tc.name     ArkUI_Tabs_BottomTabBarStylePadding_2600
     * @tc.desc     ArkUI_Tabs_BottomTabBarStylePadding_2600
     * @tc.level    0
     */
it('ArkUI_Tabs_BottomTabBarStylePadding_2600', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2600] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStylePaddingNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2600]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStylePaddingTopNumber": 6 as number,
            "bottomTabBarStylePaddingRightNumber": 6 as number,
            "bottomTabBarStylePaddingBottomNumber": 6 as number,
            "bottomTabBarStylePaddingLeftNumber": undefined
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStylePadding_2600] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStylePaddingNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2600]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2600]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('padding')));
      expect(obj.getElement('$attrs').getElement('tabBar').getString('padding')).assertEqual('{"top":"6.00vp","right":"6.00vp","bottom":"6.00vp","left":"4.00vp"}');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2600] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BottomTabBarStylePadding_2700
     * @tc.name     ArkUI_Tabs_BottomTabBarStylePadding_2700
     * @tc.desc     ArkUI_Tabs_BottomTabBarStylePadding_2700
     * @tc.level    0
     */
it('ArkUI_Tabs_BottomTabBarStylePadding_2700', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2700] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStylePaddingNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2700]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStylePaddingTopNumber": 6 as number,
            "bottomTabBarStylePaddingRightNumber": 6 as number,
            "bottomTabBarStylePaddingBottomNumber": 6 as number,
            "bottomTabBarStylePaddingLeftNumber": null
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStylePadding_2700] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStylePaddingNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2700]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2700]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('padding')));
      expect(obj.getElement('$attrs').getElement('tabBar').getString('padding')).assertEqual('{"top":"6.00vp","right":"6.00vp","bottom":"6.00vp","left":"4.00vp"}');
      console.info("[ArkUI_Tabs_BottomTabBarStylePadding_2700] end");
      done();
    });

    
    /**
     * @tc.number   [ArkUI_Tabs_BottomTabBarStyleVerticalAlign_static_0100]
     * @tc.name     [ArkUI_Tabs_BottomTabBarStyleVerticalAlign_static_0100]
     * @tc.desc     [ArkUI_Tabs_BottomTabBarStyleVerticalAlign_static_0100]
     * @tc.level    0
     */
it('[ArkUI_Tabs_BottomTabBarStyleVerticalAlign_static_0100]', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleVerticalAlign_static_0100] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarDefaultTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleVerticalAlign_static_0100]: " + strJson);

      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleVerticalAlign_static_0100]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleVerticalAlign_static_0100]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('verticalAlign')));
      expect(obj.getElement('$attrs').getElement('tabBar').getString('verticalAlign')).assertEqual("VerticalAlign.Center");
      console.info("[ArkUI_Tabs_BottomTabBarStyleVerticalAlign_static_0100] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BottomTabBarStyleVerticalAlign_static_0200
     * @tc.name     ArkUI_Tabs_BottomTabBarStyleVerticalAlign_static_0200
     * @tc.desc     ArkUI_Tabs_BottomTabBarStyleVerticalAlign_static_0200
     * @tc.level    0
     */
it('ArkUI_Tabs_BottomTabBarStyleVerticalAlign_static_0200', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleVerticalAlign_static_0200] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleVerticalAlignTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleVerticalAlign_static_0200]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStyleVerticalAlign": VerticalAlign.Top
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleVerticalAlign_static_0200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleVerticalAlign_static_0200] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleVerticalAlignTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleVerticalAlign_static_0200]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleVerticalAlign_static_0200]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('verticalAlign')));
      expect(obj.getElement('$attrs').getElement('tabBar').getString('verticalAlign')).assertEqual("VerticalAlign.Top");
      console.info("[ArkUI_Tabs_BottomTabBarStyleVerticalAlign_static_0200] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BottomTabBarStyleVerticalAlign_static_0300
     * @tc.name     ArkUI_Tabs_BottomTabBarStyleVerticalAlign_static_0300
     * @tc.desc     ArkUI_Tabs_BottomTabBarStyleVerticalAlign_static_0300
     * @tc.level    0
     */
it('ArkUI_Tabs_BottomTabBarStyleVerticalAlign_static_0300', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleVerticalAlign_static_0300] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleVerticalAlignTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleVerticalAlign_static_0300]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStyleVerticalAlign": VerticalAlign.Center
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleVerticalAlign_static_0300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleVerticalAlign_static_0300] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleVerticalAlignTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleVerticalAlign_static_0300]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleVerticalAlign_static_0300]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('verticalAlign')));
      expect(obj.getElement('$attrs').getElement('tabBar').getString('verticalAlign')).assertEqual("VerticalAlign.Center");
      console.info("[ArkUI_Tabs_BottomTabBarStyleVerticalAlign_static_0300] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BottomTabBarStyleVerticalAlign_static_0400
     * @tc.name     ArkUI_Tabs_BottomTabBarStyleVerticalAlign_static_0400
     * @tc.desc     ArkUI_Tabs_BottomTabBarStyleVerticalAlign_static_0400
     * @tc.level    0
     */
it('ArkUI_Tabs_BottomTabBarStyleVerticalAlign_static_0400', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleVerticalAlign_static_0400] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleVerticalAlignTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleVerticalAlign_static_0400]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStyleVerticalAlign": VerticalAlign.Bottom
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleVerticalAlign_static_0400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleVerticalAlign_static_0400] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleVerticalAlignTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleVerticalAlign_static_0400]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleVerticalAlign_static_0400]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('verticalAlign')));
      expect(obj.getElement('$attrs').getElement('tabBar').getString('verticalAlign')).assertEqual("VerticalAlign.Bottom");
      console.info("[ArkUI_Tabs_BottomTabBarStyleVerticalAlign_static_0400] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BottomTabBarStyleVerticalAlign_static_0500
     * @tc.name     ArkUI_Tabs_BottomTabBarStyleVerticalAlign_static_0500
     * @tc.desc     ArkUI_Tabs_BottomTabBarStyleVerticalAlign_static_0500
     * @tc.level    0
     */
it('ArkUI_Tabs_BottomTabBarStyleVerticalAlign_static_0500', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleVerticalAlign_static_0500] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleVerticalAlignTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleVerticalAlign_static_0500]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStyleVerticalAlign": undefined
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleVerticalAlign_static_0500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleVerticalAlign_static_0500] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleVerticalAlignTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleVerticalAlign_static_0500]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleVerticalAlign_static_0500]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('verticalAlign')));
      expect(obj.getElement('$attrs').getElement('tabBar').getString('verticalAlign')).assertEqual("VerticalAlign.Center");
      console.info("[ArkUI_Tabs_BottomTabBarStyleVerticalAlign_static_0500] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BottomTabBarStyleVerticalAlign_static_0600
     * @tc.name     ArkUI_Tabs_BottomTabBarStyleVerticalAlign_static_0600
     * @tc.desc     ArkUI_Tabs_BottomTabBarStyleVerticalAlign_static_0600
     * @tc.level    0
     */
it('ArkUI_Tabs_BottomTabBarStyleVerticalAlign_static_0600', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleVerticalAlign_static_0600] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleVerticalAlignTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleVerticalAlign_static_0600]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStyleVerticalAlign": null
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleVerticalAlign_static_0600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleVerticalAlign_static_0600] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleVerticalAlignTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleVerticalAlign_static_0600]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleVerticalAlign_static_0600]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('verticalAlign')));
      expect(obj.getElement('$attrs').getElement('tabBar').getString('verticalAlign')).assertEqual("VerticalAlign.Center");
      console.info("[ArkUI_Tabs_BottomTabBarStyleVerticalAlign_static_0600] end");
      done();
    });

    
    /**
     * @tc.number   [ArkUI_Tabs_BottomTabBarStyleLayoutMode_static_0100]
     * @tc.name     [ArkUI_Tabs_BottomTabBarStyleLayoutMode_static_0100]
     * @tc.desc     [ArkUI_Tabs_BottomTabBarStyleLayoutMode_static_0100]
     * @tc.level    0
     */
it('[ArkUI_Tabs_BottomTabBarStyleLayoutMode_static_0100]', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLayoutMode_static_0100] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarDefaultTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLayoutMode_static_0100]: " + strJson);

      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLayoutMode_static_0100]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLayoutMode_static_0100]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('layoutMode')));
      expect(obj.getElement('$attrs').getElement('tabBar').getString('layoutMode')).assertEqual("LayoutMode.VERTICAL");
      console.info("[ArkUI_Tabs_BottomTabBarStyleLayoutMode_static_0100] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BottomTabBarStyleLayoutMode_static_0200
     * @tc.name     ArkUI_Tabs_BottomTabBarStyleLayoutMode_static_0200
     * @tc.desc     ArkUI_Tabs_BottomTabBarStyleLayoutMode_static_0200
     * @tc.level    0
     */
it('ArkUI_Tabs_BottomTabBarStyleLayoutMode_static_0200', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLayoutMode_static_0200] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleLayoutModeTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLayoutMode_static_0200]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStyleLayoutMode": LayoutMode.HORIZONTAL
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLayoutMode_static_0200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLayoutMode_static_0200] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleLayoutModeTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLayoutMode_static_0200]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLayoutMode_static_0200]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('layoutMode')));
      expect(obj.getElement('$attrs').getElement('tabBar').getString('layoutMode')).assertEqual("LayoutMode.HORIZONTAL");
      console.info("[ArkUI_Tabs_BottomTabBarStyleLayoutMode_static_0200] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BottomTabBarStyleLayoutMode_static_0300
     * @tc.name     ArkUI_Tabs_BottomTabBarStyleLayoutMode_static_0300
     * @tc.desc     ArkUI_Tabs_BottomTabBarStyleLayoutMode_static_0300
     * @tc.level    0
     */
it('ArkUI_Tabs_BottomTabBarStyleLayoutMode_static_0300', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLayoutMode_static_0300] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleLayoutModeTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLayoutMode_static_0300]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStyleLayoutMode": LayoutMode.VERTICAL
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLayoutMode_static_0300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLayoutMode_static_0300] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleLayoutModeTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLayoutMode_static_0300]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLayoutMode_static_0300]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('layoutMode')));
      expect(obj.getElement('$attrs').getElement('tabBar').getString('layoutMode')).assertEqual("LayoutMode.VERTICAL");
      console.info("[ArkUI_Tabs_BottomTabBarStyleLayoutMode_static_0300] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BottomTabBarStyleLayoutMode_static_0400
     * @tc.name     ArkUI_Tabs_BottomTabBarStyleLayoutMode_static_0400
     * @tc.desc     ArkUI_Tabs_BottomTabBarStyleLayoutMode_static_0400
     * @tc.level    0
     */
it('ArkUI_Tabs_BottomTabBarStyleLayoutMode_static_0400', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLayoutMode_static_0400] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleLayoutModeTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLayoutMode_static_0400]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStyleLayoutMode": LayoutMode.AUTO
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLayoutMode_static_0400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLayoutMode_static_0400] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleLayoutModeTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLayoutMode_static_0400]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLayoutMode_static_0400]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('layoutMode')));
      expect(obj.getElement('$attrs').getElement('tabBar').getString('layoutMode')).assertEqual("LayoutMode.AUTO");
      console.info("[ArkUI_Tabs_BottomTabBarStyleLayoutMode_static_0400] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BottomTabBarStyleLayoutMode_static_0500
     * @tc.name     ArkUI_Tabs_BottomTabBarStyleLayoutMode_static_0500
     * @tc.desc     ArkUI_Tabs_BottomTabBarStyleLayoutMode_static_0500
     * @tc.level    0
     */
it('ArkUI_Tabs_BottomTabBarStyleLayoutMode_static_0500', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLayoutMode_static_0500] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleLayoutModeTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLayoutMode_static_0500]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStyleLayoutMode": undefined
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLayoutMode_static_0500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLayoutMode_static_0500] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleLayoutModeTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLayoutMode_static_0500]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLayoutMode_static_0500]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('layoutMode')));
      expect(obj.getElement('$attrs').getElement('tabBar').getString('layoutMode')).assertEqual("LayoutMode.VERTICAL");
      console.info("[ArkUI_Tabs_BottomTabBarStyleLayoutMode_static_0500] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BottomTabBarStyleLayoutMode_static_0600
     * @tc.name     ArkUI_Tabs_BottomTabBarStyleLayoutMode_static_0600
     * @tc.desc     ArkUI_Tabs_BottomTabBarStyleLayoutMode_static_0600
     * @tc.level    0
     */
it('ArkUI_Tabs_BottomTabBarStyleLayoutMode_static_0600', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLayoutMode_static_0600] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleLayoutModeTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLayoutMode_static_0600]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStyleLayoutMode": null
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLayoutMode_static_0600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLayoutMode_static_0600] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleLayoutModeTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLayoutMode_static_0600]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLayoutMode_static_0600]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('layoutMode')));
      expect(obj.getElement('$attrs').getElement('tabBar').getString('layoutMode')).assertEqual("LayoutMode.VERTICAL");
      console.info("[ArkUI_Tabs_BottomTabBarStyleLayoutMode_static_0600] end");
      done();
    });

    
    /**
     * @tc.number   [ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_static_0100]
     * @tc.name     [ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_static_0100]
     * @tc.desc     [ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_static_0100]
     * @tc.level    0
     */
it('[ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_static_0100]', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_static_0100] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarDefaultTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_static_0100]: " + strJson);

      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_static_0100]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_static_0100]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('symmetricExtensible')));
      expect(obj.getElement('$attrs').getElement('tabBar').getString('symmetricExtensible')).assertEqual("false");
      console.info("[ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_static_0100] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_static_0200
     * @tc.name     ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_static_0200
     * @tc.desc     ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_static_0200
     * @tc.level    0
     */
it('ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_static_0200', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_static_0200] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleSymmetricExtensibleTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_static_0200]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStyleSymmetricExtensible": true
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_static_0200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_static_0200] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleSymmetricExtensibleTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_static_0200]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_static_0200]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('symmetricExtensible')));
      expect(obj.getElement('$attrs').getElement('tabBar').getString('symmetricExtensible')).assertEqual("true");
      console.info("[ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_static_0200] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_static_0300
     * @tc.name     ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_static_0300
     * @tc.desc     ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_static_0300
     * @tc.level    0
     */
it('ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_static_0300', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_static_0300] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleSymmetricExtensibleTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_static_0300]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStyleSymmetricExtensible": false
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_static_0300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_static_0300] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleSymmetricExtensibleTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_static_0300]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_static_0300]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('symmetricExtensible')));
      expect(obj.getElement('$attrs').getElement('tabBar').getString('symmetricExtensible')).assertEqual("false");
      console.info("[ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_static_0300] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_static_0400
     * @tc.name     ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_static_0400
     * @tc.desc     ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_static_0400
     * @tc.level    0
     */
it('ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_static_0400', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_static_0400] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleSymmetricExtensibleTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_static_0400]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStyleSymmetricExtensible": 'undefined'
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_static_0400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_static_0400] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleSymmetricExtensibleTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_static_0400]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_static_0400]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('symmetricExtensible')));
      expect(obj.getElement('$attrs').getElement('tabBar').getString('symmetricExtensible')).assertEqual("false");
      console.info("[ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_static_0400] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_static_0500
     * @tc.name     ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_static_0500
     * @tc.desc     ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_static_0500
     * @tc.level    0
     */
it('ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_static_0500', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_static_0500] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleSymmetricExtensibleTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_static_0500]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStyleSymmetricExtensible": null
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_static_0500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_static_0500] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleSymmetricExtensibleTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_static_0500]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_static_0500]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getString('symmetricExtensible')));
      expect(obj.getElement('$attrs').getElement('tabBar').getString('symmetricExtensible')).assertEqual("false");
      console.info("[ArkUI_Tabs_BottomTabBarStyleSymmetricExtensible_static_0500] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0100
     * @tc.name     ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0100
     * @tc.desc     ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0100
     * @tc.level    0
     */
it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0100', 0, async (done: () => void): Promise<void> => {
      // 回看
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0100] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarDefaultTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0100]: " + strJson);

      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0100]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0100]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0100]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('overflow')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0100]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('maxLines')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0100]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('minFontSize')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0100]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('maxFontSize')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0100]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('heightAdaptivePolicy')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0100]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0100]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('size')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0100]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('weight')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0100]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('family')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0100]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('style')));

      let newJsonJudge = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      let objJudge = JSON.parseJsonElement(newJsonJudge);
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('overflow')).assertEqual('TextOverflow.Ellipsis');
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('maxLines')).assertEqual('1');
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('minFontSize')).assertEqual('0.00vp');
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('maxFontSize')).assertEqual('0.00vp');
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('heightAdaptivePolicy')).assertEqual('TextHeightAdaptivePolicy.MAX_LINES_FIRST');
      let sizeInfo: string = obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('size');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0100 sizeInfo]: " + sizeInfo);
      if (obj.getElement('$attrs').getElement('tabBar').getString('layoutMode') == 'LayoutMode.VERTICAL') {
        expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('size')).assertEqual(tabsDefaultFontSize($r('sys.float.bottom_tab_text_size_normal')));
      }else if (obj.getElement('$attrs').getElement('tabBar').getString('layoutMode') == 'LayoutMode.HORIZONTAL') {
        expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('size')).assertEqual(tabsDefaultFontSize($r('sys.float.Caption_L_VP')));
      }
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('weight')).assertEqual('FontWeight.Normal');
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('family')).assertEqual('HarmonyOS Sans');
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('style')).assertEqual('FontStyle.Normal');

      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0100] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0200
     * @tc.name     ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0200
     * @tc.desc     ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0200
     * @tc.level    0
     */
it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0200', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0200] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0200]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStyleLabelStyleOverflow": TextOverflow.None
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0200] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0200]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0200]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0200]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('overflow')));
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('overflow')).assertEqual("TextOverflow.None");
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0200] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0300
     * @tc.name     ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0300
     * @tc.desc     ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0300
     * @tc.level    0
     */
it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0300', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0300] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0300]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStyleLabelStyleOverflow": TextOverflow.Clip
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0300] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0300]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0300]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0300]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('overflow')));
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('overflow')).assertEqual("TextOverflow.Clip");
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0300] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0400
     * @tc.name     ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0400
     * @tc.desc     ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0400
     * @tc.level    0
     */
it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0400', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0400] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0400]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStyleLabelStyleOverflow": TextOverflow.Ellipsis
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0400] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0400]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0400]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0400]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('overflow')));
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('overflow')).assertEqual("TextOverflow.Ellipsis");
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0400] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0500
     * @tc.name     ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0500
     * @tc.desc     ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0500
     * @tc.level    0
     */
it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0500', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0500] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0500]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStyleLabelStyleOverflow": TextOverflow.MARQUEE
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0500] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0500]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0500]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0500]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('overflow')));
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('overflow')).assertEqual("TextOverflow.Marquee");
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0500] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0600
     * @tc.name     ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0600
     * @tc.desc     ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0600
     * @tc.level    0
     */
it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0600', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0600] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0600]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStyleLabelStyleOverflow": undefined
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0600] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0600]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0600]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0600]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('overflow')));
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('overflow')).assertEqual("TextOverflow.Ellipsis");
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0600] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0700
     * @tc.name     ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0700
     * @tc.desc     ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0700
     * @tc.level    0
     */
it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0700', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0700] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0700]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStyleLabelStyleOverflow": null
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0700] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0700]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0700]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0700]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('overflow')));
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('overflow')).assertEqual("TextOverflow.Ellipsis");
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0700] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0800
     * @tc.name     ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0800
     * @tc.desc     ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0800
     * @tc.level    0
     */
it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0800', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0800] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0800]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStyleLabelStyleMaxLines": 2 as number
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0800] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0800]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0800]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0800]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('maxLines')));
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('maxLines')).assertEqual("2");
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0800] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0900
     * @tc.name     ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0900
     * @tc.desc     ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0900
     * @tc.level    0
     */
it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0900', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0900] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0900]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStyleLabelStyleMaxLines": -1.0
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0900] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0900] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0900]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0900]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0900]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('maxLines')));
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('maxLines')).assertEqual("1");
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_0900] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1000
     * @tc.name     ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1000
     * @tc.desc     ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1000
     * @tc.level    0
     */
it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1000', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1000] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1000]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStyleLabelStyleMaxLines": 100000 as number
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1000] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1000] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1000]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1000]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1000]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('maxLines')));
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('maxLines')).assertEqual("100000");
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1000] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1100
     * @tc.name     ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1100
     * @tc.desc     ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1100
     * @tc.level    0
     */
it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1100', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1100] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1100]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStyleLabelStyleMaxLines": undefined
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1100] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1100] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1100]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1100]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1100]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('maxLines')));
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('maxLines')).assertEqual("1");
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1100] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1200
     * @tc.name     ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1200
     * @tc.desc     ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1200
     * @tc.level    0
     */
it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1200', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1200] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1200]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStyleLabelStyleMaxLines": null
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1200] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1200]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1200]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1200]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('maxLines')));
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('maxLines')).assertEqual("1");
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1200] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1300
     * @tc.name     ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1300
     * @tc.desc     ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1300
     * @tc.level    0
     */
it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1300', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1300] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1300]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStyleLabelStyleMinFontSizeNumber": 3 as number
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1300] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1300]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1300]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1300]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('minFontSize')));
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('minFontSize')).assertEqual("3.00fp");
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1300] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1400
     * @tc.name     ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1400
     * @tc.desc     ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1400
     * @tc.level    0
     */
it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1400', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1400] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleStringTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1400]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStyleLabelStyleMinFontSizeString": '3.00fp'
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1400] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleStringTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1400]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1400]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1400]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('minFontSize')));
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('minFontSize')).assertEqual("3.00fp");
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1400] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1500
     * @tc.name     ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1500
     * @tc.desc     ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1500
     * @tc.level    0
     */
it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1500', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1500] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleResourceTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1500]: " + strJson);

      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1500]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1500]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1500]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('minFontSize')));
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('minFontSize')).assertEqual("4.00fp");
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1500] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1600
     * @tc.name     ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1600
     * @tc.desc     ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1600
     * @tc.level    0
     */
it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1600', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1600] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1600]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStyleLabelStyleMinFontSizeNumber": -1 as number
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1600] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1600]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1600]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1600]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('minFontSize')));
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('minFontSize')).assertEqual("0.00vp");
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1600] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1700
     * @tc.name     ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1700
     * @tc.desc     ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1700
     * @tc.level    0
     */
it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1700', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1700] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1700]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStyleLabelStyleMinFontSizeNumber": 100000 as number
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1700] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1700]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1700]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1700]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('minFontSize')));
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('minFontSize')).assertEqual("100000.00fp");
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1700] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1800
     * @tc.name     ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1800
     * @tc.desc     ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1800
     * @tc.level    0
     */
it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1800', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1800] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1800]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStyleLabelStyleMinFontSizeNumber": undefined
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1800] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1800]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1800]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1800]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('minFontSize')));
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('minFontSize')).assertEqual("0.00vp");
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1800] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1900
     * @tc.name     ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1900
     * @tc.desc     ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1900
     * @tc.level    0
     */
it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1900', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1900] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1900]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStyleLabelStyleMinFontSizeNumber": null
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1900] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1900] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1900]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1900]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1900]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('minFontSize')));
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('minFontSize')).assertEqual("0.00vp");
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_1900] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2000
     * @tc.name     ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2000
     * @tc.desc     ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2000
     * @tc.level    0
     */
it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2000', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2000] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2000]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStyleLabelStyleMaxFontSizeNumber": 3 as number
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2000] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2000] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2000]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2000]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2000]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('maxFontSize')));
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('maxFontSize')).assertEqual("3.00fp");
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2000] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2100
     * @tc.name     ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2100
     * @tc.desc     ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2100
     * @tc.level    0
     */
it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2100', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2100] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleStringTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2100]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStyleLabelStyleMaxFontSizeString": '3.00fp'
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2100] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2100] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleStringTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2100]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2100]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2100]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('maxFontSize')));
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('maxFontSize')).assertEqual('3.00fp');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2100] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2200
     * @tc.name     ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2200
     * @tc.desc     ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2200
     * @tc.level    0
     */
it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2200', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2200] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleResourceTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2200]: " + strJson);

      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2200]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2200]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2200]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('maxFontSize')));
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('maxFontSize')).assertEqual('5.00fp');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2200] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2300
     * @tc.name     ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2300
     * @tc.desc     ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2300
     * @tc.level    0
     */
it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2300', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2300] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2300]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStyleLabelStyleMaxFontSizeNumber": -1.0
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2300] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2300]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2300]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2300]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('maxFontSize')));
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('maxFontSize')).assertEqual('0.00vp');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2300] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2400
     * @tc.name     ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2400
     * @tc.desc     ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2400
     * @tc.level    0
     */
it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2400', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2400] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2400]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStyleLabelStyleMaxFontSizeNumber": 100000 as number
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2400] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2400]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2400]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2400]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('maxFontSize')));
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('maxFontSize')).assertEqual('100000.00fp');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2400] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2500
     * @tc.name     ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2500
     * @tc.desc     ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2500
     * @tc.level    0
     */
it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2500', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2500] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2500]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStyleLabelStyleMaxFontSizeNumber": undefined
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2500] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2500]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2500]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2500]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('maxFontSize')));
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('maxFontSize')).assertEqual('0.00vp');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2500] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2600
     * @tc.name     ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2600
     * @tc.desc     ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2600
     * @tc.level    0
     */
it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2600', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2600] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2600]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStyleLabelStyleMaxFontSizeNumber": 'null'
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2600] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2600]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2600]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2600]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('maxFontSize')));
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('maxFontSize')).assertEqual('0.00vp');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2600] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2700
     * @tc.name     ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2700
     * @tc.desc     ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2700
     * @tc.level    0
     */
it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2700', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2700] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2700]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStyleLabelStyleHeightAdaptivePolicy": TextHeightAdaptivePolicy.MAX_LINES_FIRST
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2700] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2700]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2700]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2700]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('heightAdaptivePolicy')));
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('heightAdaptivePolicy')).assertEqual('TextHeightAdaptivePolicy.MAX_LINES_FIRST');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2700] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2800
     * @tc.name     ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2800
     * @tc.desc     ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2800
     * @tc.level    0
     */
it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2800', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2800] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2800]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStyleLabelStyleHeightAdaptivePolicy": TextHeightAdaptivePolicy.MIN_FONT_SIZE_FIRST
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2700] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2800]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2800]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2800]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('heightAdaptivePolicy')));
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('heightAdaptivePolicy')).assertEqual('TextHeightAdaptivePolicy.MAX_LINES_FIRST');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2800] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2900
     * @tc.name     ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2900
     * @tc.desc     ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2900
     * @tc.level    0
     */
it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2900', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2900] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2900]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStyleLabelStyleHeightAdaptivePolicy": TextHeightAdaptivePolicy.LAYOUT_CONSTRAINT_FIRST
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2700] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2900]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2900]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2900]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('heightAdaptivePolicy')));
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('heightAdaptivePolicy')).assertEqual('TextHeightAdaptivePolicy.MAX_LINES_FIRST');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2900] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3000
     * @tc.name     ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3000
     * @tc.desc     ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3000
     * @tc.level    0
     */
it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3000', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3000] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3000]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStyleLabelStyleHeightAdaptivePolicy": 'undefined'
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2700] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3000]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3000]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3000]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('heightAdaptivePolicy')));
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('heightAdaptivePolicy')).assertEqual('TextHeightAdaptivePolicy.MAX_LINES_FIRST');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3000] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3100
     * @tc.name     ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3100
     * @tc.desc     ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3100
     * @tc.level    0
     */
it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3100', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3100] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3100]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStyleLabelStyleHeightAdaptivePolicy": 'null'
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_2700] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3100]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3100]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3100]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('heightAdaptivePolicy')));
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getString('heightAdaptivePolicy')).assertEqual('TextHeightAdaptivePolicy.MAX_LINES_FIRST');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3100] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3200
     * @tc.name     ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3200
     * @tc.desc     ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3200
     * @tc.level    0
     */
it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3200', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3200] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3200]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStyleLabelStyleFontSizeNumber": 15.0
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3200] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3200]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3200]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3200]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3200]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('size')));
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('size')).assertEqual('15.00fp');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3200] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3300
     * @tc.name     ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3300
     * @tc.desc     ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3300
     * @tc.level    0
     */
it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3300', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3300] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleStringTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3300]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStyleLabelStyleFontSizeString": '17.0fp'
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3300] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleStringTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3300]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3300]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3300]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3300]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('size')));
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('size')).assertEqual('17.00fp');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3300] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3400
     * @tc.name     ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3400
     * @tc.desc     ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3400
     * @tc.level    0
     */
it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3400', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3400] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleResourceTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3400]: " + strJson);

      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3400]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3400]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3400]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3400]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('size')));
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('size')).assertEqual('18.00fp');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3400] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3500
     * @tc.name     ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3500
     * @tc.desc     ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3500
     * @tc.level    0
     */
it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3500', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3500] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3500]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStyleLabelStyleFontSizeNumber": -1 as number
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3500] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      let newJsonJudge = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      let objJudge = JSON.parseJsonElement(newJsonJudge);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3500]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3500]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3500]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3500]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('size')));
      let sizeInfo: string = obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('size');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3500 sizeInfo]: " + sizeInfo);
      if (obj.getElement('$attrs').getElement('tabBar').getString('layoutMode') == 'LayoutMode.VERTICAL') {
        expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('size')).assertEqual(tabsDefaultFontSize($r('sys.float.bottom_tab_text_size_normal')));
      }else if (obj.getElement('$attrs').getElement('tabBar').getString('layoutMode') == 'LayoutMode.HORIZONTAL') {
        expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('size')).assertEqual(tabsDefaultFontSize($r('sys.float.Caption_L_VP')));
      }
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3500] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3600
     * @tc.name     ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3600
     * @tc.desc     ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3600
     * @tc.level    0
     */
it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3600', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3600] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3600]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStyleLabelStyleFontSizeNumber": 100000 as number
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3600] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3600]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3600]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3600]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3600]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('size')));
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('size')).assertEqual('100000.00fp');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3600] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3700
     * @tc.name     ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3700
     * @tc.desc     ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3700
     * @tc.level    0
     */
it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3700', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3700] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3700]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStyleLabelStyleFontSizeNumber": undefined
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3700] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      let newJsonJudge = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      let objJudge = JSON.parseJsonElement(newJsonJudge);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3700]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3700]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3700]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3700]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('size')));
      let sizeInfo: string = obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('size');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3700 sizeInfo]: " + sizeInfo);
      if (obj.getElement('$attrs').getElement('tabBar').getString('layoutMode') == 'LayoutMode.VERTICAL') {
        expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('size')).assertEqual(tabsDefaultFontSize($r('sys.float.bottom_tab_text_size_normal')));
      }else if (obj.getElement('$attrs').getElement('tabBar').getString('layoutMode') == 'LayoutMode.HORIZONTAL') {
        expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('size')).assertEqual(tabsDefaultFontSize($r('sys.float.Caption_L_VP')));
      }
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3700] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3800
     * @tc.name     ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3800
     * @tc.desc     ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3800
     * @tc.level    0
     */
it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3800', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3800] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3800]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStyleLabelStyleFontSizeNumber": null
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3800] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      let newJsonJudge = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      let objJudge = JSON.parseJsonElement(newJsonJudge);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3800]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3800]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3800]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3800]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('size')));
      let sizeInfo: string = obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('size');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3800 sizeInfo]: " + sizeInfo);
      if (obj.getElement('$attrs').getElement('tabBar').getString('layoutMode') == 'LayoutMode.VERTICAL') {
        expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('size')).assertEqual(tabsDefaultFontSize($r('sys.float.bottom_tab_text_size_normal')));
      }else if (obj.getElement('$attrs').getElement('tabBar').getString('layoutMode') == 'LayoutMode.HORIZONTAL') {
        expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('size')).assertEqual(tabsDefaultFontSize($r('sys.float.Caption_L_VP')));
      }
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3800] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3900
     * @tc.name     ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3900
     * @tc.desc     ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3900
     * @tc.level    0
     */
it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3900', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3900] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3900]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStyleLabelStyleFontWeight": FontWeight.Lighter
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3900] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3900] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3900]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3900]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3900]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3900]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('weight')));
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('weight')).assertEqual('FontWeight.Lighter');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_3900] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4000
     * @tc.name     ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4000
     * @tc.desc     ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4000
     * @tc.level    0
     */
it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4000', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4000] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4000]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStyleLabelStyleFontWeight": FontWeight.Normal
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4000] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4000] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4000]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4000]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4000]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4000]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('weight')));
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('weight')).assertEqual('FontWeight.Normal');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4000] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4100
     * @tc.name     ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4100
     * @tc.desc     ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4100
     * @tc.level    0
     */
it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4100', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4100] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4100]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStyleLabelStyleFontWeight": FontWeight.Regular
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4100] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4100] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4100]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4100]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4100]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4100]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('weight')));
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('weight')).assertEqual('FontWeight.Regular');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4100] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4200
     * @tc.name     ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4200
     * @tc.desc     ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4200
     * @tc.level    0
     */
it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4200', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4200] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4200]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStyleLabelStyleFontWeight": FontWeight.Medium
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4200] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4200]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4200]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4200]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4200]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('weight')));
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('weight')).assertEqual('FontWeight.Medium');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4200] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4300
     * @tc.name     ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4300
     * @tc.desc     ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4300
     * @tc.level    0
     */
it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4300', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4300] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4300]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStyleLabelStyleFontWeight": FontWeight.Bold
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4300] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4300]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4300]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4300]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4300]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('weight')));
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('weight')).assertEqual('FontWeight.Bold');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4300] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4400
     * @tc.name     ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4400
     * @tc.desc     ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4400
     * @tc.level    0
     */
it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4400', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4400] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4400]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStyleLabelStyleFontWeight": FontWeight.Bolder
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4400] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4400]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4400]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4400]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4400]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('weight')));
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('weight')).assertEqual('FontWeight.Bolder');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4400] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4500
     * @tc.name     ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4500
     * @tc.desc     ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4500
     * @tc.level    0
     */
it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4500', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4500] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4500]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStyleLabelStyleFontWeightNumber": 500 as number
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4500] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4500]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4500]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4500]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4500]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('weight')));
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('weight')).assertEqual('500');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4500] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4600
     * @tc.name     ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4600
     * @tc.desc     ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4600
     * @tc.level    0
     */
it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4600', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4600] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleStringTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4600]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStyleLabelStyleFontWeightString": '200'
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4600] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleStringTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4600]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4600]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4600]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4600]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('weight')));
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('weight')).assertEqual('200');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4600] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4700
     * @tc.name     ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4700
     * @tc.desc     ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4700
     * @tc.level    0
     */
it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4700', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4700] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4700]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStyleLabelStyleFontWeightNumber": 150.0
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4700] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4700]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4700]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4700]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4700]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('weight')));
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('weight')).assertEqual('FontWeight.Normal');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4700] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4800
     * @tc.name     ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4800
     * @tc.desc     ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4800
     * @tc.level    0
     */
it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4800', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4800] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4800]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStyleLabelStyleFontWeightNumber": -1.0
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4800] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4800]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4800]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4800]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4800]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('weight')));
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('weight')).assertEqual('FontWeight.Normal');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4800] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4900
     * @tc.name     ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4900
     * @tc.desc     ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4900
     * @tc.level    0
     */
it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4900', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4900] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4900]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStyleLabelStyleFontWeightNumber": 100000.0
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4900] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4900] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4900]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4900]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4900]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4900]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('weight')));
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('weight')).assertEqual('FontWeight.Normal');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_4900] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5000
     * @tc.name     ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5000
     * @tc.desc     ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5000
     * @tc.level    0
     */
it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5000', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5000] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5000]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStyleLabelStyleFontWeightNumber": undefined
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5000] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5000] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5000]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5000]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5000]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5000]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('weight')));
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('weight')).assertEqual('FontWeight.Normal');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5000] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5100
     * @tc.name     ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5100
     * @tc.desc     ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5100
     * @tc.level    0
     */
it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5100', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5100] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5100]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStyleLabelStyleFontWeightNumber": null
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5100] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5100] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleNumberTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5100]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5100]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5100]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5100]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('weight')));
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('weight')).assertEqual('FontWeight.Normal');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5100] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5200
     * @tc.name     ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5200
     * @tc.desc     ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5200
     * @tc.level    0
     */
it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5200', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5200] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleStringTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5200]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStyleLabelStyleFontFamilyString": 'HarmonyOS Sans'
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5200] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleStringTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5200]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5200]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5200]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5200]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('family')));
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('family')).assertEqual('HarmonyOS Sans');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5200] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5300
     * @tc.name     ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5300
     * @tc.desc     ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5300
     * @tc.level    0
     */
it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5300', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5300] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleResourceTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5300]: " + strJson);

      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5300]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5300]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5300]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5300]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('family')));
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('family')).assertEqual('HarmonyOS Sans');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5300] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5400
     * @tc.name     ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5400
     * @tc.desc     ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5400
     * @tc.level    0
     */
it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5400', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5400] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleStringTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5400]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStyleLabelStyleFontFamilyString": undefined
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5400] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleStringTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5400]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5400]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5400]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5400]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('family')));
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('family')).assertEqual('HarmonyOS Sans');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5400] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5500
     * @tc.name     ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5500
     * @tc.desc     ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5500
     * @tc.level    0
     */
it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5500', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5500] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleStringTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5500]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStyleLabelStyleFontFamilyString": null
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5500] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleStringTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5500]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5500]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5500]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5500]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('family')));
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('family')).assertEqual('HarmonyOS Sans');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5500] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5600
     * @tc.name     ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5600
     * @tc.desc     ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5600
     * @tc.level    0
     */
it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5600', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5600] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5600]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStyleLabelStyleFontStyle": FontStyle.Normal
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5600] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5600]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5600]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5600]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5600]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('style')));
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('style')).assertEqual('FontStyle.Normal');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5600] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5700
     * @tc.name     ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5700
     * @tc.desc     ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5700
     * @tc.level    0
     */
it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5700', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5700] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5700]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStyleLabelStyleFontStyle": FontStyle.Italic
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5700] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5700]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5700]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5700]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5700]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('style')));
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('style')).assertEqual('FontStyle.Italic');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5700] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5800
     * @tc.name     ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5800
     * @tc.desc     ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5800
     * @tc.level    0
     */
it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5800', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5800] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5800]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStyleLabelStyleFontStyle": undefined
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5800] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5800]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5800]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5800]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5800]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('style')));
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('style')).assertEqual('FontStyle.Normal');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5800] end");
      done();
    });

    
    /**
     * @tc.number   ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5900
     * @tc.name     ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5900
     * @tc.desc     ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5900
     * @tc.level    0
     */
it('ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5900', 0, async (done: () => void): Promise<void> => {
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5900] start");
      let strJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5900]: " + strJson);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "bottomTabBarStyleLabelStyleFontStyle": null
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5900] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5900] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let newJson = inspector.getInspectorByKey('bottomTabBarStyleLabelStyleTest');
      let obj = JSON.parseJsonElement(newJson);
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5900]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5900]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5900]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font')));
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5900]: " + JSON.stringify(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('style')));
      expect(obj.getElement('$attrs').getElement('tabBar').getElement('labelStyle').getElement('font').getString('style')).assertEqual('FontStyle.Normal');
      console.info("[ArkUI_Tabs_BottomTabBarStyleLabelStyle_static_5900] end");
      done();
    });

  })
}