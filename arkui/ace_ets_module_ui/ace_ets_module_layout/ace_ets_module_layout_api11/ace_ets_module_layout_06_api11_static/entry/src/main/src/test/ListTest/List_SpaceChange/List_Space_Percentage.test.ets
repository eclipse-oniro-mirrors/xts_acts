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
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;


export default function List_Space_Percentage() {
  describe('List_Space_Percentage', () => {
    beforeAll(() => {
      console.log("List_Space_Percentage beforeAll start111")
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.layout.split06.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async (): Promise<void> => {
      console.info("List_Space_Percentage beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/List/List_SpaceChange/List_Space_Percentage',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get List_Space_Percentage state pages:" + JSON.stringify(pages));
        if (!("List_Space_Percentage" == pages.name)) {
          console.info("get List_Space_Percentage pages.name:" + JSON.stringify(pages.name));
           routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push List_Space_Percentage page error:" + err);
      }
      console.info("List_Space_Percentage beforeEach end");
    });
    afterEach(async () => {
      const routerInstance = AppStorage.get<Router>("router") as Router
      await CommonFunc.sleep(1000);
      routerInstance.back()
      await CommonFunc.sleep(1000);
      console.info("List_Space_Percentage after each called");
    });


    
    
    



/**
     * @tc.number   SUB_ACE_List_Space_Percentage_static_0100
     * @tc.name     SUB_ACE_List_Space_Percentage_static_0100
     * @tc.desc     SUB_ACE_List_Space_Percentage_static_0100
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_List_Space_Percentage_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_List_Space_Percentage_0100] START');
      AppStorage.get<MessageManager<string>>('messageManager')?.notify({
        name: 'space', value: '10%'
      });
      await CommonFunc.sleep(1000);
      let List01: RectValue = CommonFunc.getComponentRect('List_Space_Percentage_01');
      let ListItem01: RectValue = CommonFunc.getComponentRect('List_Space_Percentage_ListItem_01');
      let ListItem02: RectValue = CommonFunc.getComponentRect('List_Space_Percentage_ListItem_02');
      let ListItem03: RectValue = CommonFunc.getComponentRect('List_Space_Percentage_ListItem_03');
      let ListItem04: RectValue = CommonFunc.getComponentRect('List_Space_Percentage_ListItem_04');

	  expect(Math.abs(Math.round(ListItem01.right - ListItem01.left) - UIContext.resolveUIContext()!.vp2px(300)) <= 1).assertTrue();
	  expect(Math.abs(Math.round(ListItem01.bottom - ListItem01.top) - Math.round(UIContext.resolveUIContext()!.vp2px(50))) <= 1).assertTrue();

	  expect(Math.abs(Math.round(ListItem02.top - ListItem01.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(52))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(ListItem02.right - ListItem02.left) - UIContext.resolveUIContext()!.vp2px(300)) <= 1).assertTrue();
	  expect(Math.abs(Math.round(ListItem02.bottom - ListItem02.top) - Math.round(UIContext.resolveUIContext()!.vp2px(50))) <= 1).assertTrue();

      expect(Math.abs(Math.round(ListItem03.top - ListItem02.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(52))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(ListItem03.right - ListItem03.left) - UIContext.resolveUIContext()!.vp2px(300)) <= 1).assertTrue();
	  expect(Math.abs(Math.round(ListItem03.bottom - ListItem03.top) - Math.round(UIContext.resolveUIContext()!.vp2px(50))) <= 1).assertTrue();

      expect(Math.abs(Math.round(ListItem04.top - ListItem03.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(52))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(ListItem04.right - ListItem04.left) - UIContext.resolveUIContext()!.vp2px(300)) <= 1).assertTrue();
	  expect(Math.abs(Math.round(ListItem04.bottom - ListItem04.top) - Math.round(UIContext.resolveUIContext()!.vp2px(50))) <= 1).assertTrue();

      console.info('[SUB_ACE_List_Space_Percentage_0100] END');
      done();
    });


    
    
    



/**
     * @tc.number   SUB_ACE_List_Space_Percentage_static_0200
     * @tc.name     SUB_ACE_List_Space_Percentage_static_0200
     * @tc.desc     SUB_ACE_List_Space_Percentage_static_0200
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_List_Space_Percentage_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_List_Space_Percentage_0200] START');
      AppStorage.get<MessageManager<string>>('messageManager')?.notify({
        name: 'space', value: '50%'
      });
      await CommonFunc.sleep(1000);
      let List01: RectValue = CommonFunc.getComponentRect('List_Space_Percentage_01');
      let ListItem01: RectValue = CommonFunc.getComponentRect('List_Space_Percentage_ListItem_01');
      let ListItem02: RectValue = CommonFunc.getComponentRect('List_Space_Percentage_ListItem_02');
      let ListItem03: RectValue = CommonFunc.getComponentRect('List_Space_Percentage_ListItem_03');
      let ListItem04: RectValue = CommonFunc.getComponentRect('List_Space_Percentage_ListItem_04');

	  expect(Math.abs(Math.round(ListItem01.right - ListItem01.left) - UIContext.resolveUIContext()!.vp2px(300)) <= 1).assertTrue();
	  expect(Math.abs(Math.round(ListItem01.bottom - ListItem01.top) - Math.round(UIContext.resolveUIContext()!.vp2px(50))) <= 1).assertTrue();

	  expect(Math.abs(Math.round(ListItem02.top - ListItem01.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(260))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(ListItem02.right - ListItem02.left) - UIContext.resolveUIContext()!.vp2px(300)) <= 1).assertTrue();
	  expect(Math.abs(Math.round(ListItem02.bottom - ListItem02.top) - Math.round(UIContext.resolveUIContext()!.vp2px(50))) <= 1).assertTrue();

      console.info('[SUB_ACE_List_Space_Percentage_0200] END');
      done();
    });

    
    
    



/**
     * @tc.number   SUB_ACE_List_Space_Percentage_static_0300
     * @tc.name     SUB_ACE_List_Space_Percentage_static_0300
     * @tc.desc     SUB_ACE_List_Space_Percentage_static_0300
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_List_Space_Percentage_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_List_Space_Percentage_0300] START');
      AppStorage.get<MessageManager<string>>('messageManager')?.notify({
        name: 'space', value: '100%'
      });
      await CommonFunc.sleep(1000);
      let List01: RectValue = CommonFunc.getComponentRect('List_Space_Percentage_01');
      let ListItem01: RectValue = CommonFunc.getComponentRect('List_Space_Percentage_ListItem_01');
      let ListItem02: RectValue = CommonFunc.getComponentRect('List_Space_Percentage_ListItem_02');
      let ListItem03: RectValue = CommonFunc.getComponentRect('List_Space_Percentage_ListItem_03');
      let ListItem04: RectValue = CommonFunc.getComponentRect('List_Space_Percentage_ListItem_04');

	  expect(Math.abs(Math.round(ListItem01.right - ListItem01.left) - UIContext.resolveUIContext()!.vp2px(300)) <= 1).assertTrue();
	  expect(Math.abs(Math.round(ListItem01.bottom - ListItem01.top) - Math.round(UIContext.resolveUIContext()!.vp2px(50))) <= 1).assertTrue();

	  expect(Math.abs(Math.round(ListItem02.top - ListItem01.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(0))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(ListItem02.right - ListItem02.left) - UIContext.resolveUIContext()!.vp2px(300)) <= 1).assertTrue();
	  expect(Math.abs(Math.round(ListItem02.bottom - ListItem02.top) - Math.round(UIContext.resolveUIContext()!.vp2px(50))) <= 1).assertTrue();

      console.info('[SUB_ACE_List_Space_Percentage_0300] END');
      done();
    });
  })
}
