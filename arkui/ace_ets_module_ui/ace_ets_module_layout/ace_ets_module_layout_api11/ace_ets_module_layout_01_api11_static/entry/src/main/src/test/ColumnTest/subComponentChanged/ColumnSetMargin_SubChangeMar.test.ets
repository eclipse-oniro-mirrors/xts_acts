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

export default function ColumnSetMargin_SubChangeMar() {
  describe('ColumnSetMargin_SubChangeMar', () => {
    beforeAll(() => {
      console.info("ColumnSetMargin_SubChangeMar beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.layout.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("ColumnSetMarginTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Column/subcomponentChanged/ColumnSetMargin_SubChangeMar',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get ColumnSetMarginTest state pages:" + JSON.stringify(pages));
        if (!("ColumnSetMargin_SubChangeMar" == pages.name)) {
          console.info("get ColumnSetMarginTest pages.name:" + '');
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push ColumnSetMarginTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ColumnSetMarginTest page error:" + err);
      }
      console.info("ColumnSetMarginTest beforeEach end");
    });

    afterEach(async () => {
      await CommonFunc.sleep(3000);
      console.info("ColumnSetMargin_SubChangeMar after each called");
    });


    /**
     * @tc.number   testColumnParentMarginSubMargin_static
     * @tc.name     testColumnParentMarginSubMargin_static
     * @tc.desc     testColumnParentMarginSubMargin_static
     * @tc.level    Level.LEVEL0
     */
    it('testColumnParentMarginSubMargin_static', Level.LEVEL0, async () => {
      console.info('new testColumnParentMarginSubMargin_static START');
      const uiContext = AppStorage.get<UIContext>('uiContext');
      await CommonFunc.sleep(2000);
      let columnSetMar_1: RectValue = CommonFunc.getComponentRect('columnSetMar_1');
      let columnSetMar_2: RectValue = CommonFunc.getComponentRect('columnSetMar_2');
      let columnSetMar_3: RectValue = CommonFunc.getComponentRect('columnSetMar_3');
      let columnSetMar: RectValue = CommonFunc.getComponentRect('columnSetMar');
      expect(Math.abs(columnSetMar_1.top - columnSetMar.top - Math.round(uiContext!.vp2px(20))) <= 1).assertTrue()
      expect(Math.abs(columnSetMar_2.top - columnSetMar_1.bottom - Math.round(uiContext!.vp2px(50))) <= 1).assertTrue()
      expect(Math.abs(columnSetMar_3.top - columnSetMar_2.bottom - Math.round(uiContext!.vp2px(30))) <= 1).assertTrue()
      expect(Math.abs(columnSetMar_1.right - columnSetMar_1.left - Math.round(uiContext!.vp2px(300))) <= 1).assertTrue()
      expect(Math.abs(columnSetMar_2.right - columnSetMar_2.left - Math.round(uiContext!.vp2px(300))) <= 1).assertTrue()
      expect(Math.abs(columnSetMar_3.right - columnSetMar_3.left - Math.round(uiContext!.vp2px(300))) <= 1).assertTrue()
      expect(Math.abs(columnSetMar.bottom - columnSetMar_3.bottom) <= 1).assertTrue()
      console.info('new testColumnParentMarginSubMargin_static END');
    });
  })
}
