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
import GlobalContext from '../../../../ets/MainAbility/common/GlobalContext'
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

export default function Grid_Col_Order_GridColColumnOption() {
  describe('Grid_Col_Order_GridColColumnOption', () => {
    beforeAll(() => {
      console.info("Grid_Col_Order_GridColColumnOption beforeAll start");
           
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.layout.split05.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("Grid_Col_Order_GridColColumnOption beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/GridCol/Grid_Col_Order/Grid_Col_Order_GridColColumnOption',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get Grid_Col_Order_GridColColumnOption state pages: " + JSON.stringify(pages));
        if (!("Grid_Col_Order_GridColColumnOption" == pages.name)) {
          console.info("get Grid_Col_Order_GridColColumnOption state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push Grid_Col_Order_GridColColumnOption page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("Grid_Col_Order_GridColColumnOption after each called")
    });
    
    
    

/**
     * @tc.number   SUB_ACE_Grid_Col_Order_GridColColumnOption_TEST_static_0100
     * @tc.name     SUB_ACE_Grid_Col_Order_GridColColumnOption_TEST_static_0100
     * @tc.desc     SUB_ACE_Grid_Col_Order_GridColColumnOption_TEST_static_0100
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_Grid_Col_Order_GridColColumnOption_TEST_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_Grid_Col_Order_GridColColumnOption_TEST_static_0100] START');
      AppStorage.get<MessageManager<string>>('messageManager')?.notify({
        name: 'addOrder', value: "40vp"
      });

      await CommonFunc.sleep(3000);

      console.log('get Initial value')
      let Grid_Col_Order_GridColColumnOption_01: RectValue = CommonFunc.getComponentRect('Grid_Col_Order_GridColColumnOption_01');
      let Grid_Col_Order_GridColColumnOption_02: RectValue = CommonFunc.getComponentRect('Grid_Col_Order_GridColColumnOption_02');
      let Grid_Col_Order_GridColColumnOption_03: RectValue = CommonFunc.getComponentRect('Grid_Col_Order_GridColColumnOption_03');
      let Grid_Col_Order_GridColColumnOption_04: RectValue = CommonFunc.getComponentRect('Grid_Col_Order_GridColColumnOption_04');


      console.log('assert space')
  console.log('-----Grid_Col_Order_GridColColumnOption_01' + JSON.stringify(Grid_Col_Order_GridColColumnOption_01))
  console.log('-----Grid_Col_Order_GridColColumnOption_02' + JSON.stringify(Grid_Col_Order_GridColColumnOption_02))
  console.log('-----Grid_Col_Order_GridColColumnOption_03' + JSON.stringify(Grid_Col_Order_GridColColumnOption_03))
  console.log('-----Grid_Col_Order_GridColColumnOption_04' + JSON.stringify(Grid_Col_Order_GridColColumnOption_04))
  console.log('-----' + (Grid_Col_Order_GridColColumnOption_02.top - Grid_Col_Order_GridColColumnOption_01.bottom))
  console.log('-----' + (Grid_Col_Order_GridColColumnOption_03.top - Grid_Col_Order_GridColColumnOption_02.bottom))
  console.log('-----' + (Grid_Col_Order_GridColColumnOption_04.top - Grid_Col_Order_GridColColumnOption_03.bottom))
      expect(Math.abs((Grid_Col_Order_GridColColumnOption_02.top - Grid_Col_Order_GridColColumnOption_01.bottom) - UIContext.resolveUIContext()!.vp2px(10)) <= 1)
        .assertTrue();
      expect(Math.abs((Grid_Col_Order_GridColColumnOption_03.top - Grid_Col_Order_GridColColumnOption_02.bottom) - UIContext.resolveUIContext()!.vp2px(10)) <= 1)
        .assertTrue();
      expect(Math.abs((Grid_Col_Order_GridColColumnOption_04.top - Grid_Col_Order_GridColColumnOption_03.bottom) - UIContext.resolveUIContext()!.vp2px(10)) <= 1)
        .assertTrue();

      console.info('[SUB_ACE_Grid_Col_Order_GridColColumnOption_TEST_static_0100] END');
      done();
    });

    
    
    

/**
     * @tc.number   SUB_ACE_Grid_Col_Order_GridColColumnOption_TEST_static_0200
     * @tc.name     SUB_ACE_Grid_Col_Order_GridColColumnOption_TEST_static_0200
     * @tc.desc     SUB_ACE_Grid_Col_Order_GridColColumnOption_TEST_static_0200
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_Grid_Col_Order_GridColColumnOption_TEST_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_Grid_Col_Order_GridColColumnOption_TEST_static_0200] START');
      AppStorage.get<MessageManager<string>>('messageManager')?.notify({
        name: 'addWidth', value: '80vp'
      });

      await CommonFunc.sleep(3000);

      console.log('get Initial value')
      let Grid_Col_Order_GridColColumnOption_01: RectValue = CommonFunc.getComponentRect('Grid_Col_Order_GridColColumnOption_01');
      let Grid_Col_Order_GridColColumnOption_02: RectValue = CommonFunc.getComponentRect('Grid_Col_Order_GridColColumnOption_02');
      let Grid_Col_Order_GridColColumnOption_03: RectValue = CommonFunc.getComponentRect('Grid_Col_Order_GridColColumnOption_03');
      let Grid_Col_Order_GridColColumnOption_04: RectValue = CommonFunc.getComponentRect('Grid_Col_Order_GridColColumnOption_04');


      console.log('assert space')
      expect(Math.abs((Grid_Col_Order_GridColColumnOption_01.top - Grid_Col_Order_GridColColumnOption_03.bottom) - UIContext.resolveUIContext()!.vp2px(10)) <= 1)
        .assertTrue();
      expect(Math.abs((Grid_Col_Order_GridColColumnOption_02.top - Grid_Col_Order_GridColColumnOption_01.bottom) - UIContext.resolveUIContext()!.vp2px(10)) <= 1)
        .assertTrue();
      expect(Math.abs((Grid_Col_Order_GridColColumnOption_04.top - Grid_Col_Order_GridColColumnOption_02.bottom) - UIContext.resolveUIContext()!.vp2px(10)) <= 1)
        .assertTrue();

      console.info('[SUB_ACE_Grid_Col_Order_GridColColumnOption_TEST_static_0200] END');
      done();
    });

    
    
    

/**
     * @tc.number   SUB_ACE_Grid_Col_Order_GridColColumnOption_TEST_static_0300
     * @tc.name     SUB_ACE_Grid_Col_Order_GridColColumnOption_TEST_static_0300
     * @tc.desc     SUB_ACE_Grid_Col_Order_GridColColumnOption_TEST_static_0300
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_Grid_Col_Order_GridColColumnOption_TEST_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_Grid_Col_Order_GridColColumnOption_TEST_static_0300] START');
      AppStorage.get<MessageManager<string>>('messageManager')?.notify({
        name: 'addWidth', value: '130vp'
      });

      await CommonFunc.sleep(3000);

      console.log('get Initial value')
      let Grid_Col_Order_GridColColumnOption_01: RectValue = CommonFunc.getComponentRect('Grid_Col_Order_GridColColumnOption_01');
      let Grid_Col_Order_GridColColumnOption_02: RectValue = CommonFunc.getComponentRect('Grid_Col_Order_GridColColumnOption_02');
      let Grid_Col_Order_GridColColumnOption_03: RectValue = CommonFunc.getComponentRect('Grid_Col_Order_GridColColumnOption_03');
      let Grid_Col_Order_GridColColumnOption_04: RectValue = CommonFunc.getComponentRect('Grid_Col_Order_GridColColumnOption_04');

      console.log('assert space')
      expect(Math.abs((Grid_Col_Order_GridColColumnOption_04.top - Grid_Col_Order_GridColColumnOption_01.bottom) - UIContext.resolveUIContext()!.vp2px(10)) <= 1)
        .assertTrue();
      expect(Math.abs((Grid_Col_Order_GridColColumnOption_02.top - Grid_Col_Order_GridColColumnOption_04.bottom) - UIContext.resolveUIContext()!.vp2px(10)) <= 1)
        .assertTrue();
      expect(Math.abs((Grid_Col_Order_GridColColumnOption_03.top - Grid_Col_Order_GridColColumnOption_02.bottom) - UIContext.resolveUIContext()!.vp2px(10)) <= 1)
        .assertTrue();

      console.info('[SUB_ACE_Grid_Col_Order_GridColColumnOption_TEST_static_0300] END');
      done();
    });

    
    
    

/**
     * @tc.number   SUB_ACE_Grid_Col_Order_GridColColumnOption_TEST_static_0400
     * @tc.name     SUB_ACE_Grid_Col_Order_GridColColumnOption_TEST_static_0400
     * @tc.desc     SUB_ACE_Grid_Col_Order_GridColColumnOption_TEST_static_0400
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_Grid_Col_Order_GridColColumnOption_TEST_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_Grid_Col_Order_GridColColumnOption_TEST_static_0400] START');
      AppStorage.get<MessageManager<string>>('messageManager')?.notify({
        name: 'addWidth', value: '180vp'
      });

      await CommonFunc.sleep(3000);

      console.log('get Initial value')
      let Grid_Col_Order_GridColColumnOption_01: RectValue = CommonFunc.getComponentRect('Grid_Col_Order_GridColColumnOption_01');
      let Grid_Col_Order_GridColColumnOption_02: RectValue = CommonFunc.getComponentRect('Grid_Col_Order_GridColColumnOption_02');
      let Grid_Col_Order_GridColColumnOption_03: RectValue = CommonFunc.getComponentRect('Grid_Col_Order_GridColColumnOption_03');
      let Grid_Col_Order_GridColColumnOption_04: RectValue = CommonFunc.getComponentRect('Grid_Col_Order_GridColColumnOption_04');

      console.log('assert space')
      expect(Math.abs((Grid_Col_Order_GridColColumnOption_01.top - Grid_Col_Order_GridColColumnOption_04.bottom) - UIContext.resolveUIContext()!.vp2px(10)) <= 1)
        .assertTrue();
      expect(Math.abs((Grid_Col_Order_GridColColumnOption_02.top - Grid_Col_Order_GridColColumnOption_01.bottom) - UIContext.resolveUIContext()!.vp2px(10)) <= 1)
        .assertTrue();
      expect(Math.abs((Grid_Col_Order_GridColColumnOption_03.top - Grid_Col_Order_GridColColumnOption_02.bottom) - UIContext.resolveUIContext()!.vp2px(10)) <= 1)
        .assertTrue();

      console.info('[SUB_ACE_Grid_Col_Order_GridColColumnOption_TEST_static_0400] END');
      done();
    });

    
    
    

/**
     * @tc.number   SUB_ACE_Grid_Col_Order_GridColColumnOption_TEST_static_0500
     * @tc.name     SUB_ACE_Grid_Col_Order_GridColColumnOption_TEST_static_0500
     * @tc.desc     SUB_ACE_Grid_Col_Order_GridColColumnOption_TEST_static_0500
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_Grid_Col_Order_GridColColumnOption_TEST_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_Grid_Col_Order_GridColColumnOption_TEST_static_0500] START');
      AppStorage.get<MessageManager<string>>('messageManager')?.notify({
        name: 'addWidth', value: '230vp'
      });

      await CommonFunc.sleep(3000);

      console.log('get Initial value')
      let Grid_Col_Order_GridColColumnOption_01: RectValue = CommonFunc.getComponentRect('Grid_Col_Order_GridColColumnOption_01');
      let Grid_Col_Order_GridColColumnOption_02: RectValue = CommonFunc.getComponentRect('Grid_Col_Order_GridColColumnOption_02');
      let Grid_Col_Order_GridColColumnOption_03: RectValue = CommonFunc.getComponentRect('Grid_Col_Order_GridColColumnOption_03');
      let Grid_Col_Order_GridColColumnOption_04: RectValue = CommonFunc.getComponentRect('Grid_Col_Order_GridColColumnOption_04');

      console.log('assert space')
      expect(Math.abs((Grid_Col_Order_GridColColumnOption_03.top - Grid_Col_Order_GridColColumnOption_02.bottom) - UIContext.resolveUIContext()!.vp2px(10)) <= 1)
        .assertTrue();
      expect(Math.abs((Grid_Col_Order_GridColColumnOption_01.top - Grid_Col_Order_GridColColumnOption_03.bottom) - UIContext.resolveUIContext()!.vp2px(10)) <= 1)
        .assertTrue();
      expect(Math.abs((Grid_Col_Order_GridColColumnOption_04.top - Grid_Col_Order_GridColColumnOption_01.bottom) - UIContext.resolveUIContext()!.vp2px(10)) <= 1)
        .assertTrue();

      console.info('[SUB_ACE_Grid_Col_Order_GridColColumnOption_TEST_static_0500] END');
      done();
    });

    
    
    

/**
     * @tc.number   SUB_ACE_Grid_Col_Order_GridColColumnOption_TEST_static_0600
     * @tc.name     SUB_ACE_Grid_Col_Order_GridColColumnOption_TEST_static_0600
     * @tc.desc     SUB_ACE_Grid_Col_Order_GridColColumnOption_TEST_static_0600
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_Grid_Col_Order_GridColColumnOption_TEST_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_Grid_Col_Order_GridColColumnOption_TEST_static_0600] START');
      AppStorage.get<MessageManager<string>>('messageManager')?.notify({
        name: 'addWidth', value: '330vp'
      });

      await CommonFunc.sleep(3000);

      console.log('get Initial value')
      let Grid_Col_Order_GridColColumnOption_01: RectValue = CommonFunc.getComponentRect('Grid_Col_Order_GridColColumnOption_01');
      let Grid_Col_Order_GridColColumnOption_02: RectValue = CommonFunc.getComponentRect('Grid_Col_Order_GridColColumnOption_02');
      let Grid_Col_Order_GridColColumnOption_03: RectValue = CommonFunc.getComponentRect('Grid_Col_Order_GridColColumnOption_03');
      let Grid_Col_Order_GridColColumnOption_04: RectValue = CommonFunc.getComponentRect('Grid_Col_Order_GridColColumnOption_04');

      console.log('assert space')
      expect(Math.abs((Grid_Col_Order_GridColColumnOption_03.top - Grid_Col_Order_GridColColumnOption_02.bottom) - UIContext.resolveUIContext()!.vp2px(10)) <= 1)
        .assertTrue();
      expect(Math.abs((Grid_Col_Order_GridColColumnOption_04.top - Grid_Col_Order_GridColColumnOption_03.bottom) - UIContext.resolveUIContext()!.vp2px(10)) <= 1)
        .assertTrue();
      expect(Math.abs((Grid_Col_Order_GridColColumnOption_01.top - Grid_Col_Order_GridColColumnOption_04.bottom) - UIContext.resolveUIContext()!.vp2px(10)) <= 1)
        .assertTrue();

      console.info('[SUB_ACE_Grid_Col_Order_GridColColumnOption_TEST_static_0600] END');
      done();
    });
  })
}