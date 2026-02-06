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
import CommonFunc from '../../../../ets/MainAbility/common/Common';
import {GlobalContext} from '../../../../ets/MainAbility/common/GlobalContext'
import { MessageManager, Callback } from '../../../../ets/MainAbility/common/MessageManager';
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
import { UtilsTest } from '../../Util.test';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function layoutWeight_Part() {
  describe('layoutWeight_Part', () => {
    beforeAll(() => {
      console.info("layoutWeight_Part beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.layout.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("layoutWeight_Part beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Column/layoutWeight/layoutWeight_Part",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get layoutWeight_Part state pages:" + JSON.stringify(pages));
        if (!("layoutWeight_Part" == pages.name)) {
          console.info("get layoutWeight_Part pages.name:" + '');
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push layoutWeight_Part page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push layoutWeight_Part page error:" + err);
      }
      console.info("layoutWeight_Part beforeEach end");
    });

    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("layoutWeight_Part after each called")
    });

    
    



    /**
     * @tc.number   SUB_ACE_layoutWeight_Part_TEST_static_0100
     * @tc.name     SUB_ACE_layoutWeight_Part_TEST_static_0100
     * @tc.desc     SUB_ACE_layoutWeight_Part_TEST_static_0100
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ACE_layoutWeight_Part_TEST_static_0100', Level.LEVEL0, async () => {
      console.info('[SUB_ACE_layoutWeight_Part_TEST_static_0100] START');
      const uiContext = AppStorage.get<UIContext>('uiContext');
      AppStorage.get<MessageManager<string>>("messageManager")?.notify({
        name: 'layoutWeight1', value: '2'
      });
      AppStorage.get<MessageManager<string>>("messageManager")?.notify({
        name: 'layoutWeight2', value: '2'
      });
      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Column_layoutWeight_021: RectValue = CommonFunc.getComponentRect('Column_layoutWeight_021');
      let Column_layoutWeight_022: RectValue = CommonFunc.getComponentRect('Column_layoutWeight_022');
      let Column_layoutWeight_023: RectValue = CommonFunc.getComponentRect('Column_layoutWeight_023');
      let Column_layoutWeight_02: RectValue = CommonFunc.getComponentRect('Column_layoutWeight_02');
      console.log('assert position')
      expect(Math.abs((Math.round(Column_layoutWeight_021.left - Column_layoutWeight_02.left)) - (Math.round(Column_layoutWeight_02.right - Column_layoutWeight_021.right))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Column_layoutWeight_022.left - Column_layoutWeight_02.left)) - (Math.round(Column_layoutWeight_02.right - Column_layoutWeight_022.right))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Column_layoutWeight_023.left - Column_layoutWeight_02.left)) - (Math.round(Column_layoutWeight_02.right - Column_layoutWeight_023.right))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Column_layoutWeight_022.top - Column_layoutWeight_021.bottom)) - (Math.round(Column_layoutWeight_023.top - Column_layoutWeight_022.bottom))) <= 1)
        .assertTrue();
      console.log('assert space')
      expect(Math.abs((Math.round(Column_layoutWeight_022.top - Column_layoutWeight_021.bottom)) - (Math.round(uiContext!.vp2px(10)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Column_layoutWeight_023.top - Column_layoutWeight_022.bottom)) - (Math.round(uiContext!.vp2px(10)))) <= 1)
        .assertTrue();
      expect(Math.abs((Column_layoutWeight_02.top) - (Column_layoutWeight_021.top)) <= 1).assertTrue();
      expect(Math.abs((Column_layoutWeight_023.bottom) - (Column_layoutWeight_02.bottom)) <= 1).assertTrue();
      console.log('assert height')
      expect(Math.abs((Math.round(Column_layoutWeight_021.bottom - Column_layoutWeight_021.top)) - (Math.round(uiContext!.vp2px(165)))) <= 1)
        .assertTrue();
      console.log('Column_layoutWeight_021.bottom - Column_layoutWeight_021.top', +(Column_layoutWeight_021.bottom - Column_layoutWeight_021.top))
      expect(Math.abs((Math.round(Column_layoutWeight_022.bottom - Column_layoutWeight_022.top)) - (Math.round(uiContext!.vp2px(165)))) <= 1)
        .assertTrue();
      console.log('Column_layoutWeight_022.bottom - Column_layoutWeight_022.top', +(Column_layoutWeight_022.bottom - Column_layoutWeight_022.top))
      expect(Math.abs((Math.round(Column_layoutWeight_023.bottom - Column_layoutWeight_023.top)) - (Math.round(uiContext!.vp2px(100)))) <= 1)
        .assertTrue();
      console.log('Column_layoutWeight_023.bottom - Column_layoutWeight_023.top', +(Column_layoutWeight_023.bottom - Column_layoutWeight_023.top))
      console.log('assert weight')
      expect(Math.abs((Math.round(Column_layoutWeight_021.right - Column_layoutWeight_021.left)) - (Math.round(uiContext!.vp2px(300)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Column_layoutWeight_022.right - Column_layoutWeight_022.left)) - (Math.round(uiContext!.vp2px(300)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Column_layoutWeight_023.right - Column_layoutWeight_023.left)) - (Math.round(uiContext!.vp2px(300)))) <= 1)
        .assertTrue();
      console.info('[SUB_ACE_layoutWeight_Part_TEST_static_0100] END');
    });
    
    



    /**
     * @tc.number   SUB_ACE_layoutWeight_Part_TEST_static_0200
     * @tc.name     SUB_ACE_layoutWeight_Part_TEST_static_0200
     * @tc.desc     SUB_ACE_layoutWeight_Part_TEST_static_0200
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ACE_layoutWeight_Part_TEST_static_0200', Level.LEVEL0, async () => {
      console.info('[SUB_ACE_layoutWeight_Part_TEST_static_0200] START');
      const uiContext = AppStorage.get<UIContext>('uiContext');
      AppStorage.get<MessageManager<string>>("messageManager")?.notify({
        name: 'layoutWeight1', value: '3'
      });
      AppStorage.get<MessageManager<string>>("messageManager")?.notify({
        name: 'layoutWeight2', value: '3'
      });
      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Column_layoutWeight_021: RectValue = CommonFunc.getComponentRect('Column_layoutWeight_021');
      let Column_layoutWeight_022: RectValue = CommonFunc.getComponentRect('Column_layoutWeight_022');
      let Column_layoutWeight_023: RectValue = CommonFunc.getComponentRect('Column_layoutWeight_023');
      let Column_layoutWeight_02: RectValue = CommonFunc.getComponentRect('Column_layoutWeight_02');
      console.log('assert position')
      expect(Math.abs((Math.round(Column_layoutWeight_021.left - Column_layoutWeight_02.left)) - (Math.round(Column_layoutWeight_02.right - Column_layoutWeight_021.right))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Column_layoutWeight_022.left - Column_layoutWeight_02.left)) - (Math.round(Column_layoutWeight_02.right - Column_layoutWeight_022.right))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Column_layoutWeight_023.left - Column_layoutWeight_02.left)) - (Math.round(Column_layoutWeight_02.right - Column_layoutWeight_023.right))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Column_layoutWeight_022.top - Column_layoutWeight_021.bottom)) - (Math.round(Column_layoutWeight_023.top - Column_layoutWeight_022.bottom))) <= 1)
        .assertTrue();
      console.log('assert space')
      expect(Math.abs((Math.round(Column_layoutWeight_022.top - Column_layoutWeight_021.bottom)) - (Math.round(uiContext!.vp2px(10)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Column_layoutWeight_023.top - Column_layoutWeight_022.bottom)) - (Math.round(uiContext!.vp2px(10)))) <= 1)
        .assertTrue();
      expect(Math.abs((Column_layoutWeight_02.top) - (Column_layoutWeight_021.top)) <= 1).assertTrue();
      expect(Math.abs((Column_layoutWeight_023.bottom) - (Column_layoutWeight_02.bottom)) <= 1).assertTrue();
      console.log('assert height')
      expect(Math.abs((Math.round(Column_layoutWeight_021.bottom - Column_layoutWeight_021.top)) - (Math.round(uiContext!.vp2px(165)))) <= 1)
        .assertTrue();
      console.log('Column_layoutWeight_021.bottom - Column_layoutWeight_021.top', +(Column_layoutWeight_021.bottom - Column_layoutWeight_021.top))
      expect(Math.abs((Math.round(Column_layoutWeight_022.bottom - Column_layoutWeight_022.top)) - (Math.round(uiContext!.vp2px(165)))) <= 1)
        .assertTrue();
      console.log('Column_layoutWeight_022.bottom - Column_layoutWeight_022.top', +(Column_layoutWeight_022.bottom - Column_layoutWeight_022.top))
      expect(Math.abs((Math.round(Column_layoutWeight_023.bottom - Column_layoutWeight_023.top)) - (Math.round(uiContext!.vp2px(100)))) <= 1)
        .assertTrue();
      console.log('Column_layoutWeight_023.bottom - Column_layoutWeight_023.top', +(Column_layoutWeight_023.bottom - Column_layoutWeight_023.top))
      console.log('assert weight')
      expect(Math.abs((Math.round(Column_layoutWeight_021.right - Column_layoutWeight_021.left)) - (Math.round(uiContext!.vp2px(300)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Column_layoutWeight_022.right - Column_layoutWeight_022.left)) - (Math.round(uiContext!.vp2px(300)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Column_layoutWeight_023.right - Column_layoutWeight_023.left)) - (Math.round(uiContext!.vp2px(300)))) <= 1)
        .assertTrue();
      console.info('[SUB_ACE_layoutWeight_Part_TEST_static_0200] END');
    });
    
    



    /**
     * @tc.number   SUB_ACE_layoutWeight_Part_TEST_static_0300
     * @tc.name     SUB_ACE_layoutWeight_Part_TEST_static_0300
     * @tc.desc     SUB_ACE_layoutWeight_Part_TEST_static_0300
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ACE_layoutWeight_Part_TEST_static_0300', Level.LEVEL0, async () => {
      console.info('[SUB_ACE_layoutWeight_Part_TEST_static_0300] START');
      const uiContext = AppStorage.get<UIContext>('uiContext');
      AppStorage.get<MessageManager<string>>("messageManager")?.notify({
        name: 'layoutWeight1', value: '3'
      });
      AppStorage.get<MessageManager<string>>("messageManager")?.notify({
        name: 'layoutWeight2', value: '2'
      });
      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Column_layoutWeight_021: RectValue = CommonFunc.getComponentRect('Column_layoutWeight_021');
      let Column_layoutWeight_022: RectValue = CommonFunc.getComponentRect('Column_layoutWeight_022');
      let Column_layoutWeight_023: RectValue = CommonFunc.getComponentRect('Column_layoutWeight_023');
      let Column_layoutWeight_02: RectValue = CommonFunc.getComponentRect('Column_layoutWeight_02');
      console.log('assert position')
      expect(Math.abs((Math.round(Column_layoutWeight_021.left - Column_layoutWeight_02.left)) - (Math.round(Column_layoutWeight_02.right - Column_layoutWeight_021.right))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Column_layoutWeight_022.left - Column_layoutWeight_02.left)) - (Math.round(Column_layoutWeight_02.right - Column_layoutWeight_022.right))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Column_layoutWeight_023.left - Column_layoutWeight_02.left)) - (Math.round(Column_layoutWeight_02.right - Column_layoutWeight_023.right))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Column_layoutWeight_022.top - Column_layoutWeight_021.bottom)) - (Math.round(Column_layoutWeight_023.top - Column_layoutWeight_022.bottom))) <= 1)
        .assertTrue();
      console.log('assert space')
      expect(Math.abs((Math.round(Column_layoutWeight_022.top - Column_layoutWeight_021.bottom)) - (Math.round(uiContext!.vp2px(10)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Column_layoutWeight_023.top - Column_layoutWeight_022.bottom)) - (Math.round(uiContext!.vp2px(10)))) <= 1)
        .assertTrue();
      expect(Math.abs((Column_layoutWeight_02.top) - (Column_layoutWeight_021.top)) <= 1).assertTrue();
      expect(Math.abs((Column_layoutWeight_023.bottom) - (Column_layoutWeight_02.bottom)) <= 1).assertTrue();
      console.log('assert height')
      expect(Math.abs((Math.round(Column_layoutWeight_021.bottom - Column_layoutWeight_021.top)) - (Math.round(uiContext!.vp2px(198)))) <= 1)
        .assertTrue();
      console.log('Column_layoutWeight_021.bottom - Column_layoutWeight_021.top', +(Column_layoutWeight_021.bottom - Column_layoutWeight_021.top))
      expect(Math.abs((Math.round(Column_layoutWeight_022.bottom - Column_layoutWeight_022.top)) - (Math.round(uiContext!.vp2px(132)))) <= 1)
        .assertTrue();
      console.log('Column_layoutWeight_022.bottom - Column_layoutWeight_022.top', +(Column_layoutWeight_022.bottom - Column_layoutWeight_022.top))
      expect(Math.abs((Math.round(Column_layoutWeight_023.bottom - Column_layoutWeight_023.top)) - (Math.round(uiContext!.vp2px(100)))) <= 1)
        .assertTrue();
      console.log('Column_layoutWeight_023.bottom - Column_layoutWeight_023.top', +(Column_layoutWeight_023.bottom - Column_layoutWeight_023.top))
      console.log('assert weight')
      expect(Math.abs((Math.round(Column_layoutWeight_021.right - Column_layoutWeight_021.left)) - (Math.round(uiContext!.vp2px(300)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Column_layoutWeight_022.right - Column_layoutWeight_022.left)) - (Math.round(uiContext!.vp2px(300)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Column_layoutWeight_023.right - Column_layoutWeight_023.left)) - (Math.round(uiContext!.vp2px(300)))) <= 1)
        .assertTrue();
      console.info('[SUB_ACE_layoutWeight_Part_TEST_static_0300] END');
    });
  })
}