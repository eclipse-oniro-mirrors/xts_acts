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

export default function Row_flexShrink_Part() {
  describe('Row_flexShrink_Part', () => {
    beforeAll(async() => {
      console.info("Row_flexShrink_Part beforeAll start");
   
      await UtilsTest.startAbility("com.arkui.ace.layout.split04.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("Row_flexShrink_Part beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Row/flexShrink/Row_flexShrink_Part",
      };
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get Row_flexShrink_Part state pages:" + "");
        if (!("Row_flexShrink_Part" == pages.name)) {
          console.info("get Row_flexShrink_Part pages.name:" + "");
          
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          
        }
      } catch (err) {
        console.error("push Row_flexShrink_Part page error " + JSON.stringify(err));
        expect().assertFail();
      }
    });
    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("Row_flexShrink_Part after each called")
    });
    
    
    

/**
     * @tc.number   SUB_ACE_Row_flexShrink_Part_TEST_static_0100
     * @tc.name     SUB_ACE_Row_flexShrink_Part_TEST_static_0100
     * @tc.desc     SUB_ACE_Row_flexShrink_Part_TEST_static_0100
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_Row_flexShrink_Part_TEST_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_Row_flexShrink_Part_TEST_static_0100] START');
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'addflexShrink', value: 1
      });

      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Row_flexShrink_Part_011: RectValue = CommonFunc.getComponentRect('Row_flexShrink_Part_011');
      let Row_flexShrink_Part_012: RectValue = CommonFunc.getComponentRect('Row_flexShrink_Part_012');
      let Row_flexShrink_Part_013: RectValue = CommonFunc.getComponentRect('Row_flexShrink_Part_013');
      let Row_flexShrink_Part_01: RectValue = CommonFunc.getComponentRect('Row_flexShrink_Part_01');

      console.log('assert position')
      expect(Math.abs(Math.round(Row_flexShrink_Part_011.top - Row_flexShrink_Part_01.top) - Math.round(Row_flexShrink_Part_01.bottom - Row_flexShrink_Part_011.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Row_flexShrink_Part_012.top - Row_flexShrink_Part_01.top) - Math.round(Row_flexShrink_Part_01.bottom - Row_flexShrink_Part_012.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Row_flexShrink_Part_013.top - Row_flexShrink_Part_01.top) - Math.round(Row_flexShrink_Part_01.bottom - Row_flexShrink_Part_013.bottom)) <= 1)
        .assertTrue();

      console.log('assert space')
      expect(Math.abs((Math.round(Row_flexShrink_Part_012.left - Row_flexShrink_Part_011.right)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(10))))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_flexShrink_Part_013.left - Row_flexShrink_Part_012.right)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(10))))) <= 1)
        .assertTrue();
      console.log('Row_flexShrink_Part_012.left - Row_flexShrink_Part_011.right', Row_flexShrink_Part_012.left - Row_flexShrink_Part_011.right)
      console.log('Row_flexShrink_Part_013.left - Row_flexShrink_Part_012.right', Row_flexShrink_Part_013.left - Row_flexShrink_Part_012.right)

      console.log('assert height')
      expect(Math.abs((Math.round(Row_flexShrink_Part_011.bottom - Row_flexShrink_Part_011.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))) <= 1)
        .assertTrue();
      console.log('Row_flexShrink_Part_011.bottom - Row_flexShrink_Part_011.top', Row_flexShrink_Part_011.bottom - Row_flexShrink_Part_011.top)
      expect(Math.abs((Math.round(Row_flexShrink_Part_012.bottom - Row_flexShrink_Part_012.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))) <= 1)
        .assertTrue();
      console.log('Row_flexShrink_Part_012.bottom - Row_flexShrink_Part_012.top', Row_flexShrink_Part_012.bottom - Row_flexShrink_Part_012.top)
      expect(Math.abs((Math.round(Row_flexShrink_Part_013.bottom - Row_flexShrink_Part_013.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))) <= 1)
        .assertTrue();
      console.log('Row_flexShrink_Part_013.bottom - Row_flexShrink_Part_013.top', Row_flexShrink_Part_013.bottom - Row_flexShrink_Part_013.top)
      console.log('assert weight')
      expect(Math.abs((Math.round(Row_flexShrink_Part_011.right - Row_flexShrink_Part_011.left)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(300))))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_flexShrink_Part_012.right - Row_flexShrink_Part_012.left)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(65))))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_flexShrink_Part_013.right - Row_flexShrink_Part_013.left)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(65))))) <= 1)
        .assertTrue();
      console.info('[SUB_ACE_Row_flexShrink_Part_TEST_static_0100] END');
      done();
    });

    
    
    

/**
     * @tc.number   SUB_ACE_Row_flexShrink_Part_TEST_static_0200
     * @tc.name     SUB_ACE_Row_flexShrink_Part_TEST_static_0200
     * @tc.desc     SUB_ACE_Row_flexShrink_Part_TEST_static_0200
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_Row_flexShrink_Part_TEST_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_Row_flexShrink_Part_TEST_static_0200] START');
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'addflexShrink', value: 2
      });

      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Row_flexShrink_Part_011: RectValue = CommonFunc.getComponentRect('Row_flexShrink_Part_011');
      let Row_flexShrink_Part_012: RectValue = CommonFunc.getComponentRect('Row_flexShrink_Part_012');
      let Row_flexShrink_Part_013: RectValue = CommonFunc.getComponentRect('Row_flexShrink_Part_013');
      let Row_flexShrink_Part_01: RectValue = CommonFunc.getComponentRect('Row_flexShrink_Part_01');

      console.log('assert position')
      expect(Math.abs(Math.round(Row_flexShrink_Part_011.top - Row_flexShrink_Part_01.top) - Math.round(Row_flexShrink_Part_01.bottom - Row_flexShrink_Part_011.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Row_flexShrink_Part_012.top - Row_flexShrink_Part_01.top) - Math.round(Row_flexShrink_Part_01.bottom - Row_flexShrink_Part_012.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Row_flexShrink_Part_013.top - Row_flexShrink_Part_01.top) - Math.round(Row_flexShrink_Part_01.bottom - Row_flexShrink_Part_013.bottom)) <= 1)
        .assertTrue();

      console.log('assert space')
      expect(Math.abs((Math.round(Row_flexShrink_Part_012.left - Row_flexShrink_Part_011.right)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(10))))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_flexShrink_Part_013.left - Row_flexShrink_Part_012.right)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(10))))) <= 1)
        .assertTrue();
      console.log('Row_flexShrink_Part_012.left - Row_flexShrink_Part_011.right', Row_flexShrink_Part_012.left - Row_flexShrink_Part_011.right)
      console.log('Row_flexShrink_Part_013.left - Row_flexShrink_Part_012.right', Row_flexShrink_Part_013.left - Row_flexShrink_Part_012.right)

      console.log('assert height')
      expect(Math.abs((Math.round(Row_flexShrink_Part_011.bottom - Row_flexShrink_Part_011.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))) <= 1)
        .assertTrue();
      console.log('Row_flexShrink_Part_011.bottom - Row_flexShrink_Part_011.top', Row_flexShrink_Part_011.bottom - Row_flexShrink_Part_011.top)
      expect(Math.abs((Math.round(Row_flexShrink_Part_012.bottom - Row_flexShrink_Part_012.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))) <= 1)
        .assertTrue();
      console.log('Row_flexShrink_Part_012.bottom - Row_flexShrink_Part_012.top', Row_flexShrink_Part_012.bottom - Row_flexShrink_Part_012.top)
      expect(Math.abs((Math.round(Row_flexShrink_Part_013.bottom - Row_flexShrink_Part_013.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))) <= 1)
        .assertTrue();
      console.log('Row_flexShrink_Part_013.bottom - Row_flexShrink_Part_013.top', Row_flexShrink_Part_013.bottom - Row_flexShrink_Part_013.top)
      console.log('assert weight')
      expect(Math.abs((Math.round(Row_flexShrink_Part_011.right - Row_flexShrink_Part_011.left)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(300))))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_flexShrink_Part_012.right - Row_flexShrink_Part_012.left)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(65))))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_flexShrink_Part_013.right - Row_flexShrink_Part_013.left)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(65))))) <= 1)
        .assertTrue();
      console.info('[SUB_ACE_Row_flexShrink_Part_TEST_static_0200] END');
      done();
    });
  })
}