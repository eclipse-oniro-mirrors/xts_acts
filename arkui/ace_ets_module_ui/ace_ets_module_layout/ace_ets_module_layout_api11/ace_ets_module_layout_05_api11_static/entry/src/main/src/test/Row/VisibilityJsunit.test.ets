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
import { describe, beforeEach, afterEach, it, expect, beforeAll,Level } from "../../../../hypium/index";
import events_emitter from '@ohos.events.emitter';
import Utils from '../Utils.test';
import inspector from '@ohos.arkui.inspector'
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Visibility } from '@ohos.arkui.component'
import router from '@ohos.router';

import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test'
import { RecordData } from '@ohos.base';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function visibilityJsunit() {
  describe('appInfoTest_five_5', () => {
    beforeAll(() => {
      console.info("appInfoTest_five_5 beforeAll start");
           
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.layout.split05.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("visibilityJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Row/visibility',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get visibilityJsunit state pages: " + JSON.stringify(pages));
        if (!("visibility" == pages.name)) {
          console.info("get visibilityJsunit state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push visibilityJsunit page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("visibility after each called");
    });
    
    
    

/**
     * @tc.number   testVisibility01_static_01
     * @tc.name     testVisibility01_static_01
     * @tc.desc     testVisibility01_static_01
     * @tc.level    Level.LEVEL0
     */
it('testVisibility01_static_01', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testVisibility01_static_01] START');
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('box');
      let obj = JSON.parseJsonElement(strJson)
     console.info("[testVisibility01_static_01] obj is: " + JSON.stringify(obj));
     expect(obj.getElement('$attrs').getString('visibility')).assertEqual('Visibility.Visible');
      console.info('[testVisibility01_static_01] END');
      done();
    });
    
    
    

/**
     * @tc.number   testVisibility02_static_02
     * @tc.name     testVisibility02_static_02
     * @tc.desc     testVisibility02_static_02
     * @tc.level    Level.LEVEL0
     */
it('testVisibility02_static_02', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testVisibility02_static_02] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "visibility": Visibility.Hidden,
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 47,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testVisibility02_static_02] start to publish emit:" + JSON.stringify(eventData.data));
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testVisibility02_static_02] change component data error: " + (err as Error)?.message);
      }
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('box');
      let obj = JSON.parseJsonElement(strJson)
     console.info("[testVisibility02_static_02] obj is: " + JSON.stringify(obj));
     expect(obj.getElement('$attrs').getString('visibility')).assertEqual('Visibility.Hidden');
      console.info('[testVisibility02_static_02] END');
      done();
    });
    
    
    

/**
     * @tc.number   testVisibility03_static_03
     * @tc.name     testVisibility03_static_03
     * @tc.desc     testVisibility03_static_03
     * @tc.level    Level.LEVEL0
     */
it('testVisibility03_static_03', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testVisibility03_static_03] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "visibility": Visibility.None,
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 48,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testVisibility03_static_03] start to publish emit:" + JSON.stringify(eventData.data));
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testVisibility03_static_03] change component data error: " + (err as Error)?.message);
      }
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('box');
     console.info("[testVisibility03_static_03] obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
     expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('visibility')).assertEqual('Visibility.None');
      console.info('[testVisibility03_static_03] END');
      done();
    });
  })
}
