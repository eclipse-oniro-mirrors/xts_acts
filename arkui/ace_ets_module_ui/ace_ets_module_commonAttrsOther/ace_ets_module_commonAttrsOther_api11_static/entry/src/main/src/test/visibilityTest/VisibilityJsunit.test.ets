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
import { Visibility } from '@ohos.arkui.component'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import { UtilsTest } from '../Util.test';
import { RecordData } from '@ohos.base';

let domain: number = 0x0000;
let tag: String = 'testTag';
let testAbilityContext: common.UIAbilityContext;


export default function visibilityJsunit() {
  describe('visibilityTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("visibilityJsunit beforeAll start");
      
      await UtilsTest.startAbility("com.arkui.ace.commonAttrsOther.api11.static", "EntryAbility")
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("visibilityTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/visibility/visibility',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get visibilityTest state pages:" + JSON.stringify(pages));
        if (!("visibility" == pages.name)) {
          console.info("get visibilityTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push visibilityTest page error:" + err);
      }
      console.info("visibilityTest beforeEach end");
    });


    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("visibility after each called");
    });

    
/**
     * @tc.number   testVisibility_static_01
     * @tc.name     testVisibility_static_01
     * @tc.desc     testVisibility_static_01
     * @tc.level    Level.LEVEL0
     */
it('testVisibility_static_01', Level.LEVEL0, async () => {
      console.info('[testVisibility01] START');
      await CommonFunc.sleep(1000);
      let strJson: String = inspector.getInspectorByKey('box');
      await CommonFunc.sleep(1000);
      console.info("[testVisibility01] JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('visibility'))
        .assertEqual('Visibility.Visible');
      console.info('[testVisibility01] END');

    });

    
/**
     * @tc.number   testVisibility_static_02
     * @tc.name     testVisibility_static_02
     * @tc.desc     testVisibility_static_02
     * @tc.level    Level.LEVEL0
     */
it('testVisibility_static_02', Level.LEVEL0, async () => {
      console.info('[testVisibility02] START');
      try {
        let eventData: emitter.EventData = {
          data: {
            "visibility": Visibility.Hidden,
          } as Record<String,RecordData>
        }
        let innerEvent: emitter.InnerEvent = {
          eventId: 47,
          priority: emitter.EventPriority.LOW
        }
        console.info("[testVisibility02] start to publish emit:" + JSON.stringify(eventData.data));
        emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testVisibility02] change component data error: " + err.message);
      }
      await CommonFunc.sleep(1000);
      let strJson: String = inspector.getInspectorByKey('box');

      console.info("[testVisibility02] JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('visibility'))
        .assertEqual('Visibility.Hidden');
      console.info('[testVisibility02] END');

    });

    
/**
     * @tc.number   testVisibility_static_03
     * @tc.name     testVisibility_static_03
     * @tc.desc     testVisibility_static_03
     * @tc.level    Level.LEVEL0
     */
it('testVisibility_static_03', Level.LEVEL0, async () => {
      console.info('[testVisibility03] START');
      try {
        let eventData: emitter.EventData = {
          data: {
            "visibility": Visibility.None,
          } as Record<String,RecordData>
        }
        let innerEvent: emitter.InnerEvent = {
          eventId: 48,
          priority: emitter.EventPriority.LOW
        }
        console.info("[testVisibility03] start to publish emit:" + JSON.stringify(eventData.data));
        emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testVisibility03] change component data error: " + err.message);
      }
      await CommonFunc.sleep(1000);
      let strJson: String = inspector.getInspectorByKey('box');

      console.info("[testVisibility03] JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('visibility'))
        .assertEqual('Visibility.None');
      console.info('[testVisibility03] END');

    });

    
/**
     * @tc.number   testVisibility_static_04
     * @tc.name     testVisibility_static_04
     * @tc.desc     testVisibility_static_04
     * @tc.level    Level.LEVEL0
     */
it('testVisibility_static_04', Level.LEVEL0, async () => {
      console.info('[testVisibility04] START');
      try {
        let eventData: emitter.EventData = {
          data: {
            "visibility": 0.11111
          } as Record<String,RecordData>
        }
        let innerEvent: emitter.InnerEvent = {
          eventId: 1116,
          priority: emitter.EventPriority.LOW
        }
        console.info("[testVisibility04] start to publish emit:" + JSON.stringify(eventData.data));
        emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testVisibility04] change component data error: " + err.message);
      }
      await CommonFunc.sleep(1000);
      let strJson: String = inspector.getInspectorByKey('box');

      console.info("[testVisibility04] JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('visibility'))
        .assertEqual('Visibility.None');
      console.info('[testVisibility04] END');
    });

    
/**
     * @tc.number   testVisibility_static_05
     * @tc.name     testVisibility_static_05
     * @tc.desc     testVisibility_static_05
     * @tc.level    Level.LEVEL0
     */
it('testVisibility_static_05', Level.LEVEL0, async () => {
      console.info('[testVisibility05] START');
      try {
        let eventData: emitter.EventData = {
          data: {
            "visibility": 'nothing',
          } as Record<String,RecordData>
        }
        let innerEvent: emitter.InnerEvent = {
          eventId: 1116,
          priority: emitter.EventPriority.LOW
        }
        console.info("[testVisibility05] start to publish emit:" + JSON.stringify(eventData.data));
        emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testVisibility05] change component data error: " + err.message);
      }
      await CommonFunc.sleep(1000);
      let strJson: String = inspector.getInspectorByKey('box');
      console.info("[testVisibility05] JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('visibility'))
        .assertEqual('Visibility.None');
      console.info('[testVisibility05] END');
    });
  })
}
