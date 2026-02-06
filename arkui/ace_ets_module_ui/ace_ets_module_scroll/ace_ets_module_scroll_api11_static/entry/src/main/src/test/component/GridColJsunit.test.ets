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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import {
  Component,
  Driver,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test'
import events_emitter from '@ohos.events.emitter';
import { RecordData } from '@ohos.base';

let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function GridColJsunit() {
  describe('gridColOffsetTest', () => {
    beforeAll(() => {

      
      await UtilsTest.startAbility("com.arkui.ace.scroll.static", "EntryAbility")
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("gridCol beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/component/gridcolPage',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get gridCol state pages: " + JSON.stringify(pages));
        if (!("gridcolPage" == pages.name)) {
          console.info("get gridColstate pages.name: " + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push gridCol page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push gridCol page error: " + err);
      }
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("gridcol after each called");
    })


    
    /**
     * @tc.number   testGridColOffset_static_01
     * @tc.name     testGridColOffset_static_01
     * @tc.desc     testGridColOffset_static_01
     * @tc.level    Level.LEVEL1
     */
it('testGridColOffset_static_01', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let tagName = 'testGridColOffset_static_01';
      console.info('[' + tagName + '] START============================');
      await CommonFunc.sleep(1000)
      let strJson = inspector.getInspectorByKey('keykeyoffset');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[' + tagName + '] component obj is: ' +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('gridColOffset')));
      expect(obj.getString('$type')).assertEqual('GridCol');
      expect(obj.getElement('$attrs').getString('gridColOffset')).assertEqual("0");

      try {
        let eventData: events_emitter.EventData = {
          data: {
            "gridColOffsetNum": 1,
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 181,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew = inspector.getInspectorByKey('keykeyoffset');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info('[' + tagName + '] component objNew is: ' + JSON.stringifyJsonElement(objNew));

      expect(objNew.getString('$type')).assertEqual('GridCol');
      expect(objNew.getElement('$attrs').getString('gridColOffset')).assertEqual("1");

      try {
        let eventData3: events_emitter.EventData = {
          data: {
            "gridColOffsetNum": 2,
          } as Record<String,RecordData>
        }
        let innerEvent3: events_emitter.InnerEvent = {
          eventId: 182,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent3, eventData3);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson3 = inspector.getInspectorByKey('keykeyoffset');
      let obj3 = JSON.parseJsonElement(strJson3);
      console.info('[' + tagName + '] component strJson3 is: ' + strJson3);

      expect(obj3.getString('$type')).assertEqual('GridCol');
      expect(obj3.getElement('$attrs').getString('gridColOffset')).assertEqual("2");
      console.info('[' + tagName + '] END ===========================');
      done();
    });


    
    /**
     * @tc.number   testGridColSpan_static_02
     * @tc.name     testGridColSpan_static_02
     * @tc.desc     testGridColSpan_static_02
     * @tc.level    Level.LEVEL1
     */
it('testGridColSpan_static_02', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let tagName = 'testGridColSpan_static_02';
      console.info('[' + tagName + '] START============================');
      await CommonFunc.sleep(1000)
      let strJson = inspector.getInspectorByKey('keykeyspan');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[' + tagName + '] component obj is: ' +
      JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('span')));
      expect(obj.getString('$type')).assertEqual('GridCol');
      expect(obj.getElement('$attrs').getString('span')).assertEqual("1");

      try {
        let eventData: events_emitter.EventData = {
          data: {
            "spanNum": 0,
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew = inspector.getInspectorByKey('keykeyspan');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info('[' + tagName + '] component objNew is: ' + JSON.stringifyJsonElement(objNew));

      expect(objNew.getString('$type')).assertEqual('GridCol');
      expect(objNew.getElement('$attrs').getString('span')).assertEqual("1");

      try {
        let eventData3: events_emitter.EventData = {
          data: {
            "spanNum": 1,
          } as Record<String,RecordData>
        }
        let innerEvent3: events_emitter.InnerEvent = {
          eventId: 184,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit3');
        events_emitter.emit(innerEvent3, eventData3);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson3 = inspector.getInspectorByKey('keykeyspan');
      let obj3 = JSON.parseJsonElement(strJson3);
      console.info('[' + tagName + '] component strJson3 is: ' + strJson3);

      expect(obj3.getString('$type')).assertEqual('GridCol');
      expect(obj3.getElement('$attrs').getString('span')).assertEqual("2");
      console.info('[' + tagName + '] END ===========================');
      done();
    });


    
    /**
     * @tc.number   testGridColOrder_static_03
     * @tc.name     testGridColOrder_static_03
     * @tc.desc     testGridColOrder_static_03
     * @tc.level    Level.LEVEL1
     */
it('testGridColOrder_static_03', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let tagName = 'testGridColOrder_static_03';
      console.info('[' + tagName + '] START============================');
      await CommonFunc.sleep(1000)
      let strJsonOrder1 = inspector.getInspectorByKey('keykeyorder1');
      let objOrder1 = JSON.parseJsonElement(strJsonOrder1);
      console.info('[' + tagName + '] component objOrder1 is: ' +
      JSON.stringifyJsonElement(objOrder1.getElement('$attrs').getElement('order')));
      expect(objOrder1.getString('$type')).assertEqual('GridCol');
      expect(objOrder1.getElement('$attrs').getString('order')).assertEqual("1");
      let strJsonOrder2 = inspector.getInspectorByKey('keykeyorder2');
      let objOrder2 = JSON.parseJsonElement(strJsonOrder2);
      console.info('[' + tagName + '] component objOrder2 is: ' +
      JSON.stringifyJsonElement(objOrder2.getElement('$attrs').getElement('order')));
      expect(objOrder2.getString('$type')).assertEqual('GridCol');
      expect(objOrder2.getElement('$attrs').getString('order')).assertEqual("2");

      try {
        let eventData: events_emitter.EventData = {
          data: {
            "orderNum": 1,
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 185,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNewOrder1 = inspector.getInspectorByKey('keykeyorder1');
      let objNewOrder1 = JSON.parseJsonElement(strJsonNewOrder1);
      console.info('[' + tagName + '] component objNewOrder1 is: ' +
      JSON.stringifyJsonElement(objNewOrder1.getElement('$attrs').getElement('order')));
      expect(objNewOrder1.getString('$type')).assertEqual('GridCol');
      expect(objNewOrder1.getElement('$attrs').getString('order')).assertEqual("2");
      let strJsonNewOrder2 = inspector.getInspectorByKey('keykeyorder2');
      let objNewOrder2 = JSON.parseJsonElement(strJsonNewOrder2);
      console.info('[' + tagName + '] component objNewOrder2 is: ' +
      JSON.stringifyJsonElement(objNewOrder2.getElement('$attrs').getElement('order')));
      expect(objNewOrder2.getString('$type')).assertEqual('GridCol');
      expect(objNewOrder2.getElement('$attrs').getString('order')).assertEqual("1");


      console.info('[' + tagName + '] END ===========================');
      done();
    });

  })
}
