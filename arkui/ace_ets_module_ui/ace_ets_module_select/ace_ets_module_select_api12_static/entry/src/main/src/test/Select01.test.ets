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

import { describe, beforeEach, it, expect, Level, beforeAll, beforeEach, Size, afterEach, TestType } from '../../../hypium/index';
import { Color } from '@ohos.arkui.component'
import router from '@ohos.router';
import Utils from '../../ets/MainAbility/common/Utils';
import { Driver, ON, MouseButton, Component } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from './Util.test';
// import Utils from './Utils';
import events_emitter from '@ohos.events.emitter';
import { ArrowPosition, $r} from '@ohos.arkui.component'
import { RecordData } from '@ohos.base';

export default function select() {
  describe('ActsAceBasicSelectTest', () => {

    beforeAll(() => {
      console.info("select beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.select.api12.static", "EntryAbility")
      
    });

    beforeEach(async () => {
      await Utils.sleep(2000);
      console.info("select beforeEach start");
    })

    afterEach(async () => {
      console.info("[selectTest_afterEach] start");
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "spaceValue": 8,
            "arrowPosition": ArrowPosition.END,
            "spaceValueString": '50.00vp'
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 181,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[selectTest_afterEach] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[selectTest_afterEach] change component data error: " +(err as Error).message);
      }
    })


    
    
    
    /**
     * @tc.number   ArkUI_Stage_Select_Layout_static_0100
     * @tc.name     ArkUI_Stage_Select_Layout_static_0100
     * @tc.desc     ArkUI_Stage_Select_Layout_static_0100
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_Stage_Select_Layout_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Stage_Select_Layout_static_0100 start");
      let strJson = inspector.getInspectorByKey('selectTest');

      console.info("ArkUI_Stage_Select_Layout_static_0100: arrowPosition=" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('arrowPosition'))
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('arrowPosition') == 'ArrowPosition.END').assertTrue();
      done();
    });


    
    
    
    /**
     * @tc.number   ArkUI_Stage_Select_Layout_static_0200
     * @tc.name     ArkUI_Stage_Select_Layout_static_0200
     * @tc.desc     ArkUI_Stage_Select_Layout_static_0200
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_Stage_Select_Layout_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Stage_Select_Layout_static_0200 start");
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "arrowPosition": ArrowPosition.START
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 181,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Select_Layout_static_0200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Select_Layout_static_0200] change component data error: " + (err as Error).message);

      }
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('selectTest');

      console.info("[ArkUI_Stage_Select_Layout_static_0200] arrowPosition:" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('arrowPosition'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('arrowPosition') == 'ArrowPosition.START').assertTrue();
      done();
    });


    
    
    
    /**
     * @tc.number   ArkUI_Stage_Select_Layout_static_0300
     * @tc.name     ArkUI_Stage_Select_Layout_static_0300
     * @tc.desc     ArkUI_Stage_Select_Layout_static_0300
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_Stage_Select_Layout_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Stage_Select_Layout_static_0300 start");
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "arrowPosition": 'null'
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 181,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Select_Layout_static_0300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Select_Layout_static_0300] change component data error: " + (err as Error).message);

      }
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('selectTest');

      console.info("[ArkUI_Stage_Select_Layout_static_0300] arrowPosition:" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('arrowPosition'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('arrowPosition') == 'ArrowPosition.END').assertTrue();
      done();
    });


    
    
    
    /**
     * @tc.number   ArkUI_Stage_Select_Layout_static_0400
     * @tc.name     ArkUI_Stage_Select_Layout_static_0400
     * @tc.desc     ArkUI_Stage_Select_Layout_static_0400
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_Stage_Select_Layout_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Stage_Select_Layout_static_0400 start");
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "arrowPosition": -1
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 181,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Select_Layout_static_0400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Select_Layout_static_0400] change component data error: " + (err as Error).message);

      }
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('selectTest');

      console.info("[ArkUI_Stage_Select_Layout_static_0400] arrowPosition:" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('arrowPosition'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('arrowPosition') == 'ArrowPosition.END').assertTrue();
      done();
    });


    
    
    
    /**
     * @tc.number   ArkUI_Stage_Select_Space_0100
     * @tc.name     ArkUI_Stage_Select_Space_0100
     * @tc.desc     ArkUI_Stage_Select_Space_0100
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_Stage_Select_Space_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Stage_Select_Space_0100 start");
      let strJson = inspector.getInspectorByKey('selectTest');

      console.info("ArkUI_Stage_Select_Space_0100: space=" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('space'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('space')).assertEqual('8.00vp');
      done();
    });


    
    
    
    /**
     * @tc.number   ArkUI_Stage_Select_Space_0200
     * @tc.name     ArkUI_Stage_Select_Space_0200
     * @tc.desc     ArkUI_Stage_Select_Space_0200
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_Stage_Select_Space_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Stage_Select_Space_0200 start");
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "spaceValue": 20.00
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 181,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Select_Space_0200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Select_Space_0200] change component data error: " + (err as Error).message);

      }
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('selectTest');

      console.info("[ArkUI_Stage_Select_Space_0200] space:" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('space'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('space')).assertEqual('20.00vp');
      done();
    });


    
    
    
    /**
     * @tc.number   ArkUI_Stage_Select_Space_0300
     * @tc.name     ArkUI_Stage_Select_Space_0300
     * @tc.desc     ArkUI_Stage_Select_Space_0300
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_Stage_Select_Space_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Stage_Select_Space_0300 start");
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "spaceValueString": '40.00vp'
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 181,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Select_Space_0300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Select_Space_0300] change component data error: " + (err as Error).message);

      }
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('selectTest2');

      console.info("[ArkUI_Stage_Select_Space_0300] space:" + JSON.parseJsonElement(strJson).getElement('$attrs').getElement('space'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('space')).assertEqual('40.00vp');
      done();
    });


    
    
    
    /**
     * @tc.number   ArkUI_Stage_Select_Space_0400
     * @tc.name     ArkUI_Stage_Select_Space_0400
     * @tc.desc     ArkUI_Stage_Select_Space_0400
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_Stage_Select_Space_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Stage_Select_Space_0400 start");
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "spaceValue": 'null'
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 181,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Select_Space_0400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Select_Space_0400] change component data error: " + (err as Error).message);

      }
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('selectTest');

      console.info("[ArkUI_Stage_Select_Space_0400] space:" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('space'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('space')).assertEqual('8.00vp');
      done();
    });


    
    
    
    /**
     * @tc.number   ArkUI_Stage_Select_Space_0500
     * @tc.name     ArkUI_Stage_Select_Space_0500
     * @tc.desc     ArkUI_Stage_Select_Space_0500
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_Stage_Select_Space_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Stage_Select_Space_0500 start");
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "spaceValue": -1
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 181,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Select_Space_0500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Select_Space_0500] change component data error: " + (err as Error).message);

      }
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('selectTest');

      console.info("[ArkUI_Stage_Select_Space_0500] space:" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('space'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('space')).assertEqual('8.00vp');
      done();
    });


    
    
    
    /**
     * @tc.number   ArkUI_Stage_Select_Space_0600
     * @tc.name     ArkUI_Stage_Select_Space_0600
     * @tc.desc     ArkUI_Stage_Select_Space_0600
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_Stage_Select_Space_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Stage_Select_Space_0600 start");
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "spaceValueResource": $r('app.string.Test_Values')
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 181,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Select_Space_0600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Select_Space_0600] change component data error: " + (err as Error).message);

      }
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('selectTest3');

      console.info("[ArkUI_Stage_Select_Space_0600] space:" + JSON.parseJsonElement(strJson).getElement('$attrs').getElement('space'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('space')).assertEqual('50.00vp');
      done();
    });


    
    
    
    /**
     * @tc.number   ArkUI_Stage_Select_Space_0700
     * @tc.name     ArkUI_Stage_Select_Space_0700
     * @tc.desc     ArkUI_Stage_Select_Space_0700
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_Stage_Select_Space_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Stage_Select_Space_0700 start");
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "spaceValueString": "40.00px"
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 181,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Select_Space_0700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Select_Space_0700] change component data error: " + (err as Error).message);

      }
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('selectTest2');

      console.info("[ArkUI_Stage_Select_Space_0700] space:" + JSON.parseJsonElement(strJson).getElement('$attrs').getElement('space'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('space')).assertEqual('40.00px');
      //expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('space') == expectString).assertTrue();
      done();
    });


    
    
    
    /**
     * @tc.number   ArkUI_Stage_Select_Space_0800
     * @tc.name     ArkUI_Stage_Select_Space_0800
     * @tc.desc     ArkUI_Stage_Select_Space_0800
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_Stage_Select_Space_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Stage_Select_Space_0800 start");
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "spaceValueString": "40.00lpx"
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 181,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Select_Space_0800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Select_Space_0800] change component data error: " + (err as Error).message);

      }
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('selectTest2');

      console.info("[ArkUI_Stage_Select_Space_0800] space:" + JSON.parseJsonElement(strJson).getElement('$attrs').getElement('space'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('space')).assertEqual('40.00lpx');
      done();
    });


    
    
    
    /**
     * @tc.number   ArkUI_Stage_Select_Space_0900
     * @tc.name     ArkUI_Stage_Select_Space_0900
     * @tc.desc     ArkUI_Stage_Select_Space_0900
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_Stage_Select_Space_0900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Stage_Select_Space_0900 start");
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "spaceValueString": "40.00fp"
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 181,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Select_Space_0900] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Select_Space_0900] change component data error: " + (err as Error).message);

      }
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('selectTest2');

      console.info("[ArkUI_Stage_Select_Space_0900] space:" + JSON.parseJsonElement(strJson).getElement('$attrs').getElement('space'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('space')).assertEqual('40.00fp');
      done();
    });


    
    
    
    /**
     * @tc.number   ArkUI_Stage_Select_Size_1000
     * @tc.name     ArkUI_Stage_Select_Size_1000
     * @tc.desc     ArkUI_Stage_Select_Size_1000
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_Stage_Select_Size_1000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Stage_Select_Size_1000 start");
      let strJson = inspector.getInspectorByKey('ArkUI_Stage_Select_Size_1000');

      console.info("[ArkUI_Stage_Select_Size_1000] str:" + strJson);
      console.info("[ArkUI_Stage_Select_Size_1000] json:" + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[ArkUI_Stage_Select_Size_1000] space:" + JSON.parseJsonElement(strJson).getElement('$attrs').getElement('controlSize'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('controlSize')).assertEqual('ControlSize.NORMAL');
      done();
    });
  })
}