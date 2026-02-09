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

export default function Grid_ReachStartAndEnd2() {
  describe('Grid_ReachStartAndEnd2', () => {
    beforeAll(() => {
      console.log("Grid_ReachStartAndEnd2 beforeAll start111")
           
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.layout.split05.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("Grid_ReachStartAndEnd2 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Grid/Grid_scroll/Grid_ReachStartAndEnd',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get Grid_ReachStartAndEnd2 state pages: " + JSON.stringify(pages));
        if (!("Grid_ReachStartAndEnd" == pages.name)) {
          console.info("get Grid_ReachStartAndEnd2 state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push Grid_ReachStartAndEnd2 page error: " + err);
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
     * @tc.number   Grid_ReachStartAndEnd2_static_0200
     * @tc.name     Grid_ReachStartAndEnd2_static_0200
     * @tc.desc     Grid_ReachStartAndEnd2_static_0200
     * @tc.level    Level.LEVEL0
     */
it('Grid_ReachStartAndEnd2_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[Grid_ReachStartAndEnd2_static_0200] START');
      let scrollBarRect: RectValue = CommonFunc.getComponentRectOnScreen('Grid_ReachStartAndEnd_scrollBar')
      let driver = Driver.create()
      driver.swipe(
        (Number.parseInt(`${(scrollBarRect.right - scrollBarRect.left) * 0.5 + scrollBarRect.left}`)).toInt(),
        (Number.parseInt(`${(scrollBarRect.bottom - scrollBarRect.top) * 0.1 + scrollBarRect.top}`)).toInt(),
        (Number.parseInt(`${(scrollBarRect.right - scrollBarRect.left) * 0.5 + scrollBarRect.left}`)).toInt(),
        (Number.parseInt(`${(scrollBarRect.bottom - scrollBarRect.top) * 0.5 + scrollBarRect.top}`)).toInt(),
        1000);
      await CommonFunc.sleep(2000);

      let strJson1 = inspector.getInspectorByKey('Grid_ReachStartAndEnd_tex2')

     console.info("[Grid_ReachStartAndEnd2_static_0200] component obj1 is: " + JSON.stringify(JSON.parseJsonElement(strJson1)))
     expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content')).assertEqual('onReachEnd');

      driver.swipe(
        (Number.parseInt(`${(scrollBarRect.right - scrollBarRect.left) * 0.5 + scrollBarRect.left}`)).toInt(),
        (Number.parseInt(`${(scrollBarRect.bottom - scrollBarRect.top) * 0.5 + scrollBarRect.top}`)).toInt(),
        (Number.parseInt(`${(scrollBarRect.right - scrollBarRect.left) * 0.5 + scrollBarRect.left}`)).toInt(),
        (Number.parseInt(`${(scrollBarRect.bottom - scrollBarRect.top) * 0.1 + scrollBarRect.top}`)).toInt(),
        1000);
      await CommonFunc.sleep(2000);

      let strJson2 = inspector.getInspectorByKey('Grid_ReachStartAndEnd_tex1')

     console.info("[Grid_ReachStartAndEnd2_static_0200] component obj2 is: " + JSON.stringify(JSON.parseJsonElement(strJson2)))
     expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content')).assertEqual('onReachStart2');

      console.info('[Grid_ReachStartAndEnd2_static_0200] END');
      done();
    });


  })
}
