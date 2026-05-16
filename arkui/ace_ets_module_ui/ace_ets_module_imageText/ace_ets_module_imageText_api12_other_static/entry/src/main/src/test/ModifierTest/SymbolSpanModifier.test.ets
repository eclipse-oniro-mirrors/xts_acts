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

import router from '@ohos.router';

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import { UtilsTest, startAbility } from "../Util.test"
import CommonFunc from '../../../ets/MainAbility/common/Common';

let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function SymbolSpanModifierTest() {
  describe('SymbolSpanModifierTest', () => {
    beforeAll(() => {
      console.info("SymbolSpanModifierTest beforeAll start");

      await UtilsTest.startAbility("com.arkui.ace.imageText.api12.other.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("SymbolSpanModifierTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Modifier/SymbolSpanModifier',
      }
      try {


        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages: router.RouterState = routerInstance.getState();
        console.info("get SymbolSpanModifierTest state pages:" + JSON.stringify(pages));
        if (!("SymbolSpanModifier" == pages.name)) {
          console.info("get SymbolSpanModifierTest pages.name:" + JSON.stringify(pages.name));
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push SymbolSpanModifierTest page error: " + err);
        expect().assertFail();
      }
      // done();
    });


    
    
    


/**
     * @tc.number   SymbolSpanModifierTest_static_0010
     * @tc.name     SymbolSpanModifierTest_static_0010
     * @tc.desc     SymbolSpanModifierTest_static_0010
     * @tc.level    Level.LEVEL0
     */
it('SymbolSpanModifierTest_static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SymbolSpanModifierTest_static_0010 START');
      await CommonFunc.sleep(1000);
      console.info('SymbolSpanModifierTest_static_0010 SymbolSpanModifier_get_fontSize');
      let strJson = inspector.getInspectorByKey('SymbolSpanModifier_get_fontSize');
      console.info('SymbolSpanModifierTest_static_0010 getInspectorByKey');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[SymbolSpanModifierTest_static_0010] SymbolSpanModifier fontSize:" +
      JSON.stringify(obj.getElement("$attrs").getString('fontSize')));
      expect(obj.getElement("$attrs").getString('fontSize')).assertEqual('100.00fp');
      console.info('[SymbolSpanModifierTest_static_0010] END');
      done();
    });


    
    
    


/**
     * @tc.number   SymbolSpanModifierTest_static_0020
     * @tc.name     SymbolSpanModifierTest_static_0020
     * @tc.desc     SymbolSpanModifierTest_static_0020
     * @tc.level    Level.LEVEL0
     */
it('SymbolSpanModifierTest_static_0020', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SymbolSpanModifierTest_static_0020 START');
      await CommonFunc.sleep(1000);
      console.info('SymbolSpanModifierTest_static_0010 SymbolSpanModifier_get_type');
      let strJson = inspector.getInspectorByKey('SymbolSpanModifier_get_type');
      console.info('SymbolSpanModifierTest_static_0010 getInspectorByKey');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[SymbolSpanModifierTest_static_0020] SymbolSpanInstance type is: " +
      JSON.stringify(obj.getElement("$attrs").getString("text")));
      expect(obj.getElement("$attrs").getString("text")).assertEqual('undefined');
      console.info('[SymbolSpanModifierTest_static_0020] END');
      done();
    });
  })
}

