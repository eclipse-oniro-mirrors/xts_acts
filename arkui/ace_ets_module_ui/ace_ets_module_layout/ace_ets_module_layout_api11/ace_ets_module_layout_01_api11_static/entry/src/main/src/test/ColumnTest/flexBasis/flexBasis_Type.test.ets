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

export default function flexBasis_Type() {
  describe('flexBasis_Type', () => {
    beforeAll(() => {
      console.info("flexBasis_Type beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.layout.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("flexBasis_Type beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Column/flexBasis/flexBasis_Type",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get flexBasis_Type state pages:" + JSON.stringify(pages));
        if (!("flexBasis_Type" == pages.name)) {
          console.info("get flexBasis_Type pages.name:" + '');
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push flexBasis_Type page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push flexBasis_Type page error:" + err);
      }
      console.info("flexBasis_Type beforeEach end");
    });

    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("flexBasis_Type after each called")
    });
    
    



    /**
     * @tc.number   SUB_ACE_flexBasis_Type_TEST_static_0100
     * @tc.name     SUB_ACE_flexBasis_Type_TEST_static_0100
     * @tc.desc     SUB_ACE_flexBasis_Type_TEST_static_0100
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ACE_flexBasis_Type_TEST_static_0100', Level.LEVEL0, async () => {
      console.info('[SUB_ACE_flexBasis_Type_TEST_static_0100] START');
      const uiContext = AppStorage.get<UIContext>('uiContext');
      AppStorage.get<MessageManager<number|string>>("messageManager")?.notify({
        name: 'addflexBasis1', value: 100
      });
      await CommonFunc.sleep(3000);
      let Column_flexBasis_011: RectValue = CommonFunc.getComponentRect('Column_flexBasis_011');
      let Column_flexBasis_012: RectValue = CommonFunc.getComponentRect('Column_flexBasis_012');
      let Column_flexBasis_013: RectValue = CommonFunc.getComponentRect('Column_flexBasis_013');
      let Column_flexBasis_01: RectValue = CommonFunc.getComponentRect('Column_flexBasis_01');
      console.log('assert position')
      expect(Math.abs((Column_flexBasis_011.left - Column_flexBasis_01.left) - (Column_flexBasis_01.right - Column_flexBasis_011.right)) <= 1)
        .assertTrue();
      expect(Math.abs((Column_flexBasis_012.left - Column_flexBasis_01.left) - (Column_flexBasis_01.right - Column_flexBasis_012.right)) <= 1)
        .assertTrue();
      expect(Math.abs((Column_flexBasis_013.left - Column_flexBasis_01.left) - (Column_flexBasis_01.right - Column_flexBasis_013.right)) <= 1)
        .assertTrue();
      expect(Math.abs((Column_flexBasis_012.top - Column_flexBasis_011.bottom) - (Column_flexBasis_013.top - Column_flexBasis_012.bottom)) <= 1)
        .assertTrue();
      console.log('assert space')
      expect(Math.abs((Column_flexBasis_012.top - Column_flexBasis_011.bottom) - uiContext!.vp2px(10)) <= 1).assertTrue();
      expect(Math.abs((Column_flexBasis_013.top - Column_flexBasis_012.bottom) - uiContext!.vp2px(10)) <= 1).assertTrue();
      console.log('Column_flexBasis_012.top - Column_flexBasis_011.bottom', +(Column_flexBasis_012.top - Column_flexBasis_011.bottom))
      console.log('Column_flexBasis_013.top - Column_flexBasis_012.bottom', +(Column_flexBasis_013.top - Column_flexBasis_012.bottom))
      expect(Math.abs((Column_flexBasis_01.top - Column_flexBasis_011.top)) <= 1).assertTrue();
      console.log('assert height')
      expect(Math.abs((Column_flexBasis_011.bottom - Column_flexBasis_011.top) - uiContext!.vp2px(100)) <= 1).assertTrue();
      console.log('Column_flexBasis_011.bottom - Column_flexBasis_011.top', +(Column_flexBasis_011.bottom - Column_flexBasis_011.top))
      expect(Math.abs((Column_flexBasis_012.bottom - Column_flexBasis_012.top) - uiContext!.vp2px(100)) <= 1).assertTrue();
      console.log('Column_flexBasis_012.bottom - Column_flexBasis_012.top', +(Column_flexBasis_012.bottom - Column_flexBasis_012.top))
      expect(Math.abs((Column_flexBasis_013.bottom - Column_flexBasis_013.top) - uiContext!.vp2px(100)) <= 1).assertTrue();
      console.log('Column_flexBasis_013.bottom - Column_flexBasis_013.top', +(Column_flexBasis_013.bottom - Column_flexBasis_013.top))
      console.log('assert weight')
      expect(Math.abs((Column_flexBasis_011.right - Column_flexBasis_011.left) - uiContext!.vp2px(300)) <= 1).assertTrue();
      expect(Math.abs((Column_flexBasis_012.right - Column_flexBasis_012.left) - uiContext!.vp2px(300)) <= 1).assertTrue();
      expect(Math.abs((Column_flexBasis_013.right - Column_flexBasis_013.left) - uiContext!.vp2px(300)) <= 1).assertTrue();
      console.info('[SUB_ACE_flexBasis_Type_TEST_static_0100] END');
    });
    
    



    /**
     * @tc.number   SUB_ACE_flexBasis_Type_TEST_static_0200
     * @tc.name     SUB_ACE_flexBasis_Type_TEST_static_0200
     * @tc.desc     SUB_ACE_flexBasis_Type_TEST_static_0200
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ACE_flexBasis_Type_TEST_static_0200', Level.LEVEL0, async () => {
      console.info('[SUB_ACE_flexBasis_Type_TEST_static_0200] START');
      const uiContext = AppStorage.get<UIContext>('uiContext');
      AppStorage.get<MessageManager<number|string>>("messageManager")?.notify({
        name: 'addflexBasis1', value: 0
      });
      await CommonFunc.sleep(3000);
      let Column_flexBasis_011: RectValue = CommonFunc.getComponentRect('Column_flexBasis_011');
      let Column_flexBasis_012: RectValue = CommonFunc.getComponentRect('Column_flexBasis_012');
      let Column_flexBasis_013: RectValue = CommonFunc.getComponentRect('Column_flexBasis_013');
      let Column_flexBasis_01: RectValue = CommonFunc.getComponentRect('Column_flexBasis_01');
      console.log('assert position')
      expect(Math.abs((Column_flexBasis_011.left - Column_flexBasis_01.left) - (Column_flexBasis_01.right - Column_flexBasis_011.right)) <= 1)
        .assertTrue();
      expect(Math.abs((Column_flexBasis_012.left - Column_flexBasis_01.left) - (Column_flexBasis_01.right - Column_flexBasis_012.right)) <= 1)
        .assertTrue();
      expect(Math.abs((Column_flexBasis_013.left - Column_flexBasis_01.left) - (Column_flexBasis_01.right - Column_flexBasis_013.right)) <= 1)
        .assertTrue();
      expect(Math.abs((Column_flexBasis_012.top - Column_flexBasis_011.bottom) - (Column_flexBasis_013.top - Column_flexBasis_012.bottom)) <= 1)
        .assertTrue();
      console.log('assert space')
      expect(Math.abs((Column_flexBasis_012.top - Column_flexBasis_011.bottom) - uiContext!.vp2px(10)) <= 1).assertTrue();
      expect(Math.abs((Column_flexBasis_013.top - Column_flexBasis_012.bottom) - uiContext!.vp2px(10)) <= 1).assertTrue();
      console.log('Column_flexBasis_012.top - Column_flexBasis_011.bottom', +(Column_flexBasis_012.top - Column_flexBasis_011.bottom))
      console.log('Column_flexBasis_013.top - Column_flexBasis_012.bottom', +(Column_flexBasis_013.top - Column_flexBasis_012.bottom))
      expect(Math.abs((Column_flexBasis_01.top - Column_flexBasis_011.top)) <= 1).assertTrue();
      console.log('assert height')
      expect(Math.abs((Column_flexBasis_011.bottom - Column_flexBasis_011.top) - uiContext!.vp2px(200)) <= 1).assertTrue();
      console.log('Column_flexBasis_011.bottom - Column_flexBasis_011.top', +(Column_flexBasis_011.bottom - Column_flexBasis_011.top))
      expect(Math.abs((Column_flexBasis_012.bottom - Column_flexBasis_012.top) - uiContext!.vp2px(100)) <= 1).assertTrue();
      console.log('Column_flexBasis_012.bottom - Column_flexBasis_012.top', +(Column_flexBasis_012.bottom - Column_flexBasis_012.top))
      expect(Math.abs((Column_flexBasis_013.bottom - Column_flexBasis_013.top) - uiContext!.vp2px(100)) <= 1).assertTrue();
      console.log('Column_flexBasis_013.bottom - Column_flexBasis_013.top', +(Column_flexBasis_013.bottom - Column_flexBasis_013.top))
      console.log('assert weight')
      expect(Math.abs((Column_flexBasis_011.right - Column_flexBasis_011.left) - uiContext!.vp2px(300)) <= 1).assertTrue();
      expect(Math.abs((Column_flexBasis_012.right - Column_flexBasis_012.left) - uiContext!.vp2px(300)) <= 1).assertTrue();
      expect(Math.abs((Column_flexBasis_013.right - Column_flexBasis_013.left) - uiContext!.vp2px(300)) <= 1).assertTrue();
      console.info('[SUB_ACE_flexBasis_Type_TEST_static_0200] END');
    });

    
    



    /**
     * @tc.number   SUB_ACE_flexBasis_Type_TEST_static_0300
     * @tc.name     SUB_ACE_flexBasis_Type_TEST_static_0300
     * @tc.desc     SUB_ACE_flexBasis_Type_TEST_static_0300
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ACE_flexBasis_Type_TEST_static_0300', Level.LEVEL0, async () => {
      console.info('[SUB_ACE_flexBasis_Type_TEST_static_0300] START');
      const uiContext = AppStorage.get<UIContext>('uiContext');
      AppStorage.get<MessageManager<number|string>>("messageManager")?.notify({
        name: 'addflexBasis2', value: 'auto'
      });
      await CommonFunc.sleep(3000);
      let Column_flexBasis_021: RectValue = CommonFunc.getComponentRect('Column_flexBasis_021');
      let Column_flexBasis_022: RectValue = CommonFunc.getComponentRect('Column_flexBasis_022');
      let Column_flexBasis_023: RectValue = CommonFunc.getComponentRect('Column_flexBasis_023');
      let Column_flexBasis_02: RectValue = CommonFunc.getComponentRect('Column_flexBasis_02');
      console.log('assert position')
      expect(Math.abs((Column_flexBasis_021.left - Column_flexBasis_02.left) - (Column_flexBasis_02.right - Column_flexBasis_021.right)) <= 1)
        .assertTrue();
      expect(Math.abs((Column_flexBasis_022.left - Column_flexBasis_02.left) - (Column_flexBasis_02.right - Column_flexBasis_022.right)) <= 1)
        .assertTrue();
      expect(Math.abs((Column_flexBasis_023.left - Column_flexBasis_02.left) - (Column_flexBasis_02.right - Column_flexBasis_023.right)) <= 1)
        .assertTrue();
      expect(Math.abs((Column_flexBasis_022.top - Column_flexBasis_021.bottom) - (Column_flexBasis_023.top - Column_flexBasis_022.bottom)) <= 1)
        .assertTrue();
      console.log('assert space')
      expect(Math.abs((Column_flexBasis_022.top - Column_flexBasis_021.bottom) - uiContext!.vp2px(10)) <= 1).assertTrue();
      expect(Math.abs((Column_flexBasis_023.top - Column_flexBasis_022.bottom) - uiContext!.vp2px(10)) <= 1).assertTrue();
      expect(Math.abs((Column_flexBasis_02.top - Column_flexBasis_021.top)) <= 1).assertTrue();
      console.log('assert height')
      expect(Math.abs((Column_flexBasis_021.bottom - Column_flexBasis_021.top) - uiContext!.vp2px(220)) <= 1).assertTrue();
      console.log('Column_flexBasis_021.bottom - Column_flexBasis_021.top', +(Column_flexBasis_021.bottom - Column_flexBasis_021.top))
      expect(Math.abs((Column_flexBasis_022.bottom - Column_flexBasis_022.top) - uiContext!.vp2px(100)) <= 1).assertTrue();
      console.log('Column_flexBasis_022.bottom - Column_flexBasis_022.top', +(Column_flexBasis_022.bottom - Column_flexBasis_022.top))
      expect(Math.abs((Column_flexBasis_023.bottom - Column_flexBasis_023.top) - uiContext!.vp2px(100)) <= 1).assertTrue();
      console.log('Column_flexBasis_023.bottom - Column_flexBasis_023.top', +(Column_flexBasis_023.bottom - Column_flexBasis_023.top))
      console.log('assert weight')
      expect(Math.abs((Column_flexBasis_021.right - Column_flexBasis_021.left) - uiContext!.vp2px(300)) <= 1).assertTrue();
      expect(Math.abs((Column_flexBasis_022.right - Column_flexBasis_022.left) - uiContext!.vp2px(300)) <= 1).assertTrue();
      expect(Math.abs((Column_flexBasis_023.right - Column_flexBasis_023.left) - uiContext!.vp2px(300)) <= 1).assertTrue();
      console.info('[SUB_ACE_flexBasis_Type_TEST_static_0400] END');
    });
    
    



    /**
     * @tc.number   SUB_ACE_flexBasis_Type_TEST_static_0400
     * @tc.name     SUB_ACE_flexBasis_Type_TEST_static_0400
     * @tc.desc     SUB_ACE_flexBasis_Type_TEST_static_0400
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ACE_flexBasis_Type_TEST_static_0400', Level.LEVEL0, async () => {
      console.info('[SUB_ACE_flexBasis_Type_TEST_static_0400] START');
      const uiContext = AppStorage.get<UIContext>('uiContext');
      AppStorage.get<MessageManager<number|string>>("messageManager")?.notify({
        name: 'addflexBasis2', value: '200vp'
      });
      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Column_flexBasis_021: RectValue = CommonFunc.getComponentRect('Column_flexBasis_021');
      let Column_flexBasis_022: RectValue = CommonFunc.getComponentRect('Column_flexBasis_022');
      let Column_flexBasis_023: RectValue = CommonFunc.getComponentRect('Column_flexBasis_023');
      let Column_flexBasis_02: RectValue = CommonFunc.getComponentRect('Column_flexBasis_02');
      console.log('assert position')
      expect(Math.abs((Column_flexBasis_021.left - Column_flexBasis_02.left) - (Column_flexBasis_02.right - Column_flexBasis_021.right)) <= 1)
        .assertTrue();
      expect(Math.abs((Column_flexBasis_022.left - Column_flexBasis_02.left) - (Column_flexBasis_02.right - Column_flexBasis_022.right)) <= 1)
        .assertTrue();
      expect(Math.abs((Column_flexBasis_023.left - Column_flexBasis_02.left) - (Column_flexBasis_02.right - Column_flexBasis_023.right)) <= 1)
        .assertTrue();
      expect(Math.abs((Column_flexBasis_022.top - Column_flexBasis_021.bottom) - (Column_flexBasis_023.top - Column_flexBasis_022.bottom)) <= 1)
        .assertTrue();
      console.log('assert space')
      expect(Math.abs((Column_flexBasis_022.top - Column_flexBasis_021.bottom) - uiContext!.vp2px(10)) <= 1).assertTrue();
      expect(Math.abs((Column_flexBasis_023.top - Column_flexBasis_022.bottom) - uiContext!.vp2px(10)) <= 1).assertTrue();
      expect(Math.abs((Column_flexBasis_02.top - Column_flexBasis_021.top)) <= 1).assertTrue();
      console.log('assert height')
      expect(Math.abs((Column_flexBasis_021.bottom - Column_flexBasis_021.top) - uiContext!.vp2px(200)) <= 1).assertTrue();
      console.log('Column_flexBasis_021.bottom - Column_flexBasis_021.top', +(Column_flexBasis_021.bottom - Column_flexBasis_021.top))
      expect(Math.abs((Column_flexBasis_022.bottom - Column_flexBasis_022.top) - uiContext!.vp2px(100)) <= 1).assertTrue();
      console.log('Column_flexBasis_022.bottom - Column_flexBasis_022.top', +(Column_flexBasis_022.bottom - Column_flexBasis_022.top))
      expect(Math.abs((Column_flexBasis_023.bottom - Column_flexBasis_023.top) - uiContext!.vp2px(100)) <= 1).assertTrue();
      console.log('Column_flexBasis_023.bottom - Column_flexBasis_023.top', +(Column_flexBasis_023.bottom - Column_flexBasis_023.top))
      console.log('assert weight')
      expect(Math.abs((Column_flexBasis_021.right - Column_flexBasis_021.left) - uiContext!.vp2px(300)) <= 1).assertTrue();
      expect(Math.abs((Column_flexBasis_022.right - Column_flexBasis_022.left) - uiContext!.vp2px(300)) <= 1).assertTrue();
      expect(Math.abs((Column_flexBasis_023.right - Column_flexBasis_023.left) - uiContext!.vp2px(300)) <= 1).assertTrue();
      console.info('[SUB_ACE_flexBasis_Type_TEST_static_0400] END');
    });
    
    



    /**
     * @tc.number   SUB_ACE_flexBasis_Type_TEST_static_0500
     * @tc.name     SUB_ACE_flexBasis_Type_TEST_static_0500
     * @tc.desc     SUB_ACE_flexBasis_Type_TEST_static_0500
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ACE_flexBasis_Type_TEST_static_0500', Level.LEVEL0, async () => {
      console.info('[SUB_ACE_flexBasis_Type_TEST_static_0500] START');
      const uiContext = AppStorage.get<UIContext>('uiContext');
      AppStorage.get<MessageManager<number|string>>("messageManager")?.notify({
        name: 'addflexBasis2', value: '200px'
      });
      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Column_flexBasis_021: RectValue = CommonFunc.getComponentRect('Column_flexBasis_021');
      let Column_flexBasis_022: RectValue = CommonFunc.getComponentRect('Column_flexBasis_022');
      let Column_flexBasis_023: RectValue = CommonFunc.getComponentRect('Column_flexBasis_023');
      let Column_flexBasis_02: RectValue = CommonFunc.getComponentRect('Column_flexBasis_02');
      console.log('assert position')
      expect(Math.abs((Column_flexBasis_021.left - Column_flexBasis_02.left) - (Column_flexBasis_02.right - Column_flexBasis_021.right)) <= 1)
        .assertTrue();
      expect(Math.abs((Column_flexBasis_022.left - Column_flexBasis_02.left) - (Column_flexBasis_02.right - Column_flexBasis_022.right)) <= 1)
        .assertTrue();
      expect(Math.abs((Column_flexBasis_023.left - Column_flexBasis_02.left) - (Column_flexBasis_02.right - Column_flexBasis_023.right)) <= 1)
        .assertTrue();
      expect(Math.abs((Column_flexBasis_022.top - Column_flexBasis_021.bottom) - (Column_flexBasis_023.top - Column_flexBasis_022.bottom)) <= 1)
        .assertTrue();
      console.log('assert space')
      expect(Math.abs((Column_flexBasis_022.top - Column_flexBasis_021.bottom) - uiContext!.vp2px(10)) <= 1).assertTrue();
      expect(Math.abs((Column_flexBasis_023.top - Column_flexBasis_022.bottom) - uiContext!.vp2px(10)) <= 1).assertTrue();
      expect(Math.abs((Column_flexBasis_02.top - Column_flexBasis_021.top)) <= 1).assertTrue();
      console.log('assert height')
      expect(Math.abs((Column_flexBasis_021.bottom - Column_flexBasis_021.top) - 200) <= 1).assertTrue();
      console.log('Column_flexBasis_021.bottom - Column_flexBasis_021.top', +(Column_flexBasis_021.bottom - Column_flexBasis_021.top))
      expect(Math.abs((Column_flexBasis_022.bottom - Column_flexBasis_022.top) - uiContext!.vp2px(100)) <= 1).assertTrue();
      console.log('Column_flexBasis_022.bottom - Column_flexBasis_022.top', +(Column_flexBasis_022.bottom - Column_flexBasis_022.top))
      expect(Math.abs((Column_flexBasis_023.bottom - Column_flexBasis_023.top) - uiContext!.vp2px(100)) <= 1).assertTrue();
      console.log('Column_flexBasis_023.bottom - Column_flexBasis_023.top', +(Column_flexBasis_023.bottom - Column_flexBasis_023.top))
      console.log('assert weight')
      expect(Math.abs((Column_flexBasis_021.right - Column_flexBasis_021.left) - uiContext!.vp2px(300)) <= 1).assertTrue();
      expect(Math.abs((Column_flexBasis_022.right - Column_flexBasis_022.left) - uiContext!.vp2px(300)) <= 1).assertTrue();
      expect(Math.abs((Column_flexBasis_023.right - Column_flexBasis_023.left) - uiContext!.vp2px(300)) <= 1).assertTrue();
      console.info('[SUB_ACE_flexBasis_Type_TEST_static_0500] END');
    });
    
    



    /**
     * @tc.number   SUB_ACE_flexBasis_Type_TEST_static_0600
     * @tc.name     SUB_ACE_flexBasis_Type_TEST_static_0600
     * @tc.desc     SUB_ACE_flexBasis_Type_TEST_static_0600
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ACE_flexBasis_Type_TEST_static_0600', Level.LEVEL0, async () => {
      console.info('[SUB_ACE_flexBasis_Type_TEST_static_0600] START');
      const uiContext = AppStorage.get<UIContext>('uiContext');
      AppStorage.get<MessageManager<number|string>>("messageManager")?.notify({
        name: 'addflexBasis2', value: '200fp'
      });
      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Column_flexBasis_021: RectValue = CommonFunc.getComponentRect('Column_flexBasis_021');
      let Column_flexBasis_022: RectValue = CommonFunc.getComponentRect('Column_flexBasis_022');
      let Column_flexBasis_023: RectValue = CommonFunc.getComponentRect('Column_flexBasis_023');
      let Column_flexBasis_02: RectValue = CommonFunc.getComponentRect('Column_flexBasis_02');
      console.log('assert position')
      expect(Math.abs((Column_flexBasis_021.left - Column_flexBasis_02.left) - (Column_flexBasis_02.right - Column_flexBasis_021.right)) <= 1)
        .assertTrue();
      expect(Math.abs((Column_flexBasis_022.left - Column_flexBasis_02.left) - (Column_flexBasis_02.right - Column_flexBasis_022.right)) <= 1)
        .assertTrue();
      expect(Math.abs((Column_flexBasis_023.left - Column_flexBasis_02.left) - (Column_flexBasis_02.right - Column_flexBasis_023.right)) <= 1)
        .assertTrue();
      expect(Math.abs((Column_flexBasis_022.top - Column_flexBasis_021.bottom) - (Column_flexBasis_023.top - Column_flexBasis_022.bottom)) <= 1)
        .assertTrue();
      console.log('assert space')
      expect(Math.abs((Column_flexBasis_022.top - Column_flexBasis_021.bottom) - uiContext!.vp2px(10)) <= 1).assertTrue();
      expect(Math.abs((Column_flexBasis_023.top - Column_flexBasis_022.bottom) - uiContext!.vp2px(10)) <= 1).assertTrue();
      expect(Math.abs((Column_flexBasis_02.top - Column_flexBasis_021.top)) <= 1).assertTrue();
      console.log('assert height')
      expect(Math.abs((Column_flexBasis_021.bottom - Column_flexBasis_021.top) - uiContext!.fp2px(200)) <= 1).assertTrue();
      console.log('Column_flexBasis_021.bottom - Column_flexBasis_021.top', +(Column_flexBasis_021.bottom - Column_flexBasis_021.top))
      expect(Math.abs((Column_flexBasis_022.bottom - Column_flexBasis_022.top) - uiContext!.vp2px(100)) <= 1).assertTrue();
      console.log('Column_flexBasis_022.bottom - Column_flexBasis_022.top', +(Column_flexBasis_022.bottom - Column_flexBasis_022.top))
      expect(Math.abs((Column_flexBasis_023.bottom - Column_flexBasis_023.top) - uiContext!.vp2px(100)) <= 1).assertTrue();
      console.log('Column_flexBasis_023.bottom - Column_flexBasis_023.top', +(Column_flexBasis_023.bottom - Column_flexBasis_023.top))
      console.log('assert weight')
      expect(Math.abs((Column_flexBasis_021.right - Column_flexBasis_021.left) - uiContext!.vp2px(300)) <= 1).assertTrue();
      expect(Math.abs((Column_flexBasis_022.right - Column_flexBasis_022.left) - uiContext!.vp2px(300)) <= 1).assertTrue();
      expect(Math.abs((Column_flexBasis_023.right - Column_flexBasis_023.left) - uiContext!.vp2px(300)) <= 1).assertTrue();
      console.info('[SUB_ACE_flexBasis_Type_TEST_static_0600] END');
    });
    
    



    /**
     * @tc.number  SUB_ACE_flexBasis_Type_TEST_static_0700
     * @tc.name     SUB_ACE_flexBasis_Type_TEST_static_0700
     * @tc.desc     SUB_ACE_flexBasis_Type_TEST_static_0700
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ACE_flexBasis_Type_TEST_static_0700', Level.LEVEL0, async () => {
      console.info('[SUB_ACE_flexBasis_Type_TEST_static_0700] START');
      const uiContext = AppStorage.get<UIContext>('uiContext');
      AppStorage.get<MessageManager<number|string>>("messageManager")?.notify({
        name: 'addflexBasis2', value: '200lpx'
      });
      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Column_flexBasis_021: RectValue = CommonFunc.getComponentRect('Column_flexBasis_021');
      let Column_flexBasis_022: RectValue = CommonFunc.getComponentRect('Column_flexBasis_022');
      let Column_flexBasis_023: RectValue = CommonFunc.getComponentRect('Column_flexBasis_023');
      let Column_flexBasis_02: RectValue = CommonFunc.getComponentRect('Column_flexBasis_02');
      console.log('assert position')
      expect(Math.abs((Column_flexBasis_021.left - Column_flexBasis_02.left) - (Column_flexBasis_02.right - Column_flexBasis_021.right)) <= 1)
        .assertTrue();
      console.log('Column_flexBasis_021.left - Column_flexBasis_02.left', +(Column_flexBasis_021.left - Column_flexBasis_02.left))
      expect(Math.abs((Column_flexBasis_022.left - Column_flexBasis_02.left) - (Column_flexBasis_02.right - Column_flexBasis_022.right)) <= 1)
        .assertTrue();
      console.log('Column_flexBasis_022.left - Column_flexBasis_02.left', +(Column_flexBasis_022.left - Column_flexBasis_02.left))
      expect(Math.abs((Column_flexBasis_023.left - Column_flexBasis_02.left) - (Column_flexBasis_02.right - Column_flexBasis_023.right)) <= 1)
        .assertTrue();
      console.log('Column_flexBasis_023.left - Column_flexBasis_02.left', +(Column_flexBasis_023.left - Column_flexBasis_02.left))
      expect(Math.abs((Column_flexBasis_022.top - Column_flexBasis_021.bottom) - (Column_flexBasis_023.top - Column_flexBasis_022.bottom)) <= 1)
        .assertTrue();
      console.log('Column_flexBasis_022.top - Column_flexBasis_021.bottom', +(Column_flexBasis_022.top - Column_flexBasis_021.bottom))

      console.log('assert space')
      expect(Math.abs((Column_flexBasis_022.top - Column_flexBasis_021.bottom) - uiContext!.vp2px(10)) <= 1).assertTrue();
      expect(Math.abs((Column_flexBasis_023.top - Column_flexBasis_022.bottom) - uiContext!.vp2px(10)) <= 1).assertTrue();
      expect(Math.abs((Column_flexBasis_02.top - Column_flexBasis_021.top)) <= 1).assertTrue();
      console.log('assert height')
      expect(Math.abs((Column_flexBasis_021.bottom - Column_flexBasis_021.top) - uiContext!.lpx2px(200)) <= 1).assertTrue();
      console.log('Column_flexBasis_021.bottom - Column_flexBasis_021.top', +(Column_flexBasis_021.bottom - Column_flexBasis_021.top))
      expect(Math.abs((Column_flexBasis_022.bottom - Column_flexBasis_022.top) - uiContext!.vp2px(100)) <= 1).assertTrue();
      console.log('Column_flexBasis_022.bottom - Column_flexBasis_022.top', +(Column_flexBasis_022.bottom - Column_flexBasis_022.top))
      expect(Math.abs((Column_flexBasis_023.bottom - Column_flexBasis_023.top) - uiContext!.vp2px(100)) <= 1).assertTrue();
      console.log('Column_flexBasis_023.bottom - Column_flexBasis_023.top', +(Column_flexBasis_023.bottom - Column_flexBasis_023.top))
      console.log('assert weight')
      expect(Math.abs((Column_flexBasis_021.right - Column_flexBasis_021.left) - uiContext!.vp2px(300)) <= 1).assertTrue();
      expect(Math.abs((Column_flexBasis_022.right - Column_flexBasis_022.left) - uiContext!.vp2px(300)) <= 1).assertTrue();
      expect(Math.abs((Column_flexBasis_023.right - Column_flexBasis_023.left) - uiContext!.vp2px(300)) <= 1).assertTrue();
      console.info('[SUB_ACE_flexBasis_Type_TEST_static_0700] END');
    });
  })
}