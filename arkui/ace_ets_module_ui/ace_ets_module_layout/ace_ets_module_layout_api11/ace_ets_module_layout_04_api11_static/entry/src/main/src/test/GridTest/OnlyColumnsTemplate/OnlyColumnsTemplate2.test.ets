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

export default function OnlyColumnsTemplate2() {
  describe('OnlyColumnsTemplate2', () => {
    beforeAll(() => {
      console.info("OnlyColumnsTemplate2 beforeAll start");
   
      await UtilsTest.startAbility("com.arkui.ace.layout.split04.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("OnlyColumnsTemplate2 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Grid/OnlyColumnsTemplate/OnlyColumnsTemplate2',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get OnlyColumnsTemplate2 state pages:" + "");
        if (!("OnlyColumnsTemplate2" == pages.name)) {
          console.info("get OnlyColumnsTemplate2 pages.name:" + "");
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push OnlyColumnsTemplate2 page error:" + err);
      }
      console.info("OnlyColumnsTemplate2 beforeEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("OnlyColumnsTemplate2 after each called");
    });

/**
     * @tc.number   SUB_ACE_GRID_OnlyColumnsTemplate2_static_0100
     * @tc.name     SUB_ACE_GRID_OnlyColumnsTemplate2_static_0100
     * @tc.desc     SUB_ACE_GRID_OnlyColumnsTemplate2_static_0100
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_GRID_OnlyColumnsTemplate2_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_GRID_OnlyColumnsTemplate2_static_0100] START');
      await CommonFunc.sleep(2000);

      console.log('get Initial value')
      let GridItem_01: RectValue = CommonFunc.getComponentRect('OnlyColumnsTemplate2_GridItem_01');
      let GridItem_02: RectValue = CommonFunc.getComponentRect('OnlyColumnsTemplate2_GridItem_02');

      console.log('assert size')
      expect(Math.abs(GridItem_01.right - GridItem_01.left - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(60))) <= 1).assertTrue();
      console.log('GGridItem_01.right - GridItem_01.left' + (GridItem_01.right - GridItem_01.left))
      expect(Math.abs(GridItem_01.bottom - GridItem_01.top - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50))) <= 1).assertTrue();
      console.log('GGridItem_01.bottom - GridItem_01.top' + (GridItem_01.bottom - GridItem_01.top))

      console.info('[SUB_ACE_GRID_OnlyColumnsTemplate2_static_0100] END');
      done();
    });

  })
}
