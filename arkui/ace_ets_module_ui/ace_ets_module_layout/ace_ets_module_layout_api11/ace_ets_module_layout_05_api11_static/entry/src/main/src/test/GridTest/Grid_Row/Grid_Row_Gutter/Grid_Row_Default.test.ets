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

export default function Gutter_Length_Default() {
  describe('Gutter_Length_Default', () => {
    beforeAll(() => {
      console.info("Gutter_Length_Default beforeAll start");
           
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.layout.split05.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("Gutter_Length_Default beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Grid/Grid_Row/Grid_Row_Gutter/Grid_Row_Default',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get Gutter_Length_Default state pages: " + JSON.stringify(pages));
        if (!("Grid_Row_Default" == pages.name)) {
          console.info("get Gutter_Length_Default state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push Gutter_Length_Default page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("Gutter_Length_Default after each called")
    });

    
    
    

/**
     * @tc.number   SUB_ACE_GridRowGutterLength_Default_static_0100
     * @tc.name     SUB_ACE_GridRowGutterLength_Default_static_0100
     * @tc.desc     SUB_ACE_GridRowGutterLength_Default_static_0100
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_GridRowGutterLength_Default_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_GridRowGutterLength_Default_static_0100 START');
      await CommonFunc.sleep(2000)

      let LengthNoSet_1: RectValue = CommonFunc.getComponentRect('Length_NoChange001');
      let firstLengthNoSet: RectValue = CommonFunc.getComponentRect('Length_NoChange_0');
      let secondLengthNoSet: RectValue = CommonFunc.getComponentRect('Length_NoChange_1');
      let gridRowGutterLengthStrJson = inspector.getInspectorByKey('Length_NoChange001');
     let gridRowGutter = JSON.parseJsonElement(gridRowGutterLengthStrJson);
     expect(gridRowGutter.getString('$type')).assertEqual('GridRow');

      expect(firstLengthNoSet.top).assertEqual(LengthNoSet_1.top);
      expect(firstLengthNoSet.left).assertEqual(LengthNoSet_1.left);

      expect(Math.round(secondLengthNoSet.top - firstLengthNoSet.bottom)).assertEqual(Math.round(UIContext.resolveUIContext()!.vp2px(0)));

      console.info('SUB_ACE_GridRowGutterLength_Default_static_0100 END');
      done();
    });

  })
}
