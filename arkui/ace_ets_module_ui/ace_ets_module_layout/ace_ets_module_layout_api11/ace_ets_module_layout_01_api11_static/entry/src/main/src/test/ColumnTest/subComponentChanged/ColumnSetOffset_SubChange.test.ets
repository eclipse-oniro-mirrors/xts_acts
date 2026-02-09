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

export default function ColumnSetOffset_SubChange() {
  describe('ColumnSetOffsetTest', () => {
    beforeAll(() => {
      console.info("ColumnSetOffsetTest beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.layout.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("ColumnSetOffsetTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Column/subcomponentChanged/ColumnSetOffset_SubChange',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get ColumnSetOffsetTest state pages:" + JSON.stringify(pages));
        if (!("ColumnSetOffset_SubChange" == pages.name)) {
          console.info("get ColumnSetOffsetTest pages.name:" + '');
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push ColumnSetOffsetTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ColumnSetOffsetTest page error:" + err);
      }
      console.info("ColumnSetOffsetTest beforeEach end");
    });

    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("SetOffset after each called");
    });


    /**
     * @tc.number  testColumnSubcomponentSetOffset_static
     * @tc.name     testColumnSubcomponentSetOffset_static
     * @tc.desc     testColumnSubcomponentSetOffset_static
     * @tc.level    Level.LEVEL0
     */
    it('testColumnSubcomponentSetOffset_static', Level.LEVEL0, async () => {
      console.info('new testColumnSubcomponentSetOffset_static START');
      const uiContext = AppStorage.get<UIContext>('uiContext');
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'offset_x', value: 10
      });
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'offset_y', value: 10
      });
      await CommonFunc.sleep(2000);
      let columnOffset_1: RectValue = CommonFunc.getComponentRect('columnOffset_1');
      let columnOffset_2: RectValue = CommonFunc.getComponentRect('columnOffset_2');
      let columnOffset_3: RectValue = CommonFunc.getComponentRect('columnOffset_3');
      let columnOffset: RectValue = CommonFunc.getComponentRect('columnOffset');
      expect(Math.abs(columnOffset_1.left - columnOffset_2.left - Math.round(uiContext!.vp2px(10))) <= 1).assertTrue()
      expect(Math.abs(columnOffset_1.top - columnOffset.top - Math.round(uiContext!.vp2px(10))) <= 1).assertTrue()
      expect(Math.abs(columnOffset_2.top - columnOffset_1.bottom - Math.round(uiContext!.vp2px(20))) <= 1).assertTrue()
      expect(Math.abs(columnOffset_3.top - columnOffset_2.bottom - Math.round(uiContext!.vp2px(30))) <= 1).assertTrue()
      expect(Math.abs(columnOffset.bottom - columnOffset_3.bottom - Math.round(uiContext!.vp2px(40))) <= 1).assertTrue()
      console.info('new testColumnSubcomponentSetOffset_static END');
    });
  })
}
