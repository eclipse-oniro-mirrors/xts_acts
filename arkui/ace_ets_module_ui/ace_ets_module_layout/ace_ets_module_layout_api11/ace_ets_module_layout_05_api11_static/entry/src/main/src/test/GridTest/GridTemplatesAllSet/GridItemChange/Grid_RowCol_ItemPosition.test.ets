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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect,Level } from "../../../../../../hypium/index";
import CommonFunc from '../../../../../ets/MainAbility/common/Common';
import RectValue  from '../../../../../ets/MainAbility/common/Rect';
import { MessageManager } from '../../../../../ets/MainAbility/common/MessageManager';
import inspector from '@ohos.arkui.inspector'
import { Position } from '@ohos.arkui.component'
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

export default function grid_RowCol_ItemPositionTest() {
  describe('Grid_RowCol_ItemPositionTest', () => {
    beforeAll(() => {
      console.info("Grid_RowCol_ItemPositionTest beforeAll start");
           
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.layout.split05.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("Grid_RowCol_ItemPositionTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Grid/GridTemplatesAllSet/GridItemChange/Grid_RowCol_ItemPosition',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get Grid_RowCol_ItemPositionTest state pages: " + JSON.stringify(pages));
        if (!("Grid_RowCol_ItemPosition" == pages.name)) {
          console.info("get Grid_RowCol_ItemPositionTest state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push Grid_RowCol_ItemPositionTest page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("Grid_RowCol_ItemPositionTest after each called");
    });
    
    
    

/**
     * @tc.number   testGridRowColItemPosition_static_01
     * @tc.name     testGridRowColItemPosition_static_01
     * @tc.desc     testGridRowColItemPosition_static_01
     * @tc.level    Level.LEVEL0
     */
it('testGridRowColItemPosition_static_01', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testGridRowColItemPosition_static_01] START');
      AppStorage.get<MessageManager<Position>>('messageManager')?.notify({
        name: 'secondGridItemPosition', value: {
          x: 20, y: 20
        }
      });
      await CommonFunc.sleep(3000);
      let firstGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemPosition01');
      let secondGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemPosition02');
      let thirdGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemPosition03');
      let fourthGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemPosition04');
      let gridContainer: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemPosition_Container01');
      let gridContainerStrJson = inspector.getInspectorByKey('Grid_RowCol_ItemPosition_Container01');

     expect(JSON.parseJsonElement(gridContainerStrJson).getString('$type')).assertEqual('Grid');

      expect(Math.round(secondGridItem.left - gridContainer.left) - Math.round(UIContext.resolveUIContext()!.vp2px(20)) <= 1).assertTrue();
      expect(Math.round(secondGridItem.top - gridContainer.top) - Math.round(UIContext.resolveUIContext()!.vp2px(20)) <= 1)
        .assertTrue(); 

      expect(firstGridItem.left - gridContainer.left <= 1).assertTrue();
      expect(firstGridItem.top - gridContainer.top <= 1).assertTrue();
      expect(thirdGridItem.left - gridContainer.left <= 1).assertTrue();
      expect(thirdGridItem.top - firstGridItem.bottom <= 1).assertTrue();
      expect(fourthGridItem.left - thirdGridItem.right <= 1).assertTrue();
      expect(fourthGridItem.top - thirdGridItem.top <= 1).assertTrue();

      expect(Math.round(firstGridItem.right - firstGridItem.left) - Math.round(UIContext.resolveUIContext()!.vp2px(150)) <= 1).assertTrue();
      expect(Math.round(firstGridItem.bottom - firstGridItem.top) - Math.round(UIContext.resolveUIContext()!.vp2px(150)) <= 1).assertTrue();

      expect(Math.round(secondGridItem.right - secondGridItem.left) - Math.round(UIContext.resolveUIContext()!.vp2px(150)) <= 1).assertTrue();
      expect(Math.round(secondGridItem.bottom - secondGridItem.top) - Math.round(UIContext.resolveUIContext()!.vp2px(150)) <= 1).assertTrue();

      expect(Math.round(thirdGridItem.right - thirdGridItem.left) - Math.round(UIContext.resolveUIContext()!.vp2px(150)) <= 1).assertTrue();
      expect(Math.round(thirdGridItem.bottom - thirdGridItem.top) - Math.round(UIContext.resolveUIContext()!.vp2px(150)) <= 1).assertTrue();

      expect(Math.round(fourthGridItem.right - fourthGridItem.left) - Math.round(UIContext.resolveUIContext()!.vp2px(150)) <= 1).assertTrue();
      expect(Math.round(fourthGridItem.bottom - fourthGridItem.top) - Math.round(UIContext.resolveUIContext()!.vp2px(150)) <= 1).assertTrue();
      console.info('[testGridRowColItemPosition_static_01] END');
      done();
    });
  })
}
