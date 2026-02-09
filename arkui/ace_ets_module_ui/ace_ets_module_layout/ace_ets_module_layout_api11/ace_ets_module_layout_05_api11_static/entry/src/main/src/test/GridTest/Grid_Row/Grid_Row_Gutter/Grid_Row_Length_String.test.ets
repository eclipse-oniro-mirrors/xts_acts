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
import { MessageManager, Callback } from '../../../../../ets/MainAbility/common/MessageManager';
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

export default function Grid_Row_Length_String() {
  describe('Grid_Row_Length_String', () => {
    beforeAll(() => {
      console.info("Grid_Row_Length_String beforeAll start");
           
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.layout.split05.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("Grid_Row_Length_String beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Grid/Grid_Row/Grid_Row_Gutter/Grid_Row_Length_String',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get Grid_Row_Length_String state pages: " + JSON.stringify(pages));
        if (!("Grid_Row_Length_String" == pages.name)) {
          console.info("get Grid_Row_Length_String state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push Grid_Row_Length_String page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("Grid_Row_Length_String after each called")
    });

    
    
    

/**
     * @tc.number   SUB_ACE_Grid_Row_GutterStr_TEST_static_0100
     * @tc.name     SUB_ACE_Grid_Row_GutterStr_TEST_static_0100
     * @tc.desc     SUB_ACE_Grid_Row_GutterStr_TEST_static_0100
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_Grid_Row_GutterStr_TEST_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_Grid_Row_GutterStr_TEST_static_0100] START');
      AppStorage.get<MessageManager<string>>('messageManager')?.notify({
        name: 'addLength', value: '30%' as String
      });

      await CommonFunc.sleep(3000);

      console.log('get Initial value')
      let Length_String_00: RectValue = CommonFunc.getComponentRect('Length_String_00');
      let Length_String_01: RectValue = CommonFunc.getComponentRect('Length_String_01');
      let Length_String_02: RectValue = CommonFunc.getComponentRect('Length_String_02');
      let Length_String_03: RectValue = CommonFunc.getComponentRect('Length_String_03');
      let Length_String_04: RectValue = CommonFunc.getComponentRect('Length_String_04');
      let Length_String_05: RectValue = CommonFunc.getComponentRect('Length_String_05');
      let Length_String_06: RectValue = CommonFunc.getComponentRect('Length_String_06');
      let Length_String_07: RectValue = CommonFunc.getComponentRect('Length_String_07');

      console.log('assert space')
      expect(Math.abs(Math.round(Length_String_01.left - Length_String_00.right) - Math.round(UIContext.resolveUIContext()!.vp2px(0))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Length_String_02.left - Length_String_01.right) - Math.round(UIContext.resolveUIContext()!.vp2px(0))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Length_String_03.left - Length_String_02.right) - Math.round(UIContext.resolveUIContext()!.vp2px(0))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Length_String_04.left - Length_String_03.right) - Math.round(UIContext.resolveUIContext()!.vp2px(0))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Length_String_05.left - Length_String_04.right) - Math.round(UIContext.resolveUIContext()!.vp2px(0))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Length_String_07.left - Length_String_06.right) - Math.round(UIContext.resolveUIContext()!.vp2px(0))) <= 1)
        .assertTrue();

      expect(Math.abs(Length_String_06.top - Length_String_00.bottom - UIContext.resolveUIContext()!.vp2px(10)) <= 1).assertTrue();
      expect(Math.abs(Length_String_07.top - Length_String_01.bottom - UIContext.resolveUIContext()!.vp2px(10)) <= 1).assertTrue();


      console.info('[SUB_ACE_Grid_Row_GutterStr_TEST_static_0100] END');
      done();
    });


    
    
    

/**
     * @tc.number   SUB_ACE_Grid_Row_GutterStr_TEST_static_0200
     * @tc.name     SUB_ACE_Grid_Row_GutterStr_TEST_static_0200
     * @tc.desc     SUB_ACE_Grid_Row_GutterStr_TEST_static_0200
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_Grid_Row_GutterStr_TEST_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_Grid_Row_GutterStr_TEST_static_0200] START');
      AppStorage.get<MessageManager<string>>('messageManager')?.notify({
        name: 'addLength', value: '50px' as String
      });

      await CommonFunc.sleep(3000);

      console.log('get Initial value')
      let Length_String_00: RectValue = CommonFunc.getComponentRect('Length_String_00');
      let Length_String_01: RectValue = CommonFunc.getComponentRect('Length_String_01');
      let Length_String_02: RectValue = CommonFunc.getComponentRect('Length_String_02');
      let Length_String_03: RectValue = CommonFunc.getComponentRect('Length_String_03');
      let Length_String_04: RectValue = CommonFunc.getComponentRect('Length_String_04');
      let Length_String_05: RectValue = CommonFunc.getComponentRect('Length_String_05');
      let Length_String_06: RectValue = CommonFunc.getComponentRect('Length_String_06');
      let Length_String_07: RectValue = CommonFunc.getComponentRect('Length_String_07');

      console.log('assert space')
      expect(Math.abs(Math.round(Length_String_01.left - Length_String_00.right) - Math.round(50)) <= 1).assertTrue();
      expect(Math.abs(Math.round(Length_String_02.left - Length_String_01.right) - Math.round(50)) <= 1).assertTrue();
      expect(Math.abs(Math.round(Length_String_03.left - Length_String_02.right) - Math.round(50)) <= 1).assertTrue();
      expect(Math.abs(Math.round(Length_String_04.left - Length_String_03.right) - Math.round(50)) <= 1).assertTrue();
      expect(Math.abs(Math.round(Length_String_05.left - Length_String_04.right) - Math.round(50)) <= 1).assertTrue();
      expect(Math.abs(Math.round(Length_String_07.left - Length_String_06.right) - Math.round(50)) <= 1).assertTrue();

      expect(Math.abs(Math.round(Length_String_06.top - Length_String_00.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Length_String_07.top - Length_String_01.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(10))) <= 1)
        .assertTrue();

      console.info('[SUB_ACE_Grid_Row_GutterStr_TEST_static_0200] END');
      done();
    });


  })
}