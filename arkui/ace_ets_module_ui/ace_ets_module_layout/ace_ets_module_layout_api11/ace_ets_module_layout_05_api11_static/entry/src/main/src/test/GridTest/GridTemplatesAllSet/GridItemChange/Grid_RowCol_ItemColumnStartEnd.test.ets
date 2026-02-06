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

export default function grid_RowCol_ItemColumnStartEndTest() {
  describe('grid_RowCol_ItemColumnStartEndTest', () => {
    beforeAll(() => {
      console.info("grid_RowCol_ItemColumnStartEndTest beforeAll start");
           
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.layout.split05.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("grid_RowCol_ItemColumnStartEndTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Grid/GridTemplatesAllSet/GridItemChange/Grid_RowCol_ItemColumnStartEnd',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get grid_RowCol_ItemColumnStartEndTest state pages: " + JSON.stringify(pages));
        if (!("Grid_RowCol_ItemColumnStartEnd" == pages.name)) {
          console.info("get grid_RowCol_ItemColumnStartEndTest state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push grid_RowCol_ItemColumnStartEndTest page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("Grid_RowCol_ItemColumnStartEndTest after each called");
    });
    
    
    

/**
     * @tc.number   testGridRowColItemColumnStartToZeroEndToThree_static_01
     * @tc.name     testGridRowColItemColumnStartToZeroEndToThree_static_01
     * @tc.desc     testGridRowColItemColumnStartToZeroEndToThree_static_01
     * @tc.level    Level.LEVEL0
     */
it('testGridRowColItemColumnStartToZeroEndToThree_static_01', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testGridRowColItemColumnStartToZeroEndToThree_static_01] START');
      AppStorage.get<MessageManager<Int>>('messageManager')?.notify({
        name: 'ColumnStart', value: 0
      });
      AppStorage.get<MessageManager<Int>>('messageManager')?.notify({
        name: 'ColumnEnd', value: 3
      });
      await CommonFunc.sleep(3000);
      let firstGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemColumnStartEnd1');
      let secondGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemColumnStartEnd2');
      let thirdGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemColumnStartEnd3');
      let fourthGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemColumnStartEnd4');
      let fifthGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemColumnStartEnd5');
      let sixthGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemColumnStartEnd6');
      let seventhGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemColumnStartEnd7');
      let eighthGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemColumnStartEnd8');
      let ninthGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemColumnStartEnd9');
      let tenthGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemColumnStartEnd10');
      let eleventhGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemColumnStartEnd11');
      let twelfthGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemColumnStartEnd12');
      let thirteenthGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemColumnStartEnd13');
      let gridContainer: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemColumnStartEnd_Container01');
      let gridContainerStrJson = inspector.getInspectorByKey('Grid_RowCol_ItemColumnStartEnd_Container01');

     expect(JSON.parseJsonElement(gridContainerStrJson).getString('$type')).assertEqual('Grid');

        expect(Math.abs(firstGridItem.right - firstGridItem.left - UIContext.resolveUIContext()!.vp2px(300)) <= 1)
          .assertTrue();
        expect(Math.abs(firstGridItem.bottom - firstGridItem.top - UIContext.resolveUIContext()!.vp2px(75)) <= 1)
          .assertTrue();
        expect(Math.abs(firstGridItem.left - gridContainer.left) <= 1).assertTrue();
        expect(Math.abs(firstGridItem.top - gridContainer.top) <= 1).assertTrue();

        expect(Math.abs(secondGridItem.right - secondGridItem.left - UIContext.resolveUIContext()!.vp2px(75)) <= 1)
          .assertTrue();
        expect(Math.abs(secondGridItem.bottom - secondGridItem.top - UIContext.resolveUIContext()!.vp2px(75)) <= 1)
          .assertTrue();
        expect(Math.abs(secondGridItem.left - gridContainer.left) <= 1).assertTrue();
        expect(Math.abs(secondGridItem.top - firstGridItem.bottom) <= 1).assertTrue();
        expect(Math.abs(thirdGridItem.right - thirdGridItem.left - UIContext.resolveUIContext()!.vp2px(75)) <= 1)
          .assertTrue();
        expect(Math.abs(thirdGridItem.left - secondGridItem.right) <= 1).assertTrue();
        expect(Math.abs(thirdGridItem.top - secondGridItem.top) <= 1).assertTrue();
        expect(Math.abs(thirdGridItem.bottom - secondGridItem.bottom) <= 1).assertTrue();
        expect(Math.abs(fourthGridItem.right - fourthGridItem.left - UIContext.resolveUIContext()!.vp2px(75)) <= 1)
          .assertTrue();
        expect(Math.abs(fourthGridItem.left - thirdGridItem.right) <= 1).assertTrue();
        expect(Math.abs(fourthGridItem.top - secondGridItem.top) <= 1).assertTrue();
        expect(Math.abs(fourthGridItem.bottom - secondGridItem.bottom) <= 1).assertTrue();
        expect(Math.abs(fifthGridItem.right - fifthGridItem.left - UIContext.resolveUIContext()!.vp2px(75)) <= 1)
          .assertTrue();
        expect(Math.abs(fifthGridItem.left - fourthGridItem.right) <= 1).assertTrue();
        expect(Math.abs(fifthGridItem.right - gridContainer.right) <= 1).assertTrue();
        expect(Math.abs(fifthGridItem.top - secondGridItem.top) <= 1).assertTrue();
        expect(Math.abs(fifthGridItem.bottom - secondGridItem.bottom) <= 1).assertTrue();

        expect(Math.abs(sixthGridItem.right - sixthGridItem.left - UIContext.resolveUIContext()!.vp2px(75)) <= 1)
          .assertTrue();
        expect(Math.abs(sixthGridItem.bottom - sixthGridItem.top - UIContext.resolveUIContext()!.vp2px(75)) <= 1)
          .assertTrue();
        expect(Math.abs(sixthGridItem.left - gridContainer.left) <= 1).assertTrue();
        expect(Math.abs(sixthGridItem.top - secondGridItem.bottom) <= 1).assertTrue();
        expect(Math.abs(seventhGridItem.right - seventhGridItem.left - UIContext.resolveUIContext()!.vp2px(75)) <= 1)
          .assertTrue();
        expect(Math.abs(seventhGridItem.left - sixthGridItem.right) <= 1).assertTrue();
        expect(Math.abs(seventhGridItem.top - sixthGridItem.top) <= 1).assertTrue();
        expect(Math.abs(seventhGridItem.bottom - sixthGridItem.bottom) <= 1).assertTrue();
        expect(Math.abs(eighthGridItem.right - eighthGridItem.left - UIContext.resolveUIContext()!.vp2px(75)) <= 1)
          .assertTrue();
        expect(Math.abs(eighthGridItem.left - seventhGridItem.right) <= 1).assertTrue();
        expect(Math.abs(eighthGridItem.top - sixthGridItem.top) <= 1).assertTrue();
        expect(Math.abs(eighthGridItem.bottom - sixthGridItem.bottom) <= 1).assertTrue();
        expect(Math.abs(ninthGridItem.right - ninthGridItem.left - UIContext.resolveUIContext()!.vp2px(75)) <= 1)
          .assertTrue();
        expect(Math.abs(ninthGridItem.left - eighthGridItem.right) <= 1).assertTrue();
        expect(Math.abs(ninthGridItem.top - sixthGridItem.top) <= 1).assertTrue();
        expect(Math.abs(ninthGridItem.bottom - sixthGridItem.bottom) <= 1).assertTrue();

        expect(Math.abs(tenthGridItem.right - tenthGridItem.left - UIContext.resolveUIContext()!.vp2px(75)) <= 1)
          .assertTrue();
        expect(Math.abs(tenthGridItem.bottom - tenthGridItem.top - UIContext.resolveUIContext()!.vp2px(75)) <= 1)
          .assertTrue();
        expect(Math.abs(tenthGridItem.left - gridContainer.left) <= 1).assertTrue();
        expect(Math.abs(tenthGridItem.top - sixthGridItem.bottom) <= 1).assertTrue();
        expect(Math.abs(eleventhGridItem.right - eleventhGridItem.left - UIContext.resolveUIContext()!.vp2px(75)) <=
          1).assertTrue();
        expect(Math.abs(eleventhGridItem.left - tenthGridItem.right) <= 1).assertTrue();
        expect(Math.abs(eleventhGridItem.top - tenthGridItem.top) <= 1).assertTrue();
        expect(Math.abs(eleventhGridItem.bottom - tenthGridItem.bottom) <= 1).assertTrue();
        expect(Math.abs(twelfthGridItem.right - twelfthGridItem.left - UIContext.resolveUIContext()!.vp2px(75)) <= 1)
          .assertTrue();
        expect(Math.abs(twelfthGridItem.left - eleventhGridItem.right) <= 1).assertTrue();
        expect(Math.abs(twelfthGridItem.top - tenthGridItem.top) <= 1).assertTrue();
        expect(Math.abs(twelfthGridItem.bottom - tenthGridItem.bottom) <= 1).assertTrue();
        expect(Math.abs(thirteenthGridItem.right - thirteenthGridItem.left -
        UIContext.resolveUIContext()!.vp2px(75)) <= 1).assertTrue();
        expect(Math.abs(thirteenthGridItem.left - twelfthGridItem.right) <= 1).assertTrue();
        expect(Math.abs(thirteenthGridItem.top - tenthGridItem.top) <= 1).assertTrue();
        expect(Math.abs(thirteenthGridItem.bottom - gridContainer.bottom) <= 1).assertTrue();
        console.info('[testGridRowColItemColumnStartToZeroEndToThree_static_01] END');
        done();
      });


/**
     * @tc.number   testGridRowColItemColumnStartToZeroEndToTwo_static_02
     * @tc.name     testGridRowColItemColumnStartToZeroEndToTwo_static_02
     * @tc.desc     testGridRowColItemColumnStartToZeroEndToTwo_static_02
     * @tc.level    Level.LEVEL0
     */
it('testGridRowColItemColumnStartToZeroEndToTwo_static_02', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testGridRowColItemColumnStartToZeroEndToTwo_static_02] START');
      AppStorage.get<MessageManager<Int>>('messageManager')?.notify({
        name: 'ColumnStart', value: 0
      });
      AppStorage.get<MessageManager<Int>>('messageManager')?.notify({
        name: 'ColumnEnd', value: 2
      });
      await CommonFunc.sleep(3000);
      let firstGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemColumnStartEnd1');
      let secondGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemColumnStartEnd2');
      let thirdGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemColumnStartEnd3');
      let fourthGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemColumnStartEnd4');
      let fifthGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemColumnStartEnd5');
      let sixthGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemColumnStartEnd6');
      let seventhGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemColumnStartEnd7');
      let eighthGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemColumnStartEnd8');
      let ninthGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemColumnStartEnd9');
      let tenthGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemColumnStartEnd10');
      let eleventhGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemColumnStartEnd11');
      let twelfthGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemColumnStartEnd12');
      let thirteenthGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemColumnStartEnd13');
      let gridContainer: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemColumnStartEnd_Container01');
      let gridContainerStrJson = inspector.getInspectorByKey('Grid_RowCol_ItemColumnStartEnd_Container01');

     expect(JSON.parseJsonElement(gridContainerStrJson).getString('$type')).assertEqual('Grid');

        expect(Math.abs(firstGridItem.right - firstGridItem.left - UIContext.resolveUIContext()!.vp2px(225)) <= 1)
          .assertTrue();
        expect(Math.abs(firstGridItem.bottom - firstGridItem.top - UIContext.resolveUIContext()!.vp2px(75)) <= 1)
          .assertTrue();
        expect(Math.abs(firstGridItem.left - gridContainer.left) <= 1).assertTrue();
        expect(Math.abs(firstGridItem.top - gridContainer.top) <= 1).assertTrue();
        expect(Math.abs(secondGridItem.left - firstGridItem.right) <= 1).assertTrue();
        expect(Math.abs(secondGridItem.right - gridContainer.right) <= 1).assertTrue();
        expect(Math.abs(secondGridItem.top - gridContainer.top) <= 1).assertTrue();
        expect(Math.abs(secondGridItem.bottom - firstGridItem.bottom) <= 1).assertTrue();

        expect(Math.abs(thirdGridItem.right - thirdGridItem.left - UIContext.resolveUIContext()!.vp2px(75)) <= 1)
          .assertTrue();
        expect(Math.abs(thirdGridItem.bottom - thirdGridItem.top - UIContext.resolveUIContext()!.vp2px(75)) <= 1)
          .assertTrue();
        expect(Math.abs(thirdGridItem.left - gridContainer.left) <= 1).assertTrue();
        expect(Math.abs(thirdGridItem.top - firstGridItem.bottom) <= 1).assertTrue();
        expect(Math.abs(fourthGridItem.right - fourthGridItem.left - UIContext.resolveUIContext()!.vp2px(75)) <= 1)
          .assertTrue();
        expect(Math.abs(fourthGridItem.left - thirdGridItem.right) <= 1).assertTrue();
        expect(Math.abs(fourthGridItem.top - thirdGridItem.top) <= 1).assertTrue();
        expect(Math.abs(fourthGridItem.bottom - thirdGridItem.bottom) <= 1).assertTrue();
        expect(Math.abs(fifthGridItem.right - fifthGridItem.left - UIContext.resolveUIContext()!.vp2px(75)) <= 1)
          .assertTrue();
        expect(Math.abs(fifthGridItem.left - fourthGridItem.right) <= 1).assertTrue();
        expect(Math.abs(fifthGridItem.top - thirdGridItem.top) <= 1).assertTrue();
        expect(Math.abs(fifthGridItem.bottom - thirdGridItem.bottom) <= 1).assertTrue();
        expect(Math.abs(sixthGridItem.right - sixthGridItem.left - UIContext.resolveUIContext()!.vp2px(75)) <= 1)
          .assertTrue();
        expect(Math.abs(sixthGridItem.left - fifthGridItem.right) <= 1).assertTrue();
        expect(Math.abs(sixthGridItem.right - gridContainer.right) <= 1).assertTrue();
        expect(Math.abs(sixthGridItem.top - thirdGridItem.top) <= 1).assertTrue();
        expect(Math.abs(sixthGridItem.bottom - thirdGridItem.bottom) <= 1).assertTrue();

        expect(Math.abs(seventhGridItem.right - seventhGridItem.left - UIContext.resolveUIContext()!.vp2px(75)) <= 1)
          .assertTrue();
        expect(Math.abs(seventhGridItem.bottom - seventhGridItem.top - UIContext.resolveUIContext()!.vp2px(75)) <= 1)
          .assertTrue();
        expect(Math.abs(seventhGridItem.left - gridContainer.left) <= 1).assertTrue();
        expect(Math.abs(seventhGridItem.top - thirdGridItem.bottom) <= 1).assertTrue();
        expect(Math.abs(eighthGridItem.right - eighthGridItem.left - UIContext.resolveUIContext()!.vp2px(75)) <= 1)
          .assertTrue();
        expect(Math.abs(eighthGridItem.left - seventhGridItem.right) <= 1).assertTrue();
        expect(Math.abs(eighthGridItem.top - seventhGridItem.top) <= 1).assertTrue();
        expect(Math.abs(eighthGridItem.bottom - seventhGridItem.bottom) <= 1).assertTrue();
        expect(Math.abs(ninthGridItem.right - ninthGridItem.left - UIContext.resolveUIContext()!.vp2px(75)) <= 1)
          .assertTrue();
        expect(Math.abs(ninthGridItem.left - eighthGridItem.right) <= 1).assertTrue();
        expect(Math.abs(ninthGridItem.top - seventhGridItem.top) <= 1).assertTrue();
        expect(Math.abs(ninthGridItem.bottom - seventhGridItem.bottom) <= 1).assertTrue();
        expect(Math.abs(tenthGridItem.right - tenthGridItem.left - UIContext.resolveUIContext()!.vp2px(75)) <= 1)
          .assertTrue();
        expect(Math.abs(tenthGridItem.left - ninthGridItem.right) <= 1).assertTrue();
        expect(Math.abs(tenthGridItem.top - seventhGridItem.top) <= 1).assertTrue();
        expect(Math.abs(tenthGridItem.bottom - seventhGridItem.bottom) <= 1).assertTrue();

        expect(Math.abs(eleventhGridItem.right - eleventhGridItem.left - UIContext.resolveUIContext()!.vp2px(75)) <=
          1).assertTrue();
        expect(Math.abs(eleventhGridItem.bottom - eleventhGridItem.top - UIContext.resolveUIContext()!.vp2px(75)) <=
          1).assertTrue();
        expect(Math.abs(eleventhGridItem.left - gridContainer.left) <= 1).assertTrue();
        expect(Math.abs(eleventhGridItem.top - seventhGridItem.bottom) <= 1).assertTrue();
        expect(Math.abs(twelfthGridItem.right - twelfthGridItem.left - UIContext.resolveUIContext()!.vp2px(75)) <= 1)
          .assertTrue();
        expect(Math.abs(twelfthGridItem.left - eleventhGridItem.right) <= 1).assertTrue();
        expect(Math.abs(twelfthGridItem.top - eleventhGridItem.top) <= 1).assertTrue();
        expect(Math.abs(twelfthGridItem.bottom - eleventhGridItem.bottom) <= 1).assertTrue();
        expect(Math.abs(thirteenthGridItem.right - thirteenthGridItem.left -
        UIContext.resolveUIContext()!.vp2px(75)) <= 1).assertTrue();
        expect(Math.abs(thirteenthGridItem.left - twelfthGridItem.right) <= 1).assertTrue();
        expect(Math.abs(thirteenthGridItem.top - eleventhGridItem.top) <= 1).assertTrue();
        expect(Math.abs(thirteenthGridItem.bottom - gridContainer.bottom) <= 1).assertTrue();
        console.info('[testGridRowColItemColumnStartToZeroEndToTwo_static_02] END');
        done();
      });
  })
}
