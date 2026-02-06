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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../../hypium';
import router from '@ohos.router';
import { FlexAlign } from '@ohos.arkui.component'
// import {fp2px,lpx2px} from '@ohos.arkui.UIContext'
import  RectValue from '../../../../ets/MainAbility/common/Rect';
import CommonFunc from '../../../../ets/MainAbility/common/Common';
// import GlobalContext from '../../../ets/MainAbility/common/GlobalContext'
import { MessageManager, Callback } from '../../../../ets/MainAbility/common/MessageManager';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest, startAbility } from '../../Util.test';
import inspector from '@ohos.arkui.inspector';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function columnNesting_alignItems() {
  describe('columnNesting_alignItems', () => {
    beforeAll(async () => {
      console.info("columnNesting_alignItems beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.layout.static", "EntryAbility");

    })
    beforeEach(async (): Promise<void> =>{
      console.info("columnNesting_alignItems beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Column/columnNesting/columnNesting_alignItems",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router")
        routerInstance?.clear();
        let pages = routerInstance?.getState();
        console.info("get columnNesting_alignItems state pages1:" + JSON.stringify(pages));
        if (!("columnNesting_alignItems" == pages?.name)) {
          console.info("get columnNesting_alignItems pages.name:" + JSON.stringify(pages?.name));
          // let result = await router.push(options);
          routerInstance?.pushUrl(options);
          await CommonFunc.sleep(2000);
          pages = routerInstance?.getState();
          console.info("get columnNesting_alignItems state pages2:" + JSON.stringify(pages));
          // console.info("push columnNesting_alignItems page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push columnNesting_alignItems page error " + JSON.stringify(err));
        expect().assertFail();
      }
    });
    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("columnNesting_alignItems after each called")
    });

    
    



    /**
     * @tc.number   testColumnSpace_static
     * @tc.name     testColumnSpace_static
     * @tc.desc     testColumnSpace_static
     * @tc.level    Level.LEVEL0
     */
    it('testColumnSpace_static', Level.LEVEL0, async () => {
      console.info('[testColumnSpace_static] START');
      await CommonFunc.sleep(4000);
      const uiContext = AppStorage.get<UIContext>("uiContext")
      console.log('get Initial value')
      let columnNesting_alignItems_011: RectValue = CommonFunc.getComponentRect('columnNesting_alignItems_011');
      let columnNesting_alignItems_012: RectValue = CommonFunc.getComponentRect('columnNesting_alignItems_012');
      let columnNesting_alignItems_013: RectValue = CommonFunc.getComponentRect('columnNesting_alignItems_013');
      let columnNesting_alignItems_01: RectValue = CommonFunc.getComponentRect('columnNesting_alignItems_01');
      let columnNesting_alignItems_021: RectValue = CommonFunc.getComponentRect('columnNesting_alignItems_021');
      let columnNesting_alignItems_022: RectValue = CommonFunc.getComponentRect('columnNesting_alignItems_022');
      let columnNesting_alignItems_023: RectValue = CommonFunc.getComponentRect('columnNesting_alignItems_023');
      let columnNesting_alignItems_02: RectValue = CommonFunc.getComponentRect('columnNesting_alignItems_02');
      let columnNesting_alignItems_1: RectValue = CommonFunc.getComponentRect('columnNesting_alignItems_1');
      console.log('assert position')
      expect(Math.floor(Math.abs((columnNesting_alignItems_011.left - columnNesting_alignItems_01.left))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((columnNesting_alignItems_012.left - columnNesting_alignItems_01.left))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((columnNesting_alignItems_013.left - columnNesting_alignItems_01.left))) <= 1).assertTrue();

      expect(Math.floor(Math.abs((columnNesting_alignItems_021.right - columnNesting_alignItems_02.right))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((columnNesting_alignItems_022.right - columnNesting_alignItems_02.right))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((columnNesting_alignItems_023.right - columnNesting_alignItems_02.right))) <= 1).assertTrue();

      expect(Math.floor(Math.abs((columnNesting_alignItems_01.top - columnNesting_alignItems_011.top))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((columnNesting_alignItems_1.top - columnNesting_alignItems_01.top))) <= 1).assertTrue();

      console.log('assert space')
      console.log('[testColumnSpace_static] columnNesting_alignItems_012.top - columnNesting_alignItems_011.bottom', +(columnNesting_alignItems_012.top - columnNesting_alignItems_011.bottom))
      console.log('[testColumnSpace_static] columnNesting_alignItems_013.top - columnNesting_alignItems_012.bottom', +(columnNesting_alignItems_013.top - columnNesting_alignItems_012.bottom))
      console.log('[testColumnSpace_static] columnNesting_alignItems_022.top - columnNesting_alignItems_021.bottom', +(columnNesting_alignItems_022.top - columnNesting_alignItems_021.bottom))
      console.log('[testColumnSpace_static] columnNesting_alignItems_023.top - columnNesting_alignItems_022.bottom', +(columnNesting_alignItems_023.top - columnNesting_alignItems_022.bottom))
      expect(Math.floor(Math.abs((columnNesting_alignItems_012.top - columnNesting_alignItems_011.bottom) - (columnNesting_alignItems_013.top - columnNesting_alignItems_012.bottom))) <= 2)
        .assertTrue();
      expect(Math.floor(Math.abs((columnNesting_alignItems_022.top - columnNesting_alignItems_021.bottom) - (columnNesting_alignItems_023.top - columnNesting_alignItems_022.bottom))) <= 2)
        .assertTrue();

      expect(Math.floor(Math.abs((columnNesting_alignItems_012.top - columnNesting_alignItems_011.bottom) - uiContext!.vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((columnNesting_alignItems_013.top - columnNesting_alignItems_012.bottom) - uiContext!.vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((columnNesting_alignItems_022.top - columnNesting_alignItems_021.bottom) - uiContext!.vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((columnNesting_alignItems_023.top - columnNesting_alignItems_022.bottom) - uiContext!.vp2px(10))) <= 1)
        .assertTrue();
      console.log('[testColumnSpace_static] columnNesting_alignItems_02.top - columnNesting_alignItems_01.bottom', +(columnNesting_alignItems_02.top - columnNesting_alignItems_01.bottom))
      expect(Math.floor(Math.abs((columnNesting_alignItems_02.top - columnNesting_alignItems_01.bottom) - uiContext!.vp2px(30))) <= 1)
        .assertTrue();

      console.log('assert height')
      console.log('column_01 assert height')
      expect(Math.floor(Math.abs(columnNesting_alignItems_011.bottom - columnNesting_alignItems_011.top - uiContext!.vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs(columnNesting_alignItems_012.bottom - columnNesting_alignItems_012.top - uiContext!.vp2px(100))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs(columnNesting_alignItems_013.bottom - columnNesting_alignItems_013.top - uiContext!.vp2px(150))) <= 1)
        .assertTrue();

      console.log('column_02 assert height')
      expect(Math.floor(Math.abs(columnNesting_alignItems_021.bottom - columnNesting_alignItems_021.top - uiContext!.vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs(columnNesting_alignItems_022.bottom - columnNesting_alignItems_022.top - uiContext!.vp2px(100))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs(columnNesting_alignItems_023.bottom - columnNesting_alignItems_023.top - uiContext!.vp2px(150))) <= 1)
        .assertTrue();

      expect(Math.floor(Math.abs(columnNesting_alignItems_01.bottom - columnNesting_alignItems_01.top - uiContext!.vp2px(400))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs(columnNesting_alignItems_02.bottom - columnNesting_alignItems_02.top - uiContext!.vp2px(400))) <= 1)
        .assertTrue();

      console.log('assert weight')
      console.log('column_01 assert weight')
      expect(Math.floor(Math.abs(columnNesting_alignItems_011.right - columnNesting_alignItems_011.left - uiContext!.vp2px(300))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs(columnNesting_alignItems_012.right - columnNesting_alignItems_012.left - uiContext!.vp2px(300))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs(columnNesting_alignItems_013.right - columnNesting_alignItems_013.left - uiContext!.vp2px(300))) <= 1)
        .assertTrue();

      console.log('column_02 assert weight')
      expect(Math.floor(Math.abs(columnNesting_alignItems_021.right - columnNesting_alignItems_021.left - uiContext!.vp2px(300))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs(columnNesting_alignItems_022.right - columnNesting_alignItems_022.left - uiContext!.vp2px(300))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs(columnNesting_alignItems_023.right - columnNesting_alignItems_023.left - uiContext!.vp2px(300))) <= 1)
        .assertTrue();

      expect(Math.floor(Math.abs(columnNesting_alignItems_01.right - columnNesting_alignItems_01.left - uiContext!.vp2px(350))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs(columnNesting_alignItems_02.right - columnNesting_alignItems_02.left - uiContext!.vp2px(350))) <= 1)
        .assertTrue();

      console.info('[testColumnSpace_static] END');
    });
  })
}
