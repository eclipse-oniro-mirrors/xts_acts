'use static';
/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import events_emitter from '@ohos.events.emitter';
import { Color, $r } from '@ohos.arkui.component'
import { describe, beforeEach, it, expect, Level, beforeAll, Size, TestType, afterEach } from '../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../ets/MainAbility/common/Common';
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
import { RecordData } from '@ohos.base';


let domain: number = 0x0000;
let tag: string = 'testTag';

export default function checkBoxGroupSelectAllJsunit() {
  describe('checkBoxGroupSelectAllTest', () => {
    beforeAll(() => {
      
      await UtilsTest.startAbility("com.open.harmony.aceEtsApiLack.static", "EntryAbility")
      
    });
    beforeEach(async () => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/checkBoxGroup',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get checkBoxGroup state success " + JSON.stringify(pages));
        if (!("checkBoxGroup" == pages.name)) {
          console.info("get checkBoxGroup state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error("push checkBoxGroup page error: " + err);
      }
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("checkBoxGroupSelectAll after each called");
    });

    
    
    
    /**
     * @tc.number   testcheckBoxGroupSelectAll_static_0001
     * @tc.name     testcheckBoxGroupSelectAll_static_0001
     * @tc.desc     testcheckBoxGroupSelectAll_static_0001
     * @tc.level    Level.LEVEL0
     */
it('testcheckBoxGroupSelectAll_static_0001', Level.LEVEL0, async () => {
      console.info('checkBoxGroupSelectAll testcheckBoxGroupSelectAll0001 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('CheckboxGroup');
      console.info("[testcheckBoxGroupSelectAll0001] component selectedColor strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('CheckboxGroup');
      expect(obj.getElement('$attrs').getString('selectedColor')).assertEqual("#FFED6F21");
      console.info("[testcheckBoxGroupSelectAll0001] selectedColor value :" +
      obj.getElement('$attrs').getString('selectedColor'));

    });

    
    
    
    /**
     * @tc.number   testcheckBoxGroupSelectAll_static_0002
     * @tc.name     testcheckBoxGroupSelectAll_static_0002
     * @tc.desc     testcheckBoxGroupSelectAll_static_0002
     * @tc.level    Level.LEVEL0
     */
it('testcheckBoxGroupSelectAll_static_0002', Level.LEVEL0, async () => {
      console.info('checkBoxGroupSelectAll testcheckBoxGroupSelectAll0002 START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "isSelect": false
          } as Record<String,RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 60203,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testcheckBoxGroupSelectAll0002] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testcheckBoxGroupSelectAll0002] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = inspector.getInspectorByKey('CheckboxOne');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testcheckBoxGroupSelectAll0002] obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('selectedColor')).assertEqual("#FF39A2DB");
      console.info("[testcheckBoxGroupSelectAll0002] selectedColor value :" +
      obj.getElement('$attrs').getString('selectedColor'));
      console.info('testcheckBoxGroupSelectAll0002 END');

    });
  })
}
