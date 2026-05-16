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
import { describe, beforeEach, it, expect, Level, beforeAll, Size, TestType, afterEach } from '../../../../../hypium/index';
import router from '@ohos.router';
import RectValue from '../../../../ets/MainAbility/common/Rect';
import CommonFunc from '../../../../ets/MainAbility/common/Common';
import Utils from '../../../../ets/MainAbility/common/Utils';
import { Driver, ON, MouseButton, Component } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import { MessageManager, Callback } from '../../../../ets/MainAbility/common/MessageManager';
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

export default function SideBarContainerDivider() {
  describe('SideBarContainerDivider', () => {
    beforeAll(() => {
      console.info("SideBarContainerDivider beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.navigationnowear11.static", "EntryAbility")

    });
    beforeEach(async () => {
      console.info("SideBarContainerDivider beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/SideBarContainer/SideBarContainerDivider/SideBarContainerDivider',
      };
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        // routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get SideBarContainerDivider state pages:" + JSON.stringify(pages));
        if (!("SideBarContainerDivider" == pages.name)) {
          console.info("get SideBarContainerDivider pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push SideBarContainerDivider page error:" + err);
      }
      console.info("SideBarContainerDivider beforeEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("SideBarContainerDividerTest after each called");
    });


    
/**
     * @tc.number   SUB_ACE_SideBarContainerDivider_static_0100
     * @tc.name     SUB_ACE_SideBarContainerDivider_static_0100
     * @tc.desc     SUB_ACE_SideBarContainerDivider_static_0100
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ACE_SideBarContainerDivider_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_SideBarContainerDivider_0100] START');
      await CommonFunc.sleep(500);
      console.log("get Initial value")
      let SideBar_01: RectValue = CommonFunc.getComponentRect('SideBarContainerDivider_SideBar_01');
      let sideBarContent_01: RectValue = CommonFunc.getComponentRect('SideBarContainerDivider_sideBarContent_01');
      let SideBarContainer_01: RectValue = CommonFunc.getComponentRect('SideBarContainerDivider_SideBarContainer_01');

      console.log("assert position")
      expect(SideBar_01.left).assertEqual(SideBarContainer_01.left);
      console.log("SideBar_01.left" + SideBar_01.left)
      console.log("SideBarContainer_01.left" + SideBarContainer_01.left)

      console.log("assert width")
      expect(Math.abs(Math.round(SideBar_01.right - SideBar_01.left) - Math.round(AppStorage.get<UIContext>('uiContext')!.vp2px(200))) <= 1).assertTrue();
      console.log("SideBar_01.right - SideBar_01.left" + (SideBar_01.right - SideBar_01.left))

      expect(Math.abs(Math.round(sideBarContent_01.right - sideBarContent_01.left) - Math.round(AppStorage.get<UIContext>('uiContext')!.vp2px(490))) <= 1).assertTrue();
      console.log("sideBarContent_01.right - sideBarContent_01.left" + (sideBarContent_01.right - sideBarContent_01.left))
      console.info('[SUB_ACE_SideBarContainerDivider_0100] END');
      done();
    });


    
/**
     * @tc.number   SUB_ACE_SideBarContainerDivider_static_0200
     * @tc.name     SUB_ACE_SideBarContainerDivider_static_0200
     * @tc.desc     SUB_ACE_SideBarContainerDivider_static_0200
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ACE_SideBarContainerDivider_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_SideBarContainerDivider_0200] START');
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'width1', value: 600
      })
      await CommonFunc.sleep(500);
      console.log("get Initial value")
      let SideBar_01: RectValue = CommonFunc.getComponentRect('SideBarContainerDivider_SideBar_01');
      let sideBarContent_01: RectValue = CommonFunc.getComponentRect('SideBarContainerDivider_sideBarContent_01');
      let SideBarContainer_01: RectValue = CommonFunc.getComponentRect('SideBarContainerDivider_SideBarContainer_01');

      console.log("assert position")
      expect(SideBar_01.left).assertEqual(SideBarContainer_01.left);
      console.log("SideBar_01.left" + SideBar_01.left)
      console.log("SideBarContainer_01.left" + SideBarContainer_01.left)

      console.log("assert width")
      expect(Math.abs(Math.round(SideBar_01.right - SideBar_01.left) - Math.round(AppStorage.get<UIContext>('uiContext')!.vp2px(200))) <= 1).assertTrue();
      console.log("SideBar_01.right - SideBar_01.left" + (SideBar_01.right - SideBar_01.left))

      expect(Math.abs(Math.round(sideBarContent_01.right - sideBarContent_01.left) - Math.round(AppStorage.get<UIContext>('uiContext')!.vp2px(400))) <= 1).assertTrue();
      console.log("sideBarContent_01.right - sideBarContent_01.left" + (sideBarContent_01.right - sideBarContent_01.left))

      let strJson1 = inspector.getInspectorByKey('SideBarContainerDivider_SideBarContainer_01');
      await CommonFunc.sleep(1000);
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('type')).assertEqual('SideBarContainerType.OVERLAY');
      console.log(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('type'))

      console.info('[SUB_ACE_SideBarContainerDivider_0100] END');
      done();
    });


  })

}
