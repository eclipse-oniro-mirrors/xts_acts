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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect,Level } from '../../../../../hypium/index';
import router from '@ohos.router';
import RectValue from '../../../../ets/MainAbility/common/Rect';
import {GlobalContext} from '../../../../ets/MainAbility/common/GlobalContext'
import CommonFunc from '../../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UIContext } from "@ohos.arkui.UIContext";
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { MessageManager, Callback } from '../../../../ets/MainAbility/common/MessageManager';
import { UtilsTest } from '../../Util.test';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
export default function Column_Space() {
  describe('column_SpaceTest', () => {
    beforeAll(() => {
      console.info("column_SpaceTest beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.layout.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("column_SpaceTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Column/spaceChanged/Column_Space",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get column_SpaceTest state pages:" + JSON.stringify(pages));
        if (!("Column_Space" == pages.name)) {
          console.info("get column_SpaceTest pages.name:" + '');
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push column_SpaceTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push column_SpaceTest page error:" + err);
      }
      console.info("column_SpaceTest beforeEach end");
    });

    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("Column_Space after each called")
    });
    
    



    /**
     * @tc.number   testColumnSpaceToThirty_static
     * @tc.name     testColumnSpaceToThirty_static
     * @tc.desc     testColumnSpaceToThirty_static
     * @tc.level    Level.LEVEL0
     */
    it('testColumnSpaceToThirty_static', Level.LEVEL0, async () => {
      console.info('[testColumnSpaceToThirty_static] START');
      const uiContext = AppStorage.get<UIContext>('uiContext');
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'addSpace', value: 30
      });
      await CommonFunc.sleep(3000);
      let Column_Space_011: RectValue = CommonFunc.getComponentRect('Column_Space_011');
      let Column_Space_012: RectValue = CommonFunc.getComponentRect('Column_Space_012');
      let Column_Space_013: RectValue = CommonFunc.getComponentRect('Column_Space_013');
      let Column_Space_01: RectValue = CommonFunc.getComponentRect('Column_Space_01');
      expect(Math.floor(Math.abs((Column_Space_011.left - Column_Space_01.left) - (Column_Space_01.right - Column_Space_011.right))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_012.left - Column_Space_01.left) - (Column_Space_01.right - Column_Space_012.right))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_013.left - Column_Space_01.left) - (Column_Space_01.right - Column_Space_013.right))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_012.top - Column_Space_011.bottom) - (Column_Space_013.top - Column_Space_012.bottom))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(Column_Space_01.top - Column_Space_011.top)) <= 1).assertTrue();
      expect(Column_Space_013.bottom).assertLess(Column_Space_01.bottom);
      expect(Math.floor(Math.abs((Column_Space_012.top - Column_Space_011.bottom) - uiContext!.vp2px(30))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_011.bottom - Column_Space_011.top) - uiContext!.vp2px(50))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_012.bottom - Column_Space_012.top) - uiContext!.vp2px(100))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_013.bottom - Column_Space_013.top) - uiContext!.vp2px(150))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_011.right - Column_Space_011.left) - uiContext!.vp2px(300))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_012.right - Column_Space_012.left) - uiContext!.vp2px(300))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_013.right - Column_Space_013.left) - uiContext!.vp2px(300))) <= 1).assertTrue();

      console.info('[testColumnSpaceToThirty_static] END');
    });
    
    



    /**
     * @tc.number   testColumnSpaceToFifty_static
     * @tc.name     testColumnSpaceToFifty_static
     * @tc.desc     testColumnSpaceToFifty_static
     * @tc.level    Level.LEVEL0
     */
    it('testColumnSpaceToFifty_static', Level.LEVEL0, async () => {
      console.info('[testColumnSpaceToFifty] START');
      const uiContext = AppStorage.get<UIContext>('uiContext');
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'addSpace', value: 50
      });
      await CommonFunc.sleep(3000);
      let Column_Space_011: RectValue = CommonFunc.getComponentRect('Column_Space_011');
      let Column_Space_012: RectValue = CommonFunc.getComponentRect('Column_Space_012');
      let Column_Space_013: RectValue = CommonFunc.getComponentRect('Column_Space_013');
      let Column_Space_01: RectValue = CommonFunc.getComponentRect('Column_Space_01');
      expect(Math.floor(Math.abs((Column_Space_011.left - Column_Space_01.left) - (Column_Space_01.right - Column_Space_011.right))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_012.left - Column_Space_01.left) - (Column_Space_01.right - Column_Space_012.right))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_013.left - Column_Space_01.left) - (Column_Space_01.right - Column_Space_013.right))) <= 1).assertTrue();
      console.info('[testColumnSpaceToFifty] (Column_Space_012.top - Column_Space_011.bottom): ' + (Column_Space_012.top - Column_Space_011.bottom));
      console.info('[testColumnSpaceToFifty] (Column_Space_013.top - Column_Space_012.bottom): ' + (Column_Space_013.top - Column_Space_012.bottom));
      expect(Math.floor(Math.abs((Column_Space_012.top - Column_Space_011.bottom) - (Column_Space_013.top - Column_Space_012.bottom))) <= 2).assertTrue();
      expect(Math.floor(Math.abs(Column_Space_01.top - Column_Space_011.top)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(Column_Space_013.bottom - Column_Space_01.bottom)) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_012.top - Column_Space_011.bottom) - uiContext!.vp2px(50))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_013.top - Column_Space_012.bottom) - uiContext!.vp2px(50))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_011.bottom - Column_Space_011.top) - uiContext!.vp2px(50))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_012.bottom - Column_Space_012.top) - uiContext!.vp2px(100))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_013.bottom - Column_Space_013.top) - uiContext!.vp2px(150))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_011.right - Column_Space_011.left) - uiContext!.vp2px(300))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_012.right - Column_Space_012.left) - uiContext!.vp2px(300))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_013.right - Column_Space_013.left) - uiContext!.vp2px(300))) <= 1).assertTrue();

      console.info('[testColumnSpaceToFifty] END');
    });
    
    



    /**
     * @tc.number   testColumnSpaceToSeventy_static
     * @tc.name     testColumnSpaceToSeventy_static
     * @tc.desc     testColumnSpaceToSeventy_static
     * @tc.level    Level.LEVEL0
     */
    it('testColumnSpaceToSeventy_static', Level.LEVEL0, async () => {
      console.info('[testColumnSpaceToSeventy] START');
      const uiContext = AppStorage.get<UIContext>('uiContext');
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({
        name: 'addSpace', value: 70
      });
      await CommonFunc.sleep(3000);
      let Column_Space_011: RectValue = CommonFunc.getComponentRect('Column_Space_011');
      let Column_Space_012: RectValue = CommonFunc.getComponentRect('Column_Space_012');
      let Column_Space_013: RectValue = CommonFunc.getComponentRect('Column_Space_013');
      let Column_Space_01: RectValue = CommonFunc.getComponentRect('Column_Space_01');
      expect(Math.floor(Math.abs(Column_Space_01.top - Column_Space_011.top)) <= 1).assertTrue();
      expect(Column_Space_013.bottom).assertLarger(Column_Space_01.bottom);
      expect(Math.floor(Math.abs((Column_Space_011.left - Column_Space_01.left) - (Column_Space_01.right - Column_Space_011.right))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Column_Space_012.left - Column_Space_01.left) - (Column_Space_01.right - Column_Space_012.right))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Column_Space_013.left - Column_Space_01.left) - (Column_Space_01.right - Column_Space_013.right))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Column_Space_012.top - Column_Space_011.bottom) - (Column_Space_013.top - Column_Space_012.bottom))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Column_Space_012.top - Column_Space_011.bottom) - uiContext!.vp2px(70))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_011.bottom - Column_Space_011.top) - uiContext!.vp2px(50))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_012.bottom - Column_Space_012.top) - uiContext!.vp2px(100))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_013.bottom - Column_Space_013.top) - uiContext!.vp2px(150))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_011.right - Column_Space_011.left) - uiContext!.vp2px(300))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_012.right - Column_Space_012.left) - uiContext!.vp2px(300))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Column_Space_013.right - Column_Space_013.left) - uiContext!.vp2px(300))) <= 1).assertTrue();

      console.info('[testColumnSpaceToSeventy] END');
    });
  })
}
