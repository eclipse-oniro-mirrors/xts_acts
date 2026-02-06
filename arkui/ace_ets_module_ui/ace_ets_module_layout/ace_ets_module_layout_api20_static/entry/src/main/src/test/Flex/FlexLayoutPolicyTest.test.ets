'use static';
/*
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

import CommonFunc from '../../../ets/MainAbility/common/Common';
import RectValue from '../../../ets/MainAbility/common/Rect';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import {
  Component,
  Driver,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import router from '@ohos.router';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';

let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function FlexLayoutPolicyTest() {
  describe('FlexLayoutPolicyTest', () => {
    await UtilsTest.startAbility("com.arkui.ace.layout.api20.static", "EntryAbility")
    const uiContext = AppStorage.get<UIContext>('uiContext')!

    beforeAll(() => {
      console.info("FlexLayoutPolicyTest beforeAll start");


    });

    beforeEach(async (): Promise<void> => {
      console.info("FlexLayoutPolicyTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/FlexLayoutPolicyPage',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get FlexLayoutPolicyTest state pages:" + JSON.stringify(pages));
        if (!("FlexLayoutPolicyPage" == pages.name)) {
          console.info("get FlexLayoutPolicyTest pages.name:" + JSON.stringify(pages.name));
          
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          
        }
      } catch (err) {
        console.error("push FlexLayoutPolicyTest page error:" + err);
      }
      console.info("FlexLayoutPolicyTest beforeEach end");
      
    });
    afterEach(async () => {
    });

    
    
/**
     * @tc.number   FlexLayoutPolicyTest_static_0100
     * @tc.name     FlexLayoutPolicyTest_static_0100
     * @tc.desc     FlexLayoutPolicyTest_static_0100
     * @tc.level    Level.LEVEL1
     */
it('FlexLayoutPolicyTest_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[FlexLayoutPolicyTest_static_0100] START');
      await CommonFunc.sleep(1000);

      let flex_parent: RectValue = CommonFunc.getComponentRect('FlexLayoutPolicyTest_static_0100_Flex_parent');
      let flex_child: RectValue = CommonFunc.getComponentRect('FlexLayoutPolicyTest_static_0100_Flex_child');
      let flex_parent_width = flex_parent.right - flex_parent.left;
      let flex_parent_height = flex_parent.bottom - flex_parent.top;
      let flex_child_width = flex_child.right - flex_child.left;
      let flex_child_height = flex_child.bottom - flex_child.top;
      console.log('[FlexLayoutPolicyTest_static_0100] flex_parent_width is:' + flex_parent_width);
      console.log('[FlexLayoutPolicyTest_static_0100] flex_parent_height is:' + flex_parent_height);
      console.log('[FlexLayoutPolicyTest_static_0100] flex_child_width is:' + flex_child_width);
      console.log('[FlexLayoutPolicyTest_static_0100] flex_child_height is:' + flex_child_height);

      
      expect(Math.floor(Math.abs(flex_parent_width - flex_child_width - uiContext.vp2px(70))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(flex_parent_height - flex_child_height - uiContext.vp2px(70))) <= 1).assertTrue();

      console.info('[FlexLayoutPolicyTest_static_0100] END');
      done();
    });
  })
}