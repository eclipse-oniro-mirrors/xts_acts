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
import { StickyStyle } from '@ohos.arkui.component'
import { RecordData } from '@ohos.base';

let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function listItemJsunit2() {
  describe('listItemJsunit2', () => {
    beforeAll(() => {
      
      await UtilsTest.startAbility("com.arkui.ace.scroll.static", "EntryAbility")
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("listItem beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/List/listItem2',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get listItem state pages:" + JSON.stringify(pages));
        if (!("listItem2" == pages.name)) {
          console.info("get listItem state pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push listItem page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push listItem page error:" + err);
      }
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("listItem after each called");
    });

      
  
/**
     * @tc.number   testListItem_static_01
     * @tc.name     testListItem_static_01
     * @tc.desc     testListItem_static_01
     * @tc.level    Level.LEVEL1
     */
it('testListItem_static_01', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[testListItem_static_01] START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('ListItem');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testListItem_static_01] obj is: " + JSON.stringifyJsonElement(obj));
      expect(obj.getElement('$attrs').getString('sticky')).assertEqual('Sticky.Normal');
      console.info('testListItem_static_01 END');
      done();
    });

      
  
/**
     * @tc.number   testListItem_static_02
     * @tc.name     testListItem_static_02
     * @tc.desc     testListItem_static_02
     * @tc.level    Level.LEVEL1
     */
it('testListItem_static_02', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[testListItem_static_02] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "sticky": StickyStyle.None
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 122,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testListItem_static_02] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testListItem_static_02] change component data error: " + err.message);
      }
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('ListItem');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testListItem_static_02] obj is: " + JSON.stringifyJsonElement(obj));
      expect(obj.getElement('$attrs').getString('sticky')).assertEqual('Sticky.None');
      console.info('testListItem_static_02 END');
      done();
    });

      
  
/**
     * @tc.number   testListItem_static_03
     * @tc.name     testListItem_static_03
     * @tc.desc     testListItem_static_03
     * @tc.level    Level.LEVEL1
     */
it('testListItem_static_03', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[testListItem_static_03] START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('List');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testListItem_static_03] obj is: " + JSON.stringifyJsonElement(obj));
      expect(obj.getElement('$attrs').getBoolean('editMode')).assertTrue();
      console.info('testListItem_static_03 END');
      done();
    });

      
  
/**
     * @tc.number   testListItem_static_04
     * @tc.name     testListItem_static_04
     * @tc.desc     testListItem_static_04
     * @tc.level    Level.LEVEL1
     */
it('testListItem_static_04', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[testListItem_static_04] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "editMode": false
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 123,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testListItem_static_04] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testListItem_static_04] change component data error: " + err.message);
      }
      console.info("[testListItem_static_04] xyb000");
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('List');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testListItem_static_04] obj is: " + JSON.stringifyJsonElement(obj));
      expect(obj.getElement('$attrs').getBoolean('editMode')).assertFalse();
      console.info('testListItem_static_04 END');
      done();
    });
  })
}
