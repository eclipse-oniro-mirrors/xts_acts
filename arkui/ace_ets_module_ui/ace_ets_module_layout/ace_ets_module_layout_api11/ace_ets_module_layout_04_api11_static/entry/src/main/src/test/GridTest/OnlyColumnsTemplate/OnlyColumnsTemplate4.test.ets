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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level} from '../../../../../hypium/index';
import router from '@ohos.router';

import CommonFunc, { RectValue } from '../../../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../../../ets/MainAbility/common/MessageManager';
import { Driver, ON} from '@ohos.UiTest';
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

export default function OnlyColumnsTemplate4() {
  describe('OnlyColumnsTemplate4', () => {
    beforeAll(() => {
      console.info("OnlyColumnsTemplate4 beforeAll start");
   
      await UtilsTest.startAbility("com.arkui.ace.layout.split04.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("OnlyColumnsTemplate4 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Grid/OnlyColumnsTemplate/OnlyColumnsTemplate1',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get OnlyColumnsTemplate4 state pages:" + "");
        if (!("OnlyColumnsTemplate1" == pages.name)) {
          console.info("get OnlyColumnsTemplate4 pages.name:" + "");
          
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          
        }
      } catch (err) {
        console.error("push OnlyColumnsTemplate4 page error:" + err);
      }
      console.info("OnlyColumnsTemplate4 beforeEach end");
    });
    afterEach(async () => {
      console.info("OnlyColumnsTemplate4 after each called");
    });
/**
     * @tc.number   SUB_ACE_GRID_OnlyColumnsTemplate4_static_0300
     * @tc.name     SUB_ACE_GRID_OnlyColumnsTemplate4_static_0300
     * @tc.desc     SUB_ACE_GRID_OnlyColumnsTemplate4_static_0300
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_GRID_OnlyColumnsTemplate4_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[SUB_ACE_GRID_OnlyColumnsTemplate4_static_0300] START');
      let driver = Driver.create();
      await CommonFunc.sleep(300);
      let button = await driver.findComponent(ON.id('OnlyColumnsTemplate1_button'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let GridItem_01: RectValue = CommonFunc.getComponentRect('OnlyColumnsTemplate1_GridItem_01');
      let GridItem_02: RectValue = CommonFunc.getComponentRect('OnlyColumnsTemplate1_GridItem_02');
      await CommonFunc.sleep(1000);
      AppStorage.get<MessageManager<int>>('messageManager')?.notify({
        name: 'columnStart1', value: 5
      })
      AppStorage.get<MessageManager<int>>('messageManager')?.notify({
        name: 'columnEnd1', value: 1
      })
      AppStorage.get<MessageManager<int>>('messageManager')?.notify({
        name: 'columnStart2', value: 5
      })
      AppStorage.get<MessageManager<int>>('messageManager')?.notify({
        name: 'columnEnd2', value: 1
      })
      await CommonFunc.sleep(2000);

      console.log('get Initial value')
      let GridItem_011: RectValue = CommonFunc.getComponentRect('OnlyColumnsTemplate1_GridItem_01');
      let GridItem_022: RectValue = CommonFunc.getComponentRect('OnlyColumnsTemplate1_GridItem_02');


      console.log('assert size')
	  expect(Math.abs(Math.round(GridItem_011.right - GridItem_011.left) - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(52)))) <= 1).assertTrue();
      console.log('GridItem_011.right - GridItem_011.left' + (GridItem_011.right - GridItem_011.left))
	  expect(Math.abs(Math.round(GridItem_011.bottom - GridItem_011.top) - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50)))) <= 1).assertTrue();
      console.log('GridItem_011.bottom - GridItem_011.top' + (GridItem_011.bottom - GridItem_011.top))

      console.info('[SUB_ACE_GRID_OnlyColumnsTemplate4_static_0300] END');
      done();
    });

/**
     * @tc.number   SUB_ACE_GRID_OnlyColumnsTemplate4_static_0500
     * @tc.name     SUB_ACE_GRID_OnlyColumnsTemplate4_static_0500
     * @tc.desc     SUB_ACE_GRID_OnlyColumnsTemplate4_static_0500
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_GRID_OnlyColumnsTemplate4_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_GRID_OnlyColumnsTemplate4_static_0500] START');
      let driver = Driver.create();
      await CommonFunc.sleep(300);
      let button = await driver.findComponent(ON.id('OnlyColumnsTemplate1_button'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let GridItem_01: RectValue = CommonFunc.getComponentRect('OnlyColumnsTemplate1_GridItem_01');
      let GridItem_02: RectValue = CommonFunc.getComponentRect('OnlyColumnsTemplate1_GridItem_02');
      await CommonFunc.sleep(1000);
      AppStorage.get<MessageManager<int>>('messageManager')?.notify({
        name: 'columnStart1', value: 2
      })
      AppStorage.get<MessageManager<int>>('messageManager')?.notify({
        name: 'columnEnd1', value: 1
      })
      AppStorage.get<MessageManager<int>>('messageManager')?.notify({
        name: 'columnStart2', value: 2
      })
      AppStorage.get<MessageManager<int>>('messageManager')?.notify({
        name: 'columnEnd2', value: 1
      })
      await CommonFunc.sleep(1000);

      console.log('get Initial value')
      let GridItem_011: RectValue = CommonFunc.getComponentRect('OnlyColumnsTemplate1_GridItem_01');
      let GridItem_022: RectValue = CommonFunc.getComponentRect('OnlyColumnsTemplate1_GridItem_02');


      console.log('assert size')
	  expect(Math.abs(Math.round(GridItem_011.right - GridItem_011.left) - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(52)))) <= 1).assertTrue();
      console.log('GGridItem_01.right - GridItem_01.left' + (GridItem_011.right - GridItem_011.left))
	  expect(Math.abs(Math.round(GridItem_011.bottom - GridItem_011.top) - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50)))) <= 1).assertTrue();
      console.log('GGridItem_01.bottom - GridItem_01.top' + (GridItem_011.bottom - GridItem_011.top))

      console.info('[SUB_ACE_GRID_OnlyColumnsTemplate4_static_0500] END');
      done();
    });
  })
}
