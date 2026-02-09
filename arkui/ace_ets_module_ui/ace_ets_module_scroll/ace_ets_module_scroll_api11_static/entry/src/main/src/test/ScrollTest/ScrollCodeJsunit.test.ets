'use static';
/**
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
import { describe, beforeEach, afterEach, it, expect, beforeAll, Level } from "../../../../hypium/index";
import router from '@ohos.router';
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
import { UtilsTest, startAbility, stopApplication } from '../Util.test';
import { RecordData } from '@ohos.base';

let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function scrollCodeJsunit() {
  describe('scrollCodeJsunit', () => {
    beforeAll(() => {

      
      await UtilsTest.startAbility("com.arkui.ace.scroll.static", "EntryAbility")
      
    });
    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Scroll/scrollCode',
      }
      try {
        const routerAlp = AppStorage.get<Router>("router") as Router
        routerAlp.clear();
        let pages = routerAlp.getState();
        console.info("get ScrollCode state success " + JSON.stringify(pages));
        if (!("scrollCode" == pages.name)) {
          console.info("get ScrollCode pages success " + JSON.stringify(pages.name));
          // let result = await routerAlp.pushUrl(options);
          routerAlp.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push ScrollCode page success " + JSON.stringify(result));
        }
      } catch (err: Error) {
        console.error("push ScrollCode page error " + JSON.stringify(err));
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("ScrollCode after each called");
    });


    
    /**
     * @tc.number   test_scrollCode_static_001
     * @tc.name     test_scrollCode_static_001
     * @tc.desc     test_scrollCode_static_001
     * @tc.level    Level.LEVEL0
     */
it('test_scrollCode_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[test_scrollCode_static_001] START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('ScrollCode');

      console.info("[test_scrollCode_static_001] component JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)));
      await CommonFunc.sleep(1000);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('scrollable'))
        .assertEqual('ScrollDirection.Vertical');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('scrollBar')).assertEqual('BarState.On');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('scrollBarColor')).assertEqual('#FF0000FF');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('scrollBarWidth')).assertEqual('30.00vp');
      done();
    });


    
    /**
     * @tc.number   test_scrollCode_static_002
     * @tc.name     test_scrollCode_static_002
     * @tc.desc     test_scrollCode_static_002
     * @tc.level    Level.LEVEL0
     */
it('test_scrollCode_static_002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[test_scrollCode_static_002] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "scrollable": "Vertical"
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 185,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[test_scrollCode_static_002] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[test_scrollCode_static_002] change scrollable error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('ScrollCode');

      console.info("[test_scrollCode_static_002] component JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('scrollable'))
        .assertEqual('ScrollDirection.Vertical');
      done();
    });


    
    /**
     * @tc.number   test_scrollCode_static_003
     * @tc.name     test_scrollCode_static_003
     * @tc.desc     test_scrollCode_static_003
     * @tc.level    Level.LEVEL0
     */
it('test_scrollCode_static_003', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[test_scrollCode_static_003] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "scrollBar": "Off"
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 186,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[test_scrollCode_static_003] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[test_scrollCode_static_003] change scrollBar error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('ScrollCode');

      console.info("[test_scrollCode_static_003] component JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('scrollBar')).assertEqual('BarState.Off');
      done();
    });


    
    /**
     * @tc.number   test_scrollCode_static_004
     * @tc.name     test_scrollCode_static_004
     * @tc.desc     test_scrollCode_static_004
     * @tc.level    Level.LEVEL0
     */
it('test_scrollCode_static_004', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[test_scrollCode_static_004] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "scrollBarColor": "#FFB6C1"
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 187,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[test_scrollCode_static_004] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[test_scrollCode_static_004] change scrollBar error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('ScrollCode');

      console.info("[test_scrollCode_static_004] component JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('scrollBarColor')).assertEqual('#FFFFB6C1');
      done();
    });


    
    /**
     * @tc.number   test_scrollCode_static_005
     * @tc.name     test_scrollCode_static_005
     * @tc.desc     test_scrollCode_static_005
     * @tc.level    Level.LEVEL0
     */
it('test_scrollCode_static_005', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[test_scrollCode_static_005] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "scrollBarWidth": 40
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 188,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[test_scrollCode_static_005] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[test_scrollCode_static_005] change scrollBar error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('ScrollCode');

      console.info("[test_scrollCode_static_005] component JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('scrollBarWidth')).assertEqual('40.00vp');
      done();
    });


    
    /**
     * @tc.number   test_scrollCode_static_006
     * @tc.name     test_scrollCode_static_006
     * @tc.desc     test_scrollCode_static_006
     * @tc.level    Level.LEVEL0
     */
it('test_scrollCode_static_006', Level.LEVEL0, async (done: () => void): Promise<void> => {
      await CommonFunc.sleep(1000)
      let callback: (eventData: events_emitter.EventData) => void = (eventData: events_emitter.EventData) => {
        console.info("[test_scrollCode_static_06] get event state result is: " + JSON.stringify(eventData));
        if (eventData.data != null) {
          expect((eventData.data as Record<String,RecordData>)['scrollToIndex']).assertEqual(10)
        }
      }
      let innerEvent: events_emitter.InnerEvent = {
        eventId: 189,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(innerEvent, callback)
      } catch (err: Error) {
        console.info("[test_scrollCode_static_06] on events_emitter err : " + JSON.stringify(err));
      }
      console.info('[test_scrollCode_static_006] sendEventByKey ' +
      JSON.stringify(inspector.sendEventByKey('button', 10, "")));
      await CommonFunc.sleep(1000)
      console.info('[test_scrollCode_static_006] testSendTouchEvent END');
      done();
    });
  })
}