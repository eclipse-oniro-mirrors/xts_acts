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

export default function rowNesting_alignItems() {
  describe('rowNesting_alignItems', () => {
    beforeAll(() => {
      console.info("rowNesting_alignItems beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.layout.split04.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("rowNesting_alignItems beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Row/RowNesting/rowNesting_alignItems",
      };
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get rowNesting_alignItems state pages:" + "");
        if (!("rowNesting_alignItems" == pages.name)) {
          console.info("get rowNesting_alignItems pages.name:" + "");
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push rowNesting_alignItems page error " + JSON.stringify(err));
        expect().assertFail();
      }
    });
    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("rowNesting_alignItems after each called")
    });

    
    
    

/**
     * @tc.number   SUB_ACE_rowNesting_alignItems_TEST_static_0100
     * @tc.name     SUB_ACE_rowNesting_alignItems_TEST_static_0100
     * @tc.desc     SUB_ACE_rowNesting_alignItems_TEST_static_0100
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_rowNesting_alignItems_TEST_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_rowNesting_alignItems_TEST_static_0100] START');
      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let rowNesting_alignItems_011: RectValue = CommonFunc.getComponentRect('rowNesting_alignItems_011');
      let rowNesting_alignItems_012: RectValue = CommonFunc.getComponentRect('rowNesting_alignItems_012');
      let rowNesting_alignItems_013: RectValue = CommonFunc.getComponentRect('rowNesting_alignItems_013');
      let rowNesting_alignItems_01: RectValue = CommonFunc.getComponentRect('rowNesting_alignItems_01');

      console.log('assert position')
      expect(Math.abs((Math.round(rowNesting_alignItems_011.top - rowNesting_alignItems_01.top)) - (0)) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(rowNesting_alignItems_012.top - rowNesting_alignItems_01.top)) - (0)) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(rowNesting_alignItems_013.top - rowNesting_alignItems_01.top)) - (0)) <= 1)
        .assertTrue();

      console.log('assert space')
      expect(Math.abs(Math.round(rowNesting_alignItems_012.left - rowNesting_alignItems_011.right) - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(10)))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(rowNesting_alignItems_013.left - rowNesting_alignItems_012.right) - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(10)))) <= 1)
        .assertTrue();
      console.log('rowNesting_alignItems_012.left - rowNesting_alignItems_011.right', rowNesting_alignItems_012.left - rowNesting_alignItems_011.right)
      console.log('rowNesting_alignItems_013.left - rowNesting_alignItems_012.right', rowNesting_alignItems_013.left - rowNesting_alignItems_012.right)


      console.log('assert height')
      expect(Math.abs((Math.round(rowNesting_alignItems_011.bottom - rowNesting_alignItems_011.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50))))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(rowNesting_alignItems_012.bottom - rowNesting_alignItems_012.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(rowNesting_alignItems_013.bottom - rowNesting_alignItems_013.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))))) <= 1)
        .assertTrue();
      console.log('assert weight')
      expect(Math.abs((Math.round(rowNesting_alignItems_011.right - rowNesting_alignItems_011.left)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50))))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(rowNesting_alignItems_012.right - rowNesting_alignItems_012.left)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(rowNesting_alignItems_013.right - rowNesting_alignItems_013.left)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))))) <= 1)
        .assertTrue();
      console.info('[SUB_ACE_rowNesting_alignItems_TEST_static_0100] END');
      done();
    });

  })
}