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

export default function Grid_Col_Span_Number() {
  describe('Grid_Col_Span_Number', () => {
    beforeAll(() => {
      console.info("Grid_Col_Span_Number beforeAll start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.layout.split05.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("Grid_Col_Span_Number beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/GridCol/Grid_Col_Span/Grid_Col_Span_Number',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get Grid_Col_Span_Number state pages: " + JSON.stringify(pages));
        if (!("Grid_Col_Span_Number" == pages.name)) {
          console.info("get Grid_Col_Span_Number state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push Grid_Col_Span_Number page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("Grid_Col_Span_Number after each called")
    });

    
    
    

/**
     * @tc.number   SUB_ACE_Grid_Col_Span_Number_TEST_static_0100
     * @tc.name     SUB_ACE_Grid_Col_Span_Number_TEST_static_0100
     * @tc.desc     SUB_ACE_Grid_Col_Span_Number_TEST_static_0100
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_Grid_Col_Span_Number_TEST_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_Grid_Col_Span_Number_TEST_static_0100] START');
      AppStorage.get<MessageManager<Int>>('messageManager')?.notify({
        name: 'addSpan', value: -2
      });

      await CommonFunc.sleep(3000);

      console.log('get Initial value')
      let Grid_Col_Span_Number_00: RectValue = CommonFunc.getComponentRect('Grid_Col_Span_Number_00');
      let Grid_Col_Span_Number_01: RectValue = CommonFunc.getComponentRect('Grid_Col_Span_Number_01');
      let Grid_Col_Span_Number_02: RectValue = CommonFunc.getComponentRect('Grid_Col_Span_Number_02');
      let Grid_Col_Span_Number_03: RectValue = CommonFunc.getComponentRect('Grid_Col_Span_Number_03');
      let Grid_Col_Span_Number_04: RectValue = CommonFunc.getComponentRect('Grid_Col_Span_Number_04');
      let Grid_Col_Span_Number_05: RectValue = CommonFunc.getComponentRect('Grid_Col_Span_Number_05');
      let Grid_Col_Span_Number_06: RectValue = CommonFunc.getComponentRect('Grid_Col_Span_Number_06');
      let Grid_Col_Span_Number_07: RectValue = CommonFunc.getComponentRect('Grid_Col_Span_Number_07');


      console.log('assert space')
      expect(Math.floor(Math.abs((Grid_Col_Span_Number_01.left - Grid_Col_Span_Number_00.right) -
      UIContext.resolveUIContext()!.vp2px(10))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Grid_Col_Span_Number_02.left - Grid_Col_Span_Number_01.right) -
      UIContext.resolveUIContext()!.vp2px(10))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Grid_Col_Span_Number_03.left - Grid_Col_Span_Number_02.right) -
      UIContext.resolveUIContext()!.vp2px(10))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Grid_Col_Span_Number_04.left - Grid_Col_Span_Number_03.right) -
      UIContext.resolveUIContext()!.vp2px(10))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Grid_Col_Span_Number_05.left - Grid_Col_Span_Number_04.right) -
      UIContext.resolveUIContext()!.vp2px(10))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Grid_Col_Span_Number_06.top - Grid_Col_Span_Number_00.bottom) -
      UIContext.resolveUIContext()!.vp2px(10))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Grid_Col_Span_Number_07.top - Grid_Col_Span_Number_01.bottom) -
      UIContext.resolveUIContext()!.vp2px(10))) <= 1).assertTrue();

      console.info('[SUB_ACE_Grid_Col_Span_Number_TEST_static_0100] END');
      done();
    });


    
    
    

/**
     * @tc.number   SUB_ACE_Grid_Col_Span_Number_TEST_static_0200
     * @tc.name     SUB_ACE_Grid_Col_Span_Number_TEST_static_0200
     * @tc.desc     SUB_ACE_Grid_Col_Span_Number_TEST_static_0200
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_Grid_Col_Span_Number_TEST_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
  try{
    console.info('[SUB_ACE_Grid_Col_Span_Number_TEST_static_0200] START');
      AppStorage.get<MessageManager<Int>>('messageManager')?.notify({
        name: 'addSpan', value: 0
      });

      await CommonFunc.sleep(3000);

      console.log('get Initial value')
      let Grid_Col_Span_Number_00: RectValue = CommonFunc.getComponentRect('Grid_Col_Span_Number_00');
      let Grid_Col_Span_Number_01: RectValue = CommonFunc.getComponentRect('Grid_Col_Span_Number_01');
      let Grid_Col_Span_Number_02: RectValue = CommonFunc.getComponentRect('Grid_Col_Span_Number_02');
      let Grid_Col_Span_Number_03: RectValue = CommonFunc.getComponentRect('Grid_Col_Span_Number_03');
      let Grid_Col_Span_Number_04: RectValue = CommonFunc.getComponentRect('Grid_Col_Span_Number_04');
      let Grid_Col_Span_Number_05: RectValue = CommonFunc.getComponentRect('Grid_Col_Span_Number_05');
      let Grid_Col_Span_Number_06: RectValue = CommonFunc.getComponentRect('Grid_Col_Span_Number_06');
      let Grid_Col_Span_Number_07: RectValue = CommonFunc.getComponentRect('Grid_Col_Span_Number_07');

      console.info('[SUB_ACE_Grid_Col_Span_Number_TEST_static_0200] END');
      done();
  }
  catch(err){
 expect().assertFail();
      }
    });

    
    
    

/**
     * @tc.number   SUB_ACE_Grid_Col_Span_Number_TEST_static_0300
     * @tc.name     SUB_ACE_Grid_Col_Span_Number_TEST_static_0300
     * @tc.desc     SUB_ACE_Grid_Col_Span_Number_TEST_static_0300
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_Grid_Col_Span_Number_TEST_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_Grid_Col_Span_Number_TEST_static_0300] START');
      AppStorage.get<MessageManager<Int>>('messageManager')?.notify({
        name: 'addSpan', value: 2
      });

      await CommonFunc.sleep(3000);

      console.log('get Initial value')
      let Grid_Col_Span_Number_00: RectValue = CommonFunc.getComponentRect('Grid_Col_Span_Number_00');
      let Grid_Col_Span_Number_01: RectValue = CommonFunc.getComponentRect('Grid_Col_Span_Number_01');
      let Grid_Col_Span_Number_02: RectValue = CommonFunc.getComponentRect('Grid_Col_Span_Number_02');
      let Grid_Col_Span_Number_03: RectValue = CommonFunc.getComponentRect('Grid_Col_Span_Number_03');
      let Grid_Col_Span_Number_04: RectValue = CommonFunc.getComponentRect('Grid_Col_Span_Number_04');
      let Grid_Col_Span_Number_05: RectValue = CommonFunc.getComponentRect('Grid_Col_Span_Number_05');
      let Grid_Col_Span_Number_06: RectValue = CommonFunc.getComponentRect('Grid_Col_Span_Number_06');
      let Grid_Col_Span_Number_07: RectValue = CommonFunc.getComponentRect('Grid_Col_Span_Number_07');


      console.log('assert space')
      expect(Math.floor(Math.abs((Grid_Col_Span_Number_01.left - Grid_Col_Span_Number_00.right) -
      UIContext.resolveUIContext()!.vp2px(10))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Grid_Col_Span_Number_02.left - Grid_Col_Span_Number_01.right) -
      UIContext.resolveUIContext()!.vp2px(10))) <= 1).assertTrue();

      expect(Math.floor(Math.abs((Grid_Col_Span_Number_04.left - Grid_Col_Span_Number_03.right) -
      UIContext.resolveUIContext()!.vp2px(10))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Grid_Col_Span_Number_05.left - Grid_Col_Span_Number_04.right) -
      UIContext.resolveUIContext()!.vp2px(10))) <= 1).assertTrue();

      expect(Math.floor(Math.abs((Grid_Col_Span_Number_07.left - Grid_Col_Span_Number_06.right) -
      UIContext.resolveUIContext()!.vp2px(10))) <= 1).assertTrue();

      expect(Math.floor(Math.abs((Grid_Col_Span_Number_03.top - Grid_Col_Span_Number_00.bottom) -
      UIContext.resolveUIContext()!.vp2px(10))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Grid_Col_Span_Number_04.top - Grid_Col_Span_Number_01.bottom) -
      UIContext.resolveUIContext()!.vp2px(10))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Grid_Col_Span_Number_05.top - Grid_Col_Span_Number_02.bottom) -
      UIContext.resolveUIContext()!.vp2px(10))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Grid_Col_Span_Number_06.top - Grid_Col_Span_Number_03.bottom) -
      UIContext.resolveUIContext()!.vp2px(10))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Grid_Col_Span_Number_07.top - Grid_Col_Span_Number_04.bottom) -
      UIContext.resolveUIContext()!.vp2px(10))) <= 1).assertTrue();

      console.info('[SUB_ACE_Grid_Col_Span_Number_TEST_static_0300] END');
      done();
    });

    
    
    

/**
     * @tc.number   SUB_ACE_Grid_Col_Span_Number_TEST_static_0400
     * @tc.name     SUB_ACE_Grid_Col_Span_Number_TEST_static_0400
     * @tc.desc     SUB_ACE_Grid_Col_Span_Number_TEST_static_0400
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_Grid_Col_Span_Number_TEST_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_Grid_Col_Span_Number_TEST_static_0400] START');
      AppStorage.get<MessageManager<Int>>('messageManager')?.notify({
        name: 'addSpan', value: 8
      });

      await CommonFunc.sleep(3000);

      console.log('get Initial value')
      let Grid_Col_Span_Number_00: RectValue = CommonFunc.getComponentRect('Grid_Col_Span_Number_00');
      let Grid_Col_Span_Number_01: RectValue = CommonFunc.getComponentRect('Grid_Col_Span_Number_01');
      let Grid_Col_Span_Number_02: RectValue = CommonFunc.getComponentRect('Grid_Col_Span_Number_02');
      let Grid_Col_Span_Number_03: RectValue = CommonFunc.getComponentRect('Grid_Col_Span_Number_03');
      let Grid_Col_Span_Number_04: RectValue = CommonFunc.getComponentRect('Grid_Col_Span_Number_04');
      let Grid_Col_Span_Number_05: RectValue = CommonFunc.getComponentRect('Grid_Col_Span_Number_05');
      let Grid_Col_Span_Number_06: RectValue = CommonFunc.getComponentRect('Grid_Col_Span_Number_06');
      let Grid_Col_Span_Number_07: RectValue = CommonFunc.getComponentRect('Grid_Col_Span_Number_07');

      console.log('assert space')
      expect(Math.floor(Math.abs((Grid_Col_Span_Number_01.top - Grid_Col_Span_Number_00.bottom) -
      UIContext.resolveUIContext()!.vp2px(10))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Grid_Col_Span_Number_02.top - Grid_Col_Span_Number_01.bottom) -
      UIContext.resolveUIContext()!.vp2px(10))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Grid_Col_Span_Number_03.top - Grid_Col_Span_Number_02.bottom) -
      UIContext.resolveUIContext()!.vp2px(10))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Grid_Col_Span_Number_04.top - Grid_Col_Span_Number_03.bottom) -
      UIContext.resolveUIContext()!.vp2px(10))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Grid_Col_Span_Number_05.top - Grid_Col_Span_Number_04.bottom) -
      UIContext.resolveUIContext()!.vp2px(10))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Grid_Col_Span_Number_06.top - Grid_Col_Span_Number_05.bottom) -
      UIContext.resolveUIContext()!.vp2px(10))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Grid_Col_Span_Number_07.top - Grid_Col_Span_Number_06.bottom) -
      UIContext.resolveUIContext()!.vp2px(10))) <= 1).assertTrue();

      console.info('[SUB_ACE_Grid_Col_Span_Number_TEST_static_0400] END');
      done();
    });
  })
}