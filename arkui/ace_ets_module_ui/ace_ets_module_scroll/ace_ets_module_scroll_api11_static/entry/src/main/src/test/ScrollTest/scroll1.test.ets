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

import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import Utils from '../../../ets/MainAbility/common/Utils'
import events_emitter from '@ohos.events.emitter';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test'
import { UtilsTest, startAbility, stopApplication } from '../Util.test';
import { RecordData } from '@ohos.base';

let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function scrollOnScrollBeginJsunit() {
  describe('scrollOnScrollBeginTest', () => {
    beforeAll(() => {

      
      await UtilsTest.startAbility("com.arkui.ace.scroll.static", "EntryAbility")
      

      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Scroll/scroll1',
      }
      try {
        const routerAlp = AppStorage.get<Router>("router") as Router
        routerAlp.clear();
        let pages = routerAlp.getState();
        console.info("get scroll state success " + JSON.stringify(pages));
        if (!("scroll1" == pages.name)) {
          console.info("get scroll state success " + JSON.stringify(pages.name));
          // let result = await routerAlp.pushUrl(options);
          routerAlp.pushUrl(options);
          await Utils.sleep(2000);
          // console.info("push scroll page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push scroll page error: " + err);
      }
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("scrollOnScrollBegin after each called");
    });


    
    /**
     * @tc.number   testscrollOnScrollBegin0001_static_01
     * @tc.name     testscrollOnScrollBegin0001_static_01
     * @tc.desc     testscrollOnScrollBegin0001_static_01
     * @tc.level    Level.LEVEL0
     */
it('testscrollOnScrollBegin0001_static_01', Level.LEVEL0, async () => {
      console.info('scrollOnScrollBegin testscrollOnScrollBegin0001_static_01 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('Scroll');
      console.info("[testscrollOnScrollBegin0001_static_01] component width strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Scroll');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('width')).assertEqual("100.00%");
      console.info("[testscrollOnScrollBegin0001_static_01] width value :" +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('width'));

    });


    
    /**
     * @tc.number   testscrollOnScrollBegin0002_static_02
     * @tc.name     testscrollOnScrollBegin0002_static_02
     * @tc.desc     testscrollOnScrollBegin0002_static_02
     * @tc.level    Level.LEVEL0
     */
it('testscrollOnScrollBegin0002_static_02', Level.LEVEL0, async () => {
      console.info('scrollOnScrollBegin testscrollOnScrollBegin0002_static_02 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('Scroll');
      console.info("[testscrollOnScrollBegin0002_static_02] component height strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Scroll');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('height')).assertEqual("100.00%");
      console.info("[testscrollOnScrollBegin0002_static_02] height value :" +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('height'));

    });


    
    /**
     * @tc.number   testscrollOnScrollBegin0003_static_03
     * @tc.name     testscrollOnScrollBegin0003_static_03
     * @tc.desc     testscrollOnScrollBegin0003_static_03
     * @tc.level    Level.LEVEL0
     */
it('testscrollOnScrollBegin0003_static_03', Level.LEVEL0, async () => {
      console.info('scrollOnScrollBegin testscrollOnScrollBegin0003_static_03 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('Scroll');
      console.info("[testscrollOnScrollBegin0003_static_03] component fontSize strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Scroll');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('scrollBar')).assertEqual("BarState.On");
      console.info("[testscrollOnScrollBegin0003_static_03] scrollBar value :" +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('scrollBar'));

    });


    
    /**
     * @tc.number   testscrollOnScrollBegin0004_static_04
     * @tc.name     testscrollOnScrollBegin0004_static_04
     * @tc.desc     testscrollOnScrollBegin0004_static_04
     * @tc.level    Level.LEVEL0
     */
it('testscrollOnScrollBegin0004_static_04', Level.LEVEL0, async () => {
      console.info('scrollOnScrollBegin testscrollOnScrollBegin0004_static_04 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('Scroll');
      console.info("[testscrollOnScrollBegin0004_static_04] component opacity strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Scroll');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('scrollBarColor')).assertEqual("#FF808080");
      console.info("[testscrollOnScrollBegin0004_static_04] scrollBarColor value :" +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('scrollBarColor'));

    });


    
    /**
     * @tc.number   testscrollOnScrollBegin0005_static_05
     * @tc.name     testscrollOnScrollBegin0005_static_05
     * @tc.desc     testscrollOnScrollBegin0005_static_05
     * @tc.level    Level.LEVEL0
     */
it('testscrollOnScrollBegin0005_static_05', Level.LEVEL0, async () => {
      console.info('scrollOnScrollBegin testscrollOnScrollBegin0005_static_05 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('Scroll');
      console.info("[testscrollOnScrollBegin0005_static_05] component align strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Scroll');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('scrollBarWidth')).assertEqual("30.00vp");
      console.info("[testscrollOnScrollBegin0005_static_05] scrollBarWidth value :" +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('scrollBarWidth'));

    });


    
    /**
     * @tc.number   testscrollOnScrollBegin0006_static_06
     * @tc.name     testscrollOnScrollBegin0006_static_06
     * @tc.desc     testscrollOnScrollBegin0006_static_06
     * @tc.level    Level.LEVEL0
     */
it('testscrollOnScrollBegin0006_static_06', Level.LEVEL0, async () => {
      console.info('scrollOnScrollBegin testscrollOnScrollBegin0006_static_06 START');
      await Utils.sleep(2000);

      let callback: (indexEvent: events_emitter.EventData) => void = (indexEvent: events_emitter.EventData) => {
        console.info("scrollOnScrollBegin get state result is: " + JSON.stringify(indexEvent));
        expect((indexEvent.data as Record<String,RecordData>)['STATUS']).assertEqual(true);
      }
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 10086,
        priority: events_emitter.EventPriority.LOW
      }
      inspector.sendEventByKey('Scroll', 10, "")
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("scrollOnScrollBegin on events_emitter err : " + JSON.stringify(err));
      }
      console.info('testscrollOnScrollBegin0006_static_06 END');

    });


    
    /**
     * @tc.number   testscrollOnScrollBegin0007_static_07
     * @tc.name     testscrollOnScrollBegin0007_static_07
     * @tc.desc     testscrollOnScrollBegin0007_static_07
     * @tc.level    Level.LEVEL0
     */
it('testscrollOnScrollBegin0007_static_07', Level.LEVEL0, async () => {
      console.info('scrollOnScrollBegin testscrollOnScrollBegin0007_static_07 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('Scroll');
      console.info("[testscrollOnScrollBegin0007_static_07] component align strJson:" + strJson);
      let obj7 = JSON.parseJsonElement(strJson);
      expect(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('edgeEffectOptions')
        .getBoolean('alwaysEnabled')).assertFalse();
      console.info("EdgeEffectOptions value :" +
      JSON.parseJsonElement(strJson).getElement('$attrs').getElement('edgeEffectOptions').getBoolean('alwaysEnabled'));

    });


    
    /**
     * @tc.number   testscrollOnScrollBegin0008_static_08
     * @tc.name     testscrollOnScrollBegin0008_static_08
     * @tc.desc     testscrollOnScrollBegin0008_static_08
     * @tc.level    Level.LEVEL0
     */
it('testscrollOnScrollBegin0008_static_08', Level.LEVEL0, async () => {
      console.info('testEdgeEffectOptions testscrollOnScrollBegin0008_static_08 START');
      await Utils.sleep(2000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "alwaysEnabled": true
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 323,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testscrollOnScrollBegin0008_static_08] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testscrollOnScrollBegin0008_static_08] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('Scroll');
      let obj1 = JSON.parseJsonElement(strJson);
      expect(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('edgeEffectOptions')
        .getBoolean('alwaysEnabled')).assertTrue();
      console.info("edgeEffectOptions value :" +
      JSON.parseJsonElement(strJson).getElement('$attrs').getElement('edgeEffectOptions').getBoolean('alwaysEnabled'));

    });
  })
}
