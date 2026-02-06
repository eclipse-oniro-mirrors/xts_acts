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
import { GlobalContext } from '../../../../ets/MainAbility/common/GlobalContext'
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

export default function ColumnWidthHeight_SubChange() {
  describe('ColumnSetWidthHeightTest', () => {
    beforeAll(() => {
      console.info("ColumnSetVisibility_SubChange beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.layout.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("ColumnSetWidthHeightTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Column/subcomponentChanged/ColumnWidthHeight_SubChange',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get ColumnSetWidthHeightTest state pages:" + JSON.stringify(pages));
        if (!("TextClockApi" == pages.name)) {
          console.info("get ColumnSetWidthHeightTest pages.name:" + '');
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push ColumnSetWidthHeightTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ColumnSetWidthHeightTest page error:" + err);
      }
      console.info("ColumnSetWidthHeightTest beforeEach end");
    });

    afterEach(async () => {
      await CommonFunc.sleep(2000);
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'height', value: 50
      });
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'width', value: 300
      });
      console.info("FlexBase after each called");
    });


    /**
     * @tc.number  testColumnSubcomponentModifyHeight_static
     * @tc.name     testColumnSubcomponentModifyHeight_static
     * @tc.desc     testColumnSubcomponentModifyHeight_static
     * @tc.level    Level.LEVEL0
     */
    it('testColumnSubcomponentModifyHeight_static', Level.LEVEL0, async () => {
      console.info('new testColumnSubcomponentModifyHeight START');
      const uiContext = AppStorage.get<UIContext>('uiContext');
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'height', value: 80
      });
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'width', value: 300
      });
      await CommonFunc.sleep(2000);
      let columnWidthHeight_1: RectValue = CommonFunc.getComponentRect('columnWidthHeight_1');
      let columnWidthHeight_2: RectValue = CommonFunc.getComponentRect('columnWidthHeight_2');
      let columnWidthHeight_3: RectValue = CommonFunc.getComponentRect('columnWidthHeight_3');
      let columnWidthHeight: RectValue = CommonFunc.getComponentRect('columnWidthHeight');
      expect(Math.abs(columnWidthHeight.top - columnWidthHeight_1.top) <= 1).assertTrue()
      expect(Math.abs(columnWidthHeight_2.top - columnWidthHeight_1.bottom - Math.round(uiContext!.vp2px(30))) <= 1)
        .assertTrue()
      expect(Math.abs(columnWidthHeight_3.top - columnWidthHeight_2.bottom - Math.round(uiContext!.vp2px(30))) <= 1)
        .assertTrue()
      expect(Math.abs(columnWidthHeight.bottom - columnWidthHeight_3.bottom - Math.round(uiContext!.vp2px(10))) <= 1)
        .assertTrue()
      console.info('new testColumnSubcomponentModifyHeight END');
    });


    /**
     * @tc.number  testColumnSubcomponentModifyWidth_static
     * @tc.name     testColumnSubcomponentModifyWidth_static
     * @tc.desc     testColumnSubcomponentModifyWidth_static
     * @tc.level    Level.LEVEL0
     */
    it('testColumnSubcomponentModifyWidth_static', Level.LEVEL0, async () => {
      console.info('new testColumnSubcomponentModifyWidth_static START');
      const uiContext = AppStorage.get<UIContext>('uiContext');
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'height', value: 50
      });
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'width', value: 200
      });
      await CommonFunc.sleep(2000);
      let columnWidthHeight_1: RectValue = CommonFunc.getComponentRect('columnWidthHeight_1');
      let columnWidthHeight_2: RectValue = CommonFunc.getComponentRect('columnWidthHeight_2');
      let columnWidthHeight_3: RectValue = CommonFunc.getComponentRect('columnWidthHeight_3');
      let columnWidthHeight: RectValue = CommonFunc.getComponentRect('columnWidthHeight');
      expect(Math.abs(columnWidthHeight.top - columnWidthHeight_1.top) <= 1).assertTrue()
      expect(Math.abs(columnWidthHeight_2.top - columnWidthHeight_1.bottom - Math.round(uiContext!.vp2px(30))) <= 1)
        .assertTrue()
      expect(Math.abs(columnWidthHeight_3.top - columnWidthHeight_2.bottom - Math.round(uiContext!.vp2px(30))) <= 1)
        .assertTrue()
      expect(Math.abs(columnWidthHeight.bottom - columnWidthHeight_3.bottom - Math.round(uiContext!.vp2px(40))) <= 1)
        .assertTrue()
      console.info('new testColumnSubcomponentModifyWidth_static END');
    });
  })
}
