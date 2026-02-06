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

export default function grid_RowCol_ItemPadMarTest() {
  describe('Grid_RowCol_ItemPadMarTest', () => {
    beforeAll(() => {
      console.info("grid_RowCol_ItemPadMarTest beforeAll start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.layout.split05.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("grid_RowCol_ItemPadMarTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Grid/GridTemplatesAllSet/GridItemChange/Grid_RowCol_ItemPadMar',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get grid_RowCol_ItemPadMarTest state pages: " + JSON.stringify(pages));
        if (!("Grid_RowCol_ItemPadMar" == pages.name)) {
          console.info("get grid_RowCol_ItemPadMarTest state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push grid_RowCol_ItemPadMarTest page error: " + err);
      }
    });

    afterEach(async () => {
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'secondGridItemPadding', value: 0
      });
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'secondGridItemMargin', value: 0
      });
      await CommonFunc.sleep(1000);
      console.info("Grid_RowCol_ItemPadMarTest after each called");
    });
    
    
    

/**
     * @tc.number   testGridRowColItemMargin_static_01
     * @tc.name     testGridRowColItemMargin_static_01
     * @tc.desc     testGridRowColItemMargin_static_01
     * @tc.level    Level.LEVEL0
     */
it('testGridRowColItemMargin_static_01', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testGridRowColItemMargin_static_01] START');
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'secondGridItemMargin', value: 10
      });
      await CommonFunc.sleep(3000);
      let firstGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemPadMar01');
      let secondGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemPadMar02');
      let secondText: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemPadMar_Text02');
      let thirdGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemPadMar03');
      let fourthGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemPadMar04');
      let gridContainer: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemPadMar_Container01');
      let gridContainerStrJson = inspector.getInspectorByKey('Grid_RowCol_ItemPadMar_Container01');

     expect(JSON.parseJsonElement(gridContainerStrJson).getString('$type')).assertEqual('Grid');

      expect(Math.abs(secondGridItem.left - firstGridItem.right - UIContext.resolveUIContext()!.vp2px(10)) <= 1)
        .assertTrue();
      expect(Math.abs(secondGridItem.top - gridContainer.top - UIContext.resolveUIContext()!.vp2px(10)) <= 1)
        .assertTrue();

      expect(Math.abs(secondGridItem.left - secondText.left) <= 1).assertTrue();
      expect(Math.abs(secondGridItem.top - secondText.top) <= 1).assertTrue();

      expect(Math.abs(secondGridItem.right - secondGridItem.left -
        (secondText.right - secondText.left)) <= 1).assertTrue();
      expect(Math.abs(secondGridItem.bottom - secondGridItem.top -
        (secondText.bottom - secondText.top)) <= 1).assertTrue();

      expect(Math.abs(firstGridItem.left - gridContainer.left) <= 1).assertTrue();
      expect(Math.abs(firstGridItem.top - gridContainer.top) <= 1).assertTrue();
      expect(Math.abs(thirdGridItem.left - gridContainer.left) <= 1).assertTrue();
      expect(Math.abs(thirdGridItem.top - firstGridItem.bottom) <= 1).assertTrue();
      expect(Math.abs(fourthGridItem.left - thirdGridItem.right) <= 1).assertTrue();
      expect(Math.abs(fourthGridItem.top - thirdGridItem.top) <= 1).assertTrue();

      expect(Math.abs(firstGridItem.right - firstGridItem.left - UIContext.resolveUIContext()!.vp2px(150)) <= 1)
        .assertTrue();
      expect(Math.abs(firstGridItem.bottom - firstGridItem.top - UIContext.resolveUIContext()!.vp2px(150)) <= 1)
        .assertTrue();

      let mar: number = secondGridItem.left - firstGridItem.right
      let marWid: number = fourthGridItem.right - fourthGridItem.left
      console.info(`[testGridRowColItemMargin_static_01] secondGridItem.right - secondGridItem.left=
        ${(secondGridItem.right - secondGridItem.left)}`);
      console.info(`[testGridRowColItemMargin_static_01] secondGridItem.left - firstGridItem.right=
        ${(secondGridItem.left - firstGridItem.right)}`);
      console.info(`[testGridRowColItemMargin_static_01] fourthGridItem.right - fourthGridItem.left=
        ${(fourthGridItem.right - fourthGridItem.left)}`);
      expect(Math.floor(Math.abs((secondGridItem.right - secondGridItem.left) - (marWid - 2*mar))) <= 1).assertTrue();
      expect(Math.abs(Math.round(secondGridItem.bottom - secondGridItem.top) -
      Math.round(UIContext.resolveUIContext()!.vp2px(130))) <= 1).assertTrue();

      expect(Math.abs(thirdGridItem.right - thirdGridItem.left - UIContext.resolveUIContext()!.vp2px(150)) <= 1)
        .assertTrue();
      expect(Math.abs(thirdGridItem.bottom - thirdGridItem.top - UIContext.resolveUIContext()!.vp2px(150)) <= 1)
        .assertTrue();

      expect(Math.abs(fourthGridItem.right - fourthGridItem.left - UIContext.resolveUIContext()!.vp2px(150)) <= 1)
        .assertTrue();
      expect(Math.abs(fourthGridItem.bottom - fourthGridItem.top - UIContext.resolveUIContext()!.vp2px(150)) <= 1)
        .assertTrue();

      console.info('[testGridRowColItemMargin_static_01] END');
      done();
    });
    
    
    

/**
     * @tc.number   testGridRowColItemPadding_static_02
     * @tc.name     testGridRowColItemPadding_static_02
     * @tc.desc     testGridRowColItemPadding_static_02
     * @tc.level    Level.LEVEL0
     */
it('testGridRowColItemPadding_static_02', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testGridRowColItemPadding_static_02] START');
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'secondGridItemPadding', value: 10
      });
      await CommonFunc.sleep(3000);
      let firstGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemPadMar01');
      let secondGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemPadMar02');
      let secondText: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemPadMar_Text02');
      let thirdGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemPadMar03');
      let fourthGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemPadMar04');
      let gridContainer: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemPadMar_Container01');
      let gridContainerStrJson = inspector.getInspectorByKey('Grid_RowCol_ItemPadMar_Container01');

      expect(JSON.parseJsonElement(gridContainerStrJson).getString('$type')).assertEqual('Grid');
      expect(Math.abs(secondText.left - secondGridItem.left - UIContext.resolveUIContext()!.vp2px(10)) <= 1)
        .assertTrue();
      expect(Math.abs(secondText.top - secondGridItem.top - UIContext.resolveUIContext()!.vp2px(10)) <= 1)
        .assertTrue();
      expect(Math.abs(secondGridItem.right - secondText.right - UIContext.resolveUIContext()!.vp2px(10)) <= 1)
        .assertTrue();
      expect(Math.abs(secondGridItem.bottom - secondText.bottom - UIContext.resolveUIContext()!.vp2px(10)) <= 1)
        .assertTrue();

      expect(Math.abs(firstGridItem.left - gridContainer.left) <= 1).assertTrue();
      expect(Math.abs(firstGridItem.top - gridContainer.top) <= 1).assertTrue();
      expect(Math.abs(secondGridItem.left - firstGridItem.right) <= 1).assertTrue();
      expect(Math.abs(secondGridItem.top - gridContainer.top) <= 1).assertTrue();
      expect(Math.abs(thirdGridItem.left - gridContainer.left) <= 1).assertTrue();
      expect(Math.abs(thirdGridItem.top - firstGridItem.bottom) <= 1).assertTrue();
      expect(Math.abs(fourthGridItem.left - thirdGridItem.right) <= 1).assertTrue();
      expect(Math.abs(fourthGridItem.top - thirdGridItem.top) <= 1).assertTrue();

      expect(Math.abs(firstGridItem.right - firstGridItem.left - UIContext.resolveUIContext()!.vp2px(150)) <= 1)
        .assertTrue();
      expect(Math.abs(firstGridItem.bottom - firstGridItem.top - UIContext.resolveUIContext()!.vp2px(150)) <= 1)
        .assertTrue();

      expect(Math.abs(secondGridItem.right - secondGridItem.left - UIContext.resolveUIContext()!.vp2px(150)) <= 1)
        .assertTrue();
      expect(Math.abs(secondGridItem.bottom - secondGridItem.top - UIContext.resolveUIContext()!.vp2px(150)) <= 1)
        .assertTrue();

      expect(Math.abs(thirdGridItem.right - thirdGridItem.left - UIContext.resolveUIContext()!.vp2px(150)) <= 1)
        .assertTrue();
      expect(Math.abs(thirdGridItem.bottom - thirdGridItem.top - UIContext.resolveUIContext()!.vp2px(150)) <= 1)
        .assertTrue();

      expect(Math.abs(fourthGridItem.right - fourthGridItem.left - UIContext.resolveUIContext()!.vp2px(150)) <= 1)
        .assertTrue();
      expect(Math.abs(fourthGridItem.bottom - fourthGridItem.top - UIContext.resolveUIContext()!.vp2px(150)) <= 1)
        .assertTrue();
      console.info('[testGridRowColItemPadding_static_02] END');
      done();
    });
    
    
    

/**
     * @tc.number   testGridRowColItemMarPad_static_03
     * @tc.name     testGridRowColItemMarPad_static_03
     * @tc.desc     testGridRowColItemMarPad_static_03
     * @tc.level    Level.LEVEL0
     */
it('testGridRowColItemMarPad_static_03', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testGridRowColItemMarPad_static_03] START');
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'secondGridItemPadding', value: 10
      });
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'secondGridItemMargin', value: 10
      });
      await CommonFunc.sleep(3000);
      let firstGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemPadMar01');
      let secondGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemPadMar02');
      let secondText: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemPadMar_Text02');
      let thirdGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemPadMar03');
      let fourthGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemPadMar04');
      let gridContainer: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemPadMar_Container01');
      let gridContainerStrJson = inspector.getInspectorByKey('Grid_RowCol_ItemPadMar_Container01');

     expect(JSON.parseJsonElement(gridContainerStrJson).getString('$type')).assertEqual('Grid');

      expect(Math.abs(secondGridItem.left - firstGridItem.right - UIContext.resolveUIContext()!.vp2px(10)) <= 1)
        .assertTrue();
      expect(Math.abs(secondGridItem.top - gridContainer.top - UIContext.resolveUIContext()!.vp2px(10)) <= 1)
        .assertTrue();

      expect(Math.abs(secondText.left - secondGridItem.left - UIContext.resolveUIContext()!.vp2px(10)) <= 1)
        .assertTrue();
      expect(Math.abs(secondText.top - secondGridItem.top - UIContext.resolveUIContext()!.vp2px(10)) <= 1)
        .assertTrue();
      expect(Math.abs(secondGridItem.right - secondText.right - UIContext.resolveUIContext()!.vp2px(10)) <= 1)
        .assertTrue();
      expect(Math.abs(secondGridItem.bottom - secondText.bottom - UIContext.resolveUIContext()!.vp2px(10)) <= 1)
        .assertTrue();

      expect(Math.abs(firstGridItem.left - gridContainer.left) <= 1).assertTrue();
      expect(Math.abs(firstGridItem.top - gridContainer.top) <= 1).assertTrue();
      expect(Math.abs(thirdGridItem.left - gridContainer.left) <= 1).assertTrue();
      expect(Math.abs(thirdGridItem.top - firstGridItem.bottom) <= 1).assertTrue();
      expect(Math.abs(fourthGridItem.left - thirdGridItem.right) <= 1).assertTrue();
      expect(Math.abs(fourthGridItem.top - thirdGridItem.top) <= 1).assertTrue();

      expect(Math.abs(firstGridItem.right - firstGridItem.left - UIContext.resolveUIContext()!.vp2px(150)) <= 1)
        .assertTrue();
      expect(Math.abs(firstGridItem.bottom - firstGridItem.top - UIContext.resolveUIContext()!.vp2px(150)) <= 1)
        .assertTrue();

      let mar: number = secondGridItem.left - firstGridItem.right
      let marWid: number = fourthGridItem.right - fourthGridItem.left
      console.info(`[testGridRowColItemMarPad_static_03] secondGridItem.right - secondGridItem.left=
        ${(secondGridItem.right - secondGridItem.left)}`);
      console.info(`[testGridRowColItemMarPad_static_03] secondGridItem.left - firstGridItem.right=
        ${(secondGridItem.left - firstGridItem.right)}`);
      console.info(`[testGridRowColItemMarPad_static_03] fourthGridItem.right - fourthGridItem.left=
        ${(fourthGridItem.right - fourthGridItem.left)}`);
      expect(Math.floor(Math.abs((secondGridItem.right - secondGridItem.left) - (marWid - 2*mar))) <= 1).assertTrue();
      expect(Math.abs(Math.round(secondGridItem.bottom - secondGridItem.top) -
      Math.round(UIContext.resolveUIContext()!.vp2px(130))) <= 1).assertTrue();

      expect(Math.abs(thirdGridItem.right - thirdGridItem.left - UIContext.resolveUIContext()!.vp2px(150)) <= 1)
        .assertTrue();
      expect(Math.abs(thirdGridItem.bottom - thirdGridItem.top - UIContext.resolveUIContext()!.vp2px(150)) <= 1)
        .assertTrue();

      expect(Math.abs(fourthGridItem.right - fourthGridItem.left - UIContext.resolveUIContext()!.vp2px(150)) <= 1)
        .assertTrue();
      expect(Math.abs(fourthGridItem.bottom - fourthGridItem.top - UIContext.resolveUIContext()!.vp2px(150)) <= 1)
        .assertTrue();

      console.info('[testGridRowColItemMarPad_static_03] END');
      done();
    });
  })
}
