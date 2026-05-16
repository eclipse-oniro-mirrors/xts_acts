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

export default function Grid_Row_Columns_Default() {
  describe('Grid_Row_Columns_Default', () => {
    beforeAll(() => {
      console.info("Grid_Row_Columns_Default beforeAll start");
           
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.layout.split05.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("Grid_Row_Columns_Default beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Grid/Grid_Row/Grid_Row_Columns/Grid_Row_Columns_Default',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get Grid_Row_Columns_Default state pages: " + JSON.stringify(pages));
        if (!("Grid_Row_Columns_Default" == pages.name)) {
          console.info("get Grid_Row_Columns_Default state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push Grid_Row_Columns_Default page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("Grid_Row_Columns_Default after each called")
    });

    
    
    

/**
     * @tc.number   SUB_ACE_GridRowColumns_static_0100
     * @tc.name     SUB_ACE_GridRowColumns_static_0100
     * @tc.desc     SUB_ACE_GridRowColumns_static_0100
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_GridRowColumns_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_GridRowColumns_static_0100 START');
      await CommonFunc.sleep(2000)

      let Columns_1: RectValue = CommonFunc.getComponentRect('GridRow_Columns_001');
      let firstColumns: RectValue = CommonFunc.getComponentRect('GridRow_Columns_0');
      let secondColumns: RectValue = CommonFunc.getComponentRect('GridRow_Columns_1');
      let thirdColumns: RectValue = CommonFunc.getComponentRect('GridRow_Columns_2');
      let fourthColumns: RectValue = CommonFunc.getComponentRect('GridRow_Columns_3');
      let fifthColumns: RectValue = CommonFunc.getComponentRect('GridRow_Columns_4');
      let sixthColumns: RectValue = CommonFunc.getComponentRect('GridRow_Columns_5');
      let seventhColumns: RectValue = CommonFunc.getComponentRect('GridRow_Columns_6');
      let eighthColumns: RectValue = CommonFunc.getComponentRect('GridRow_Columns_7');
      let ninthColumns: RectValue = CommonFunc.getComponentRect('GridRow_Columns_8');
      let tenthColumns: RectValue = CommonFunc.getComponentRect('GridRow_Columns_9');
      let eleventhColumns: RectValue = CommonFunc.getComponentRect('GridRow_Columns_10');
      let twelfthColumns: RectValue = CommonFunc.getComponentRect('GridRow_Columns_11');

      let gridRowColumnsJson = inspector.getInspectorByKey('GridRow_Columns_001');
     expect(JSON.parseJsonElement(gridRowColumnsJson).getString('$type')).assertEqual('GridRow');

      expect(Math.abs(firstColumns.top - Columns_1.top) <= 1).assertTrue();
      expect(Math.abs(secondColumns.top - Columns_1.top) <= 1).assertTrue();
      expect(Math.abs(thirdColumns.top - Columns_1.top) <= 1).assertTrue();
      expect(Math.abs(fourthColumns.top - Columns_1.top) <= 1).assertTrue();
      expect(Math.abs(fifthColumns.top - Columns_1.top) <= 1).assertTrue();
      expect(Math.abs(sixthColumns.top - Columns_1.top) <= 1).assertTrue();
      expect(Math.abs(seventhColumns.top - Columns_1.top) <= 1).assertTrue();
      expect(Math.abs(eighthColumns.top - Columns_1.top) <= 1).assertTrue();
      expect(Math.abs(ninthColumns.top - Columns_1.top) <= 1).assertTrue();
      expect(Math.abs(tenthColumns.top - Columns_1.top) <= 1).assertTrue();
      expect(Math.abs(eleventhColumns.top - Columns_1.top) <= 1).assertTrue();
      expect(Math.abs(twelfthColumns.top - Columns_1.top) <= 1).assertTrue();

      expect(Math.abs(firstColumns.left - Columns_1.left) <= 1).assertTrue();

      expect(Math.abs(Math.floor(secondColumns.left - firstColumns.right) - Math.floor(UIContext.resolveUIContext()!.vp2px(5))) <= 1).assertTrue();

      console.info('SUB_ACE_GridRowColumns_static_0100 END');
      done();
    });

  })
}
