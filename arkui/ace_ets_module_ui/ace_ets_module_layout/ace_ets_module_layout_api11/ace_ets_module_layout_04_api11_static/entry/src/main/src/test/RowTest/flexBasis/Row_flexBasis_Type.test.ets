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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc, { RectValue } from '../../../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../../../ets/MainAbility/common/MessageManager';
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
let testAbilityContext: common.UIAbilityContext;

export default function Row_flexBasis_Type() {
  describe('Row_flexBasis_Type', () => {
    beforeAll(async () => {
      console.info("Row_flexBasis_Type beforeAll start");

      await UtilsTest.startAbility("com.arkui.ace.layout.split04.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("Row_flexBasis_Type beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Row/flexBasis/Row_flexBasis_Type",
      };
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get Row_flexBasis_Type state pages:" + "");
        if (!("Row_flexBasis_Type" == pages.name)) {
          console.info("get Row_flexBasis_Type pages.name:" + "");

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);

        }
      } catch (err) {
        console.error("push Row_flexBasis_Type page error " + JSON.stringify(err));
        expect().assertFail();
      }
    });
    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("Row_flexBasis_Type after each called")
    });


    /**
         * @tc.number   SUB_ACE_Row_flexBasis_Type_TEST_static_0100
         * @tc.name     SUB_ACE_Row_flexBasis_Type_TEST_static_0100
         * @tc.desc     SUB_ACE_Row_flexBasis_Type_TEST_static_0100
         * @tc.level    Level.LEVEL0
         */
    it('SUB_ACE_Row_flexBasis_Type_TEST_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_Row_flexBasis_Type_TEST_static_0100] START');
      AppStorage.get<MessageManager<number|string>>('messageManager')?.notify({
        name: 'addflexBasis1', value: 100
      });

      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Row_flexBasis_Type_011: RectValue = CommonFunc.getComponentRect('Row_flexBasis_Type_011');
      let Row_flexBasis_Type_012: RectValue = CommonFunc.getComponentRect('Row_flexBasis_Type_012');
      let Row_flexBasis_Type_013: RectValue = CommonFunc.getComponentRect('Row_flexBasis_Type_013');
      let Row_flexBasis_Type_01: RectValue = CommonFunc.getComponentRect('Row_flexBasis_Type_01');

      console.log('assert position')
      expect(Math.abs(Math.round(Row_flexBasis_Type_011.top - Row_flexBasis_Type_01.top) -
      Math.round(Row_flexBasis_Type_01.bottom - Row_flexBasis_Type_011.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Row_flexBasis_Type_012.top - Row_flexBasis_Type_01.top) -
      Math.round(Row_flexBasis_Type_01.bottom - Row_flexBasis_Type_012.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Row_flexBasis_Type_013.top - Row_flexBasis_Type_01.top) -
      Math.round(Row_flexBasis_Type_01.bottom - Row_flexBasis_Type_013.bottom)) <= 1)
        .assertTrue();

      console.log('assert space')
      expect(Math.abs((Math.round(Row_flexBasis_Type_012.left - Row_flexBasis_Type_011.right)) -
        (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(10))))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_flexBasis_Type_013.left - Row_flexBasis_Type_012.right)) -
        (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(10))))) <= 1)
        .assertTrue();
      console.log('Row_flexBasis_Type_012.left - Row_flexBasis_Type_011.right',
        Row_flexBasis_Type_012.left - Row_flexBasis_Type_011.right)
      console.log('Row_flexBasis_Type_013.left - Row_flexBasis_Type_012.right',
        Row_flexBasis_Type_013.left - Row_flexBasis_Type_012.right)

      console.log('assert height')
      expect(Math.abs((Math.round(Row_flexBasis_Type_011.bottom - Row_flexBasis_Type_011.top)) -
        (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))) <= 1)
        .assertTrue();
      console.log('Row_flexBasis_Type_011.bottom - Row_flexBasis_Type_011.top',
        Row_flexBasis_Type_011.bottom - Row_flexBasis_Type_011.top)
      expect(Math.abs((Math.round(Row_flexBasis_Type_012.bottom - Row_flexBasis_Type_012.top)) -
        (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))) <= 1)
        .assertTrue();
      console.log('Row_flexBasis_Type_012.bottom - Row_flexBasis_Type_012.top',
        Row_flexBasis_Type_012.bottom - Row_flexBasis_Type_012.top)
      expect(Math.abs((Math.round(Row_flexBasis_Type_013.bottom - Row_flexBasis_Type_013.top)) -
        (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))) <= 1)
        .assertTrue();
      console.log('Row_flexBasis_Type_013.bottom - Row_flexBasis_Type_013.top',
        Row_flexBasis_Type_013.bottom - Row_flexBasis_Type_013.top)
      console.log('assert weight')
      expect(Math.abs((Math.round(Row_flexBasis_Type_011.right - Row_flexBasis_Type_011.left)) -
        (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_flexBasis_Type_012.right - Row_flexBasis_Type_012.left)) -
        (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_flexBasis_Type_013.right - Row_flexBasis_Type_013.left)) -
        (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))) <= 1)
        .assertTrue();
      console.info('[SUB_ACE_Row_flexBasis_Type_TEST_static_0100] END');
      done();
    });


    /**
         * @tc.number   SUB_ACE_Row_flexBasis_Type_TEST_static_0200
         * @tc.name     SUB_ACE_Row_flexBasis_Type_TEST_static_0200
         * @tc.desc     SUB_ACE_Row_flexBasis_Type_TEST_static_0200
         * @tc.level    Level.LEVEL0
         */
    it('SUB_ACE_Row_flexBasis_Type_TEST_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_Row_flexBasis_Type_TEST_static_0200] START');
      AppStorage.get<MessageManager<number|string>>('messageManager')?.notify({
        name: 'addflexBasis1', value: 0
      });

      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Row_flexBasis_Type_011: RectValue = CommonFunc.getComponentRect('Row_flexBasis_Type_011');
      let Row_flexBasis_Type_012: RectValue = CommonFunc.getComponentRect('Row_flexBasis_Type_012');
      let Row_flexBasis_Type_013: RectValue = CommonFunc.getComponentRect('Row_flexBasis_Type_013');
      let Row_flexBasis_Type_01: RectValue = CommonFunc.getComponentRect('Row_flexBasis_Type_01');

      console.log('assert position')
      expect(Math.abs(Math.round(Row_flexBasis_Type_011.top - Row_flexBasis_Type_01.top) -
      Math.round(Row_flexBasis_Type_01.bottom - Row_flexBasis_Type_011.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Row_flexBasis_Type_012.top - Row_flexBasis_Type_01.top) -
      Math.round(Row_flexBasis_Type_01.bottom - Row_flexBasis_Type_012.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Row_flexBasis_Type_013.top - Row_flexBasis_Type_01.top) -
      Math.round(Row_flexBasis_Type_01.bottom - Row_flexBasis_Type_013.bottom)) <= 1)
        .assertTrue();

      console.log('assert space')
      expect(Math.abs((Math.round(Row_flexBasis_Type_012.left - Row_flexBasis_Type_011.right)) -
        (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(10))))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_flexBasis_Type_013.left - Row_flexBasis_Type_012.right)) -
        (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(10))))) <= 1)
        .assertTrue();
      console.log('Row_flexBasis_Type_012.left - Row_flexBasis_Type_011.right',
        Row_flexBasis_Type_012.left - Row_flexBasis_Type_011.right)
      console.log('Row_flexBasis_Type_013.left - Row_flexBasis_Type_012.right',
        Row_flexBasis_Type_013.left - Row_flexBasis_Type_012.right)

      console.log('assert height')
      expect(Math.abs((Math.round(Row_flexBasis_Type_011.bottom - Row_flexBasis_Type_011.top)) -
        (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))) <= 1)
        .assertTrue();
      console.log('Row_flexBasis_Type_011.bottom - Row_flexBasis_Type_011.top',
        Row_flexBasis_Type_011.bottom - Row_flexBasis_Type_011.top)
      expect(Math.abs((Math.round(Row_flexBasis_Type_012.bottom - Row_flexBasis_Type_012.top)) -
        (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))) <= 1)
        .assertTrue();
      console.log('Row_flexBasis_Type_012.bottom - Row_flexBasis_Type_012.top',
        Row_flexBasis_Type_012.bottom - Row_flexBasis_Type_012.top)
      expect(Math.abs((Math.round(Row_flexBasis_Type_013.bottom - Row_flexBasis_Type_013.top)) -
        (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))) <= 1)
        .assertTrue();
      console.log('Row_flexBasis_Type_013.bottom - Row_flexBasis_Type_013.top',
        Row_flexBasis_Type_013.bottom - Row_flexBasis_Type_013.top)
      console.log('assert weight')
      expect(Math.abs((Math.round(Row_flexBasis_Type_011.right - Row_flexBasis_Type_011.left)) -
        (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(200))))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_flexBasis_Type_012.right - Row_flexBasis_Type_012.left)) -
        (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_flexBasis_Type_013.right - Row_flexBasis_Type_013.left)) -
        (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))) <= 1)
        .assertTrue();
      console.info('[SUB_ACE_Row_flexBasis_Type_TEST_static_0200] END');
      done();
    });


    /**
         * @tc.number   SUB_ACE_flexBasis_Type_TEST_static_0300
         * @tc.name     SUB_ACE_flexBasis_Type_TEST_static_0300
         * @tc.desc     SUB_ACE_flexBasis_Type_TEST_static_0300
         * @tc.level    Level.LEVEL0
         */
    it('SUB_ACE_flexBasis_Type_TEST_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_flexBasis_Type_TEST_static_0300] START');
      AppStorage.get<MessageManager<number|string>>('messageManager')?.notify({
        name: 'addflexBasis2', value: 'auto'
      });

      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Row_flexBasis_Type_021: RectValue = CommonFunc.getComponentRect('Row_flexBasis_Type_021');
      let Row_flexBasis_Type_022: RectValue = CommonFunc.getComponentRect('Row_flexBasis_Type_022');
      let Row_flexBasis_Type_023: RectValue = CommonFunc.getComponentRect('Row_flexBasis_Type_023');
      let Row_flexBasis_Type_02: RectValue = CommonFunc.getComponentRect('Row_flexBasis_Type_02');
      console.log('assert position')
      expect(Math.abs(Math.round(Row_flexBasis_Type_021.top - Row_flexBasis_Type_02.top) -
      Math.round(Row_flexBasis_Type_02.bottom - Row_flexBasis_Type_021.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Row_flexBasis_Type_022.top - Row_flexBasis_Type_02.top) -
      Math.round(Row_flexBasis_Type_02.bottom - Row_flexBasis_Type_022.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Row_flexBasis_Type_023.top - Row_flexBasis_Type_02.top) -
      Math.round(Row_flexBasis_Type_02.bottom - Row_flexBasis_Type_023.bottom)) <= 1)
        .assertTrue();

      console.log('assert space')
      expect(Math.abs((Math.round(Row_flexBasis_Type_022.left - Row_flexBasis_Type_021.right)) -
        (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(10))))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_flexBasis_Type_023.left - Row_flexBasis_Type_022.right)) -
        (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(10))))) <= 1)
        .assertTrue();


      console.log('assert height')
      expect(Math.abs((Math.round(Row_flexBasis_Type_021.bottom - Row_flexBasis_Type_021.top)) -
        (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))) <= 1)
        .assertTrue();
      console.log('Row_flexBasis_Type_021.bottom - Row_flexBasis_Type_021.top',
        Row_flexBasis_Type_021.bottom - Row_flexBasis_Type_021.top)
      expect(Math.abs((Math.round(Row_flexBasis_Type_022.bottom - Row_flexBasis_Type_022.top)) -
        (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))) <= 1)
        .assertTrue();
      console.log('Row_flexBasis_Type_022.bottom - Row_flexBasis_Type_022.top',
        Row_flexBasis_Type_022.bottom - Row_flexBasis_Type_022.top)
      expect(Math.abs((Math.round(Row_flexBasis_Type_023.bottom - Row_flexBasis_Type_023.top)) -
        (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))) <= 1)
        .assertTrue();
      console.log('Row_flexBasis_Type_023.bottom - Row_flexBasis_Type_023.top',
        Row_flexBasis_Type_023.bottom - Row_flexBasis_Type_023.top)
      console.log('assert weight')
      expect(Math.abs((Math.round(Row_flexBasis_Type_021.right - Row_flexBasis_Type_021.left)) -
        (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(220))))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_flexBasis_Type_022.right - Row_flexBasis_Type_022.left)) -
        (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_flexBasis_Type_023.right - Row_flexBasis_Type_023.left)) -
        (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))) <= 1)
        .assertTrue();
      console.info('[SUB_ACE_flexBasis_Type_TEST_static_0300] END');
      done();
    });


    /**
         * @tc.number   SUB_ACE_flexBasis_Type_TEST_static_0400
         * @tc.name     SUB_ACE_flexBasis_Type_TEST_static_0400
         * @tc.desc     SUB_ACE_flexBasis_Type_TEST_static_0400
         * @tc.level    Level.LEVEL0
         */
    it('SUB_ACE_flexBasis_Type_TEST_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_flexBasis_Type_TEST_static_0400] START');
      AppStorage.get<MessageManager<number|string>>('messageManager')?.notify({
        name: 'addflexBasis2', value: '200vp'
      });

      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Row_flexBasis_Type_021: RectValue = CommonFunc.getComponentRect('Row_flexBasis_Type_021');
      let Row_flexBasis_Type_022: RectValue = CommonFunc.getComponentRect('Row_flexBasis_Type_022');
      let Row_flexBasis_Type_023: RectValue = CommonFunc.getComponentRect('Row_flexBasis_Type_023');
      let Row_flexBasis_Type_02: RectValue = CommonFunc.getComponentRect('Row_flexBasis_Type_02');
      console.log('assert position')
      expect(Math.abs(Math.round(Row_flexBasis_Type_021.top - Row_flexBasis_Type_02.top) -
      Math.round(Row_flexBasis_Type_02.bottom - Row_flexBasis_Type_021.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Row_flexBasis_Type_022.top - Row_flexBasis_Type_02.top) -
      Math.round(Row_flexBasis_Type_02.bottom - Row_flexBasis_Type_022.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Row_flexBasis_Type_023.top - Row_flexBasis_Type_02.top) -
      Math.round(Row_flexBasis_Type_02.bottom - Row_flexBasis_Type_023.bottom)) <= 1)
        .assertTrue();

      console.log('assert space')
      expect(Math.abs((Math.round(Row_flexBasis_Type_022.left - Row_flexBasis_Type_021.right)) -
        (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(10))))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_flexBasis_Type_023.left - Row_flexBasis_Type_022.right)) -
        (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(10))))) <= 1)
        .assertTrue();


      console.log('assert height')
      expect(Math.abs((Math.round(Row_flexBasis_Type_021.bottom - Row_flexBasis_Type_021.top)) -
        (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))) <= 1)
        .assertTrue();
      console.log('Row_flexBasis_Type_021.bottom - Row_flexBasis_Type_021.top',
        Row_flexBasis_Type_021.bottom - Row_flexBasis_Type_021.top)
      expect(Math.abs((Math.round(Row_flexBasis_Type_022.bottom - Row_flexBasis_Type_022.top)) -
        (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))) <= 1)
        .assertTrue();
      console.log('Row_flexBasis_Type_022.bottom - Row_flexBasis_Type_022.top',
        Row_flexBasis_Type_022.bottom - Row_flexBasis_Type_022.top)
      expect(Math.abs((Math.round(Row_flexBasis_Type_023.bottom - Row_flexBasis_Type_023.top)) -
        (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))) <= 1)
        .assertTrue();
      console.log('Row_flexBasis_Type_023.bottom - Row_flexBasis_Type_023.top',
        Row_flexBasis_Type_023.bottom - Row_flexBasis_Type_023.top)
      console.log('assert weight')
      expect(Math.abs((Math.round(Row_flexBasis_Type_021.right - Row_flexBasis_Type_021.left)) -
        (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(200))))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_flexBasis_Type_022.right - Row_flexBasis_Type_022.left)) -
        (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_flexBasis_Type_023.right - Row_flexBasis_Type_023.left)) -
        (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))) <= 1)
        .assertTrue();
      console.info('[SUB_ACE_flexBasis_Type_TEST_static_0400] END');
      done();
    });


    /**
         * @tc.number   SUB_ACE_flexBasis_Type_TEST_static_0500
         * @tc.name     SUB_ACE_flexBasis_Type_TEST_static_0500
         * @tc.desc     SUB_ACE_flexBasis_Type_TEST_static_0500
         * @tc.level    Level.LEVEL0
         */
    it('SUB_ACE_flexBasis_Type_TEST_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_flexBasis_Type_TEST_static_0500] START');
      AppStorage.get<MessageManager<number|string>>('messageManager')?.notify({
        name: 'addflexBasis2', value: '200px'
      });

      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Row_flexBasis_Type_021: RectValue = CommonFunc.getComponentRect('Row_flexBasis_Type_021');
      let Row_flexBasis_Type_022: RectValue = CommonFunc.getComponentRect('Row_flexBasis_Type_022');
      let Row_flexBasis_Type_023: RectValue = CommonFunc.getComponentRect('Row_flexBasis_Type_023');
      let Row_flexBasis_Type_02: RectValue = CommonFunc.getComponentRect('Row_flexBasis_Type_02');
      console.log('assert position')
      expect(Math.abs(Math.round(Row_flexBasis_Type_021.top - Row_flexBasis_Type_02.top) -
      Math.round(Row_flexBasis_Type_02.bottom - Row_flexBasis_Type_021.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Row_flexBasis_Type_022.top - Row_flexBasis_Type_02.top) -
      Math.round(Row_flexBasis_Type_02.bottom - Row_flexBasis_Type_022.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Row_flexBasis_Type_023.top - Row_flexBasis_Type_02.top) -
      Math.round(Row_flexBasis_Type_02.bottom - Row_flexBasis_Type_023.bottom)) <= 1)
        .assertTrue();

      console.log('assert space')
      expect(Math.abs((Math.round(Row_flexBasis_Type_022.left - Row_flexBasis_Type_021.right)) -
        (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(10))))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_flexBasis_Type_023.left - Row_flexBasis_Type_022.right)) -
        (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(10))))) <= 1)
        .assertTrue();


      console.log('assert height')
      expect(Math.abs((Math.round(Row_flexBasis_Type_021.bottom - Row_flexBasis_Type_021.top)) -
        (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))) <= 1)
        .assertTrue();
      console.log('Row_flexBasis_Type_021.bottom - Row_flexBasis_Type_021.top',
        Row_flexBasis_Type_021.bottom - Row_flexBasis_Type_021.top)
      expect(Math.abs((Math.round(Row_flexBasis_Type_022.bottom - Row_flexBasis_Type_022.top)) -
        (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))) <= 1)
        .assertTrue();
      console.log('Row_flexBasis_Type_022.bottom - Row_flexBasis_Type_022.top',
        Row_flexBasis_Type_022.bottom - Row_flexBasis_Type_022.top)
      expect(Math.abs((Math.round(Row_flexBasis_Type_023.bottom - Row_flexBasis_Type_023.top)) -
        (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))) <= 1)
        .assertTrue();
      console.log('Row_flexBasis_Type_023.bottom - Row_flexBasis_Type_023.top',
        Row_flexBasis_Type_023.bottom - Row_flexBasis_Type_023.top)
      console.log('assert weight')
      expect(Math.abs((Math.round(Row_flexBasis_Type_021.right - Row_flexBasis_Type_021.left)) - (200)) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_flexBasis_Type_022.right - Row_flexBasis_Type_022.left)) -
        (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_flexBasis_Type_023.right - Row_flexBasis_Type_023.left)) -
        (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))) <= 1)
        .assertTrue();
      console.info('[SUB_ACE_flexBasis_Type_TEST_static_0500] END');
      done();
    });


    /**
         * @tc.number   SUB_ACE_flexBasis_Type_TEST_static_0600
         * @tc.name     SUB_ACE_flexBasis_Type_TEST_static_0600
         * @tc.desc     SUB_ACE_flexBasis_Type_TEST_static_0600
         * @tc.level    Level.LEVEL0
         */
    it('SUB_ACE_flexBasis_Type_TEST_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_flexBasis_Type_TEST_static_0600] START');
      AppStorage.get<MessageManager<number|string>>('messageManager')?.notify({
        name: 'addflexBasis2', value: '200fp'
      });
      let context = AppStorage.get<UIContext>('context') as UIContext
      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Row_flexBasis_Type_021: RectValue = CommonFunc.getComponentRect('Row_flexBasis_Type_021');
      let Row_flexBasis_Type_022: RectValue = CommonFunc.getComponentRect('Row_flexBasis_Type_022');
      let Row_flexBasis_Type_023: RectValue = CommonFunc.getComponentRect('Row_flexBasis_Type_023');
      let Row_flexBasis_Type_02: RectValue = CommonFunc.getComponentRect('Row_flexBasis_Type_02');
      console.log('assert position')
      expect(Math.abs(Math.round(Row_flexBasis_Type_021.top - Row_flexBasis_Type_02.top) -
      Math.round(Row_flexBasis_Type_02.bottom - Row_flexBasis_Type_021.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Row_flexBasis_Type_022.top - Row_flexBasis_Type_02.top) -
      Math.round(Row_flexBasis_Type_02.bottom - Row_flexBasis_Type_022.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Row_flexBasis_Type_023.top - Row_flexBasis_Type_02.top) -
      Math.round(Row_flexBasis_Type_02.bottom - Row_flexBasis_Type_023.bottom)) <= 1)
        .assertTrue();

      console.log('assert space')
      expect(Math.abs((Math.round(Row_flexBasis_Type_022.left - Row_flexBasis_Type_021.right)) -
        (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(10))))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_flexBasis_Type_023.left - Row_flexBasis_Type_022.right)) -
        (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(10))))) <= 1)
        .assertTrue();


      console.log('assert height')
      expect(Math.abs((Math.round(Row_flexBasis_Type_021.bottom - Row_flexBasis_Type_021.top)) -
        (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))) <= 1)
        .assertTrue();
      console.log('Row_flexBasis_Type_021.bottom - Row_flexBasis_Type_021.top',
        Row_flexBasis_Type_021.bottom - Row_flexBasis_Type_021.top)
      expect(Math.abs((Math.round(Row_flexBasis_Type_022.bottom - Row_flexBasis_Type_022.top)) -
        (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))) <= 1)
        .assertTrue();
      console.log('Row_flexBasis_Type_022.bottom - Row_flexBasis_Type_022.top',
        Row_flexBasis_Type_022.bottom - Row_flexBasis_Type_022.top)
      expect(Math.abs((Math.round(Row_flexBasis_Type_023.bottom - Row_flexBasis_Type_023.top)) -
        (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))) <= 1)
        .assertTrue();
      console.log('Row_flexBasis_Type_023.bottom - Row_flexBasis_Type_023.top',
        Row_flexBasis_Type_023.bottom - Row_flexBasis_Type_023.top)
      console.log('assert weight')
      expect(Math.abs((Math.round(Row_flexBasis_Type_021.right - Row_flexBasis_Type_021.left)) -
        (Math.round(context.fp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_flexBasis_Type_022.right - Row_flexBasis_Type_022.left)) -
        (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_flexBasis_Type_023.right - Row_flexBasis_Type_023.left)) -
        (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))) <= 1)
        .assertTrue();
      console.info('[SUB_ACE_flexBasis_Type_TEST_static_0600] END');
      done();
    });


    /**
         * @tc.number   SUB_ACE_flexBasis_Type_TEST_static_0700
         * @tc.name     SUB_ACE_flexBasis_Type_TEST_static_0700
         * @tc.desc     SUB_ACE_flexBasis_Type_TEST_static_0700
         * @tc.level    Level.LEVEL0
         */
    it('SUB_ACE_flexBasis_Type_TEST_static_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_flexBasis_Type_TEST_static_0700] START');
      let context = AppStorage.get<UIContext>('context') as UIContext
      AppStorage.get<MessageManager<number|string>>('messageManager')?.notify({
        name: 'addflexBasis2', value: '200lpx'
      });

      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Row_flexBasis_Type_021: RectValue = CommonFunc.getComponentRect('Row_flexBasis_Type_021');
      let Row_flexBasis_Type_022: RectValue = CommonFunc.getComponentRect('Row_flexBasis_Type_022');
      let Row_flexBasis_Type_023: RectValue = CommonFunc.getComponentRect('Row_flexBasis_Type_023');
      let Row_flexBasis_Type_02: RectValue = CommonFunc.getComponentRect('Row_flexBasis_Type_02');
      console.log('assert position')
      expect(Math.abs(Math.round(Row_flexBasis_Type_021.top - Row_flexBasis_Type_02.top) -
      Math.round(Row_flexBasis_Type_02.bottom - Row_flexBasis_Type_021.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Row_flexBasis_Type_022.top - Row_flexBasis_Type_02.top) -
      Math.round(Row_flexBasis_Type_02.bottom - Row_flexBasis_Type_022.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Row_flexBasis_Type_023.top - Row_flexBasis_Type_02.top) -
      Math.round(Row_flexBasis_Type_02.bottom - Row_flexBasis_Type_023.bottom)) <= 1)
        .assertTrue();
      console.log('Row_flexBasis_Type_021.top - Row_flexBasis_Type_02.top',
        Row_flexBasis_Type_021.top - Row_flexBasis_Type_02.top)
      console.log('Row_flexBasis_Type_022.top - Row_flexBasis_Type_02.top',
        Row_flexBasis_Type_022.top - Row_flexBasis_Type_02.top)
      console.log('Row_flexBasis_Type_023.top - Row_flexBasis_Type_02.top',
        Row_flexBasis_Type_023.top - Row_flexBasis_Type_02.top)

      console.log('assert space')
      expect(Math.abs((Math.round(Row_flexBasis_Type_022.left - Row_flexBasis_Type_021.right)) -
        (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(10))))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_flexBasis_Type_023.left - Row_flexBasis_Type_022.right)) -
        (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(10))))) <= 1)
        .assertTrue();


      console.log('assert height')
      expect(Math.abs((Math.round(Row_flexBasis_Type_021.bottom - Row_flexBasis_Type_021.top)) -
        (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))) <= 1)
        .assertTrue();
      console.log('Row_flexBasis_Type_021.bottom - Row_flexBasis_Type_021.top',
        Row_flexBasis_Type_021.bottom - Row_flexBasis_Type_021.top)
      expect(Math.abs((Math.round(Row_flexBasis_Type_022.bottom - Row_flexBasis_Type_022.top)) -
        (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))) <= 1)
        .assertTrue();
      console.log('Row_flexBasis_Type_022.bottom - Row_flexBasis_Type_022.top',
        Row_flexBasis_Type_022.bottom - Row_flexBasis_Type_022.top)
      expect(Math.abs((Math.round(Row_flexBasis_Type_023.bottom - Row_flexBasis_Type_023.top)) -
        (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))) <= 1)
        .assertTrue();
      console.log('Row_flexBasis_Type_023.bottom - Row_flexBasis_Type_023.top',
        Row_flexBasis_Type_023.bottom - Row_flexBasis_Type_023.top)
      console.log('assert weight')
      expect(Math.abs((Math.round(Row_flexBasis_Type_021.right - Row_flexBasis_Type_021.left)) -
        (Math.round(context.lpx2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_flexBasis_Type_022.right - Row_flexBasis_Type_022.left)) -
        (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_flexBasis_Type_023.right - Row_flexBasis_Type_023.left)) -
        (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))) <= 1)
        .assertTrue();
      console.info('[SUB_ACE_flexBasis_Type_TEST_static_0700] END');
      done();
    });
  })
}