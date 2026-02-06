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
import { MessageManager } from '../../../../ets/MainAbility/common/MessageManager';
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

export default function Row_Space() {
  describe('row_SpaceTest', () => {
    beforeAll(() => {
      console.info("row_SpaceTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.layout.split04.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("row_SpaceTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Row/spaceChanged/Row_Space",
      };
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get row_SpaceTest state pages:" + "");
        if (!("Row_Space" == pages.name)) {
          console.info("get row_SpaceTest pages.name:" + "");
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push row_SpaceTest page error " + JSON.stringify(err));
        expect().assertFail();
      }
      console.info("row_SpaceTest beforeEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("row_SpaceTest after each called")
    });
    
    
    

/**
     * @tc.number   testRowSpaceUnfill_static_01
     * @tc.name     testRowSpaceUnfill_static_01
     * @tc.desc     testRowSpaceUnfill_static_01
     * @tc.level    Level.LEVEL0
     */
it('testRowSpaceUnfill_static_01', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testRowSpaceUnfill_static_01] START');
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'addSpace', value: 10
      });
      await CommonFunc.sleep(3000);
      let Row_Space_011: RectValue = CommonFunc.getComponentRect('Row_Space_011');
      let Row_Space_012: RectValue = CommonFunc.getComponentRect('Row_Space_012');
      let Row_Space_013: RectValue = CommonFunc.getComponentRect('Row_Space_013');
      let Row_Space_01: RectValue = CommonFunc.getComponentRect('Row_Space_01');
      expect(Math.abs(Math.round(Row_Space_011.top - Row_Space_01.top) - Math.round(Row_Space_01.bottom - Row_Space_011.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Row_Space_012.top - Row_Space_01.top) - Math.round(Row_Space_01.bottom - Row_Space_012.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Row_Space_013.top - Row_Space_01.top) - Math.round(Row_Space_01.bottom - Row_Space_013.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Row_Space_012.left - Row_Space_011.right) - Math.round(Row_Space_013.left - Row_Space_012.right)) <= 1)
        .assertTrue();

      expect(Math.round(Row_Space_012.left - Row_Space_011.right) - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(10)) <= 1).assertTrue();
      expect(Math.abs(Math.round(Row_Space_01.left) - Math.round(Row_Space_011.left)) <= 1).assertTrue();
      expect(Row_Space_013.right).assertLess(Row_Space_01.right);
      expect(Math.abs((Math.round(Row_Space_011.bottom - Row_Space_011.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50))))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_012.bottom - Row_Space_012.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_013.bottom - Row_Space_013.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_011.right - Row_Space_011.left)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_012.right - Row_Space_012.left)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_013.right - Row_Space_013.left)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))) <= 1)
        .assertTrue();
      console.info('[testRowSpaceUnfill_static_01] END');
      done();
    });
    
    
    

/**
     * @tc.number   testRowSpaceFill_static_02
     * @tc.name     testRowSpaceFill_static_02
     * @tc.desc     testRowSpaceFill_static_02
     * @tc.level    Level.LEVEL0
     */
it('testRowSpaceFill_static_02', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testRowSpaceFill_static_02] START');
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'addSpace', value: 25
      });
      await CommonFunc.sleep(3000);
      let Row_Space_011: RectValue = CommonFunc.getComponentRect('Row_Space_011');
      let Row_Space_012: RectValue = CommonFunc.getComponentRect('Row_Space_012');
      let Row_Space_013: RectValue = CommonFunc.getComponentRect('Row_Space_013');
      let Row_Space_01: RectValue = CommonFunc.getComponentRect('Row_Space_01');
      expect(Math.abs(Math.round(Row_Space_011.top - Row_Space_01.top) - Math.round(Row_Space_01.bottom - Row_Space_011.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Row_Space_012.top - Row_Space_01.top) - Math.round(Row_Space_01.bottom - Row_Space_012.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Row_Space_013.top - Row_Space_01.top) - Math.round(Row_Space_01.bottom - Row_Space_013.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Row_Space_012.left - Row_Space_011.right) - Math.round(Row_Space_013.left - Row_Space_012.right)) <= 1)
        .assertTrue();

      expect(Math.abs(Math.round((Row_Space_012.left - Row_Space_011.right) * 10) / 10 - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(25)) * 10) / 10) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Row_Space_01.left) - Math.round(Row_Space_011.left)) <= 1).assertTrue();
      expect(Math.abs(Math.round(Row_Space_013.right) - Math.round(Row_Space_01.right)) <= 1).assertTrue();
      expect(Math.abs((Math.round(Row_Space_011.bottom - Row_Space_011.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50))))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_012.bottom - Row_Space_012.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_013.bottom - Row_Space_013.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_011.right - Row_Space_011.left)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_012.right - Row_Space_012.left)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_013.right - Row_Space_013.left)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))) <= 1)
        .assertTrue();
      console.info('[testRowSpaceFill_static_02] END');
      done();
    });
    
    
    

/**
     * @tc.number   testRowSpaceOverflow_static_03
     * @tc.name     testRowSpaceOverflow_static_03
     * @tc.desc     testRowSpaceOverflow_static_03
     * @tc.level    Level.LEVEL0
     */
it('testRowSpaceOverflow_static_03', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testRowSpaceOverflow_static_03] START');
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'addSpace', value: 30
      });
      await CommonFunc.sleep(3000);
      let Row_Space_011: RectValue = CommonFunc.getComponentRect('Row_Space_011');
      let Row_Space_012: RectValue = CommonFunc.getComponentRect('Row_Space_012');
      let Row_Space_013: RectValue = CommonFunc.getComponentRect('Row_Space_013');
      let Row_Space_01: RectValue = CommonFunc.getComponentRect('Row_Space_01');
      expect(Math.abs(Math.round(Row_Space_011.top - Row_Space_01.top) - Math.round(Row_Space_01.bottom - Row_Space_011.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Row_Space_012.top - Row_Space_01.top) - Math.round(Row_Space_01.bottom - Row_Space_012.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Row_Space_013.top - Row_Space_01.top) - Math.round(Row_Space_01.bottom - Row_Space_013.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Row_Space_012.left - Row_Space_011.right) - Math.round(Row_Space_013.left - Row_Space_012.right)) <= 1)
        .assertTrue();

      expect(Math.abs(Row_Space_012.left - Row_Space_011.right - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(30))) <= 1).assertTrue();
      expect(Math.abs(Math.round(Row_Space_01.left) - Math.round(Row_Space_011.left)) <= 1).assertTrue();
      expect(Row_Space_013.right).assertLarger(Row_Space_01.right);
      expect(Math.abs((Math.round(Row_Space_011.bottom - Row_Space_011.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50))))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_012.bottom - Row_Space_012.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_013.bottom - Row_Space_013.top)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150))))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_011.right - Row_Space_011.left)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_012.right - Row_Space_012.left)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_013.right - Row_Space_013.left)) - (Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))))) <= 1)
        .assertTrue();
      console.info('[testRowSpaceOverflow_static_03] END');
      done();
    });
  })
}
