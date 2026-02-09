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
import { $r,Resource } from '@ohos.arkui.component'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect,Level } from '../../../../../hypium/index';
import CommonFunc from '../../../../ets/MainAbility/common/Common';
import RectValue  from '../../../../ets/MainAbility/common/Rect';
import { MessageManager, Callback } from '../../../../ets/MainAbility/common/MessageManager';
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
import { UtilsTest } from '../../Util.test';
import {
  Component,
  Driver,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix,
  UiDirection,
  MouseButton
} from '@ohos.UiTest';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function List_divider_resource() {
  describe('List_divider_resource', () => {
    beforeAll(() => {
      console.info("List_divider_resource beforeAll start");
            
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.layout.split06.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async (): Promise<void> => {
      console.info("List_divider_resource beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/List/List_divider/List_divider_resource',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get List_divider_resource state pages:" + JSON.stringify(pages));
        if (!("List_divider_resource" == pages.name)) {
          console.info("get List_divider_resource pages.name:" + JSON.stringify(pages.name));
           routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push List_divider_resource page error:" + err);
      }
      console.info("List_divider_resource beforeEach end");
    });
    afterEach(async () => {
      const routerInstance = AppStorage.get<Router>("router") as Router
      await CommonFunc.sleep(1000);
      // routerInstance.clear()
      console.info("List_divider_resource after each called");
    });


    
    
    



/**
     * @tc.number   SUB_ACE_List_divider_resource_static_0100
     * @tc.name     SUB_ACE_List_divider_resource_static_0100
     * @tc.desc     SUB_ACE_List_divider_resource_static_0100
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_List_divider_resource_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_List_divider_resource_0100] START');
      await CommonFunc.sleep(1000);
      console.log('get Initial value')
      let ListItem_01: RectValue = CommonFunc.getComponentRect('List_divider_resource_listItem_01');
      let ListItem_02: RectValue = CommonFunc.getComponentRect('List_divider_resource_listItem_02');
      let List_01: RectValue = CommonFunc.getComponentRect('List_divider_resource_list_01');

      console.log('get divider width')
      expect(Math.round(ListItem_02.top - ListItem_01.bottom)).assertEqual(Math.round(UIContext.resolveUIContext()!.vp2px(20)));

      console.info('[SUB_ACE_List_divider_resource_0100] END');
      done();
    });

    
    
    



/**
     * @tc.number   SUB_ACE_List_divider_resource_static_0200
     * @tc.name     SUB_ACE_List_divider_resource_static_0200
     * @tc.desc     SUB_ACE_List_divider_resource_static_0200
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_List_divider_resource_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_List_divider_resource_0200] START');
      AppStorage.get<MessageManager<Resource>>('messageManager')?.notify({
        name: 'strokeWidth', value: $r('app.float.strokeWidth')
      });
      await CommonFunc.sleep(1000);
      console.log('get Initial value')
      let ListItem_01: RectValue = CommonFunc.getComponentRect('List_divider_resource_listItem_01');
      let ListItem_02: RectValue = CommonFunc.getComponentRect('List_divider_resource_listItem_02');
      let List_01: RectValue = CommonFunc.getComponentRect('List_divider_resource_list_01');

      console.log('get divider width')
      expect(Math.round(ListItem_02.top - ListItem_01.bottom)).assertEqual(Math.round(UIContext.resolveUIContext()!.vp2px(20)));

      console.info('[SUB_ACE_List_divider_resource_0200] END');
      done();
    });


  })
}
