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
import router from '@ohos.router';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import { UtilsTest } from '../../Util.test';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function Grid_ReachStartAndEnd4() {
  describe('Grid_ReachStartAndEnd4', () => {
    beforeAll(() => {
           
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.layout.split05.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("Grid_ReachStartAndEnd4 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Grid/Grid_scroll/Grid_ReachStartAndEnd',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get Grid_ReachStartAndEnd4 state pages: " + JSON.stringify(pages));
        if (!("Grid_ReachStartAndEnd" == pages.name)) {
          console.info("get Grid_ReachStartAndEnd4 state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push Grid_ReachStartAndEnd4 page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      
      
      let driver = Driver.create();
      await CommonFunc.sleep(300);
      let btn = await driver.findComponent(ON.id('grid_Reset_bt'));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(3000);

      console.info("Grid_ReachStartAndEnd2 after each called");
    });

    
    
    

/**
     * @tc.number   Grid_ReachStartAndEnd4_static_0500
     * @tc.name     Grid_ReachStartAndEnd4_static_0500
     * @tc.desc     Grid_ReachStartAndEnd4_static_0500
     * @tc.level    Level.LEVEL0
     */
it('Grid_ReachStartAndEnd4_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[Grid_ReachStartAndEnd4_static_0500] START');

      let driver = Driver.create()
      let button1 = await driver.findComponent(ON.id('Grid_ReachStartAndEnd_changePadding'))
      await (button1?.click() as Promise<void>)

      let gridRect: RectValue = CommonFunc.getComponentRectOnScreen('Grid_ReachStartAndEnd_grid')
      driver.swipe(
        (Number.parseInt(`${`${(gridRect.right - gridRect.left) * 0.5 + gridRect.left}`}`)).toInt(),
        (Number.parseInt(`${`${(gridRect.bottom - gridRect.top) * 0.5 + gridRect.top}`}`)).toInt(),
        (Number.parseInt(`${`${(gridRect.right - gridRect.left) * 0.5 + gridRect.left}`}`)).toInt(),
        (Number.parseInt(`${`${(gridRect.bottom - gridRect.top) * 0.1 + gridRect.top}`}`)).toInt(),
        1000);
      await CommonFunc.sleep(2000);

      driver.swipe(
        (Number.parseInt(`${`${(gridRect.right - gridRect.left) * 0.5 + gridRect.left}`}`)).toInt(),
        (Number.parseInt(`${`${(gridRect.bottom - gridRect.top) * 0.1 + gridRect.top}`}`)).toInt(),
        (Number.parseInt(`${`${(gridRect.right - gridRect.left) * 0.5 + gridRect.left}`}`)).toInt(),
        (Number.parseInt(`${`${(gridRect.bottom - gridRect.top) * 0.5 + gridRect.top}`}`)).toInt(),
        1000);
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('Grid_ReachStartAndEnd_tex1');
     console.info("[Grid_ReachStartAndEnd4_static_0500] component obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)))
     expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')).assertEqual('onReachStart2');

      console.info('[Grid_ReachStartAndEnd4_static_0500] END');
      done();
    });


  })
}
