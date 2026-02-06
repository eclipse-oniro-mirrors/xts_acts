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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level} from '../../../../../hypium/index';
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
let testAbilityContext:common.UIAbilityContext;

export default function Row_Space_String() {
  describe('Row_Space_String', () => {
    beforeAll(() => {
      console.info("Row_Space_String beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.layout.split04.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("Row_Space_String beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Row/spaceChanged/Row_Space_String",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get Row_Space_String state pages:" + "");
        if (!("Row_Space_String" == pages.name)) {
          console.info("get Row_Space_String pages.name:" + "");
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push Row_Space_String page error " + JSON.stringify(err));
        expect().assertFail();
      }
    });
    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("Row_Space_String after each called")
    });

    
    
    

/**
     * @tc.number   SUB_ACE_Row_Space_String_TEST_static_0100
     * @tc.name     SUB_ACE_Row_Space_String_TEST_static_0100
     * @tc.desc     SUB_ACE_Row_Space_String_TEST_static_0100
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_Row_Space_String_TEST_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_Row_Space_String_TEST_static_0100] START');
      AppStorage.get<MessageManager<string>>('messageManager')?.notify({
        name: 'addSpace', value: '30vp'
      });
      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Row_Space_String_011: RectValue = CommonFunc.getComponentRect('Row_Space_String_011');
      let Row_Space_String_012: RectValue = CommonFunc.getComponentRect('Row_Space_String_012');
      let Row_Space_String_013: RectValue = CommonFunc.getComponentRect('Row_Space_String_013');
      let Row_Space_String_01: RectValue = CommonFunc.getComponentRect('Row_Space_String_01');

      console.log('assert position')
      expect(Math.abs(Math.round(Row_Space_String_011.top - Row_Space_String_01.top) - Math.round(Row_Space_String_01.bottom - Row_Space_String_011.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Row_Space_String_012.top - Row_Space_String_01.top) - Math.round(Row_Space_String_01.bottom - Row_Space_String_012.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Row_Space_String_013.top - Row_Space_String_01.top) - Math.round(Row_Space_String_01.bottom - Row_Space_String_013.bottom)) <= 1)
        .assertTrue();

      console.log('assert space')
      expect(Math.abs((Math.round(Row_Space_String_012.left - Row_Space_String_011.right)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(30))))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_String_013.left - Row_Space_String_012.right)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(30))))) <= 1)
        .assertTrue();
      console.log('Row_Space_String_012.left - Row_Space_String_011.right', Row_Space_String_012.left - Row_Space_String_011.right)
      console.log('Row_Space_String_013.left - Row_Space_String_012.right', Row_Space_String_013.left - Row_Space_String_012.right)


      console.log('assert height')
      expect(Math.abs((Math.round(Row_Space_String_011.bottom - Row_Space_String_011.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50))))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_String_012.bottom - Row_Space_String_012.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_String_013.bottom - Row_Space_String_013.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))))) <= 1)
        .assertTrue();
      console.log('assert weight')
      expect(Math.abs((Math.round(Row_Space_String_011.right - Row_Space_String_011.left)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50))))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_String_012.right - Row_Space_String_012.left)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_String_013.right - Row_Space_String_013.left)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))))) <= 1)
        .assertTrue();
      console.info('[SUB_ACE_Row_Space_String_TEST_static_0100] END');
      done();
    });


    
    
    

/**
     * @tc.number   SUB_ACE_Row_Space_String_TEST_static_0200
     * @tc.name     SUB_ACE_Row_Space_String_TEST_static_0200
     * @tc.desc     SUB_ACE_Row_Space_String_TEST_static_0200
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_Row_Space_String_TEST_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_Row_Space_String_TEST_static_0200] START');
      AppStorage.get<MessageManager<string>>('messageManager')?.notify({
        name: 'addSpace', value: '30'
      });
      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Row_Space_String_011: RectValue = CommonFunc.getComponentRect('Row_Space_String_011');
      let Row_Space_String_012: RectValue = CommonFunc.getComponentRect('Row_Space_String_012');
      let Row_Space_String_013: RectValue = CommonFunc.getComponentRect('Row_Space_String_013');
      let Row_Space_String_01: RectValue = CommonFunc.getComponentRect('Row_Space_String_01');

      console.log('assert position')
      expect(Math.abs(Math.round(Row_Space_String_011.top - Row_Space_String_01.top) - Math.round(Row_Space_String_01.bottom - Row_Space_String_011.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Row_Space_String_012.top - Row_Space_String_01.top) - Math.round(Row_Space_String_01.bottom - Row_Space_String_012.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Row_Space_String_013.top - Row_Space_String_01.top) - Math.round(Row_Space_String_01.bottom - Row_Space_String_013.bottom)) <= 1)
        .assertTrue();

      console.log('assert space')
      expect(Math.abs((Math.round(Row_Space_String_012.left - Row_Space_String_011.right)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(30))))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_String_013.left - Row_Space_String_012.right)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(30))))) <= 1)
        .assertTrue();
      console.log('Row_Space_String_012.left - Row_Space_String_011.right', Row_Space_String_012.left - Row_Space_String_011.right)
      console.log('Row_Space_String_013.left - Row_Space_String_012.right', Row_Space_String_013.left - Row_Space_String_012.right)


      console.log('assert height')
      expect(Math.abs((Math.round(Row_Space_String_011.bottom - Row_Space_String_011.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50))))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_String_012.bottom - Row_Space_String_012.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_String_013.bottom - Row_Space_String_013.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))))) <= 1)
        .assertTrue();
      console.log('assert weight')
      expect(Math.abs((Math.round(Row_Space_String_011.right - Row_Space_String_011.left)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50))))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_String_012.right - Row_Space_String_012.left)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_String_013.right - Row_Space_String_013.left)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))))) <= 1)
        .assertTrue();
      console.info('[SUB_ACE_Row_Space_String_TEST_static_0200] END');
      done();
    });

    
    
    

/**
     * @tc.number   SUB_ACE_Row_Space_String_TEST_static_0300
     * @tc.name     SUB_ACE_Row_Space_String_TEST_static_0300
     * @tc.desc     SUB_ACE_Row_Space_String_TEST_static_0300
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_Row_Space_String_TEST_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_Row_Space_String_TEST_static_0300] START');
      AppStorage.get<MessageManager<string>>('messageManager')?.notify({
        name: 'addSpace', value: '50px'
      });
      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Row_Space_String_011: RectValue = CommonFunc.getComponentRect('Row_Space_String_011');
      let Row_Space_String_012: RectValue = CommonFunc.getComponentRect('Row_Space_String_012');
      let Row_Space_String_013: RectValue = CommonFunc.getComponentRect('Row_Space_String_013');
      let Row_Space_String_01: RectValue = CommonFunc.getComponentRect('Row_Space_String_01');

      console.log('assert position')
      expect(Math.abs(Math.round(Row_Space_String_011.top - Row_Space_String_01.top) - Math.round(Row_Space_String_01.bottom - Row_Space_String_011.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Row_Space_String_012.top - Row_Space_String_01.top) - Math.round(Row_Space_String_01.bottom - Row_Space_String_012.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Row_Space_String_013.top - Row_Space_String_01.top) - Math.round(Row_Space_String_01.bottom - Row_Space_String_013.bottom)) <= 1)
        .assertTrue();

      console.log('assert space')
      expect(Math.abs((Math.round(Row_Space_String_012.left - Row_Space_String_011.right)) - (50)) <= 1).assertTrue();
      expect(Math.abs((Math.round(Row_Space_String_013.left - Row_Space_String_012.right)) - (50)) <= 1).assertTrue();
      console.log('Row_Space_String_012.left - Row_Space_String_011.right', Row_Space_String_012.left - Row_Space_String_011.right)
      console.log('Row_Space_String_013.left - Row_Space_String_012.right', Row_Space_String_013.left - Row_Space_String_012.right)


      console.log('assert height')
      expect(Math.abs((Math.round(Row_Space_String_011.bottom - Row_Space_String_011.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50))))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_String_012.bottom - Row_Space_String_012.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_String_013.bottom - Row_Space_String_013.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))))) <= 1)
        .assertTrue();
      console.log('assert weight')
      expect(Math.abs((Math.round(Row_Space_String_011.right - Row_Space_String_011.left)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50))))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_String_012.right - Row_Space_String_012.left)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_String_013.right - Row_Space_String_013.left)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))))) <= 1)
        .assertTrue();
      console.info('[SUB_ACE_Row_Space_String_TEST_static_0300] END');
      done();
    });

    
    
    

/**
     * @tc.number   SUB_ACE_Row_Space_String_TEST_static_0400
     * @tc.name     SUB_ACE_Row_Space_String_TEST_static_0400
     * @tc.desc     SUB_ACE_Row_Space_String_TEST_static_0400
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_Row_Space_String_TEST_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_Row_Space_String_TEST_static_0400] START');
     let context = AppStorage.get<UIContext>('context') as UIContext
      AppStorage.get<MessageManager<string>>('messageManager')?.notify({
        name: 'addSpace', value: '70fp'
      });
      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Row_Space_String_011: RectValue = CommonFunc.getComponentRect('Row_Space_String_011');
      let Row_Space_String_012: RectValue = CommonFunc.getComponentRect('Row_Space_String_012');
      let Row_Space_String_013: RectValue = CommonFunc.getComponentRect('Row_Space_String_013');
      let Row_Space_String_01: RectValue = CommonFunc.getComponentRect('Row_Space_String_01');

      console.log('assert position')
      expect(Math.abs(Math.round(Row_Space_String_011.top - Row_Space_String_01.top) - Math.round(Row_Space_String_01.bottom - Row_Space_String_011.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Row_Space_String_012.top - Row_Space_String_01.top) - Math.round(Row_Space_String_01.bottom - Row_Space_String_012.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Row_Space_String_013.top - Row_Space_String_01.top) - Math.round(Row_Space_String_01.bottom - Row_Space_String_013.bottom)) <= 1)
        .assertTrue();

      console.log('assert space')
      expect(Math.abs((Math.round(Row_Space_String_012.left - Row_Space_String_011.right)) - (Math.round(context.fp2px(70)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_String_013.left - Row_Space_String_012.right)) - (Math.round(context.fp2px(70)))) <= 1)
        .assertTrue();
      console.log('Row_Space_String_012.left - Row_Space_String_011.right', Row_Space_String_012.left - Row_Space_String_011.right)
      console.log('Row_Space_String_013.left - Row_Space_String_012.right', Row_Space_String_013.left - Row_Space_String_012.right)


      console.log('assert height')
      expect(Math.abs((Math.round(Row_Space_String_011.bottom - Row_Space_String_011.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50))))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_String_012.bottom - Row_Space_String_012.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_String_013.bottom - Row_Space_String_013.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))))) <= 1)
        .assertTrue();
      console.log('assert weight')
      expect(Math.abs((Math.round(Row_Space_String_011.right - Row_Space_String_011.left)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50))))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_String_012.right - Row_Space_String_012.left)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_String_013.right - Row_Space_String_013.left)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))))) <= 1)
        .assertTrue();
      console.info('[SUB_ACE_Row_Space_String_TEST_static_0400] END');
      done();
    });

    
    
    

/**
     * @tc.number   SUB_ACE_Row_Space_String_TEST_static_0500
     * @tc.name     SUB_ACE_Row_Space_String_TEST_static_0500
     * @tc.desc     SUB_ACE_Row_Space_String_TEST_static_0500
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_Row_Space_String_TEST_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_Row_Space_String_TEST_static_0500] START');
      let context = AppStorage.get<UIContext>('context') as UIContext
      AppStorage.get<MessageManager<string>>('messageManager')?.notify({
        name: 'addSpace', value: '70lpx'
      });
      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Row_Space_String_011: RectValue = CommonFunc.getComponentRect('Row_Space_String_011');
      let Row_Space_String_012: RectValue = CommonFunc.getComponentRect('Row_Space_String_012');
      let Row_Space_String_013: RectValue = CommonFunc.getComponentRect('Row_Space_String_013');
      let Row_Space_String_01: RectValue = CommonFunc.getComponentRect('Row_Space_String_01');

      console.log('assert position')
      expect(Math.abs(Math.round(Row_Space_String_011.top - Row_Space_String_01.top) - Math.round(Row_Space_String_01.bottom - Row_Space_String_011.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Row_Space_String_012.top - Row_Space_String_01.top) - Math.round(Row_Space_String_01.bottom - Row_Space_String_012.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Row_Space_String_013.top - Row_Space_String_01.top) - Math.round(Row_Space_String_01.bottom - Row_Space_String_013.bottom)) <= 1)
        .assertTrue();
      console.log('Row_Space_String_011.top - Row_Space_String_01.top', Row_Space_String_011.top - Row_Space_String_01.top)
      console.log('Row_Space_String_012.top - Row_Space_String_01.top', Row_Space_String_012.top - Row_Space_String_01.top)
      console.log('Row_Space_String_013.top - Row_Space_String_01.top', Row_Space_String_013.top - Row_Space_String_01.top)

      console.log('assert space')
      expect(Math.abs((Math.round(Row_Space_String_012.left - Row_Space_String_011.right)) - (Math.round(context.lpx2px(70)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_String_013.left - Row_Space_String_012.right)) - (Math.round(context.lpx2px(70)))) <= 1)
        .assertTrue();
      console.log('Row_Space_String_012.left - Row_Space_String_011.right', Row_Space_String_012.left - Row_Space_String_011.right)
      console.log('Row_Space_String_013.left - Row_Space_String_012.right', Row_Space_String_013.left - Row_Space_String_012.right)


      console.log('assert height')
      expect(Math.abs((Math.round(Row_Space_String_011.bottom - Row_Space_String_011.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50))))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_String_012.bottom - Row_Space_String_012.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_String_013.bottom - Row_Space_String_013.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))))) <= 1)
        .assertTrue();
      console.log('assert weight')
      expect(Math.abs((Math.round(Row_Space_String_011.right - Row_Space_String_011.left)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50))))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_String_012.right - Row_Space_String_012.left)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_String_013.right - Row_Space_String_013.left)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))))) <= 1)
        .assertTrue();
      console.info('[SUB_ACE_Row_Space_String_TEST_static_0500] END');
      done();
    });

    
    
    

/**
     * @tc.number   SUB_ACE_Row_Space_String_TEST_static_0600
     * @tc.name     SUB_ACE_Row_Space_String_TEST_static_0600
     * @tc.desc     SUB_ACE_Row_Space_String_TEST_static_0600
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_Row_Space_String_TEST_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_Row_Space_String_TEST_static_0600] START');
      AppStorage.get<MessageManager<string>>('messageManager')?.notify({
        name: 'addSpace', value: Number(AppStorage.get<UIContext>('uiContext')?.vp2px(10)) + 'px'
      });
      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Row_Space_String_011: RectValue = CommonFunc.getComponentRect('Row_Space_String_011');
      let Row_Space_String_012: RectValue = CommonFunc.getComponentRect('Row_Space_String_012');
      let Row_Space_String_013: RectValue = CommonFunc.getComponentRect('Row_Space_String_013');
      let Row_Space_String_01: RectValue = CommonFunc.getComponentRect('Row_Space_String_01');

      console.log('assert position')
      expect(Math.abs(Math.round(Row_Space_String_011.top - Row_Space_String_01.top) - Math.round(Row_Space_String_01.bottom - Row_Space_String_011.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Row_Space_String_012.top - Row_Space_String_01.top) - Math.round(Row_Space_String_01.bottom - Row_Space_String_012.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Row_Space_String_013.top - Row_Space_String_01.top) - Math.round(Row_Space_String_01.bottom - Row_Space_String_013.bottom)) <= 1)
        .assertTrue();
      console.log('assert space')
      expect(Math.abs((Math.round(Row_Space_String_012.left - Row_Space_String_011.right)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(10))))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_String_013.left - Row_Space_String_012.right)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(10))))) <= 1)
        .assertTrue();
      console.log('Row_Space_String_012.left - Row_Space_String_011.right', Row_Space_String_012.left - Row_Space_String_011.right)
      console.log('Row_Space_String_013.left - Row_Space_String_012.right', Row_Space_String_013.left - Row_Space_String_012.right)


      console.log('assert height')
      expect(Math.abs((Math.round(Row_Space_String_011.bottom - Row_Space_String_011.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50))))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_String_012.bottom - Row_Space_String_012.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_String_013.bottom - Row_Space_String_013.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))))) <= 1)
        .assertTrue();
      console.log('assert weight')
      expect(Math.abs((Math.round(Row_Space_String_011.right - Row_Space_String_011.left)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50))))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_String_012.right - Row_Space_String_012.left)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_String_013.right - Row_Space_String_013.left)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))))) <= 1)
        .assertTrue();
      console.info('[SUB_ACE_Row_Space_String_TEST_static_0600] END');
      done();
    });

    
    
    

/**
     * @tc.number   SUB_ACE_Row_Space_String_TEST_static_0700
     * @tc.name     SUB_ACE_Row_Space_String_TEST_static_0700
     * @tc.desc     SUB_ACE_Row_Space_String_TEST_static_0700
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_Row_Space_String_TEST_static_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {

      let context = AppStorage.get<UIContext>('context') as UIContext
      console.info('[SUB_ACE_Row_Space_String_TEST_0700] START');
      AppStorage.get<MessageManager<string>>('messageManager')?.notify({
        name: 'addSpace', value: context.px2vp(10) + 'vp'
      });

      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Row_Space_String_011: RectValue = CommonFunc.getComponentRect('Row_Space_String_011');
      let Row_Space_String_012: RectValue = CommonFunc.getComponentRect('Row_Space_String_012');
      let Row_Space_String_013: RectValue = CommonFunc.getComponentRect('Row_Space_String_013');
      let Row_Space_String_01: RectValue = CommonFunc.getComponentRect('Row_Space_String_01');

      console.log('assert position')
      expect(Math.abs(Math.round(Row_Space_String_011.top - Row_Space_String_01.top) - Math.round(Row_Space_String_01.bottom - Row_Space_String_011.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Row_Space_String_012.top - Row_Space_String_01.top) - Math.round(Row_Space_String_01.bottom - Row_Space_String_012.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Row_Space_String_013.top - Row_Space_String_01.top) - Math.round(Row_Space_String_01.bottom - Row_Space_String_013.bottom)) <= 1)
        .assertTrue();

      console.log('assert space')
      expect(Math.abs((Math.round(Row_Space_String_012.left - Row_Space_String_011.right)) - (10)) <= 1).assertTrue();
      expect(Math.abs((Math.round(Row_Space_String_013.left - Row_Space_String_012.right)) - (10)) <= 1).assertTrue();
      console.log('Row_Space_String_012.left - Row_Space_String_011.right', Row_Space_String_012.left - Row_Space_String_011.right)
      console.log('Row_Space_String_013.left - Row_Space_String_012.right', Row_Space_String_013.left - Row_Space_String_012.right)

      console.log('assert height')
      expect(Math.abs((Math.round(Row_Space_String_011.bottom - Row_Space_String_011.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50))))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_String_012.bottom - Row_Space_String_012.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_String_013.bottom - Row_Space_String_013.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))))) <= 1)
        .assertTrue();
      console.log('assert weight')
      expect(Math.abs((Math.round(Row_Space_String_011.right - Row_Space_String_011.left)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50))))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_String_012.right - Row_Space_String_012.left)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_String_013.right - Row_Space_String_013.left)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))))) <= 1)
        .assertTrue();
      console.info('[SUB_ACE_Row_Space_String_TEST_static_0700] END');
      done();
    });

    
    
    

/**
     * @tc.number   SUB_ACE_Row_Space_String_TEST_static_0800
     * @tc.name     SUB_ACE_Row_Space_String_TEST_static_0800
     * @tc.desc     SUB_ACE_Row_Space_String_TEST_static_0800
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_Row_Space_String_TEST_static_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let context = AppStorage.get<UIContext>('context') as UIContext
      console.info('[SUB_ACE_Row_Space_String_TEST_static_0800] START');
      AppStorage.get<MessageManager<string>>('messageManager')?.notify({
        name: 'addSpace', value: context.fp2px(10) + 'px'
      });

      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Row_Space_String_011: RectValue = CommonFunc.getComponentRect('Row_Space_String_011');
      let Row_Space_String_012: RectValue = CommonFunc.getComponentRect('Row_Space_String_012');
      let Row_Space_String_013: RectValue = CommonFunc.getComponentRect('Row_Space_String_013');
      let Row_Space_String_01: RectValue = CommonFunc.getComponentRect('Row_Space_String_01');

      console.log('assert position')
      expect(Math.abs(Math.round(Row_Space_String_011.top - Row_Space_String_01.top) - Math.round(Row_Space_String_01.bottom - Row_Space_String_011.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Row_Space_String_012.top - Row_Space_String_01.top) - Math.round(Row_Space_String_01.bottom - Row_Space_String_012.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Row_Space_String_013.top - Row_Space_String_01.top) - Math.round(Row_Space_String_01.bottom - Row_Space_String_013.bottom)) <= 1)
        .assertTrue();
      console.log('assert space')
      expect(Math.abs((Math.round(Row_Space_String_012.left - Row_Space_String_011.right)) - (Math.round(context.fp2px(10)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_String_013.left - Row_Space_String_012.right)) - (Math.round(context.fp2px(10)))) <= 1)
        .assertTrue();
      console.log('Row_Space_String_012.left - Row_Space_String_011.right', Row_Space_String_012.left - Row_Space_String_011.right)
      console.log('Row_Space_String_013.left - Row_Space_String_012.right', Row_Space_String_013.left - Row_Space_String_012.right)


      console.log('assert height')
      expect(Math.abs((Math.round(Row_Space_String_011.bottom - Row_Space_String_011.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50))))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_String_012.bottom - Row_Space_String_012.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_String_013.bottom - Row_Space_String_013.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))))) <= 1)
        .assertTrue();
      console.log('assert weight')
      expect(Math.abs((Math.round(Row_Space_String_011.right - Row_Space_String_011.left)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50))))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_String_012.right - Row_Space_String_012.left)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_String_013.right - Row_Space_String_013.left)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))))) <= 1)
        .assertTrue();
      console.info('[SUB_ACE_Row_Space_String_TEST_static_0800] END');
      done();
    });

    
    
    

/**
     * @tc.number   SUB_ACE_Row_Space_String_TEST_static_0900
     * @tc.name     SUB_ACE_Row_Space_String_TEST_static_0900
     * @tc.desc     SUB_ACE_Row_Space_String_TEST_static_0900
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_Row_Space_String_TEST_static_0900', Level.LEVEL0, async (done: () => void): Promise<void> => {

     let context = AppStorage.get<UIContext>('context') as UIContext
      console.info('[SUB_ACE_Row_Space_String_TEST_static_0900] START');
      AppStorage.get<MessageManager<string>>('messageManager')?.notify({
        name: 'addSpace', value: context.px2fp(10) + 'fp'
      });

      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Row_Space_String_011: RectValue = CommonFunc.getComponentRect('Row_Space_String_011');
      let Row_Space_String_012: RectValue = CommonFunc.getComponentRect('Row_Space_String_012');
      let Row_Space_String_013: RectValue = CommonFunc.getComponentRect('Row_Space_String_013');
      let Row_Space_String_01: RectValue = CommonFunc.getComponentRect('Row_Space_String_01');

      console.log('assert position')
      expect(Math.abs(Math.round(Row_Space_String_011.top - Row_Space_String_01.top) - Math.round(Row_Space_String_01.bottom - Row_Space_String_011.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Row_Space_String_012.top - Row_Space_String_01.top) - Math.round(Row_Space_String_01.bottom - Row_Space_String_012.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Row_Space_String_013.top - Row_Space_String_01.top) - Math.round(Row_Space_String_01.bottom - Row_Space_String_013.bottom)) <= 1)
        .assertTrue();

      console.log('assert space')
      expect(Math.abs((Math.round(Row_Space_String_012.left - Row_Space_String_011.right)) - (10)) <= 1).assertTrue();
      expect(Math.abs((Math.round(Row_Space_String_013.left - Row_Space_String_012.right)) - (10)) <= 1).assertTrue();
      console.log('Row_Space_String_012.left - Row_Space_String_011.right', Row_Space_String_012.left - Row_Space_String_011.right)
      console.log('Row_Space_String_013.left - Row_Space_String_012.right', Row_Space_String_013.left - Row_Space_String_012.right)

      console.log('assert height')
      expect(Math.abs((Math.round(Row_Space_String_011.bottom - Row_Space_String_011.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50))))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_String_012.bottom - Row_Space_String_012.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_String_013.bottom - Row_Space_String_013.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))))) <= 1)
        .assertTrue();
      console.log('assert weight')
      expect(Math.abs((Math.round(Row_Space_String_011.right - Row_Space_String_011.left)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50))))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_String_012.right - Row_Space_String_012.left)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_String_013.right - Row_Space_String_013.left)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))))) <= 1)
        .assertTrue();
      console.info('[SUB_ACE_Row_Space_String_TEST_static_0900] END');
      done();
    });

    
    
    

/**
     * @tc.number   SUB_ACE_Row_Space_String_TEST_static_1000
     * @tc.name     SUB_ACE_Row_Space_String_TEST_static_1000
     * @tc.desc     SUB_ACE_Row_Space_String_TEST_static_1000
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_Row_Space_String_TEST_static_1000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let context = AppStorage.get<UIContext>('context') as UIContext
      console.info('[SUB_ACE_Row_Space_String_TEST_static_1000] START');
      AppStorage.get<MessageManager<string>>('messageManager')?.notify({
        name: 'addSpace', value: context.lpx2px(10) + 'px'
      });

      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Row_Space_String_011: RectValue = CommonFunc.getComponentRect('Row_Space_String_011');
      let Row_Space_String_012: RectValue = CommonFunc.getComponentRect('Row_Space_String_012');
      let Row_Space_String_013: RectValue = CommonFunc.getComponentRect('Row_Space_String_013');
      let Row_Space_String_01: RectValue = CommonFunc.getComponentRect('Row_Space_String_01');

      console.log('assert position')
      expect(Math.abs(Math.round(Row_Space_String_011.top - Row_Space_String_01.top) - Math.round(Row_Space_String_01.bottom - Row_Space_String_011.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Row_Space_String_012.top - Row_Space_String_01.top) - Math.round(Row_Space_String_01.bottom - Row_Space_String_012.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Row_Space_String_013.top - Row_Space_String_01.top) - Math.round(Row_Space_String_01.bottom - Row_Space_String_013.bottom)) <= 1)
        .assertTrue();

      console.log('assert space')
      expect(Math.abs((Math.round(Row_Space_String_012.left - Row_Space_String_011.right)) - (Math.round(context.lpx2px(10)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_String_013.left - Row_Space_String_012.right)) - (Math.round(context.lpx2px(10)))) <= 1)
        .assertTrue();
      console.log('Row_Space_String_012.left - Row_Space_String_011.right', Row_Space_String_012.left - Row_Space_String_011.right)
      console.log('Row_Space_String_013.left - Row_Space_String_012.right', Row_Space_String_013.left - Row_Space_String_012.right)


      console.log('assert height')
      expect(Math.abs((Math.round(Row_Space_String_011.bottom - Row_Space_String_011.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50))))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_String_012.bottom - Row_Space_String_012.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_String_013.bottom - Row_Space_String_013.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))))) <= 1)
        .assertTrue();
      console.log('assert weight')
      expect(Math.abs((Math.round(Row_Space_String_011.right - Row_Space_String_011.left)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50))))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_String_012.right - Row_Space_String_012.left)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_String_013.right - Row_Space_String_013.left)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))))) <= 1)
        .assertTrue();
      console.info('[SUB_ACE_Row_Space_String_TEST_static_1000] END');
      done();
    });

    
    
    

/**
     * @tc.number   SUB_ACE_Row_Space_String_TEST_static_1100
     * @tc.name     SUB_ACE_Row_Space_String_TEST_static_1100
     * @tc.desc     SUB_ACE_Row_Space_String_TEST_static_1100
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_Row_Space_String_TEST_static_1100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let context = AppStorage.get<UIContext>('context') as UIContext
      console.info('[SUB_ACE_Row_Space_String_TEST_1100] START');
      AppStorage.get<MessageManager<string>>('messageManager')?.notify({
        name: 'addSpace', value: context.px2lpx(10) + 'lpx'
      });

      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Row_Space_String_011: RectValue = CommonFunc.getComponentRect('Row_Space_String_011');
      let Row_Space_String_012: RectValue = CommonFunc.getComponentRect('Row_Space_String_012');
      let Row_Space_String_013: RectValue = CommonFunc.getComponentRect('Row_Space_String_013');
      let Row_Space_String_01: RectValue = CommonFunc.getComponentRect('Row_Space_String_01');

      console.log('assert position')
      expect(Math.abs(Math.round(Row_Space_String_011.top - Row_Space_String_01.top) - Math.round(Row_Space_String_01.bottom - Row_Space_String_011.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Row_Space_String_012.top - Row_Space_String_01.top) - Math.round(Row_Space_String_01.bottom - Row_Space_String_012.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Row_Space_String_013.top - Row_Space_String_01.top) - Math.round(Row_Space_String_01.bottom - Row_Space_String_013.bottom)) <= 1)
        .assertTrue();
      console.log('Row_Space_String_011.top - Row_Space_String_01.top', Row_Space_String_011.top - Row_Space_String_01.top)
      console.log('Row_Space_String_012.top - Row_Space_String_01.top', Row_Space_String_012.top - Row_Space_String_01.top)
      console.log('Row_Space_String_013.top - Row_Space_String_01.top', Row_Space_String_013.top - Row_Space_String_01.top)

      console.log('assert space')
      expect(Math.abs((Math.round(Row_Space_String_012.left - Row_Space_String_011.right)) - (10)) <= 1).assertTrue();
      expect(Math.abs((Math.round(Row_Space_String_013.left - Row_Space_String_012.right)) - (10)) <= 1).assertTrue();
      console.log('Row_Space_String_012.left - Row_Space_String_011.right', Row_Space_String_012.left - Row_Space_String_011.right)
      console.log('Row_Space_String_013.left - Row_Space_String_012.right', Row_Space_String_013.left - Row_Space_String_012.right)

      console.log('assert height')
      expect(Math.abs((Math.round(Row_Space_String_011.bottom - Row_Space_String_011.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50))))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_String_012.bottom - Row_Space_String_012.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_String_013.bottom - Row_Space_String_013.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))))) <= 1)
        .assertTrue();
      console.log('assert weight')
      expect(Math.abs((Math.round(Row_Space_String_011.right - Row_Space_String_011.left)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50))))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_String_012.right - Row_Space_String_012.left)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_String_013.right - Row_Space_String_013.left)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))))) <= 1)
        .assertTrue();
      console.info('[SUB_ACE_Row_Space_String_TEST_static_1100] END');
      done();
    });

    
    
    

/**
     * @tc.number   SUB_ACE_Row_Space_String_TEST_static_1200
     * @tc.name     SUB_ACE_Row_Space_String_TEST_static_1200
     * @tc.desc     SUB_ACE_Row_Space_String_TEST_static_1200
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_Row_Space_String_TEST_static_1200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_Row_Space_String_TEST_static_1200] START');
      AppStorage.get<MessageManager<string>>('messageManager')?.notify({
        name: 'addSpace', value: '3' + '0'
      });

      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Row_Space_String_011: RectValue = CommonFunc.getComponentRect('Row_Space_String_011');
      let Row_Space_String_012: RectValue = CommonFunc.getComponentRect('Row_Space_String_012');
      let Row_Space_String_013: RectValue = CommonFunc.getComponentRect('Row_Space_String_013');
      let Row_Space_String_01: RectValue = CommonFunc.getComponentRect('Row_Space_String_01');

      console.log('assert position')
      expect(Math.abs(Math.round(Row_Space_String_011.top - Row_Space_String_01.top) - Math.round(Row_Space_String_01.bottom - Row_Space_String_011.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Row_Space_String_012.top - Row_Space_String_01.top) - Math.round(Row_Space_String_01.bottom - Row_Space_String_012.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Row_Space_String_013.top - Row_Space_String_01.top) - Math.round(Row_Space_String_01.bottom - Row_Space_String_013.bottom)) <= 1)
        .assertTrue();

      console.log('assert space')
      expect(Math.abs((Math.round(Row_Space_String_012.left - Row_Space_String_011.right)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(30))))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_String_013.left - Row_Space_String_012.right)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(30))))) <= 1)
        .assertTrue();
      console.log('Row_Space_String_012.left - Row_Space_String_011.right', Row_Space_String_012.left - Row_Space_String_011.right)
      console.log('Row_Space_String_013.left - Row_Space_String_012.right', Row_Space_String_013.left - Row_Space_String_012.right)


      console.log('assert height')
      expect(Math.abs((Math.round(Row_Space_String_011.bottom - Row_Space_String_011.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50))))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_String_012.bottom - Row_Space_String_012.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_String_013.bottom - Row_Space_String_013.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))))) <= 1)
        .assertTrue();
      console.log('assert weight')
      expect(Math.abs((Math.round(Row_Space_String_011.right - Row_Space_String_011.left)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50))))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_String_012.right - Row_Space_String_012.left)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_String_013.right - Row_Space_String_013.left)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))))) <= 1)
        .assertTrue();
      console.info('[SUB_ACE_Row_Space_String_TEST_static_1200] END');
      done();
    });

  })
}