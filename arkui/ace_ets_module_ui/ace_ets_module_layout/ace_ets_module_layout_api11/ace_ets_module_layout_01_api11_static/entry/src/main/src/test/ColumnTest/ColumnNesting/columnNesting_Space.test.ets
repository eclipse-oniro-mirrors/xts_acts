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
import RectValue from '../../../../ets/MainAbility/common/Rect';
import CommonFunc from '../../../../ets/MainAbility/common/Common';
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
let testAbilityContext: common.UIAbilityContext;

export default function columnNesting_Space() {
  describe('columnNesting_Space', () => {
    beforeAll(() => {
      console.info("columnNesting_Space beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.layout.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("columnNesting_Space beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Column/columnNesting/columnNesting_Space",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get columnNesting_Space state pages:" + JSON.stringify(pages));
        if (!("columnNesting_Space" == pages.name)) {
          console.info("get columnNesting_Space pages.name:" + '');
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push columnNesting_Space page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push columnNesting_Space page error:" + err);
      }
      console.info("columnNesting_Space beforeEach end");
    });

    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("columnNesting_Space after each called")
    });


        /**
     * @tc.number   SUB_ACE_columnNesting_Space_TEST_static_0100
     * @tc.name     SUB_ACE_columnNesting_Space_TEST_static_0100
     * @tc.desc     SUB_ACE_columnNesting_Space_TEST_static_0100
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ACE_columnNesting_Space_TEST_static_0100', Level.LEVEL0, async () => {
      console.info('[SUB_ACE_columnNesting_Space_TEST_0100] START');
      const uiContext = AppStorage.get<UIContext>('uiContext');
      await CommonFunc.sleep(4000);
      console.log('get Initial value')
      let columnNesting_Space_011: RectValue = CommonFunc.getComponentRect('columnNesting_Space_011');
      let columnNesting_Space_012: RectValue = CommonFunc.getComponentRect('columnNesting_Space_012');
      let columnNesting_Space_013: RectValue = CommonFunc.getComponentRect('columnNesting_Space_013');
      let columnNesting_Space_01: RectValue = CommonFunc.getComponentRect('columnNesting_Space_01');
      let columnNesting_Space_021: RectValue = CommonFunc.getComponentRect('columnNesting_Space_021');
      let columnNesting_Space_022: RectValue = CommonFunc.getComponentRect('columnNesting_Space_022');
      let columnNesting_Space_023: RectValue = CommonFunc.getComponentRect('columnNesting_Space_023');
      let columnNesting_Space_02: RectValue = CommonFunc.getComponentRect('columnNesting_Space_02');
      let columnNesting_Space_1: RectValue = CommonFunc.getComponentRect('columnNesting_Space_1');
      console.log('assert position')
      expect(Math.floor(Math.abs((columnNesting_Space_011.left - columnNesting_Space_01.left) -
        (columnNesting_Space_01.right - columnNesting_Space_011.right))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((columnNesting_Space_012.left - columnNesting_Space_01.left) -
        (columnNesting_Space_01.right - columnNesting_Space_012.right))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((columnNesting_Space_013.left - columnNesting_Space_01.left) -
        (columnNesting_Space_01.right - columnNesting_Space_013.right))) <= 1)
        .assertTrue();
      console.log('[SUB_ACE_columnNesting_Space_TEST_0100] columnNesting_Space_012.top - columnNesting_Space_011.bottom',
        +(columnNesting_Space_012.top - columnNesting_Space_011.bottom))
      console.log('[SUB_ACE_columnNesting_Space_TEST_0100] columnNesting_Space_013.top - columnNesting_Space_012.bottom',
        +(columnNesting_Space_013.top - columnNesting_Space_012.bottom))
      expect(Math.floor(Math.abs((columnNesting_Space_012.top - columnNesting_Space_011.bottom) -
        (columnNesting_Space_013.top - columnNesting_Space_012.bottom))) <= 2)
        .assertTrue();

      expect(Math.floor(Math.abs((columnNesting_Space_021.left - columnNesting_Space_02.left) -
        (columnNesting_Space_02.right - columnNesting_Space_021.right))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((columnNesting_Space_022.left - columnNesting_Space_02.left) -
        (columnNesting_Space_02.right - columnNesting_Space_022.right))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((columnNesting_Space_023.left - columnNesting_Space_02.left) -
        (columnNesting_Space_02.right - columnNesting_Space_023.right))) <= 1)
        .assertTrue();
      console.log('[SUB_ACE_columnNesting_Space_TEST_0100] columnNesting_Space_022.top - columnNesting_Space_021.bottom',
        +(columnNesting_Space_022.top - columnNesting_Space_021.bottom))
      console.log('[SUB_ACE_columnNesting_Space_TEST_0100] columnNesting_Space_023.top - columnNesting_Space_022.bottom',
        +(columnNesting_Space_023.top - columnNesting_Space_022.bottom))
      expect(Math.floor(Math.abs((columnNesting_Space_022.top - columnNesting_Space_021.bottom) -
        (columnNesting_Space_023.top - columnNesting_Space_022.bottom))) <= 2)
        .assertTrue();
      expect(Math.floor(Math.abs(columnNesting_Space_01.top - columnNesting_Space_011.top)) <= 1).assertTrue();

      console.log('assert space')
      expect(Math.floor(Math.abs((columnNesting_Space_012.top - columnNesting_Space_011.bottom) -
      uiContext!.vp2px(10))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((columnNesting_Space_013.top - columnNesting_Space_012.bottom) -
      uiContext!.vp2px(10))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((columnNesting_Space_022.top - columnNesting_Space_021.bottom) -
      uiContext!.vp2px(10))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((columnNesting_Space_023.top - columnNesting_Space_022.bottom) -
      uiContext!.vp2px(10))) <= 1).assertTrue();
      console.log('[SUB_ACE_columnNesting_Space_TEST_0100] columnNesting_Space_02.top - columnNesting_Space_01.bottom',
        +(columnNesting_Space_02.top - columnNesting_Space_01.bottom))
      expect(Math.floor(Math.abs((columnNesting_Space_02.top - columnNesting_Space_01.bottom) -
      uiContext!.vp2px(30))) <= 1).assertTrue();

      console.log('assert height')
      console.log('column_01 assert height')
      expect(Math.floor(Math.abs(columnNesting_Space_011.bottom - columnNesting_Space_011.top -
      uiContext!.vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs(columnNesting_Space_012.bottom - columnNesting_Space_012.top -
      uiContext!.vp2px(100))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs(columnNesting_Space_013.bottom - columnNesting_Space_013.top -
      uiContext!.vp2px(150))) <= 1)
        .assertTrue();

      console.log('column_02 assert height')
      expect(Math.floor(Math.abs(columnNesting_Space_021.bottom - columnNesting_Space_021.top -
      uiContext!.vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs(columnNesting_Space_022.bottom - columnNesting_Space_022.top -
      uiContext!.vp2px(100))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs(columnNesting_Space_023.bottom - columnNesting_Space_023.top -
      uiContext!.vp2px(150))) <= 1)
        .assertTrue();

      expect(Math.floor(Math.abs(columnNesting_Space_01.bottom - columnNesting_Space_01.top - uiContext!.vp2px(400))) <=
        1)
        .assertTrue();
      expect(Math.floor(Math.abs(columnNesting_Space_02.bottom - columnNesting_Space_02.top - uiContext!.vp2px(400))) <=
        1)
        .assertTrue();

      console.log('assert weight')
      expect(Math.floor(Math.abs(columnNesting_Space_011.right - columnNesting_Space_011.left -
      uiContext!.vp2px(300))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs(columnNesting_Space_012.right - columnNesting_Space_012.left -
      uiContext!.vp2px(300))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs(columnNesting_Space_013.right - columnNesting_Space_013.left -
      uiContext!.vp2px(300))) <= 1)
        .assertTrue();

      expect(Math.floor(Math.abs(columnNesting_Space_021.right - columnNesting_Space_021.left -
      uiContext!.vp2px(300))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs(columnNesting_Space_022.right - columnNesting_Space_022.left -
      uiContext!.vp2px(300))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs(columnNesting_Space_023.right - columnNesting_Space_023.left -
      uiContext!.vp2px(300))) <= 1)
        .assertTrue();

      expect(Math.floor(Math.abs(columnNesting_Space_01.right - columnNesting_Space_01.left - uiContext!.vp2px(350))) <=
        1)
        .assertTrue();
      expect(Math.floor(Math.abs(columnNesting_Space_02.right - columnNesting_Space_02.left - uiContext!.vp2px(350))) <=
        1)
        .assertTrue();

      console.info('[SUB_ACE_columnNesting_Space_TEST_0100] END');
    });
  })
}