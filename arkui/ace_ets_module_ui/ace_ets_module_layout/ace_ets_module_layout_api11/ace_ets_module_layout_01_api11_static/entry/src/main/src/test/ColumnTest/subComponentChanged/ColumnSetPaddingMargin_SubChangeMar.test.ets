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

export default function ColumnSetPaddingMargin_SubChangeMar() {
  describe('ColumnSetPaddingMarginTest', () => {
    beforeAll(() => {
      console.info("ColumnSetPaddingMarginTest beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.layout.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("ColumnSetPaddingMarginTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Column/subcomponentChanged/ColumnSetPaddingMargin_SubChangeMar',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get ColumnSetPaddingMarginTest state pages:" + JSON.stringify(pages));
        if (!("ColumnSetPaddingMargin_SubChangeMar" == pages.name)) {
          console.info("get ColumnSetPaddingMarginTest pages.name:" + '');
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push ColumnSetPaddingMarginTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ColumnSetPaddingMarginTest page error:" + err);
      }
      console.info("ColumnSetPaddingMarginTest beforeEach end");
    });

    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("ColumnSetPaddingMargin_SubChangeMar after each called");
    });


    /**
     * @tc.number  testColumnParentMarPadSubMargin_static
     * @tc.name     testColumnParentMarPadSubMargin_static
     * @tc.desc     testColumnParentMarPadSubMargin_static
     * @tc.level    Level.LEVEL0
     */
    it('testColumnParentMarPadSubMargin_static', Level.LEVEL0, async () => {
      console.info('new testColumnParentMarPadSubMargin_static START');
      const uiContext = AppStorage.get<UIContext>('uiContext');
      await CommonFunc.sleep(2000);
      let setPadMar01: RectValue = CommonFunc.getComponentRect('setPadMar01');
      let setPadMar02: RectValue = CommonFunc.getComponentRect('setPadMar02');
      let setPadMar03: RectValue = CommonFunc.getComponentRect('setPadMar03');
      let setPadMar: RectValue = CommonFunc.getComponentRect('setPadMar');
      expect(Math.abs(Math.round(setPadMar01.top - setPadMar.top) - Math.round(uiContext!.vp2px(40))) <= 1).assertTrue()
      expect(Math.abs(Math.round(setPadMar02.top - setPadMar01.bottom) - Math.round(uiContext!.vp2px(50))) <= 1)
        .assertTrue()
      expect(Math.abs(Math.round(setPadMar03.top - setPadMar02.bottom) - Math.round(uiContext!.vp2px(30))) <= 1)
        .assertTrue()
      expect(setPadMar.bottom).assertLess(setPadMar03.bottom)
      expect(Math.abs(Math.round(setPadMar01.right - setPadMar01.left) - Math.round(uiContext!.vp2px(300))) <= 1)
        .assertTrue()
      expect(Math.abs(Math.round(setPadMar02.right - setPadMar02.left) - Math.round(uiContext!.vp2px(300))) <= 1)
        .assertTrue()
      expect(Math.abs(Math.round(setPadMar03.right - setPadMar03.left) - Math.round(uiContext!.vp2px(300))) <= 1)
        .assertTrue()
      console.info('new testColumnParentMarPadSubMargin_static END');
    });
  })
}
