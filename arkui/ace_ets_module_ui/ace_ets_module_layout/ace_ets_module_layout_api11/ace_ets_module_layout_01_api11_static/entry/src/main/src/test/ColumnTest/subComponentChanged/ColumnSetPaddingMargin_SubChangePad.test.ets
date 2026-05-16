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

export default function ColumnSetPaddingMargin_SubChange() {
  describe('ColumnSetPaddingMarginTest', () => {
    beforeAll(() => {
      console.info("ColumnSetPaddingMarginTest beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.layout.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("ColumnSetPaddingMarginTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Column/subcomponentChanged/ColumnSetPaddingMargin_SubChangePad',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get ColumnSetPaddingMarginTest state pages:" + JSON.stringify(pages));
        if (!("ColumnSetPaddingMargin_SubChangePad" == pages.name)) {
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
      console.info("ColumnSetPaddingMargin after each called");
    });


    /**
     * @tc.number  testColumnParentMarPadSubPaddding_static
     * @tc.name     testColumnParentMarPadSubPaddding_static
     * @tc.desc     testColumnParentMarPadSubPaddding_static
     * @tc.level    Level.LEVEL0
     */
    it('testColumnParentMarPadSubPaddding_static', Level.LEVEL0, async () => {
      console.info('new testColumnParentMarPadSubPaddding_static START');
      const uiContext = AppStorage.get<UIContext>('uiContext');
      await CommonFunc.sleep(2000);
      let setPaddingMargin_SubPad01: RectValue = CommonFunc.getComponentRect('setPaddingMargin_SubPad01');
      let setPaddingMargin_SubPad02: RectValue = CommonFunc.getComponentRect('setPaddingMargin_SubPad02');
      let setPaddingMargin_SubPad03: RectValue = CommonFunc.getComponentRect('setPaddingMargin_SubPad03');
      let setPaddingMargin_SubPad: RectValue = CommonFunc.getComponentRect('setPaddingMargin_SubPad');
      expect(Math.abs(setPaddingMargin_SubPad01.top - setPaddingMargin_SubPad.top - Math.round(uiContext!.vp2px(20))) <=
        1).assertTrue()
      expect(Math.abs(setPaddingMargin_SubPad02.top - setPaddingMargin_SubPad01.bottom -
      Math.round(uiContext!.vp2px(30))) <= 1).assertTrue()
      expect(Math.abs(setPaddingMargin_SubPad03.top - setPaddingMargin_SubPad02.bottom -
      Math.round(uiContext!.vp2px(30))) <= 1).assertTrue()
      expect(Math.abs(setPaddingMargin_SubPad.bottom - setPaddingMargin_SubPad03.bottom -
      Math.round(uiContext!.vp2px(20))) <= 1).assertTrue()
      expect(Math.abs(setPaddingMargin_SubPad01.right - setPaddingMargin_SubPad01.left -
      Math.round(uiContext!.vp2px(300))) <= 1).assertTrue()
      expect(Math.abs(setPaddingMargin_SubPad02.right - setPaddingMargin_SubPad02.left -
      Math.round(uiContext!.vp2px(300))) <= 1).assertTrue()
      expect(Math.abs(setPaddingMargin_SubPad03.right - setPaddingMargin_SubPad03.left -
      Math.round(uiContext!.vp2px(300))) <= 1).assertTrue()
      console.info('new testColumnParentMarPadSubPaddding_static END');
    });
  })
}
