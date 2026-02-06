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

export default function Grid_Row_Columns() {
  describe('Grid_Row_Columns', () => {
    beforeAll(() => {
      console.info("Grid_Row_Columns beforeAll start");
           
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.layout.split05.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("Grid_Row_Columns beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Grid/Grid_Row/Grid_Row_Columns/Grid_Row_Columns',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get Grid_Row_Columns state pages: " + JSON.stringify(pages));
        if (!("Grid_Row_Columns" == pages.name)) {
          console.info("get Grid_Row_Columns state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push Grid_Row_Columns page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("Grid_Row_Columns after each called")
    });

    
    
    

/**
     * @tc.number   SUB_ACE_Grid_Row_Columns_TEST_static_0100
     * @tc.name     SUB_ACE_Grid_Row_Columns_TEST_static_0100
     * @tc.desc     SUB_ACE_Grid_Row_Columns_TEST_static_0100
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_Grid_Row_Columns_TEST_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_Grid_Row_Columns_TEST_static_0100] START');
      AppStorage.get<MessageManager<string>>('messageManager')?.notify({
        name: 'addWidth', value: '40vp'
      });

      await CommonFunc.sleep(3000);

      console.log('get Initial value')
      let Grid_Row_Columns_00: RectValue = CommonFunc.getComponentRect('Grid_Row_Columns_00');
      let Grid_Row_Columns_01: RectValue = CommonFunc.getComponentRect('Grid_Row_Columns_01');
      let Grid_Row_Columns_02: RectValue = CommonFunc.getComponentRect('Grid_Row_Columns_02');
      let Grid_Row_Columns_03: RectValue = CommonFunc.getComponentRect('Grid_Row_Columns_03');
      let Grid_Row_Columns_04: RectValue = CommonFunc.getComponentRect('Grid_Row_Columns_04');
      let Grid_Row_Columns_05: RectValue = CommonFunc.getComponentRect('Grid_Row_Columns_05');
      let Grid_Row_Columns_06: RectValue = CommonFunc.getComponentRect('Grid_Row_Columns_06');
      let Grid_Row_Columns_07: RectValue = CommonFunc.getComponentRect('Grid_Row_Columns_07');

      console.log('assert space')
      expect(Math.abs(Math.round(Grid_Row_Columns_01.top - Grid_Row_Columns_00.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Grid_Row_Columns_02.top - Grid_Row_Columns_01.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Grid_Row_Columns_03.top - Grid_Row_Columns_02.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Grid_Row_Columns_04.top - Grid_Row_Columns_03.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Grid_Row_Columns_05.top - Grid_Row_Columns_04.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Grid_Row_Columns_06.top - Grid_Row_Columns_05.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Grid_Row_Columns_07.top - Grid_Row_Columns_06.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(10))) <= 1)
        .assertTrue();


      console.info('[SUB_ACE_Grid_Row_Columns_TEST_static_0100] END');
      done();
    });


    
    
    

/**
     * @tc.number   SUB_ACE_Grid_Row_Columns_TEST_static_0200
     * @tc.name     SUB_ACE_Grid_Row_Columns_TEST_static_0200
     * @tc.desc     SUB_ACE_Grid_Row_Columns_TEST_static_0200
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_Grid_Row_Columns_TEST_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_Grid_Row_Columns_TEST_static_0200] START');
      AppStorage.get<MessageManager<string>>('messageManager')?.notify({
        name: 'addWidth', value: '80vp'
      });

      await CommonFunc.sleep(3000);

      console.log('get Initial value')
      let Grid_Row_Columns_00: RectValue = CommonFunc.getComponentRect('Grid_Row_Columns_00');
      let Grid_Row_Columns_01: RectValue = CommonFunc.getComponentRect('Grid_Row_Columns_01');
      let Grid_Row_Columns_02: RectValue = CommonFunc.getComponentRect('Grid_Row_Columns_02');
      let Grid_Row_Columns_03: RectValue = CommonFunc.getComponentRect('Grid_Row_Columns_03');
      let Grid_Row_Columns_04: RectValue = CommonFunc.getComponentRect('Grid_Row_Columns_04');
      let Grid_Row_Columns_05: RectValue = CommonFunc.getComponentRect('Grid_Row_Columns_05');
      let Grid_Row_Columns_06: RectValue = CommonFunc.getComponentRect('Grid_Row_Columns_06');
      let Grid_Row_Columns_07: RectValue = CommonFunc.getComponentRect('Grid_Row_Columns_07');

      console.log('assert space')
      expect(Math.abs(Math.round(Grid_Row_Columns_01.left - Grid_Row_Columns_00.right) - Math.round(UIContext.resolveUIContext()!.vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Grid_Row_Columns_03.left - Grid_Row_Columns_02.right) - Math.round(UIContext.resolveUIContext()!.vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Grid_Row_Columns_05.left - Grid_Row_Columns_04.right) - Math.round(UIContext.resolveUIContext()!.vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Grid_Row_Columns_07.left - Grid_Row_Columns_06.right) - Math.round(UIContext.resolveUIContext()!.vp2px(10))) <= 1)
        .assertTrue();

      expect(Math.abs(Math.round(Grid_Row_Columns_02.top - Grid_Row_Columns_00.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Grid_Row_Columns_03.top - Grid_Row_Columns_01.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(10))) <= 1)
        .assertTrue();

      expect(Math.abs(Math.round(Grid_Row_Columns_04.top - Grid_Row_Columns_02.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Grid_Row_Columns_05.top - Grid_Row_Columns_03.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(10))) <= 1)
        .assertTrue();

      expect(Math.abs(Math.round(Grid_Row_Columns_06.top - Grid_Row_Columns_04.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Grid_Row_Columns_07.top - Grid_Row_Columns_05.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(10))) <= 1)
        .assertTrue();


      console.info('[SUB_ACE_Grid_Row_Columns_TEST_static_0200] END');
      done();
    });

    
    
    

/**
     * @tc.number   SUB_ACE_Grid_Row_Columns_TEST_static_0300
     * @tc.name     SUB_ACE_Grid_Row_Columns_TEST_static_0300
     * @tc.desc     SUB_ACE_Grid_Row_Columns_TEST_static_0300
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_Grid_Row_Columns_TEST_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_Grid_Row_Columns_TEST_static_0300] START');
      AppStorage.get<MessageManager<string>>('messageManager')?.notify({
        name: 'addWidth', value: '120vp'
      });

      await CommonFunc.sleep(3000);

      console.log('get Initial value')
      let Grid_Row_Columns_00: RectValue = CommonFunc.getComponentRect('Grid_Row_Columns_00');
      let Grid_Row_Columns_01: RectValue = CommonFunc.getComponentRect('Grid_Row_Columns_01');
      let Grid_Row_Columns_02: RectValue = CommonFunc.getComponentRect('Grid_Row_Columns_02');
      let Grid_Row_Columns_03: RectValue = CommonFunc.getComponentRect('Grid_Row_Columns_03');
      let Grid_Row_Columns_04: RectValue = CommonFunc.getComponentRect('Grid_Row_Columns_04');
      let Grid_Row_Columns_05: RectValue = CommonFunc.getComponentRect('Grid_Row_Columns_05');
      let Grid_Row_Columns_06: RectValue = CommonFunc.getComponentRect('Grid_Row_Columns_06');

      console.log('assert space')
      expect(Math.abs(Math.round(Grid_Row_Columns_01.left - Grid_Row_Columns_00.right) - Math.round(UIContext.resolveUIContext()!.vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Grid_Row_Columns_02.left - Grid_Row_Columns_01.right) - Math.round(UIContext.resolveUIContext()!.vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Grid_Row_Columns_04.left - Grid_Row_Columns_03.right) - Math.round(UIContext.resolveUIContext()!.vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Grid_Row_Columns_05.left - Grid_Row_Columns_04.right) - Math.round(UIContext.resolveUIContext()!.vp2px(10))) <= 1)
        .assertTrue();

      expect(Math.abs(Math.round(Grid_Row_Columns_03.top - Grid_Row_Columns_00.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Grid_Row_Columns_04.top - Grid_Row_Columns_01.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Grid_Row_Columns_05.top - Grid_Row_Columns_02.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(10))) <= 1)
        .assertTrue();

      console.info('[SUB_ACE_Grid_Row_Columns_TEST_static_0300] END');
      done();
    });

    
    
    

/**
     * @tc.number   SUB_ACE_Grid_Row_Columns_TEST_static_0400
     * @tc.name     SUB_ACE_Grid_Row_Columns_TEST_static_0400
     * @tc.desc     SUB_ACE_Grid_Row_Columns_TEST_static_0400
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_Grid_Row_Columns_TEST_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_Grid_Row_Columns_TEST_static_0400] START');
      AppStorage.get<MessageManager<string>>('messageManager')?.notify({
        name: 'addWidth', value: '170vp'
      });

      await CommonFunc.sleep(3000);

      console.log('get Initial value')
      let Grid_Row_Columns_00: RectValue = CommonFunc.getComponentRect('Grid_Row_Columns_00');
      let Grid_Row_Columns_01: RectValue = CommonFunc.getComponentRect('Grid_Row_Columns_01');
      let Grid_Row_Columns_02: RectValue = CommonFunc.getComponentRect('Grid_Row_Columns_02');
      let Grid_Row_Columns_03: RectValue = CommonFunc.getComponentRect('Grid_Row_Columns_03');
      let Grid_Row_Columns_04: RectValue = CommonFunc.getComponentRect('Grid_Row_Columns_04');
      let Grid_Row_Columns_05: RectValue = CommonFunc.getComponentRect('Grid_Row_Columns_05');
      let Grid_Row_Columns_06: RectValue = CommonFunc.getComponentRect('Grid_Row_Columns_06');
      let Grid_Row_Columns_07: RectValue = CommonFunc.getComponentRect('Grid_Row_Columns_07');

      console.log('assert space')
      expect(Math.abs(Math.round(Grid_Row_Columns_01.left - Grid_Row_Columns_00.right) - Math.round(UIContext.resolveUIContext()!.vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Grid_Row_Columns_02.left - Grid_Row_Columns_01.right) - Math.round(UIContext.resolveUIContext()!.vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Grid_Row_Columns_03.left - Grid_Row_Columns_02.right) - Math.round(UIContext.resolveUIContext()!.vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Grid_Row_Columns_05.left - Grid_Row_Columns_04.right) - Math.round(UIContext.resolveUIContext()!.vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Grid_Row_Columns_06.left - Grid_Row_Columns_05.right) - Math.round(UIContext.resolveUIContext()!.vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Grid_Row_Columns_07.left - Grid_Row_Columns_06.right) - Math.round(UIContext.resolveUIContext()!.vp2px(10))) <= 1)
        .assertTrue();

      expect(Math.abs(Math.round(Grid_Row_Columns_04.top - Grid_Row_Columns_00.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Grid_Row_Columns_05.top - Grid_Row_Columns_01.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Grid_Row_Columns_06.top - Grid_Row_Columns_02.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Grid_Row_Columns_07.top - Grid_Row_Columns_03.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(10))) <= 1)
        .assertTrue();

      console.info('[SUB_ACE_Grid_Row_Columns_TEST_static_0400] END');
      done();
    });

    
    
    

/**
     * @tc.number   SUB_ACE_Grid_Row_Columns_TEST_static_0500
     * @tc.name     SUB_ACE_Grid_Row_Columns_TEST_static_0500
     * @tc.desc     SUB_ACE_Grid_Row_Columns_TEST_static_0500
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_Grid_Row_Columns_TEST_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_Grid_Row_Columns_TEST_static_0500] START');
      AppStorage.get<MessageManager<string>>('messageManager')?.notify({
        name: 'addWidth', value: '220vp'
      });

      await CommonFunc.sleep(3000);

      console.log('get Initial value')
      let Grid_Row_Columns_00: RectValue = CommonFunc.getComponentRect('Grid_Row_Columns_00');
      let Grid_Row_Columns_01: RectValue = CommonFunc.getComponentRect('Grid_Row_Columns_01');
      let Grid_Row_Columns_02: RectValue = CommonFunc.getComponentRect('Grid_Row_Columns_02');
      let Grid_Row_Columns_03: RectValue = CommonFunc.getComponentRect('Grid_Row_Columns_03');
      let Grid_Row_Columns_04: RectValue = CommonFunc.getComponentRect('Grid_Row_Columns_04');
      let Grid_Row_Columns_05: RectValue = CommonFunc.getComponentRect('Grid_Row_Columns_05');
      let Grid_Row_Columns_06: RectValue = CommonFunc.getComponentRect('Grid_Row_Columns_06');
      let Grid_Row_Columns_07: RectValue = CommonFunc.getComponentRect('Grid_Row_Columns_07');

      console.log('assert space')
      expect(Math.abs(Math.round(Grid_Row_Columns_01.left - Grid_Row_Columns_00.right) - Math.round(UIContext.resolveUIContext()!.vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Grid_Row_Columns_02.left - Grid_Row_Columns_01.right) - Math.round(UIContext.resolveUIContext()!.vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Grid_Row_Columns_03.left - Grid_Row_Columns_02.right) - Math.round(UIContext.resolveUIContext()!.vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Grid_Row_Columns_04.left - Grid_Row_Columns_03.right) - Math.round(UIContext.resolveUIContext()!.vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Grid_Row_Columns_06.left - Grid_Row_Columns_05.right) - Math.round(UIContext.resolveUIContext()!.vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Grid_Row_Columns_07.left - Grid_Row_Columns_06.right) - Math.round(UIContext.resolveUIContext()!.vp2px(10))) <= 1)
        .assertTrue();

      expect(Math.abs(Math.round(Grid_Row_Columns_05.top - Grid_Row_Columns_00.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Grid_Row_Columns_06.top - Grid_Row_Columns_01.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Grid_Row_Columns_07.top - Grid_Row_Columns_02.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(10))) <= 1)
        .assertTrue();

      console.info('[SUB_ACE_Grid_Row_Columns_TEST_static_0500] END');
      done();
    });

    
    
    

/**
     * @tc.number   SUB_ACE_Grid_Row_Columns_TEST_static_0600
     * @tc.name     SUB_ACE_Grid_Row_Columns_TEST_static_0600
     * @tc.desc     SUB_ACE_Grid_Row_Columns_TEST_static_0600
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_Grid_Row_Columns_TEST_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_Grid_Row_Columns_TEST_static_0600] START');
      AppStorage.get<MessageManager<string>>('messageManager')?.notify({
        name: 'addWidth', value: '320vp'
      });

      await CommonFunc.sleep(3000);

      console.log('get Initial value')
      let Grid_Row_Columns_00: RectValue = CommonFunc.getComponentRect('Grid_Row_Columns_00');
      let Grid_Row_Columns_01: RectValue = CommonFunc.getComponentRect('Grid_Row_Columns_01');
      let Grid_Row_Columns_02: RectValue = CommonFunc.getComponentRect('Grid_Row_Columns_02');
      let Grid_Row_Columns_03: RectValue = CommonFunc.getComponentRect('Grid_Row_Columns_03');
      let Grid_Row_Columns_04: RectValue = CommonFunc.getComponentRect('Grid_Row_Columns_04');
      let Grid_Row_Columns_05: RectValue = CommonFunc.getComponentRect('Grid_Row_Columns_05');
      let Grid_Row_Columns_06: RectValue = CommonFunc.getComponentRect('Grid_Row_Columns_06');
      let Grid_Row_Columns_07: RectValue = CommonFunc.getComponentRect('Grid_Row_Columns_07');

      console.log('assert space')
      expect(Math.abs(Math.round(Grid_Row_Columns_01.left - Grid_Row_Columns_00.right) - Math.round(UIContext.resolveUIContext()!.vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Grid_Row_Columns_02.left - Grid_Row_Columns_01.right) - Math.round(UIContext.resolveUIContext()!.vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Grid_Row_Columns_03.left - Grid_Row_Columns_02.right) - Math.round(UIContext.resolveUIContext()!.vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Grid_Row_Columns_04.left - Grid_Row_Columns_03.right) - Math.round(UIContext.resolveUIContext()!.vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Grid_Row_Columns_05.left - Grid_Row_Columns_04.right) - Math.round(UIContext.resolveUIContext()!.vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Grid_Row_Columns_07.left - Grid_Row_Columns_06.right) - Math.round(UIContext.resolveUIContext()!.vp2px(10))) <= 1)
        .assertTrue();

      expect(Math.abs(Math.round(Grid_Row_Columns_06.top - Grid_Row_Columns_00.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Grid_Row_Columns_07.top - Grid_Row_Columns_01.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(10))) <= 1)
        .assertTrue();

      console.info('[SUB_ACE_Grid_Row_Columns_TEST_static_0600] END');
      done();
    });

  })
}