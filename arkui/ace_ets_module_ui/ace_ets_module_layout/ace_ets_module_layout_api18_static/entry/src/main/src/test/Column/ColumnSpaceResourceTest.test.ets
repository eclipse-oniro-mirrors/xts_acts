'use static';
/*
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

import CommonFunc from '../../../ets/MainAbility/common/Common';
import {
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  Level
} from '../../../../hypium/index';
import {
  Component,
  Driver,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import router from '@ohos.router';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';

let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function ColumnSpaceResourceTest() {
  describe('ColumnSpaceResourceTest', () => {
    beforeAll(() => {
      await UtilsTest.startAbility("com.arkui.ace.layout.api18.static", "EntryAbility")
      console.info("ColumnSpaceResourceTest beforeAll start");
    });

    beforeEach(async (): Promise<void> => {
      console.info("ColumnSpaceResourceTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Column/ColumnSpaceResourcePage',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get ColumnSpaceResourceTest state pages:" + JSON.stringify(pages));
        if (!("ColumnSpaceResourcePage" == pages.name)) {
          console.info("get ColumnSpaceResourceTest pages.name:" + JSON.stringify(pages.name));
          
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          
        }
      } catch (err) {
        console.error("push ColumnSpaceResourceTest page error:" + err);
      }
      console.info("ColumnSpaceResourceTest beforeEach end");
      
    });
    afterEach(async () => {
    });


    
    


/**
     * @tc.number   ColumnSpaceResourceTest_static_0100
     * @tc.name     ColumnSpaceResourceTest_static_0100
     * @tc.desc     ColumnSpaceResourceTest_static_0100
     * @tc.level    Level.LEVEL1
     */
it('ColumnSpaceResourceTest_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ColumnSpaceResourceTest_0100] START');
      const uiContext = AppStorage.get<UIContext>('uiContext')!;
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('ColumnSpaceResource_Column1');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('space')).assertEqual("10.00vp");

      let Column1 = CommonFunc.getComponentRect('ColumnSpaceResource_Column1');
      let Column1_01 = CommonFunc.getComponentRect('ColumnSpaceResource_Column1_01');
      let Column1_02 = CommonFunc.getComponentRect('ColumnSpaceResource_Column1_02');
      let Column1_03 = CommonFunc.getComponentRect('ColumnSpaceResource_Column1_03');

      console.info('[ColumnSpaceResourceTest_0100] Column1.top - Column1_01.top');
      console.info('[ColumnSpaceResourceTest_0100] Column1_02.top - Column1_01.bottom - UIContext.resolveUIContext()!.vp2px(10)');
      console.info('[ColumnSpaceResourceTest_0100] Column1_03.top - Column1_02.bottom - UIContext.resolveUIContext()!.vp2px(10)');
      expect(Math.floor(Math.abs(Column1.top - Column1_01.top)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(Column1_02.top - Column1_01.bottom - uiContext.vp2px(10))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(Column1_03.top - Column1_02.bottom - uiContext.vp2px(10))) <= 1).assertTrue();

      console.info('[ColumnSpaceResourceTest_0100] END');
      done();
    });


    
    


/**
     * @tc.number   ColumnSpaceResourceTest_static_0200
     * @tc.name     ColumnSpaceResourceTest_static_0200
     * @tc.desc     ColumnSpaceResourceTest_static_0200
     * @tc.level    Level.LEVEL1
     */
it('ColumnSpaceResourceTest_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ColumnSpaceResourceTest_0200] START');
      const uiContext = AppStorage.get<UIContext>('uiContext')!;
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('ColumnSpaceResource_Column2');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('space')).assertEqual("10.00vp");

      let Column2 = CommonFunc.getComponentRect('ColumnSpaceResource_Column2');
      let Column2_01 = CommonFunc.getComponentRect('ColumnSpaceResource_Column2_01');
      let Column2_02 = CommonFunc.getComponentRect('ColumnSpaceResource_Column2_02');
      let Column2_03 = CommonFunc.getComponentRect('ColumnSpaceResource_Column2_03');

      console.info('[ColumnSpaceResourceTest_0200] Column2.top - Column2_01.top');
      console.info('[ColumnSpaceResourceTest_0200] Column2_02.top - Column2_01.bottom - UIContext.resolveUIContext()!.vp2px(10)');
      console.info('[ColumnSpaceResourceTest_0200] Column2_03.top - Column2_02.bottom - UIContext.resolveUIContext()!.vp2px(10)');
      expect(Math.floor(Math.abs(Column2.top - Column2_01.top)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(Column2_02.top - Column2_01.bottom - uiContext.vp2px(10))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(Column2_03.top - Column2_02.bottom - uiContext.vp2px(10))) <= 1).assertTrue();

      console.info('[ColumnSpaceResourceTest_0200] END');
      done();
    });


    
    


/**
     * @tc.number   ColumnSpaceResourceTest_static_0300
     * @tc.name     ColumnSpaceResourceTest_static_0300
     * @tc.desc     ColumnSpaceResourceTest_static_0300
     * @tc.level    Level.LEVEL1
     */
it('ColumnSpaceResourceTest_static_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ColumnSpaceResourceTest_0300] START');
      const uiContext = AppStorage.get<UIContext>('uiContext')!;
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('ColumnSpaceResource_Column3');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('space')).assertEqual("10.90vp");

      let Column3 = CommonFunc.getComponentRect('ColumnSpaceResource_Column3');
      let Column3_01 = CommonFunc.getComponentRect('ColumnSpaceResource_Column3_01');
      let Column3_02 = CommonFunc.getComponentRect('ColumnSpaceResource_Column3_02');
      let Column3_03 = CommonFunc.getComponentRect('ColumnSpaceResource_Column3_03');

      console.info('[ColumnSpaceResourceTest_0300] Column3.top - Column3_01.top');
      console.info('[ColumnSpaceResourceTest_0300] Column3_02.top - Column3_01.bottom - UIContext.resolveUIContext()!.vp2px(10.9)');
      console.info('[ColumnSpaceResourceTest_0300] Column3_03.top - Column3_02.bottom - UIContext.resolveUIContext()!.vp2px(10.9)');
      expect(Math.floor(Math.abs(Column3.top - Column3_01.top)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(Column3_02.top - Column3_01.bottom - uiContext.vp2px(10.9))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(Column3_03.top - Column3_02.bottom - uiContext.vp2px(10.9))) <= 1).assertTrue();

      console.info('[ColumnSpaceResourceTest_0300] END');
      done();
    });

  })
}