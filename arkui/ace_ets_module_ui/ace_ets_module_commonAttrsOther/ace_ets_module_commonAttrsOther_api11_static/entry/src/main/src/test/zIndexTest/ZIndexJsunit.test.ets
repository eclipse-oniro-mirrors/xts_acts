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
import emitter from '@ohos.events.emitter';
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it,Level } from '../../../../hypium/index'
import router from '@ohos.router';
import {
  Component,
  DisplayRotation,
  Driver,
  MatchPattern,
  ON,
  Point,
  PointerMatrix,
  Rect,
  ResizeDirection,
  UiWindow,
  WindowMode
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Callback, MessageManager } from '../../../ets/MainAbility/utils/MessageManager';
import window from '@ohos.window';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import inspector from '@ohos.arkui.inspector'
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement'
import display from '@ohos.display'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import { UtilsTest } from '../Util.test';
import { RecordData } from '@ohos.base';

let domain: number = 0x0000;
let tag: String = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function zIndexJsunit() {
  describe('zIndexTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("zIndexJsunit beforeAll start");
      
      await UtilsTest.startAbility("com.arkui.ace.commonAttrsOther.api11.static", "EntryAbility")
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("zIndexTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/zIndex/zIndex',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get zIndexTest state pages:" + JSON.stringify(pages));
        if (!("zIndex" == pages.name)) {
          console.info("get zIndexTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push zIndexTest page error:" + err);
      }
      console.info("zIndexTest beforeEach end");
    });

    afterEach(async () => {
      await CommonFunc.sleep(2000);
      // const routerInstance = AppStorage.get<Router>("router") as Router
      // routerInstance.back();
      console.info("zIndex after each called");
    });

    
/**
     * @tc.number   testZIndex_static_01
     * @tc.name     testZIndex_static_01
     * @tc.desc     testZIndex_static_01
     * @tc.level    Level.LEVEL0
     */
it('testZIndex_static_01', Level.LEVEL0, async () => {
      console.info('[testZIndex01] START');
      await CommonFunc.sleep(4000);
      let strJson = inspector.getInspectorByKey('zIndex');
      await CommonFunc.sleep(2000);
      console.info("[testZIndex01] obj is: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('zIndex')).assertEqual(1);
      console.info('[testZIndex01] END');

    });

    
/**
     * @tc.number   testZIndex_static_02
     * @tc.name     testZIndex_static_02
     * @tc.desc     testZIndex_static_02
     * @tc.level    Level.LEVEL0
     */
it('testZIndex_static_02', Level.LEVEL0, async () => {
      console.info('[testZIndex02] START');
      try {
        let eventData: emitter.EventData = {
          data: {
            "zIndex": 4
          } as Record<String,RecordData>
        }
        let innerEvent: emitter.InnerEvent = {
          eventId: 236,
          priority: emitter.EventPriority.LOW
        }
        console.info("[testZIndex02] start to publish emit");
        emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testZIndex02] change component data error: " + err.message);
      }
      await CommonFunc.sleep(4000);
      let strJson = inspector.getInspectorByKey('zIndex');
      await CommonFunc.sleep(2000);
      console.info("[testZIndex02] obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('zIndex')).assertEqual(4);
      console.info('testZIndex02 END');

    });

    
/**
     * @tc.number   testZIndex_static_03
     * @tc.name     testZIndex_static_03
     * @tc.desc     testZIndex_static_03
     * @tc.level    Level.LEVEL0
     */
it('testZIndex_static_03', Level.LEVEL0, async () => {
      console.info('[testZIndex03] START');
      try {
        let eventData: emitter.EventData = {
          data: {
            "zIndex": -5
          } as Record<String,RecordData>
        }
        let innerEvent: emitter.InnerEvent = {
          eventId: 236,
          priority: emitter.EventPriority.LOW
        }
        console.info("[testZIndex03] start to publish emit");
        emitter.emit(innerEvent, eventData);

      } catch (err) {
        console.log("[testZIndex03] change component data error: " + err.message);
      }
      await CommonFunc.sleep(4000);
      let strJson = inspector.getInspectorByKey('zIndex');
      await CommonFunc.sleep(2000);
      console.info("[testZIndex03] obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('zIndex')).assertEqual(-5);
      console.info('testZIndex03 END');

    });

    
/**
     * @tc.number   testZIndex_static_04
     * @tc.name     testZIndex_static_04
     * @tc.desc     testZIndex_static_04
     * @tc.level    Level.LEVEL0
     */
it('testZIndex_static_04', Level.LEVEL0, async () => {
      console.info('[testZIndex04] START');
      try {
        let eventData: emitter.EventData = {
          data: {
            "zIndex": 889900444
          } as Record<String,RecordData>
        }
        let innerEvent: emitter.InnerEvent = {
          eventId: 1113,
          priority: emitter.EventPriority.LOW
        }
        console.info("[testZIndex04] start to publish emit");
        emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testZIndex04] change component data error: " + err.message);
      }
      await CommonFunc.sleep(4000);
      let strJson = inspector.getInspectorByKey('zIndex');
      await CommonFunc.sleep(2000);
      console.info("[testZIndex04] obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('zIndex')).assertEqual(889900444);
      console.info('testZIndex04 END');
    });
  })
}
