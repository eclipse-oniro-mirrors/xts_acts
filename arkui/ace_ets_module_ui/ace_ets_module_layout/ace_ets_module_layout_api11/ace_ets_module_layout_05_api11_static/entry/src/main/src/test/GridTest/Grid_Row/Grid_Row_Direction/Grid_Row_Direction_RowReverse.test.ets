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

export default function Grid_Row_Direction_RowReverse() {
  describe('Grid_Row_Direction_RowReverse', () => {
    beforeAll(() => {
      console.info("Grid_Row_Direction_RowReverse beforeAll start");
           
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.layout.split05.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("Grid_Col_Offset_Default beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Grid/Grid_Row/Grid_Row_Direction/Grid_Row_Direction_RowReverse',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get Grid_Col_Offset_Default state pages: " + JSON.stringify(pages));
        if (!("Grid_Row_Direction_RowReverse" == pages.name)) {
          console.info("get Grid_Col_Offset_Default state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push Grid_Col_Offset_Default page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("Grid_Row_Direction_RowReverse after each called")
    });

    
    
    

/**
     * @tc.number   SUB_ACE_GridRowDirection_RowReverse_static_0100
     * @tc.name     SUB_ACE_GridRowDirection_RowReverse_static_0100
     * @tc.desc     SUB_ACE_GridRowDirection_RowReverse_static_0100
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_GridRowDirection_RowReverse_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_GridRowDirection_RowReverse_static_0100 START');
      await CommonFunc.sleep(2000)

      let DirectionRowReverse_1: RectValue = CommonFunc.getComponentRect('DirectionRowReverse_001');
      let firstDirectionRowReverse: RectValue = CommonFunc.getComponentRect('DirectionRowReverse_0');
      let secondDirectionRowReverse: RectValue = CommonFunc.getComponentRect('DirectionRowReverse_1');
      let thirdDirectionRowReverse: RectValue = CommonFunc.getComponentRect('DirectionRowReverse_2');
      let gridRowDirectionRowReverseJson = inspector.getInspectorByKey('DirectionRowReverse_001');
     expect(JSON.parseJsonElement(gridRowDirectionRowReverseJson).getString('$type')).assertEqual('GridRow');

      expect(Math.abs(firstDirectionRowReverse.top - DirectionRowReverse_1.top) <= 1).assertTrue();
      expect(Math.abs(firstDirectionRowReverse.right - DirectionRowReverse_1.right) <= 1).assertTrue();

      expect(Math.abs(Math.round(firstDirectionRowReverse.left - secondDirectionRowReverse.right) - Math.round(UIContext.resolveUIContext()!.vp2px(10))) <= 1).assertTrue();
      expect(Math.abs(Math.round(thirdDirectionRowReverse.top - firstDirectionRowReverse.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(10))) <= 1).assertTrue();

      console.info('SUB_ACE_GridRowDirection_RowReverse_static_0100 END');
      done();
    });

  })
}
