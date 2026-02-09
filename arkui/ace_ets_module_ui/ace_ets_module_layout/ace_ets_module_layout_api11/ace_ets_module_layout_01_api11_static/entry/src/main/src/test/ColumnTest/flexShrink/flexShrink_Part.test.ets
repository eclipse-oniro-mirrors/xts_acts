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
import { UIContext } from "@ohos.arkui.UIContext";
import router from '@ohos.router';
import RectValue from '../../../../ets/MainAbility/common/Rect';
import CommonFunc from '../../../../ets/MainAbility/common/Common';
import { GlobalContext } from '../../../../ets/MainAbility/common/GlobalContext'
import {MessageManager,Callback} from '../../../../ets/MainAbility/common/MessageManager';
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
let testAbilityContext:common.UIAbilityContext;

export default function flexShrink_Part() {
  describe('flexShrink_Part',  () =>{
    beforeAll(() => {
      console.info("flexGrow_Default beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.layout.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("flexShrink_Part beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Column/flexShrink/flexShrink_Part",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get flexShrink_Part state pages:" + JSON.stringify(pages));
        if (!("flexShrink_Part" == pages.name)) {
          console.info("get flexShrink_Part pages.name:" + '');
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push flexShrink_Part page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push flexShrink_Part page error:" + err);
      }
      console.info("flexShrink_Part beforeEach end");
    });

    afterEach(async  () =>{
      await CommonFunc.sleep(2000);
      console.info("flexShrink_Part after each called")
    });

    
    



    /**
     * @tc.number   testflexShrink_static
     * @tc.name     testflexShrink_static
     * @tc.desc     testflexShrink_static
     * @tc.level    Level.LEVEL0
     */
    it('testflexShrink_static', Level.LEVEL0, async () => {
      console.info('[testflexShrink_static] START');
      const uiContext = AppStorage.get<UIContext>('uiContext');
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({name:'addflexShrink', value:1});
      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Column_flexShrink_011: RectValue = CommonFunc.getComponentRect('Column_flexShrink_011');
      let Column_flexShrink_012: RectValue = CommonFunc.getComponentRect('Column_flexShrink_012');
      let Column_flexShrink_013: RectValue = CommonFunc.getComponentRect('Column_flexShrink_013');
      let Column_flexShrink_01: RectValue = CommonFunc.getComponentRect('Column_flexShrink_01');
      console.log('assert position')
      expect(Math.abs(Math.round(Column_flexShrink_011.left - Column_flexShrink_01.left) - Math.round(Column_flexShrink_01.right - Column_flexShrink_011.right)) <= 1).assertTrue();
      expect(Math.abs(Math.round(Column_flexShrink_012.left - Column_flexShrink_01.left) - Math.round(Column_flexShrink_01.right - Column_flexShrink_012.right)) <= 1).assertTrue();
      expect(Math.abs(Math.round(Column_flexShrink_013.left - Column_flexShrink_01.left) - Math.round(Column_flexShrink_01.right - Column_flexShrink_013.right)) <= 1).assertTrue();
      expect(Math.abs(Math.round(Column_flexShrink_012.top - Column_flexShrink_011.bottom) - Math.round(Column_flexShrink_013.top - Column_flexShrink_012.bottom)) <= 1).assertTrue();
      console.log('assert space')
      expect(Math.abs(Column_flexShrink_012.top - Column_flexShrink_011.bottom - uiContext!.vp2px(10)) <= 1).assertTrue();
      expect(Math.abs(Column_flexShrink_013.top - Column_flexShrink_012.bottom - uiContext!.vp2px(10)) <= 1).assertTrue();
      console.log('Column_flexShrink_012.top - Column_flexShrink_011.bottom', + (Column_flexShrink_012.top - Column_flexShrink_011.bottom))
      console.log('Column_flexShrink_013.top - Column_flexShrink_012.bottom', + (Column_flexShrink_013.top - Column_flexShrink_012.bottom))
      expect(Math.abs(Column_flexShrink_01.top - Column_flexShrink_011.top) <= 1).assertTrue();
      expect(Math.abs(Column_flexShrink_013.bottom - Column_flexShrink_01.bottom) <= 1).assertTrue();
      console.log('assert height')
      expect(Math.abs(Column_flexShrink_011.bottom - Column_flexShrink_011.top - uiContext!.vp2px(300)) <= 1).assertTrue();
      console.log('Column_flexShrink_011.bottom - Column_flexShrink_011.top', + (Column_flexShrink_011.bottom - Column_flexShrink_011.top))
      expect(Math.abs(Column_flexShrink_012.bottom - Column_flexShrink_012.top - uiContext!.vp2px(65)) <= 1).assertTrue();
      console.log('Column_flexShrink_012.bottom - Column_flexShrink_012.top', + (Column_flexShrink_012.bottom - Column_flexShrink_012.top))
      expect(Math.abs(Column_flexShrink_013.bottom - Column_flexShrink_013.top - uiContext!.vp2px(65)) <= 1).assertTrue();
      console.log('Column_flexShrink_013.bottom - Column_flexShrink_013.top', + (Column_flexShrink_013.bottom - Column_flexShrink_013.top))
      console.log('assert weight')
      expect(Math.abs(Column_flexShrink_011.right - Column_flexShrink_011.left - uiContext!.vp2px(300)) <= 1).assertTrue();
      expect(Math.abs(Column_flexShrink_012.right - Column_flexShrink_012.left - uiContext!.vp2px(300)) <= 1).assertTrue();
      expect(Math.abs(Column_flexShrink_013.right - Column_flexShrink_013.left - uiContext!.vp2px(300)) <= 1).assertTrue();
      console.info('[testflexShrink_static] END');
    });
    
    



    /**
     * @tc.number   SUB_ACE_flexShrink_Part_TEST_static_0200
     * @tc.name     SUB_ACE_flexShrink_Part_TEST_static_0200
     * @tc.desc     SUB_ACE_flexShrink_Part_TEST_static_0200
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ACE_flexShrink_Part_TEST_static_0200', Level.LEVEL0, async () => {
      console.info('[SUB_ACE_flexShrink_Part_TEST_0200] START');
      const uiContext = AppStorage.get<UIContext>('uiContext');
      AppStorage.get<MessageManager<number>>("messageManager")?.notify({name:'addflexShrink', value:2});
      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Column_flexShrink_011: RectValue = CommonFunc.getComponentRect('Column_flexShrink_011');
      let Column_flexShrink_012: RectValue = CommonFunc.getComponentRect('Column_flexShrink_012');
      let Column_flexShrink_013: RectValue = CommonFunc.getComponentRect('Column_flexShrink_013');
      let Column_flexShrink_01: RectValue = CommonFunc.getComponentRect('Column_flexShrink_01');
      console.log('assert position')
      expect(Math.abs(Math.round(Column_flexShrink_011.left - Column_flexShrink_01.left) - Math.round(Column_flexShrink_01.right - Column_flexShrink_011.right)) <= 1).assertTrue();
      expect(Math.abs(Math.round(Column_flexShrink_012.left - Column_flexShrink_01.left) - Math.round(Column_flexShrink_01.right - Column_flexShrink_012.right)) <= 1).assertTrue();
      expect(Math.abs(Math.round(Column_flexShrink_013.left - Column_flexShrink_01.left) - Math.round(Column_flexShrink_01.right - Column_flexShrink_013.right)) <= 1).assertTrue();
      expect(Math.abs(Math.round(Column_flexShrink_012.top - Column_flexShrink_011.bottom) - Math.round(Column_flexShrink_013.top - Column_flexShrink_012.bottom)) <= 1).assertTrue();
      console.log('assert space')
      expect(Math.abs(Column_flexShrink_012.top - Column_flexShrink_011.bottom - uiContext!.vp2px(10)) <= 1).assertTrue();
      expect(Math.abs(Column_flexShrink_013.top - Column_flexShrink_012.bottom - uiContext!.vp2px(10)) <= 1).assertTrue();
      console.log('Column_flexShrink_012.top - Column_flexShrink_011.bottom', + (Column_flexShrink_012.top - Column_flexShrink_011.bottom))
      console.log('Column_flexShrink_013.top - Column_flexShrink_012.bottom', + (Column_flexShrink_013.top - Column_flexShrink_012.bottom))
      expect(Math.abs(Column_flexShrink_01.top - Column_flexShrink_011.top) <= 1).assertTrue();
      expect(Math.abs(Column_flexShrink_013.bottom - Column_flexShrink_01.bottom) <= 1).assertTrue();
      console.log('assert height')
      expect(Math.abs(Column_flexShrink_011.bottom - Column_flexShrink_011.top - uiContext!.vp2px(300)) <= 1).assertTrue();
      console.log('Column_flexShrink_011.bottom - Column_flexShrink_011.top', + (Column_flexShrink_011.bottom - Column_flexShrink_011.top))
      expect(Math.abs(Column_flexShrink_012.bottom - Column_flexShrink_012.top - uiContext!.vp2px(65)) <= 1).assertTrue();
      console.log('Column_flexShrink_012.bottom - Column_flexShrink_012.top', + (Column_flexShrink_012.bottom - Column_flexShrink_012.top))
      expect(Math.abs(Column_flexShrink_013.bottom - Column_flexShrink_013.top - uiContext!.vp2px(65)) <= 1).assertTrue();
      console.log('Column_flexShrink_013.bottom - Column_flexShrink_013.top', + (Column_flexShrink_013.bottom - Column_flexShrink_013.top))
      console.log('assert weight')
      expect(Math.abs(Column_flexShrink_011.right - Column_flexShrink_011.left - uiContext!.vp2px(300)) <= 1).assertTrue();
      expect(Math.abs(Column_flexShrink_012.right - Column_flexShrink_012.left - uiContext!.vp2px(300)) <= 1).assertTrue();
      expect(Math.abs(Column_flexShrink_013.right - Column_flexShrink_013.left - uiContext!.vp2px(300)) <= 1).assertTrue();
      console.info('[SUB_ACE_flexShrink_Part_TEST_0200] END');
    });

  })
}