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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import { Driver, Component, ON, Rect } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test'
import events_emitter from '@ohos.events.emitter';
import inspector from '@ohos.arkui.inspector'
import { RecordData } from '@ohos.base';

let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function listLevel1HorizontalTest() {
  describe('listLevel1HorizontalTest', () => {
    beforeAll(() => {

      
      await UtilsTest.startAbility("com.arkui.ace.scroll12.static", "EntryAbility")
      
    });
    beforeEach(async (): Promise<void> => {
      console.info("listLevel1HorizontalTest beforeEach start");
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get listLevel1HorizontalTest state pages:" + JSON.stringify(pages));
        if (!("ListLevel1Horizontal" == pages.name)) {
          console.info("get listLevel1HorizontalTest pages.name:" + JSON.stringify(pages.name));
          router.pushUrl({ url: "MainAbility/pages/List/ListLevel1Horizontal" })
        }
      } catch (err) {
        console.error("push listLevel1HorizontalTest page error:" + err);
      }
      console.info("listLevel1HorizontalTest beforeEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("listLevel1HorizontalTest after each called");
    });


    
    /**
     * @tc.number   listLevel1HorizontalTest_static_0100
     * @tc.name     listLevel1HorizontalTest_static_0100
     * @tc.desc     listLevel1HorizontalTest_static_0100
     * @tc.level    Level.LEVEL1
     */
it('listLevel1HorizontalTest_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[listLevel1HorizontalTest_static_0100] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "endMargin": "30.00vp"
          } as Record<string, RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 125,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[listLevel1HorizontalTest_static_0100] start to publish emit:" + JSON.stringify(eventData.data));
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[listLevel1HorizontalTest_static_0100] change component data error: " + err.message);
      }
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('listlevel1Horizontal');

      console.info("[listLevel1HorizontalTest_static_0100] JSON.parseJsonElement(strJson) is: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('divider').getString('endMargin'))
        .assertEqual("30.00vp");
      console.info('listLevel1HorizontalTest_static_0100 END');
      done()
    });


    
    /**
     * @tc.number   listLevel1HorizontalTest_static_0200
     * @tc.name     listLevel1HorizontalTest_static_0200
     * @tc.desc     listLevel1HorizontalTest_static_0200
     * @tc.level    Level.LEVEL1
     */
it('listLevel1HorizontalTest_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[listLevel1HorizontalTest_static_0200] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "strokeWidth": "50.5vp"
          } as Record<string, RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 125,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[listLevel1HorizontalTest_static_0200] start to publish emit:" + JSON.stringify(eventData.data));
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[listLevel1HorizontalTest_static_0200] change component data error: " + err.message);
      }
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('listlevel1Horizontal');

      console.info("[listLevel1HorizontalTest_static_0200] JSON.parseJsonElement(strJson) is: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('divider').getString('strokeWidth'))
        .assertEqual("50.50vp");
      console.info('listLevel1HorizontalTest_static_0200 END');
      done()
    });


    
    /**
     * @tc.number   listLevel1HorizontalTest_static_0300
     * @tc.name     listLevel1HorizontalTest_static_0300
     * @tc.desc     listLevel1HorizontalTest_static_0300
     * @tc.level    Level.LEVEL1
     */
it('listLevel1HorizontalTest_static_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[listLevel1HorizontalTest_static_0300] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "startMargin": "30.00vp"
          } as Record<string, RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 125,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[listLevel1HorizontalTest_static_0300] start to publish emit:" + JSON.stringify(eventData.data));
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[listLevel1HorizontalTest_static_0300] change component data error: " + err.message);
      }
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('listlevel1Horizontal');

      console.info("[listLevel1HorizontalTest_static_0300] JSON.parseJsonElement(strJson) is: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('divider').getString('startMargin'))
        .assertEqual("30.00vp");
      console.info('listLevel1HorizontalTest_static_0300 END');
      done()
    });


    
    /**
     * @tc.number   listLevel1HorizontalTest_static_0400
     * @tc.name     listLevel1HorizontalTest_static_0400
     * @tc.desc     listLevel1HorizontalTest_static_0400
     * @tc.level    Level.LEVEL1
     */
it('listLevel1HorizontalTest_static_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[listLevel1HorizontalTest_static_0400] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "startMargin": "0.00vp"
          } as Record<string, RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 125,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[listLevel1HorizontalTest_static_0400] start to publish emit:" + JSON.stringify(eventData.data));
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[listLevel1HorizontalTest_static_0400] change component data error: " + err.message);
      }
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('listlevel1Horizontal');

      console.info("[listLevel1HorizontalTest_static_0400] JSON.parseJsonElement(strJson) is: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('divider').getString('startMargin'))
        .assertEqual("0.00vp");
      console.info('listLevel1HorizontalTest_static_0400 END');
      done()
    });


    
    /**
     * @tc.number   listLevel1HorizontalTest_static_0500
     * @tc.name     listLevel1HorizontalTest_static_0500
     * @tc.desc     listLevel1HorizontalTest_static_0500
     * @tc.level    Level.LEVEL1
     */
it('listLevel1HorizontalTest_static_0500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[listLevel1HorizontalTest_static_0500] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "startMargin": "30.90vp"
          } as Record<string, RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 125,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[listLevel1HorizontalTest_static_0500] start to publish emit:" + JSON.stringify(eventData.data));
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[listLevel1HorizontalTest_static_0500] change component data error: " + err.message);
      }
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('listlevel1Horizontal');

      console.info("[listLevel1HorizontalTest_static_0500] JSON.parseJsonElement(strJson) is: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('divider').getString('startMargin'))
        .assertEqual("30.90vp");
      console.info('listLevel1HorizontalTest_static_0500 END');
      done()
    });


    
    /**
     * @tc.number   listLevel1HorizontalTest_static_0600
     * @tc.name     listLevel1HorizontalTest_static_0600
     * @tc.desc     listLevel1HorizontalTest_static_0600
     * @tc.level    Level.LEVEL1
     */
it('listLevel1HorizontalTest_static_0600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[listLevel1HorizontalTest_static_0600] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "endMargin": "0.00vp"
          } as Record<string, RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 125,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[listLevel1HorizontalTest_static_0600] start to publish emit:" + JSON.stringify(eventData.data));
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[listLevel1HorizontalTest_static_0600] change component data error: " + err.message);
      }
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('listlevel1Horizontal');

      console.info("[listLevel1HorizontalTest_static_0600] JSON.parseJsonElement(strJson) is: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('divider').getString('endMargin'))
        .assertEqual("0.00vp");
      console.info('listLevel1HorizontalTest_static_0600 END');
      done()
    });


    
    /**
     * @tc.number   listLevel1HorizontalTest_static_0700
     * @tc.name     listLevel1HorizontalTest_static_0700
     * @tc.desc     listLevel1HorizontalTest_static_0700
     * @tc.level    Level.LEVEL1
     */
it('listLevel1HorizontalTest_static_0700', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[listLevel1HorizontalTest_static_0700] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "endMargin": "30.9vp"
          } as Record<string, RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 125,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[listLevel1HorizontalTest_static_0700] start to publish emit:" + JSON.stringify(eventData.data));
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[listLevel1HorizontalTest_static_0700] change component data error: " + err.message);
      }
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('listlevel1Horizontal');

      console.info("[listLevel1HorizontalTest_static_0700] JSON.parseJsonElement(strJson) is: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('divider').getString('endMargin'))
        .assertEqual("30.90vp");
      console.info('listLevel1HorizontalTest_static_0700 END');
      done()
    });
  })
}
