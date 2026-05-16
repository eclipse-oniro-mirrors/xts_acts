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

import { MessageManager, Callback } from '../../../../ets/MainAbility/common/MessageManager';
import RectValue from '../../../../ets/MainAbility/common/Rect';
import { describe, beforeEach, it, expect, Level, beforeAll, Size, TestType, afterEach } from '../../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../../ets/MainAbility/common/Common';
import Utils from '../../../../ets/MainAbility/common/Utils';
import { Driver, ON, MouseButton, Component } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../../Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';

export default function SideBarContainerType_DefaultValue1() {
  describe('SideBarContainerType_DefaultValue1', () => {
    beforeAll(() => {
      console.info("SideBarContainerType_DefaultValue1 beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.navigationnowear11.static", "EntryAbility")

    });
    beforeEach(async () => {
      console.info("SideBarContainerType_DefaultValue1 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/SideBarContainer/SideBarContainerType/SideBarContainerType_DefaultValue1',
      };
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
       
        let pages = routerInstance.getState();
        console.info("get SideBarContainerType_DefaultValue1 state pages:" + JSON.stringify(pages));
        if (!("SideBarContainerType_DefaultValue1" == pages.name)) {
          console.info("get SideBarContainerType_DefaultValue1 pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push SideBarContainerType_DefaultValue1 page error:" + err);
      }
      console.info("SideBarContainerType_DefaultValue1 beforeEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("SideBarContainerType_DefaultValue1Test after each called");
    });


    
/**
     * @tc.number   SUB_ACE_SideBarContainerType_DefaultValue1_static_0100
     * @tc.name     SUB_ACE_SideBarContainerType_DefaultValue1_static_0100
     * @tc.desc     SUB_ACE_SideBarContainerType_DefaultValue1_static_0100
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ACE_SideBarContainerType_DefaultValue1_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_SideBarContainerType_DefaultValue1_0100] START');
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'minSideBarWidth', value: 300
      })
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'width1', value: 670
      })
      await CommonFunc.sleep(500);
      console.log("get Initial value")
      let SideBar_01: RectValue = CommonFunc.getComponentRect('SideBarContainerType_DefaultValue1_SideBar_01');
      let sideBarContent_01: RectValue = CommonFunc.getComponentRect('SideBarContainerType_DefaultValue1_sideBarContent_01');
      let SideBarContainer_01: RectValue = CommonFunc.getComponentRect('SideBarContainerType_DefaultValue1_SideBarContainer_01');

      console.log("assert position")
      expect(Math.abs(SideBar_01.left - SideBarContainer_01.left) <= 1).assertTrue();
      console.log("SideBar_01.left" + SideBar_01.left)
      console.log("SideBarContainer_01.left" + SideBarContainer_01.left)

      console.log("assert width")
      expect(Math.abs(Math.round(SideBar_01.right - SideBar_01.left) - Math.round(AppStorage.get<UIContext>('uiContext')!.vp2px(300))) <= 1).assertTrue();
      console.log("SideBar_01.right - SideBar_01.left" + (SideBar_01.right - SideBar_01.left))

      expect(Math.abs(Math.round(sideBarContent_01.right - sideBarContent_01.left) - Math.round(AppStorage.get<UIContext>('uiContext')!.vp2px(369))) <= 1).assertTrue();
      console.log("sideBarContent_01.right - sideBarContent_01.left" + (sideBarContent_01.right - sideBarContent_01.left))

      console.info('[SUB_ACE_SideBarContainerType_DefaultValue1_0100] END');
      done();
    });


    
/**
     * @tc.number   SUB_ACE_SideBarContainerType_DefaultValue1_static_0200
     * @tc.name     SUB_ACE_SideBarContainerType_DefaultValue1_static_0200
     * @tc.desc     SUB_ACE_SideBarContainerType_DefaultValue1_static_0200
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ACE_SideBarContainerType_DefaultValue1_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_SideBarContainerType_DefaultValue1_0200] START');
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'minSideBarWidth', value: 300
      })
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'width1', value: 600
      })
      await CommonFunc.sleep(500);
      console.log("get Initial value")
      let SideBar_01: RectValue = CommonFunc.getComponentRect('SideBarContainerType_DefaultValue1_SideBar_01');
      let sideBarContent_01: RectValue = CommonFunc.getComponentRect('SideBarContainerType_DefaultValue1_sideBarContent_01');
      let SideBarContainer_01: RectValue = CommonFunc.getComponentRect('SideBarContainerType_DefaultValue1_SideBarContainer_01');

      console.log("assert position")
      expect(SideBar_01.left).assertEqual(SideBarContainer_01.left);
      expect(sideBarContent_01.left).assertEqual(SideBarContainer_01.left);
      console.log("SideBar_01.left" + SideBar_01.left)
      console.log("sideBarContent_01.left" + SideBar_01.left)
      console.log("SideBarContainer_01.left" + SideBarContainer_01.left)

      console.log("assert width")
      expect(Math.abs(Math.round(SideBar_01.right - SideBar_01.left) - Math.round(AppStorage.get<UIContext>('uiContext')!.vp2px(300))) <= 1).assertTrue();
      console.log("SideBar_01.right - SideBar_01.left" + (SideBar_01.right - SideBar_01.left))

      expect(Math.abs(Math.round(sideBarContent_01.right - sideBarContent_01.left) - Math.round(AppStorage.get<UIContext>('uiContext')!.vp2px(600))) <= 1).assertTrue();
      console.log("sideBarContent_01.right - sideBarContent_01.left" + (sideBarContent_01.right - sideBarContent_01.left))

      let strJson1 = inspector.getInspectorByKey('SideBarContainerType_DefaultValue1_SideBarContainer_01');

      await CommonFunc.sleep(1000);
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('type')).assertEqual('SideBarContainerType.OVERLAY');
      console.log(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('type'))

      console.info('[SUB_ACE_SideBarContainerType_DefaultValue1_0100] END');
      done();
    });


  })

}
