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

export default function Grid_ScrollFrameBegin() {
  describe('Grid_ScrollFrameBegin', () => {
    beforeAll(() => {
           
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.layout.split05.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("Grid_ScrollFrameBegin beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Grid/Grid_scroll/Grid_ScrollFrameBegin',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        // routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get Grid_ScrollFrameBegin state pages: " + JSON.stringify(pages));
        if (!("Grid_ScrollFrameBegin" == pages.name)) {
          console.info("get Grid_ScrollFrameBegin state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push Grid_ScrollFrameBegin page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);


      let driver = Driver.create();
      await CommonFunc.sleep(300);
      let btn = await driver.findComponent(ON.id('scrollFrame_Reset_bt'));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(3000);
      console.info("Grid_ScrollFrameBegin after each called");
    });


    
    
    

/**
     * @tc.number   Grid_ScrollFrameBegin_static_0100
     * @tc.name     Grid_ScrollFrameBegin_static_0100
     * @tc.desc     Grid_ScrollFrameBegin_static_0100
     * @tc.level    Level.LEVEL0
     */
it('Grid_ScrollFrameBegin_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[Grid_ScrollFrameBegin_static_0100] START');
      let driver = Driver.create()
      let button = await driver.findComponent(ON.id('Grid_ScrollFrameBegin_scrollTo'))
      await (button?.click() as Promise<void>)
      await CommonFunc.sleep(2000);

      let strJson1 = inspector.getInspectorByKey('Grid_ScrollFrameBegin_text')

     console.info("[Grid_ScrollFrameBegin_static_0100] component obj1 is: " + JSON.stringify(JSON.parseJsonElement(strJson1)))
     expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content')).assertEqual('');

      console.info('[Grid_ScrollFrameBegin_static_0100] END');
      done();
    });

    
    
    

/**
     * @tc.number   Grid_ScrollFrameBegin_static_0200
     * @tc.name     Grid_ScrollFrameBegin_static_0200
     * @tc.desc     Grid_ScrollFrameBegin_static_0200
     * @tc.level    Level.LEVEL0
     */
it('Grid_ScrollFrameBegin_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[Grid_ScrollFrameBegin_static_0200] START');
      let gridRect: RectValue = CommonFunc.getComponentRectOnScreen('Grid_ScrollFrameBegin_grid')
      let driver = Driver.create()
      driver.swipe(
        (Number.parseInt(`${(gridRect.right - gridRect.left) * 0.5 + gridRect.left}`)).toInt(),
        (Number.parseInt(`${(gridRect.bottom - gridRect.top) * 0.5 + gridRect.top}`)).toInt(),
        (Number.parseInt(`${(gridRect.right - gridRect.left) * 0.5 + gridRect.left}`)).toInt(),
        (Number.parseInt(`${(gridRect.bottom - gridRect.top) * 0.1 + gridRect.top}`)).toInt(),
        1000);
      await CommonFunc.sleep(2000);

      let strJson1 = inspector.getInspectorByKey('Grid_ScrollFrameBegin_text')

     console.info("[Grid_ScrollFrameBegin_static_0200] component obj1 is: " + JSON.stringify(JSON.parseJsonElement(strJson1)))
     expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content')).assertEqual('onScrollFrameBegin');

      console.info('[Grid_ScrollFrameBegin_static_0200] END');
      done();
    });

    
    
    

/**
     * @tc.number   Grid_ScrollFrameBegin_static_0300
     * @tc.name     Grid_ScrollFrameBegin_static_0300
     * @tc.desc     Grid_ScrollFrameBegin_static_0300
     * @tc.level    Level.LEVEL0
     */
it('Grid_ScrollFrameBegin_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[Grid_ScrollFrameBegin_static_0300] START');
      let gridRect: RectValue = CommonFunc.getComponentRectOnScreen('Grid_ScrollFrameBegin_grid')
      let driver = Driver.create()
      await driver.fling({
        x: (Number.parseInt(`${(gridRect.right - gridRect.left) * 0.5 + gridRect.left}`)).toInt(),
        y: (Number.parseInt(`${(gridRect.bottom - gridRect.top) * 0.5 + gridRect.top}`)).toInt()
      },
        {
          x: (Number.parseInt(`${(gridRect.right - gridRect.left) * 0.5 + gridRect.left}`)).toInt(),
          y: (Number.parseInt(`${(gridRect.bottom - gridRect.top) * 0.3 + gridRect.top}`)).toInt()
        }, 5, 1000);
      await CommonFunc.sleep(2000);

      let strJson1 = inspector.getInspectorByKey('Grid_ScrollFrameBegin_text')

     console.info("[Grid_ScrollFrameBegin_static_0300] component obj1 is: " + JSON.stringify(JSON.parseJsonElement(strJson1)))
     expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content')).assertEqual('onScrollFrameBegin');

      console.info('[Grid_ScrollFrameBegin_static_0300] END');
      done();
    });


  })
}
