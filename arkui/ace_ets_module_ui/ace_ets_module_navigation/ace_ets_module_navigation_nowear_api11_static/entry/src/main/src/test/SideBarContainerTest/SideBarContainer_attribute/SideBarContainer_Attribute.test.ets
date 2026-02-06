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
export default function SideBarContainer_AttributeTest() {
  describe('SideBarContainer_AttributeTest', () => {
    beforeAll(() => {
      console.info("SideBarContainer_AttributeTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.navigationnowear11.static", "EntryAbility")

    });
    beforeEach(async () => {
      console.info("SideBarContainer_Attribute beforeEach start");
      let driver: Driver = Driver.create();
      let size = await driver.getDisplaySize();
      if (size.x != 466 && size.y != 466) {
        let options: router.RouterOptions = {
          url: 'MainAbility/pages/SideBarContainer/SideBarContainer_attribute/SideBarContainer_Attribute',
        };
        try {
          const routerInstance = AppStorage.get<Router>("router") as Router
       
        let pages = routerInstance.getState();
          console.info("get SideBarContainer_Attribute state pages:" + JSON.stringify(pages));
          if (!("SideBarContainer_Attribute" == pages.name)) {
            console.info("get SideBarContainer_Attribute pages.name:" + JSON.stringify(pages.name));
            routerInstance.pushUrl(options);
            await CommonFunc.sleep(2000);
          }
        } catch (err) {
          console.error("push SideBarContainer_Attribute page error:" + err);
        }
        console.info("SideBarContainer_Attribute beforeEach end");
      }
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("SideBarContainer_AttributeTest after each called");
    });

    
/**
     * @tc.number   SUB_ACE_SideBarContainer_Attribute_static_0100
     * @tc.name     SUB_ACE_SideBarContainer_Attribute_static_0100
     * @tc.desc     SUB_ACE_SideBarContainer_Attribute_static_0100
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ACE_SideBarContainer_Attribute_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_SideBarContainer_Attribute_0100] START');
      await CommonFunc.sleep(2000);

      console.log("get Initial value")
      let SideBar_01: RectValue = CommonFunc.getComponentRect('SideBarContainer_Attribute_SideBar_01');
      let SideBarContainer_01: RectValue =
        CommonFunc.getComponentRect('SideBarContainer_Attribute_SideBarContainer_01');

      console.log("assert position")
      expect(SideBar_01.left).assertEqual(SideBarContainer_01.left);
      console.log("SideBar_01.left" + SideBar_01.left)

      console.log("assert width")

      expect(Math.round(SideBar_01.right - SideBar_01.left)).assertEqual(Math.round(AppStorage.get<UIContext>('uiContext')!.vp2px(200)));
      console.log("SideBar_01.right - SideBar_01.left" + (SideBar_01.right - SideBar_01.left))

      console.info('[SUB_ACE_SideBarContainer_Attribute_0100] END');
      done();
    });


    
/**
     * @tc.number   SUB_ACE_SideBarContainer_Attribute_static_0200
     * @tc.name     SUB_ACE_SideBarContainer_Attribute_static_0200
     * @tc.desc     SUB_ACE_SideBarContainer_Attribute_static_0200
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ACE_SideBarContainer_Attribute_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_SideBarContainer_Attribute_0200] START');
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'sideBarWidth', value: 320
      })
      await CommonFunc.sleep(2000);

      console.log("get Initial value")
      let SideBar_01: RectValue = CommonFunc.getComponentRect('SideBarContainer_Attribute_SideBar_01');
      let SideBarContainer_01: RectValue =
        CommonFunc.getComponentRect('SideBarContainer_Attribute_SideBarContainer_01');

      console.log("assert position")
      expect(SideBar_01.left).assertEqual(SideBarContainer_01.left);
      console.log("SideBar_01.left" + SideBar_01.left)

      console.log("assert width")
      console.log("SideBar_01.right - SideBar_01.left" + (SideBar_01.right - SideBar_01.left))
      console.log("AppStorage.get<UIContext>('uiContext')!.vp2px(200) " + AppStorage.get<UIContext>('uiContext')!.vp2px(200))
      expect(Math.round(SideBar_01.right - SideBar_01.left)).assertEqual(Math.round(AppStorage.get<UIContext>('uiContext')!.vp2px(300)));
      console.log("SideBar_01.right - SideBar_01.left" + (SideBar_01.right - SideBar_01.left))

      console.info('[SUB_ACE_SideBarContainer_Attribute_0200] END');
      done();
    });


    
/**
     * @tc.number   SUB_ACE_SideBarContainer_Attribute_static_0300
     * @tc.name     SUB_ACE_SideBarContainer_Attribute_static_0300
     * @tc.desc     SUB_ACE_SideBarContainer_Attribute_static_0300
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ACE_SideBarContainer_Attribute_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_SideBarContainer_Attribute_0300] START');
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'sideBarWidth', value: 250
      })
      await CommonFunc.sleep(2000);

      console.log("get Initial value")
      let SideBar_01: RectValue = CommonFunc.getComponentRect('SideBarContainer_Attribute_SideBar_01');
      let SideBarContainer_01: RectValue =
        CommonFunc.getComponentRect('SideBarContainer_Attribute_SideBarContainer_01');

      console.log("assert position")
      expect(Math.abs(SideBar_01.left - SideBarContainer_01.left) <= 1).assertTrue();
      console.log("SideBar_01.left" + SideBar_01.left)

      console.log("assert width");
      expect(Math.abs(Math.round(SideBar_01.right - SideBar_01.left) - Math.round(AppStorage.get<UIContext>('uiContext')!.vp2px(250))) <= 1).assertTrue();
      console.log("SideBar_01.right - SideBar_01.left" + (SideBar_01.right - SideBar_01.left))

      console.info('[SUB_ACE_SideBarContainer_Attribute_0300] END');
      done();
    });

    
/**
     * @tc.number   SUB_ACE_SideBarContainer_Attribute_static_0400
     * @tc.name     SUB_ACE_SideBarContainer_Attribute_static_0400
     * @tc.desc     SUB_ACE_SideBarContainer_Attribute_static_0400
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ACE_SideBarContainer_Attribute_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_SideBarContainer_Attribute_0400] START');
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'maxSideBarWidth', value: 150
      })
      await CommonFunc.sleep(2000);

      console.log("get Initial value")
      let SideBar_01: RectValue = CommonFunc.getComponentRect('SideBarContainer_Attribute_SideBar_01');
      let SideBarContainer_01: RectValue =
        CommonFunc.getComponentRect('SideBarContainer_Attribute_SideBarContainer_01');

      console.log("assert position")
      expect(SideBar_01.left).assertEqual(SideBarContainer_01.left);
      console.log("SideBar_01.left" + SideBar_01.left)

      console.log("assert width")
      expect(Math.round(SideBar_01.right - SideBar_01.left)).assertEqual(Math.round(AppStorage.get<UIContext>('uiContext')!.vp2px(200)));
      console.log("SideBar_01.right - SideBar_01.left" + (SideBar_01.right - SideBar_01.left))

      console.info('[SUB_ACE_SideBarContainer_Attribute_0400] END');
      done();
    });


  })

}
