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
import { MessageManager,Callback } from '../../../../ets/MainAbility/common/MessageManager';
import { Driver, ON } from '@ohos.UiTest';
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

export default function OnlyRowsTemplate5() {
  describe('OnlyRowsTemplate5',  () =>{
    beforeAll(() => {
      console.info("OnlyRowsTemplate5 beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.layout.split04.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("OnlyRowsTemplate5 beforeEach start");
      let options:router.RouterOptions = {
        url: 'MainAbility/pages/Grid/OnlyRowsTemplate/OnlyRowsTemplate1',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get OnlyRowsTemplate5 state pages:" + "");
        if (!("OnlyRowsTemplate1" == pages.name)) {
          console.info("get OnlyRowsTemplate5 pages.name:" + "");
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push OnlyRowsTemplate5 page error:" + err);
      }
      console.info("OnlyRowsTemplate5 beforeEach end");
    });
    afterEach(async  () => {
      console.info("OnlyRowsTemplate5 after each called");
    });

/**
     * @tc.number   SUB_ACE_GRID_OnlyRowsTemplate5_static_0500
     * @tc.name     SUB_ACE_GRID_OnlyRowsTemplate5_static_0500
     * @tc.desc     SUB_ACE_GRID_OnlyRowsTemplate5_static_0500
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_GRID_OnlyRowsTemplate5_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_GRID_OnlyRowsTemplate5_static_0500] START');
      AppStorage.get<MessageManager<int>>('messageManager')?.notify({name:'rowStart1', value:2})
      AppStorage.get<MessageManager<int>>('messageManager')?.notify({name:'rowEnd1', value:1})
      AppStorage.get<MessageManager<int>>('messageManager')?.notify({name:'rowStart2', value:2})
      AppStorage.get<MessageManager<int>>('messageManager')?.notify({name:'rowEnd2', value:1})
      await CommonFunc.sleep(2000);

      console.log('get Initial value')
      let GridItem_011:RectValue = CommonFunc.getComponentRect('OnlyRowsTemplate1_GridItem_01');
      console.log('assert size')
      expect(Math.round(GridItem_011.right - GridItem_011.left)).assertEqual(Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))));
      console.log('GGridItem_01.right - GridItem_01.left' + (GridItem_011.right - GridItem_011.left))
      expect(Math.round(GridItem_011.bottom - GridItem_011.top)).assertEqual(Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(72))));
      console.log('GGridItem_01.bottom - GridItem_01.top' + (GridItem_011.bottom - GridItem_011.top))
      await CommonFunc.sleep(2000);
      let driver = Driver.create();
      await CommonFunc.sleep(300);
      let button = await driver.findComponent(ON.id('OnlyRowsTemplate1_button'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info('[SUB_ACE_GRID_OnlyRowsTemplate5_static_0500] END');
      done();
    });
  })
}
