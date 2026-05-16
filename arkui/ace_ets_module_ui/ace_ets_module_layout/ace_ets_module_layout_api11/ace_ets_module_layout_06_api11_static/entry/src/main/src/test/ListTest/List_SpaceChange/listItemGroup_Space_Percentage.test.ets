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


export default function listItemGroup_Space_Percentage() {
  describe('listItemGroup_Space_Percentage', () => {
    beforeAll(() => {
      console.log("listItemGroup_Space_Percentage beforeAll start111")
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.layout.split06.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async (): Promise<void> => {
      console.info("listItemGroup_Space_Percentage beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/List/List_SpaceChange/listItemGroup_Space_Percentage',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get listItemGroup_Space_Percentage state pages:" + JSON.stringify(pages));
        if (!("listItemGroup_Space_Percentage" == pages.name)) {
          console.info("get listItemGroup_Space_Percentage pages.name:" + JSON.stringify(pages.name));
           routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push listItemGroup_Space_Percentage page error:" + err);
      }
      console.info("listItemGroup_Space_Percentage beforeEach end");
    });
    afterEach(async () => {
      const routerInstance = AppStorage.get<Router>("router") as Router
      await CommonFunc.sleep(1000);
      routerInstance.back()
      console.info("listItemGroup_Space_Percentage after each called");
    });


    
    
    



/**
     * @tc.number   testListItemGroupSpacePercentage_static
     * @tc.name     testListItemGroupSpacePercentage_static
     * @tc.desc     testListItemGroupSpacePercentage_static
     * @tc.level    Level.LEVEL0
     */
it('testListItemGroupSpacePercentage_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_listItemGroup_Space_Percentage_0100] START');
      AppStorage.get<MessageManager<string>>('messageManager')?.notify({
        name: 'space1', value: '10%'
      });
      AppStorage.get<MessageManager<string>>('messageManager')?.notify({
        name: 'space2', value: '10%'
      });
      await CommonFunc.sleep(1000);
      let List01: RectValue = CommonFunc.getComponentRect('listItemGroup_Space_Percentage_01');
      let ListItemGroup_1: RectValue = CommonFunc.getComponentRect('listItemGroup_Space_Percentage_ListItemGroup_1');
      let ListItem11: RectValue = CommonFunc.getComponentRect('listItemGroup_Space_Percentage_ListItem_11');
      let ListItem12: RectValue = CommonFunc.getComponentRect('listItemGroup_Space_Percentage_ListItem_12');
      let ListItem13: RectValue = CommonFunc.getComponentRect('listItemGroup_Space_Percentage_ListItem_13');

      let ListItemGroup_2: RectValue = CommonFunc.getComponentRect('listItemGroup_Space_Percentage_ListItemGroup_2');
      let ListItem21: RectValue = CommonFunc.getComponentRect('listItemGroup_Space_Percentage_ListItem_21');
      let ListItem22: RectValue = CommonFunc.getComponentRect('listItemGroup_Space_Percentage_ListItem_22');
      let ListItem23: RectValue = CommonFunc.getComponentRect('listItemGroup_Space_Percentage_ListItem_23');

      expect(Math.abs(Math.round(ListItem11.right - ListItem11.left) - UIContext.resolveUIContext()!.vp2px(300)) <= 1).assertTrue();
      expect(Math.abs(Math.round(ListItem11.bottom - ListItem11.top) - Math.round(UIContext.resolveUIContext()!.vp2px(50))) <= 1).assertTrue();

      console.log('assert the spacing between ListItem11 and ListItem12')
      expect(Math.abs(Math.round(ListItem12.top - ListItem11.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(52))) <= 1).assertTrue();
      expect(Math.abs(Math.round(ListItem12.right - ListItem12.left) - UIContext.resolveUIContext()!.vp2px(300)) <= 1).assertTrue();
      expect(Math.abs(Math.round(ListItem12.bottom - ListItem12.top) - Math.round(UIContext.resolveUIContext()!.vp2px(50))) <= 1).assertTrue();

      console.log('assert the spacing between ListItem12 and ListItem13')
      expect(Math.abs(Math.round(ListItem13.top - ListItem12.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(52))) <= 1).assertTrue();
      expect(Math.abs(Math.round(ListItem13.right - ListItem13.left) - UIContext.resolveUIContext()!.vp2px(300)) <= 1).assertTrue();
      expect(Math.abs(Math.round(ListItem13.bottom - ListItem13.top) - Math.round(UIContext.resolveUIContext()!.vp2px(50))) <= 1).assertTrue();

      console.log('assert the spacing between ListItemGroup_1 and ListItemGroup_2')
      expect(Math.abs(Math.round(ListItemGroup_2.top - ListItemGroup_1.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(52))) <= 1).assertTrue();
      expect(Math.abs(Math.round(ListItem21.right - ListItem21.left) - UIContext.resolveUIContext()!.vp2px(300)) <= 1).assertTrue();
      expect(Math.abs(Math.round(ListItem21.bottom - ListItem21.top) - Math.round(UIContext.resolveUIContext()!.vp2px(50))) <= 1).assertTrue();

      console.info('[SUB_ACE_listItemGroup_Space_Percentage_0100] END');
      done();
    });

  })
}
