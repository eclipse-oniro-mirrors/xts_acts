'use static';
/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect,Level } from '../../../../hypium/index';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import RectValue  from '../../../ets/MainAbility/common/Rect';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import { Driver, ON } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector'
import router from '@ohos.router';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import { Component, Driver, UiWindow, ON,  MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;


export default function ListLanes04() {
  describe('ListLanes04', () => {
    beforeAll(() => {
      console.info("ListLanes04 beforeAll start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.layout.split06.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    })
    beforeEach(async (): Promise<void> => {
      console.info("ListLanes04 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/List/ListLanes04',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get ListLanes04 state pages: " + JSON.stringify(pages));
        if (!("ListLanes04" == pages.name)) {
          console.info("get ListLanes04 state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push ListLanes04 page error: " + err);
        expect().assertFail();
      }
    });

    
    
    



/**
     * @tc.number   ListLanes04_static_001
     * @tc.name     ListLanes04_static_001
     * @tc.desc     ListLanes04_static_001
     * @tc.level    Level.LEVEL0
     */
it('ListLanes04_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[ListLanes04_static_001] START');
      await CommonFunc.sleep(1000);

      let ListItem01_0 = CommonFunc.getComponentRect('ListItem01_0');
      let ListItem01_1 = CommonFunc.getComponentRect('ListItem01_1');
      await CommonFunc.sleep(1000);
      expect(Math.round(ListItem01_1.top - ListItem01_0.bottom)).assertEqual(Math.round(UIContext.resolveUIContext()!.vp2px(0)));

      console.info('[ListLanes04_static_001] END');
      done();
    });

    
    
    



/**
     * @tc.number   ListLanes04_static_002
     * @tc.name     ListLanes04_static_002
     * @tc.desc     ListLanes04_static_002
     * @tc.level    Level.LEVEL0
     */
it('ListLanes04_static_002', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[ListLanes04_002] START');
      await CommonFunc.sleep(1000);

      let ListItem0 = CommonFunc.getComponentRect('ListItem02_0');
      let ListItem1 = CommonFunc.getComponentRect('ListItem02_1');
      await CommonFunc.sleep(1000);
      expect(Math.round(ListItem1.top - ListItem0.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(0)) <= 1).assertTrue();

      console.info('[ListLanes04_002] END');
      done();
    });

    
    
    



/**
     * @tc.number   ListLanes04_static_003
     * @tc.name     ListLanes04_static_003
     * @tc.desc     ListLanes04_static_003
     * @tc.level    Level.LEVEL0
     */
it('ListLanes04_static_003', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ListLanes04_003] START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('ListLanesKey04_3');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ListLanes04_003] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);
      expect(obj.getElement('$attrs').getString('laneGutter')).assertEqual('10.00%');
      console.info('[ListLanes04_003] END');
      done();
    });
  })
}
