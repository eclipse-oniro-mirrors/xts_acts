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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect,Level } from "../../../../hypium/index"
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import GlobalContext from '../../../ets/MainAbility/common/GlobalContext'
import {MessageManager,Callback} from '../../../ets/MainAbility/common/MessageManager';
import { GridDirection } from '@ohos.arkui.component'
import router from '@ohos.router';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function GridLayoutDirection() {
  describe('GridLayoutDirection', () => {
    beforeAll(() => {
      console.info("GridLayoutDirection beforeAll start");
           
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.layout.split05.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("GridLayoutDirection beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Grid/GridLayoutDirection',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get GridLayoutDirection state pages: " + JSON.stringify(pages));
        if (!("GridLayoutDirection" == pages.name)) {
          console.info("get GridLayoutDirection state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push GridLayoutDirection page error: " + err);
      }
    });

    
    
    

/**
     * @tc.number   GridLayoutDirection_static_001
     * @tc.name     GridLayoutDirection_static_001
     * @tc.desc     GridLayoutDirection_static_001
     * @tc.level    Level.LEVEL0
     */
it('GridLayoutDirection_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[GridLayoutDirection_static_001] START');
      await CommonFunc.sleep(1000);
      AppStorage.get<MessageManager<number | GridDirection>>('messageManager')?.notify({name:'layoutDirection', value: GridDirection.ColumnReverse });
      await CommonFunc.sleep(1000);
      let GridItem00 = CommonFunc.getComponentRect('GridItem00');
      let GridItem01 = CommonFunc.getComponentRect('GridItem01');
      await CommonFunc.sleep(1000);

	  expect(Math.abs(Math.round(GridItem00.top - GridItem01.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(10))) <= 1).assertTrue();

      console.info('[GridLayoutDirection_static_001] END');
      done();
    });

    
    
    

/**
     * @tc.number   GridLayoutDirection_static_002
     * @tc.name     GridLayoutDirection_static_002
     * @tc.desc     GridLayoutDirection_static_002
     * @tc.level    Level.LEVEL0
     */
it('GridLayoutDirection_static_002', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[GridLayoutDirection_static_002] START');
      await CommonFunc.sleep(200);
     AppStorage.get<MessageManager<number | GridDirection>>('messageManager')?.notify({name:'layoutDirection', value: GridDirection.Column });
      await CommonFunc.sleep(200);
      let GridItem00 = CommonFunc.getComponentRect('GridItem00');
      let GridItem01 = CommonFunc.getComponentRect('GridItem01');
      await CommonFunc.sleep(1000);

	  expect(Math.abs(Math.round(GridItem01.top - GridItem00.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(10))) <= 1).assertTrue();

      console.info('[GridLayoutDirection_static_002] END');
      done();
    });

    
    
    

/**
     * @tc.number   GridLayoutDirection_static_003
     * @tc.name     GridLayoutDirection_static_003
     * @tc.desc     GridLayoutDirection_static_003
     * @tc.level    Level.LEVEL0
     */
it('GridLayoutDirection_static_003', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[GridLayoutDirection_static_003] START');
      await CommonFunc.sleep(200);
     AppStorage.get<MessageManager<number | GridDirection>>('messageManager')?.notify({name:'layoutDirection', value: GridDirection.RowReverse });
      await CommonFunc.sleep(200);
      let GridItem00 = CommonFunc.getComponentRect('GridItem00');
      let GridItem01 = CommonFunc.getComponentRect('GridItem01');
      await CommonFunc.sleep(1000);

	  expect(Math.abs(Math.round(GridItem00.left - GridItem01.right) - Math.round(UIContext.resolveUIContext()!.vp2px(10))) <= 1).assertTrue();

      console.info('[GridLayoutDirection_static_003] END');
      done();
    });

    
    
    

/**
     * @tc.number   GridLayoutDirection_static_004
     * @tc.name     GridLayoutDirection_static_004
     * @tc.desc     GridLayoutDirection_static_004
     * @tc.level    Level.LEVEL0
     */
it('GridLayoutDirection_static_004', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[GridLayoutDirection_static_004] START');
      await CommonFunc.sleep(200);
     AppStorage.get<MessageManager<number | GridDirection>>('messageManager')?.notify({name:'layoutDirection', value: GridDirection.Row });
      await CommonFunc.sleep(200);
      let GridItem00 = CommonFunc.getComponentRect('GridItem00');
      let GridItem01 = CommonFunc.getComponentRect('GridItem01');
      await CommonFunc.sleep(1000);

	  expect(Math.abs(Math.round(GridItem01.left - GridItem00.right) - Math.round(UIContext.resolveUIContext()!.vp2px(10))) <= 1).assertTrue();

      console.info('[GridLayoutDirection_static_004] END');
      done();
    });

    
    
    

/**
     * @tc.number   GridLayoutDirection_static_005
     * @tc.name     GridLayoutDirection_static_005
     * @tc.desc     GridLayoutDirection_static_005
     * @tc.level    Level.LEVEL0
     */
it('GridLayoutDirection_static_005', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[GridLayoutDirection_static_005] START');
      await CommonFunc.sleep(200);
      AppStorage.get<MessageManager<number | GridDirection>>('messageManager')?.notify({name:'gridPadding', value: 50 });
      await CommonFunc.sleep(200);
      let GridLayoutDirKey = CommonFunc.getComponentRect('GridLayoutDirKey');
      let GridItem00 = CommonFunc.getComponentRect('GridItem00');
      await CommonFunc.sleep(1000);

      expect(Math.abs(Math.round(GridItem00.top - GridLayoutDirKey.top) - Math.round(UIContext.resolveUIContext()!.vp2px(50))) <= 1).assertTrue();

      console.info('[GridLayoutDirection_static_005] END');
      done();
    });

    
    
    

/**
     * @tc.number   GridLayoutDirection_static_006
     * @tc.name     GridLayoutDirection_static_006
     * @tc.desc     GridLayoutDirection_static_006
     * @tc.level    Level.LEVEL0
     */
it('GridLayoutDirection_static_006', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[GridLayoutDirection_static_006] START');
      await CommonFunc.sleep(200);
      AppStorage.get<MessageManager<number | GridDirection>>('messageManager')?.notify({name:'gridMargin', value: 50 });
      await CommonFunc.sleep(200);
      let GridLayoutDirKey = CommonFunc.getComponentRect('GridLayoutDirKey');
      let ColumnKey = CommonFunc.getComponentRect('ColumnKey');
      await CommonFunc.sleep(1000);

      expect(Math.abs(Math.round(GridLayoutDirKey.top - ColumnKey.top) - Math.round(UIContext.resolveUIContext()!.vp2px(50))) <= 1).assertTrue();

      console.info('[GridLayoutDirection_static_006] END');
      done();
    });


  })
}
