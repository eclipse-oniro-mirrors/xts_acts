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
import CommonFunc from "../../../../ets/MainAbility/common/Common";
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

export default function ColumnSetPadding__SubChange() {
  describe('ColumnSetPadding__SubChange', () => {
    beforeAll(() => {
      console.info("ColumnSetPadding__SubChange beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.layout.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("ColumnSetPaddingTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Column/subcomponentChanged/ColumnSetPadding_SubChange',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get ColumnSetPaddingTest state pages:" + JSON.stringify(pages));
        if (!("ColumnSetPadding_SubChange" == pages.name)) {
          console.info("get ColumnSetPaddingTest pages.name:" + '');
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push ColumnSetPaddingTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ColumnSetPaddingTest page error:" + err);
      }
      console.info("ColumnSetPaddingTest beforeEach end");
    });

    afterEach(async () => {
      console.info("parentComponentSetPadding after each called");
    });


    /**
     * @tc.number   testColumnParentPaddingSubMarPad_static
     * @tc.name     testColumnParentPaddingSubMarPad_static
     * @tc.desc     testColumnParentPaddingSubMarPad_static
     * @tc.level    Level.LEVEL0
     */
    it('testColumnParentPaddingSubMarPad_static', Level.LEVEL0, async () => {
      console.info('new testColumnParentPaddingSubMarPad_static START');
      const uiContext = AppStorage.get<UIContext>('uiContext');
      await CommonFunc.sleep(2000);
      let columnSetPadding_1: RectValue = CommonFunc.getComponentRect('columnSetPadding_1');
      let columnSetPadding_2: RectValue = CommonFunc.getComponentRect('columnSetPadding_2');
      let columnSetPadding_3: RectValue = CommonFunc.getComponentRect('columnSetPadding_3');
      let columnSetPadding: RectValue = CommonFunc.getComponentRect('columnSetPadding');
      expect(Math.abs(columnSetPadding_1.top - columnSetPadding.top - Math.round(uiContext!.vp2px(40))) <= 1)
        .assertTrue()
      expect(Math.abs(columnSetPadding_2.top - columnSetPadding_1.bottom - Math.round(uiContext!.vp2px(50))) <= 1)
        .assertTrue()
      expect(Math.abs(columnSetPadding_3.top - columnSetPadding_2.bottom - Math.round(uiContext!.vp2px(30))) <= 1)
        .assertTrue()
      expect(columnSetPadding.bottom).assertLess(columnSetPadding_3.bottom)
      expect(Math.abs(columnSetPadding_1.right - columnSetPadding_1.left - Math.round(uiContext!.vp2px(300))) <= 1)
        .assertTrue()
      expect(Math.abs(columnSetPadding_2.right - columnSetPadding_2.left - Math.round(uiContext!.vp2px(300))) <= 1)
        .assertTrue()
      expect(Math.abs(columnSetPadding_3.right - columnSetPadding_3.left - Math.round(uiContext!.vp2px(300))) <= 1)
        .assertTrue()
      console.info('new testColumnParentPaddingSubMarPad_static END');
    });
  })
}
