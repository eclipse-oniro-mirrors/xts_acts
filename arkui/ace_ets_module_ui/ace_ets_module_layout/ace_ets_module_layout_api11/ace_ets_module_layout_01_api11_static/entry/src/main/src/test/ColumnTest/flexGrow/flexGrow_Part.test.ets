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
import router from '@ohos.router';
import RectValue from '../../../../ets/MainAbility/common/Rect';
import CommonFunc from '../../../../ets/MainAbility/common/Common';
import { GlobalContext } from '../../../../ets/MainAbility/common/GlobalContext'
import { MessageManager, Callback } from '../../../../ets/MainAbility/common/MessageManager';
import { UIContext } from "@ohos.arkui.UIContext";
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
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

export default function flexGrow_Part() {
  describe('flexGrow_Part', () => {

    beforeAll(() => {
      console.info("flexGrow_Part beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.layout.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("flexGrow_Part beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Column/flexGrow/flexGrow_Part",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get flexGrow_Part state pages:" + JSON.stringify(pages));
        if (!("flexGrow_Part" == pages.name)) {
          console.info("get flexGrow_Part pages.name:" + '');
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push flexGrow_Part page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push flexGrow_Part page error:" + err);
      }
      console.info("flexGrow_Part beforeEach end");
    });

    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("flexGrow_Part after each called")
    });

    
    



    /**
     * @tc.number   testFlexGrow_static_001
     * @tc.name     testFlexGrow_static_001
     * @tc.desc     testFlexGrow_static_001
     * @tc.level    Level.LEVEL0
     */
    it('testFlexGrow_static_001', Level.LEVEL0, async () => {
      console.info('[testFlexGrow_static] START');
      const uiContext = AppStorage.get<UIContext>('uiContext');
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'addflexGrow2', value: 1
      });
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'addflexGrow3', value: 1
      });
      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Column_flexGrow_011: RectValue = CommonFunc.getComponentRect('Column_flexGrow_011');
      let Column_flexGrow_012: RectValue = CommonFunc.getComponentRect('Column_flexGrow_012');
      let Column_flexGrow_013: RectValue = CommonFunc.getComponentRect('Column_flexGrow_013');
      let Column_flexGrow_01: RectValue = CommonFunc.getComponentRect('Column_flexGrow_01');
      console.log('assert position')
      expect(Math.floor(Math.abs(Column_flexGrow_011.left - Column_flexGrow_01.left - (Column_flexGrow_01.right - Column_flexGrow_011.right))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs(Column_flexGrow_012.left - Column_flexGrow_01.left - (Column_flexGrow_01.right - Column_flexGrow_012.right))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs(Column_flexGrow_013.left - Column_flexGrow_01.left - (Column_flexGrow_01.right - Column_flexGrow_013.right))) <= 1)
        .assertTrue();
      console.log('[testFlexGrow_static] Column_flexGrow_012.top - Column_flexGrow_011.bottom', +(Column_flexGrow_012.top - Column_flexGrow_011.bottom))
      console.log('[testFlexGrow_static] Column_flexGrow_013.top - Column_flexGrow_012.bottom', +(Column_flexGrow_013.top - Column_flexGrow_012.bottom))
      expect(Math.floor(Math.abs(Column_flexGrow_012.top - Column_flexGrow_011.bottom - (Column_flexGrow_013.top - Column_flexGrow_012.bottom))) <= 2)
        .assertTrue()
      console.log('assert space')
      expect(Math.floor(Math.abs(Column_flexGrow_012.top - Column_flexGrow_011.bottom - uiContext!.vp2px(10))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(Column_flexGrow_013.top - Column_flexGrow_012.bottom - uiContext!.vp2px(10))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(Column_flexGrow_01.top - Column_flexGrow_011.top)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(Column_flexGrow_013.bottom - Column_flexGrow_01.bottom)) <= 1).assertTrue();
      console.log('assert height')
      console.log('[testFlexGrow_static] Column_flexGrow_011.bottom - Column_flexGrow_011.top - uiContext!.vp2px(250)', +(Column_flexGrow_011.bottom - Column_flexGrow_011.top - uiContext!.vp2px(250)))
      expect(Math.floor(Math.abs(Column_flexGrow_011.bottom - Column_flexGrow_011.top - uiContext!.vp2px(250))) <= 1).assertTrue();
      console.log('[testFlexGrow_static] Column_flexGrow_012.bottom - Column_flexGrow_012.top - uiContext!.vp2px(100)', +(Column_flexGrow_012.bottom - Column_flexGrow_012.top - uiContext!.vp2px(100)))
      expect(Math.floor(Math.abs(Column_flexGrow_012.bottom - Column_flexGrow_012.top - uiContext!.vp2px(100))) <= 1).assertTrue();
      console.log('[testFlexGrow_static] Column_flexGrow_013.bottom - Column_flexGrow_013.top', +(Column_flexGrow_013.bottom - Column_flexGrow_013.top))
      expect(Math.floor(Math.abs(Column_flexGrow_013.bottom - Column_flexGrow_013.top - uiContext!.vp2px(100))) <= 1).assertTrue();

      console.log('assert weight')
      expect(Math.floor(Math.abs(Column_flexGrow_011.right - Column_flexGrow_011.left - uiContext!.vp2px(300))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(Column_flexGrow_012.right - Column_flexGrow_012.left - uiContext!.vp2px(300))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(Column_flexGrow_013.right - Column_flexGrow_013.left - uiContext!.vp2px(300))) <= 1).assertTrue();
      console.info('[testFlexGrow_static] END');
    });
    
    



    /**
     * @tc.number   SUB_ACE_flexGrow_Part_TEST_static_0200
     * @tc.name     SUB_ACE_flexGrow_Part_TEST_static_0200
     * @tc.desc     SUB_ACE_flexGrow_Part_TEST_static_0200
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ACE_flexGrow_Part_TEST_static_0200', Level.LEVEL0, async () => {
      console.info('[SUB_ACE_flexGrow_Part_TEST_0200] START');
      const uiContext = AppStorage.get<UIContext>('uiContext');
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'addflexGrow2', value: 2
      });
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'addflexGrow3', value: 2
      });
      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Column_flexGrow_011: RectValue = CommonFunc.getComponentRect('Column_flexGrow_011');
      let Column_flexGrow_012: RectValue = CommonFunc.getComponentRect('Column_flexGrow_012');
      let Column_flexGrow_013: RectValue = CommonFunc.getComponentRect('Column_flexGrow_013');
      let Column_flexGrow_01: RectValue = CommonFunc.getComponentRect('Column_flexGrow_01');
      console.log('assert position')
      expect(Math.floor(Math.abs(Column_flexGrow_011.left - Column_flexGrow_01.left - (Column_flexGrow_01.right - Column_flexGrow_011.right))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs(Column_flexGrow_012.left - Column_flexGrow_01.left - (Column_flexGrow_01.right - Column_flexGrow_012.right))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs(Column_flexGrow_013.left - Column_flexGrow_01.left - (Column_flexGrow_01.right - Column_flexGrow_013.right))) <= 2)
        .assertTrue();
      console.log('[SUB_ACE_flexGrow_Part_TEST_0200] Column_flexGrow_012.top - Column_flexGrow_011.bottom', +(Column_flexGrow_012.top - Column_flexGrow_011.bottom))
      console.log('[SUB_ACE_flexGrow_Part_TEST_0200] Column_flexGrow_013.top - Column_flexGrow_012.bottom', +(Column_flexGrow_013.top - Column_flexGrow_012.bottom))
      expect(Math.floor(Math.abs(Column_flexGrow_012.top - Column_flexGrow_011.bottom - (Column_flexGrow_013.top - Column_flexGrow_012.bottom))) <= 2)
        .assertTrue()
      console.log('assert space')
      expect(Math.floor(Math.abs(Column_flexGrow_012.top - Column_flexGrow_011.bottom - uiContext!.vp2px(10))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(Column_flexGrow_013.top - Column_flexGrow_012.bottom - uiContext!.vp2px(10))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(Column_flexGrow_01.top - Column_flexGrow_011.top)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(Column_flexGrow_013.bottom - Column_flexGrow_01.bottom)) <= 1).assertTrue();
      console.log('assert height')
      console.log('[SUB_ACE_flexGrow_Part_TEST_0200] Column_flexGrow_011.bottom - Column_flexGrow_011.top', +(Column_flexGrow_011.bottom - Column_flexGrow_011.top))
      expect(Math.floor(Math.abs(Column_flexGrow_011.bottom - Column_flexGrow_011.top - uiContext!.vp2px(250))) <= 1).assertTrue();
      console.log('[SUB_ACE_flexGrow_Part_TEST_0200] Column_flexGrow_012.bottom - Column_flexGrow_012.top', +(Column_flexGrow_012.bottom - Column_flexGrow_012.top))
      expect(Math.floor(Math.abs(Column_flexGrow_012.bottom - Column_flexGrow_012.top - uiContext!.vp2px(100))) <= 1).assertTrue();
      console.log('[SUB_ACE_flexGrow_Part_TEST_0200] Column_flexGrow_013.bottom - Column_flexGrow_013.top', +(Column_flexGrow_013.bottom - Column_flexGrow_013.top))
      expect(Math.floor(Math.abs(Column_flexGrow_013.bottom - Column_flexGrow_013.top - uiContext!.vp2px(100))) <= 1).assertTrue();
      console.log('assert weight')
      expect(Math.floor(Math.abs(Column_flexGrow_011.right - Column_flexGrow_011.left - uiContext!.vp2px(300))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(Column_flexGrow_012.right - Column_flexGrow_012.left - uiContext!.vp2px(300))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(Column_flexGrow_013.right - Column_flexGrow_013.left - uiContext!.vp2px(300))) <= 1).assertTrue();
      console.info('[SUB_ACE_flexGrow_Part_TEST_0200] END');
    });
    
    



    /**
     * @tc.number  SUB_ACE_flexGrow_Part_TEST_static_0300
     * @tc.name     SUB_ACE_flexGrow_Part_TEST_static_0300
     * @tc.desc     SUB_ACE_flexGrow_Part_TEST_static_0300
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ACE_flexGrow_Part_TEST_static_0300', Level.LEVEL0, async () => {
      console.info('[SUB_ACE_flexGrow_Part_TEST_0300] START');
      const uiContext = AppStorage.get<UIContext>('uiContext');
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'addflexGrow2', value: 3
      });
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'addflexGrow3', value: 3
      });
      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Column_flexGrow_011: RectValue = CommonFunc.getComponentRect('Column_flexGrow_011');
      let Column_flexGrow_012: RectValue = CommonFunc.getComponentRect('Column_flexGrow_012');
      let Column_flexGrow_013: RectValue = CommonFunc.getComponentRect('Column_flexGrow_013');
      let Column_flexGrow_01: RectValue = CommonFunc.getComponentRect('Column_flexGrow_01');
      console.log('assert position')
      expect(Math.floor(Math.abs(Column_flexGrow_011.left - Column_flexGrow_01.left - (Column_flexGrow_01.right - Column_flexGrow_011.right))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs(Column_flexGrow_012.left - Column_flexGrow_01.left - (Column_flexGrow_01.right - Column_flexGrow_012.right))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs(Column_flexGrow_013.left - Column_flexGrow_01.left - (Column_flexGrow_01.right - Column_flexGrow_013.right))) <= 1)
        .assertTrue();
      console.log('[SUB_ACE_flexGrow_Part_TEST_0300] Column_flexGrow_012.top - Column_flexGrow_011.bottom', +(Column_flexGrow_012.top - Column_flexGrow_011.bottom))
      console.log('[SUB_ACE_flexGrow_Part_TEST_0300] Column_flexGrow_013.top - Column_flexGrow_012.bottom', +(Column_flexGrow_013.top - Column_flexGrow_012.bottom))
      expect(Math.floor(Math.abs(Column_flexGrow_012.top - Column_flexGrow_011.bottom - (Column_flexGrow_013.top - Column_flexGrow_012.bottom))) <= 2)
        .assertTrue()
      console.log('assert space')
      expect(Math.floor(Math.abs(Column_flexGrow_012.top - Column_flexGrow_011.bottom - uiContext!.vp2px(10))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(Column_flexGrow_013.top - Column_flexGrow_012.bottom - uiContext!.vp2px(10))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(Column_flexGrow_01.top - Column_flexGrow_011.top)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(Column_flexGrow_013.bottom - Column_flexGrow_01.bottom)) <= 1).assertTrue();
      console.log('assert height')
      console.log('[SUB_ACE_flexGrow_Part_TEST_0300] Column_flexGrow_011.bottom - Column_flexGrow_011.top', +(Column_flexGrow_011.bottom - Column_flexGrow_011.top))
      expect(Math.floor(Math.abs(Column_flexGrow_011.bottom - Column_flexGrow_011.top - uiContext!.vp2px(250))) <= 1).assertTrue();
      console.log('[SUB_ACE_flexGrow_Part_TEST_0300] Column_flexGrow_012.bottom - Column_flexGrow_012.top', +(Column_flexGrow_012.bottom - Column_flexGrow_012.top))
      expect(Math.floor(Math.abs(Column_flexGrow_012.bottom - Column_flexGrow_012.top - uiContext!.vp2px(100))) <= 1).assertTrue();
      console.log('[SUB_ACE_flexGrow_Part_TEST_0300] Column_flexGrow_013.bottom - Column_flexGrow_013.top', +(Column_flexGrow_013.bottom - Column_flexGrow_013.top))
      expect(Math.floor(Math.abs(Column_flexGrow_013.bottom - Column_flexGrow_013.top - uiContext!.vp2px(100))) <= 1).assertTrue();
      console.log('assert weight')
      expect(Math.floor(Math.abs(Column_flexGrow_011.right - Column_flexGrow_011.left - uiContext!.vp2px(300))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(Column_flexGrow_012.right - Column_flexGrow_012.left - uiContext!.vp2px(300))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(Column_flexGrow_013.right - Column_flexGrow_013.left - uiContext!.vp2px(300))) <= 1).assertTrue();
      console.info('[SUB_ACE_flexGrow_Part_TEST_0300] END');
    });
    
    



    /**
     * @tc.number  SUB_ACE_flexGrow_Part_TEST_static_0400
     * @tc.name     SUB_ACE_flexGrow_Part_TEST_static_0400
     * @tc.desc     SUB_ACE_flexGrow_Part_TEST_static_0400
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ACE_flexGrow_Part_TEST_static_0400', Level.LEVEL0, async () => {
      console.info('[SUB_ACE_flexGrow_Part_TEST_0400] START');
      const uiContext = AppStorage.get<UIContext>('uiContext');
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'addflexGrow1', value: 3
      });
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'addflexGrow2', value: 2
      });
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'addflexGrow3', value: 1
      });
      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Column_flexGrow_011: RectValue = CommonFunc.getComponentRect('Column_flexGrow_011');
      let Column_flexGrow_012: RectValue = CommonFunc.getComponentRect('Column_flexGrow_012');
      let Column_flexGrow_013: RectValue = CommonFunc.getComponentRect('Column_flexGrow_013');
      let Column_flexGrow_01: RectValue = CommonFunc.getComponentRect('Column_flexGrow_01');
      console.log('assert position')
      expect(Math.floor(Math.abs(Column_flexGrow_011.left - Column_flexGrow_01.left - (Column_flexGrow_01.right - Column_flexGrow_011.right))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs(Column_flexGrow_012.left - Column_flexGrow_01.left - (Column_flexGrow_01.right - Column_flexGrow_012.right))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs(Column_flexGrow_013.left - Column_flexGrow_01.left - (Column_flexGrow_01.right - Column_flexGrow_013.right))) <= 1)
        .assertTrue();
      console.log('[SUB_ACE_flexGrow_Part_TEST_0400] Column_flexGrow_012.top - Column_flexGrow_011.bottom', +(Column_flexGrow_012.top - Column_flexGrow_011.bottom))
      console.log('[SUB_ACE_flexGrow_Part_TEST_0400] Column_flexGrow_013.top - Column_flexGrow_012.bottom', +(Column_flexGrow_013.top - Column_flexGrow_012.bottom))
      expect(Math.floor(Math.abs(Column_flexGrow_012.top - Column_flexGrow_011.bottom - (Column_flexGrow_013.top - Column_flexGrow_012.bottom))) <= 2)
        .assertTrue()
      console.log('assert space')
      expect(Math.floor(Math.abs(Column_flexGrow_012.top - Column_flexGrow_011.bottom - uiContext!.vp2px(10))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(Column_flexGrow_013.top - Column_flexGrow_012.bottom - uiContext!.vp2px(10))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(Column_flexGrow_01.top - Column_flexGrow_011.top)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(Column_flexGrow_013.bottom - Column_flexGrow_01.bottom)) <= 1).assertTrue();
      console.log('assert height')
      console.log('[SUB_ACE_flexGrow_Part_TEST_0400] Column_flexGrow_011.bottom - Column_flexGrow_011.top', +(Column_flexGrow_011.bottom - Column_flexGrow_011.top))
      expect(Math.floor(Math.abs(Column_flexGrow_011.bottom - Column_flexGrow_011.top - uiContext!.vp2px(250))) <= 1).assertTrue();
      console.log('[SUB_ACE_flexGrow_Part_TEST_0400] Column_flexGrow_012.bottom - Column_flexGrow_012.top', +(Column_flexGrow_012.bottom - Column_flexGrow_012.top))
      expect(Math.floor(Math.abs(Column_flexGrow_012.bottom - Column_flexGrow_012.top - uiContext!.vp2px(100))) <= 1).assertTrue();
      console.log('[SUB_ACE_flexGrow_Part_TEST_0400] Column_flexGrow_013.bottom - Column_flexGrow_013.top', +(Column_flexGrow_013.bottom - Column_flexGrow_013.top))
      expect(Math.floor(Math.abs(Column_flexGrow_013.bottom - Column_flexGrow_013.top - uiContext!.vp2px(100))) <= 1).assertTrue();
      console.log('assert weight')
      expect(Math.floor(Math.abs(Column_flexGrow_011.right - Column_flexGrow_011.left - uiContext!.vp2px(300))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(Column_flexGrow_012.right - Column_flexGrow_012.left - uiContext!.vp2px(300))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(Column_flexGrow_013.right - Column_flexGrow_013.left - uiContext!.vp2px(300))) <= 1).assertTrue();
      console.info('[SUB_ACE_flexGrow_Part_TEST_0400] END');
    });
    
    



    /**
     * @tc.number  SUB_ACE_flexGrow_Part_TEST_static_0500
     * @tc.name     SUB_ACE_flexGrow_Part_TEST_static_0500
     * @tc.desc     SUB_ACE_flexGrow_Part_TEST_static_0500
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ACE_flexGrow_Part_TEST_static_0500', Level.LEVEL0, async () => {
      console.info('[SUB_ACE_flexGrow_Part_TEST_0500] START');
      const uiContext = AppStorage.get<UIContext>('uiContext');
      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Column_flexGrow_021: RectValue = CommonFunc.getComponentRect('Column_flexGrow_021');
      let Column_flexGrow_022: RectValue = CommonFunc.getComponentRect('Column_flexGrow_022');
      let Column_flexGrow_023: RectValue = CommonFunc.getComponentRect('Column_flexGrow_023');
      let Column_flexGrow_02: RectValue = CommonFunc.getComponentRect('Column_flexGrow_02');
      console.log('assert position')
      expect(Math.floor(Math.abs(Column_flexGrow_021.left - Column_flexGrow_02.left - (Column_flexGrow_02.right - Column_flexGrow_021.right))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs(Column_flexGrow_022.left - Column_flexGrow_02.left - (Column_flexGrow_02.right - Column_flexGrow_022.right))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs(Column_flexGrow_023.left - Column_flexGrow_02.left - (Column_flexGrow_02.right - Column_flexGrow_023.right))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs(Column_flexGrow_022.top - Column_flexGrow_021.bottom - (Column_flexGrow_023.top - Column_flexGrow_022.bottom))) <= 1)
        .assertTrue()
      console.log('assert space')
      expect(Math.floor(Math.abs(Column_flexGrow_022.top - Column_flexGrow_021.bottom - uiContext!.vp2px(10))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(Column_flexGrow_023.top - Column_flexGrow_022.bottom - uiContext!.vp2px(10))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(Column_flexGrow_02.top - Column_flexGrow_021.top)) <= 1).assertTrue();
      console.log('assert height')
      console.log('[SUB_ACE_flexGrow_Part_TEST_0500] Column_flexGrow_021.bottom - Column_flexGrow_021.top', +(Column_flexGrow_021.bottom - Column_flexGrow_021.top))
      expect(Math.floor(Math.abs(Column_flexGrow_021.bottom - Column_flexGrow_021.top - uiContext!.vp2px(100))) <= 1).assertTrue();
      console.log('[SUB_ACE_flexGrow_Part_TEST_0500] Column_flexGrow_022.bottom - Column_flexGrow_022.top', +(Column_flexGrow_022.bottom - Column_flexGrow_022.top))
      expect(Math.floor(Math.abs(Column_flexGrow_022.bottom - Column_flexGrow_022.top - uiContext!.vp2px(100))) <= 1).assertTrue();
      console.log('[SUB_ACE_flexGrow_Part_TEST_0500] Column_flexGrow_023.bottom - Column_flexGrow_023.top', +(Column_flexGrow_023.bottom - Column_flexGrow_023.top))
      expect(Math.floor(Math.abs(Column_flexGrow_023.bottom - Column_flexGrow_023.top - uiContext!.vp2px(100))) <= 1).assertTrue();
      console.log('assert weight')
      expect(Math.floor(Math.abs(Column_flexGrow_021.right - Column_flexGrow_021.left - uiContext!.vp2px(300))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(Column_flexGrow_022.right - Column_flexGrow_022.left - uiContext!.vp2px(300))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(Column_flexGrow_023.right - Column_flexGrow_023.left - uiContext!.vp2px(300))) <= 1).assertTrue();
      console.info('[SUB_ACE_flexGrow_Part_TEST_0500] END');
    });
  })
}