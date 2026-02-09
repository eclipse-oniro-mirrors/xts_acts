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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter';
import Utils from '../Utils.test';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import { UtilsTest, startAbility, stopApplication } from "../Util.test"
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Font, FontStyle,ResourceColor } from '@ohos.arkui.component';
import { RecordData } from '@ohos.base';

let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function selectJsunit() {
  describe('appInfoTest_five_2', () => {
    beforeAll(() => {
      console.info("appInfoTest_five_2 beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.picker.nowear.static", "EntryAbility");

    });
    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Select/select1',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get select state pages:" + JSON.stringify(pages));
        if (!("select1" == pages.name)) {
          console.info("get select pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push select page error " + JSON.stringify(err));
      }
      // done()
    });

    afterEach(async (): Promise<void> => {
      await Utils.sleep(2000);
      console.info("select after each called");
    });

    
    /**
     * @tc.number   selectTest_static_0100
     * @tc.name     selectTest_static_0100
     * @tc.desc     selectTest_static_0100
     * @tc.level    Level.LEVEL1
     */
it('selectTest_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('selectTest_static_0100 START');
      await Utils.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('select');
      console.info("selectTest_static_0100 component JSON.parse(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString("value")).assertEqual('10');
      await Utils.sleep(1000);
      done();
    });

    
    /**
     * @tc.number   selectTest_static_0200
     * @tc.name     selectTest_static_0200
     * @tc.desc     selectTest_static_0200
     * @tc.level    Level.LEVEL1
     */
it('selectTest_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[selectTest_static_0200] START');
      await Utils.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "value": "5"
          } as Record<String,RecordData>
        } as events_emitter.EventData
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 191,
          priority: events_emitter.EventPriority.LOW
        } as events_emitter.InnerEvent
        console.info("[selectTest_static_0200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[selectTest_static_0200] change component data error: " + (err as Error).message);
      }
      await Utils.sleep(2000);
      let strJsonNew = inspector.getInspectorByKey('select');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("[selectTest_static_0200] component objNew is: " + objNew.getElement('$attrs').getString('value'));
      expect(objNew.getElement('$attrs').getString('value')).assertEqual('5');
      await Utils.sleep(1000);
      done();
    });

    
    /**
     * @tc.number   selectTest_static_0300
     * @tc.name     selectTest_static_0300
     * @tc.desc     selectTest_static_0300
     * @tc.level    Level.LEVEL1
     */
it('selectTest_static_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[selectTest_static_0300] START');
      await Utils.sleep(2000);
      let strJson: string = inspector.getInspectorByKey('select');
      console.info("[selectTest_static_0300] component strJson:" + strJson);
      console.info("[selectTest_static_0300] font:" +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString("font"));
      expect(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString("font"))
        .getString("size")).assertEqual('30.00fp');
      expect(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString("font"))
        .getString('weight')).assertEqual('400');
      expect(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString("font"))
        .getString('family')).assertEqual('serif');
      expect(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString("font"))
        .getString('style')).assertEqual('FontStyle.Normal');
      done();
    });

    
    /**
     * @tc.number   selectTest_static_0400
     * @tc.name     selectTest_static_0400
     * @tc.desc     selectTest_static_0400
     * @tc.level    Level.LEVEL1
     */
it('selectTest_static_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[selectTest_static_0400] START');
      await Utils.sleep(1000);
      let font: Font = {
        size: 24,
        weight: 500,
        family: 'sans-serif',
        style: FontStyle.Normal
      } as Font
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "font": font as Font
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 191,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[selectTest_static_0400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[selectTest_static_0400] change component data error: " + (err as Error).message);
      }
      await Utils.sleep(2000);
      let strJson: string = inspector.getInspectorByKey('select');
      console.info("[selectTest_static_0400] component strJson:" + strJson);
      console.info("[selectTest_static_0400] font:" +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString("font"));
      expect(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString("font"))
        .getString('size')).assertEqual('24.00fp');
      expect(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString("font"))
        .getString('weight')).assertEqual('500');
      expect(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString("font"))
        .getString('family')).assertEqual('sans-serif');
      expect(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString("font"))
        .getString('style')).assertEqual('FontStyle.Normal');
      done();
    });

    
    /**
     * @tc.number   selectTest_static_0500
     * @tc.name     selectTest_static_0500
     * @tc.desc     selectTest_static_0500
     * @tc.level    Level.LEVEL1
     */
it('selectTest_static_0500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[selectTest_static_0500] START');
      await Utils.sleep(2000);
      let strJson: string = inspector.getInspectorByKey('select');
      console.info("[selectTest_static_0500] component strJson:" + strJson);
      console.info("[selectTest_static_0500] fontColor:" +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString("fontColor"));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString("fontColor")).assertEqual('#FFCCCCCC');
      done();
    });

    
    /**
     * @tc.number   selectTest_static_0600
     * @tc.name     selectTest_static_0600
     * @tc.desc     selectTest_static_0600
     * @tc.level    Level.LEVEL1
     */
it('selectTest_static_0600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[selectTest_static_0600] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "fontColor": '#FF000990' as ResourceColor
          } as Record<String,RecordData>
        }
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 191,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[selectTest_static_0600] start to publish emit");
        events_emitter.emit(indexEvent, eventData);
      } catch (err) {
        console.log("[selectTest_static_0600] change component data error: " + (err as Error).message);
      }
      await Utils.sleep(4000);
      let strJson: string = inspector.getInspectorByKey('select');
      console.info("[selectTest_static_0600] component strJson:" + strJson);
      console.info("[selectTest_static_0600] fontColor:" +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontColor'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontColor')).assertEqual('#FF000990');
      done();
    });

    
    /**
     * @tc.number   selectTest_static_0700
     * @tc.name     selectTest_static_0700
     * @tc.desc     selectTest_static_0700
     * @tc.level    Level.LEVEL1
     */
it('selectTest_static_0700', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[selectTest_static_0700] START');
      await Utils.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "value": "-10"
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 191,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[selectTest_static_0700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[selectTest_static_0700] change component data error: " + (err as Error).message);
      }
      await Utils.sleep(2000);
      let strJsonNew = inspector.getInspectorByKey('select');
      console.info("[selectTest_static_0700] component objNew is: " +
      JSON.stringify(JSON.parseJsonElement(strJsonNew)));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString("value")).assertEqual('-10');
      done();
    });

    
    /**
     * @tc.number   selectTest_static_0800
     * @tc.name     selectTest_static_0800
     * @tc.desc     selectTest_static_0800
     * @tc.level    Level.LEVEL1
     */
it('selectTest_static_0800', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[selectTest_static_0800] START');
      await Utils.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "value": '1111111111'
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 191,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[selectTest_static_0800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[selectTest_static_0800] change component data error: " + (err as Error).message);
      }
      await Utils.sleep(2000);
      let strJsonNew = inspector.getInspectorByKey('select');
      console.info("[selectTest_static_0800] component objNew is: " +
      JSON.stringify(JSON.parseJsonElement(strJsonNew)));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString("value")).assertEqual('1111111111');
      done();
    });

    
    /**
     * @tc.number   selectTest_static_0900
     * @tc.name     selectTest_static_0900
     * @tc.desc     selectTest_static_0900
     * @tc.level    Level.LEVEL1
     */
it('selectTest_static_0900', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[selectTest_static_0900] START');
      await Utils.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "value": '1111111111aaa'
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 191,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[selectTest_static_0900] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[selectTest_static_0900] change component data error: " + (err as Error).message);
      }
      await Utils.sleep(2000);
      let strJsonNew = inspector.getInspectorByKey('select');
      console.info("[selectTest_static_0900] component objNew is: " +
      JSON.stringify(JSON.parseJsonElement(strJsonNew)));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString("value")).assertEqual('1111111111aaa');
      done();
    });

    
    /**
     * @tc.number   selectTest_static_1000
     * @tc.name     selectTest_static_1000
     * @tc.desc     selectTest_static_1000
     * @tc.level    Level.LEVEL1
     */
it('selectTest_static_1000', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[selectTest_static_1000] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "fontColor": 121111
          } as Record<String,RecordData>
        }
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 191,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[selectTest_static_1000] start to publish emit");
        events_emitter.emit(indexEvent, eventData);
      } catch (err) {
        console.log("[selectTest_static_1000] change component data error: " + (err as Error).message);
      }
      await Utils.sleep(4000);
      let strJson: string = inspector.getInspectorByKey('select');
      console.info("[selectTest_static_1000] component strJson:" + strJson);

      console.info("[selectTest_static_1000] fontColor:" +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontColor'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString("fontColor")).assertEqual('#FF01D917');
      done();
    });

  })
}
