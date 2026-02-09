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
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function Grid_RowCol_LayoutDirection() {
  describe('Grid_RowCol_LayoutDirectionTest', () => {
    beforeAll(() => {
      console.info("Grid_RowCol_LayoutDirectionTest beforeAll start");
           
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.layout.split05.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("Grid_RowCol_LayoutDirection beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Grid/GridTemplatesAllSet/GridChange/Grid_RowCol_LayoutDirection',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get Grid_RowCol_LayoutDirection state pages: " + JSON.stringify(pages));
        if (!("Grid_RowCol_LayoutDirection" == pages.name)) {
          console.info("get Grid_RowCol_LayoutDirection state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push Grid_RowCol_LayoutDirection page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("Grid_RowCol_LayoutDirection after each called")
    });
    
    
    

/**
     * @tc.number   testGridRowColGridLayoutDirection_static_01
     * @tc.name     testGridRowColGridLayoutDirection_static_01
     * @tc.desc     testGridRowColGridLayoutDirection_static_01
     * @tc.level    Level.LEVEL0
     */
it('testGridRowColGridLayoutDirection_static_01', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testGridRowColGridLayoutDirection_static_01] START');
      await CommonFunc.sleep(3000);
      let gridContainerStrJson = inspector.getInspectorByKey('Grid_RowCol_LayoutDirection_01');

     expect(JSON.parseJsonElement(gridContainerStrJson).getString('$type')).assertEqual('Grid');
      let Grid_RowCol_LayoutDirection_011: RectValue = CommonFunc.getComponentRect('Grid_RowCol_LayoutDirection_011');
      let Grid_RowCol_LayoutDirection_012: RectValue = CommonFunc.getComponentRect('Grid_RowCol_LayoutDirection_012');
      let Grid_RowCol_LayoutDirection_013: RectValue = CommonFunc.getComponentRect('Grid_RowCol_LayoutDirection_013');
      let Grid_RowCol_LayoutDirection_014: RectValue = CommonFunc.getComponentRect('Grid_RowCol_LayoutDirection_014');
      let Grid_RowCol_LayoutDirection_01: RectValue = CommonFunc.getComponentRect('Grid_RowCol_LayoutDirection_01');
      expect(Math.abs(Grid_RowCol_LayoutDirection_011.left - Grid_RowCol_LayoutDirection_01.left) <= 1).assertTrue();
      expect(Math.abs(Grid_RowCol_LayoutDirection_013.left - Grid_RowCol_LayoutDirection_01.left) <= 1).assertTrue();

      expect(Math.abs(Grid_RowCol_LayoutDirection_011.right - Grid_RowCol_LayoutDirection_012.left) <= 1).assertTrue();
      expect(Math.abs(Grid_RowCol_LayoutDirection_013.right - Grid_RowCol_LayoutDirection_014.left) <= 1).assertTrue();

      expect(Math.abs(Grid_RowCol_LayoutDirection_012.right - Grid_RowCol_LayoutDirection_01.right) <= 1).assertTrue();
      expect(Math.abs(Grid_RowCol_LayoutDirection_014.right - Grid_RowCol_LayoutDirection_01.right) <= 1).assertTrue();

      expect(Math.abs(Grid_RowCol_LayoutDirection_011.top - Grid_RowCol_LayoutDirection_01.top) <= 1).assertTrue();
      expect(Math.abs(Grid_RowCol_LayoutDirection_012.top - Grid_RowCol_LayoutDirection_01.top) <= 1).assertTrue();

      expect(Math.abs(Grid_RowCol_LayoutDirection_011.bottom - Grid_RowCol_LayoutDirection_013.top) <= 1).assertTrue();
      expect(Math.abs(Grid_RowCol_LayoutDirection_012.bottom - Grid_RowCol_LayoutDirection_014.top) <= 1).assertTrue();

      expect(Math.abs(Grid_RowCol_LayoutDirection_013.bottom - Grid_RowCol_LayoutDirection_01.bottom) <= 1)
        .assertTrue();
      expect(Math.abs(Grid_RowCol_LayoutDirection_014.bottom - Grid_RowCol_LayoutDirection_01.bottom) <= 1)
        .assertTrue();

      expect(Math.abs(Grid_RowCol_LayoutDirection_011.right - Grid_RowCol_LayoutDirection_011.left -
      UIContext.resolveUIContext()!.vp2px(150)) <= 1).assertTrue();
      expect(Math.abs(Grid_RowCol_LayoutDirection_012.right - Grid_RowCol_LayoutDirection_012.left -
      UIContext.resolveUIContext()!.vp2px(150)) <= 1).assertTrue();
      expect(Math.abs(Grid_RowCol_LayoutDirection_013.right - Grid_RowCol_LayoutDirection_013.left -
      UIContext.resolveUIContext()!.vp2px(150)) <= 1).assertTrue();
      expect(Math.abs(Grid_RowCol_LayoutDirection_014.right - Grid_RowCol_LayoutDirection_014.left -
      UIContext.resolveUIContext()!.vp2px(150)) <= 1).assertTrue();

      expect(Math.abs(Grid_RowCol_LayoutDirection_011.bottom - Grid_RowCol_LayoutDirection_011.top -
      UIContext.resolveUIContext()!.vp2px(150)) <= 1).assertTrue();
      expect(Math.abs(Grid_RowCol_LayoutDirection_013.bottom - Grid_RowCol_LayoutDirection_013.top -
      UIContext.resolveUIContext()!.vp2px(150)) <= 1).assertTrue();
      expect(Math.abs(Grid_RowCol_LayoutDirection_014.bottom - Grid_RowCol_LayoutDirection_014.top -
      UIContext.resolveUIContext()!.vp2px(150)) <= 1).assertTrue();
      console.info('[testGridRowColGridLayoutDirection_static_01] END');
      done();
    });
  })
}
