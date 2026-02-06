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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect,Level } from '../../../../../../hypium/index';
import CommonFunc from '../../../../../ets/MainAbility/common/Common';
import RectValue  from '../../../../../ets/MainAbility/common/Rect';
import { MessageManager, Callback } from '../../../../../ets/MainAbility/common/MessageManager';
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
import { UtilsTest } from '../../../Util.test';
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

export default function ListItem_aspectRatio_width() {
  describe('ListItem_aspectRatio_width', () => {
    beforeAll(() => {
      console.info("ListItem_aspectRatio_width beforeAll start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.layout.split06.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async (): Promise<void> => {
      console.info("ListItem_aspectRatio_width beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/List/List_aspectRatio/ListItem_aspectRatio/ListItem_aspectRatio_width',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get ListItem_aspectRatio_width state pages:" + JSON.stringify(pages));
        if (!("ListItem_aspectRatio_width" == pages.name)) {
          console.info("get ListItem_aspectRatio_width pages.name:" + JSON.stringify(pages.name));
           routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push ListItem_aspectRatio_width page error:" + err);
      }
      console.info("ListItem_aspectRatio_width beforeEach end");
    });
    afterEach(async () => {
      const routerInstance = AppStorage.get<Router>("router") as Router
      await CommonFunc.sleep(1000);
      // routerInstance.clear()
      console.info("ListItem_aspectRatio_width after each called");
    });


    
    
    



/**
     * @tc.number   SUB_ACE_ListItem_aspectRatio_width_static_0100
     * @tc.name     SUB_ACE_ListItem_aspectRatio_width_static_0100
     * @tc.desc     SUB_ACE_ListItem_aspectRatio_width_static_0100
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_ListItem_aspectRatio_width_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_ListItem_aspectRatio_width_0100] START');
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'aspectRatio1', value: 0
      });
      await CommonFunc.sleep(1000);
      let ListItem01: RectValue = CommonFunc.getComponentRect('ListItem_aspectRatio_width_01');

      expect(Math.abs(Math.round(ListItem01.right - ListItem01.left) - Math.round(UIContext.resolveUIContext()!.vp2px(160))) <= 1).assertTrue();
      expect(Math.abs(Math.round(ListItem01.bottom - ListItem01.top) - Math.round(UIContext.resolveUIContext()!.vp2px(20))) <= 1).assertTrue();

      console.info('[SUB_ACE_ListItem_aspectRatio_width_0100] END');
      done();
    });

    
    
    



/**
     * @tc.number   SUB_ACE_ListItem_aspectRatio_width_static_0200
     * @tc.name     SUB_ACE_ListItem_aspectRatio_width_static_0200
     * @tc.desc     SUB_ACE_ListItem_aspectRatio_width_static_0200
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_ListItem_aspectRatio_width_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_ListItem_aspectRatio_width_0200] START');
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'aspectRatio1', value: 0.5
      });
      await CommonFunc.sleep(1000);
      let ListItem01: RectValue = CommonFunc.getComponentRect('ListItem_aspectRatio_width_01');
      console.info('[vp2px]' + Math.round(UIContext.resolveUIContext()!.vp2px(10)));
      console.info('[SUB_ACE_ListItem_aspectRatio_width_0200_1]' + Math.round(ListItem01.right - ListItem01.left));
      console.info('[SUB_ACE_ListItem_aspectRatio_width_0200_2]' + Math.round(ListItem01.bottom - ListItem01.top));

      expect(Math.abs(Math.round(ListItem01.right - ListItem01.left) - Math.round(UIContext.resolveUIContext()!.vp2px(160))) <= 1).assertTrue();
      expect(Math.abs(Math.round(ListItem01.bottom - ListItem01.top) - Math.round(UIContext.resolveUIContext()!.vp2px(320))) <= 1).assertTrue();

      console.info('[SUB_ACE_ListItem_aspectRatio_width_0200] END');
      done();
    });

    
    
    



/**
     * @tc.number   SUB_ACE_ListItem_aspectRatio_width_static_0300
     * @tc.name     SUB_ACE_ListItem_aspectRatio_width_static_0300
     * @tc.desc     SUB_ACE_ListItem_aspectRatio_width_static_0300
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_ListItem_aspectRatio_width_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_ListItem_aspectRatio_width_0300] START');
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'aspectRatio1', value: 2
      });
      await CommonFunc.sleep(1000);
      let ListItem01: RectValue = CommonFunc.getComponentRect('ListItem_aspectRatio_width_01');
      console.info('[SUB_ACE_ListItem_aspectRatio_width_0300_1]' + Math.round(ListItem01.right - ListItem01.left));
      console.info('[SUB_ACE_ListItem_aspectRatio_width_0300_2]' + Math.round(ListItem01.bottom - ListItem01.top));

      expect(Math.abs(Math.round(ListItem01.right - ListItem01.left) - Math.round(UIContext.resolveUIContext()!.vp2px(160))) <= 1).assertTrue();
      expect(Math.abs(Math.round(ListItem01.bottom - ListItem01.top) - Math.round(UIContext.resolveUIContext()!.vp2px(80))) <= 1).assertTrue();

      console.info('[SUB_ACE_ListItem_aspectRatio_width_0300] END');
      done();
    });

    
    
    



/**
     * @tc.number   SUB_ACE_ListItem_aspectRatio_width_static_0400
     * @tc.name     SUB_ACE_ListItem_aspectRatio_width_static_0400
     * @tc.desc     SUB_ACE_ListItem_aspectRatio_width_static_0400
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_ListItem_aspectRatio_width_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_ListItem_aspectRatio_width_0400] START');
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'aspectRatio1', value: -1
      });
      await CommonFunc.sleep(1000);
      let ListItem01: RectValue = CommonFunc.getComponentRect('ListItem_aspectRatio_width_01');

      expect(Math.abs(Math.round(ListItem01.right - ListItem01.left) - Math.round(UIContext.resolveUIContext()!.vp2px(160))) <= 1).assertTrue();
      expect(Math.abs(Math.round(ListItem01.bottom - ListItem01.top) - Math.round(UIContext.resolveUIContext()!.vp2px(20))) <= 1).assertTrue();

      console.info('[SUB_ACE_ListItem_aspectRatio_width_0400] END');
      done();
    });


  })
}
