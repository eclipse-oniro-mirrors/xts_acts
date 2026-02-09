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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON,  MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from "../Util.test"
import CommonFunc from "../../../ets/MainAbility/common/Common";
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;


export default function RichEditorMenuPolicyJsunit() {
  describe('RichEditorMenuPolicyJsunit', () => {
    beforeAll(() => {
      console.info("RichEditorMenuPolicyJsunit beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.imageText.nowear.api12.static", "EntryAbility");

    });
    beforeEach(async (): Promise<void> => {
      console.info("RichEditorMenuPolicyJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorEnhance01/RichEditorMenuPolicy',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get RichEditorMenuPolicyJsunit state pages:" + JSON.stringify(pages));
        if (!("RichEditorMenuPolicyJsunit" == pages.name)) {
          console.info("get RichEditorMenuPolicyJsunit pages.name:" + JSON.stringify(pages.name));
          let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          let driver = Driver.create();
          await driver.delayMs(2000)
          console.info("push RichEditorMenuPolicyJsunit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorMenuPolicyJsunit page error:" + err);
      }
      console.info("RichEditorMenuPolicyJsunit beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      let driver = Driver.create();
      await driver.delayMs(1000)
      console.info("RichEditorMenuPolicyJsunit after each called");
    });

    
    
/**
     * @tc.number   RichEditorMenuPolicyJsunit_static_0100
     * @tc.name     RichEditorMenuPolicyJsunit_static_0100
     * @tc.desc     RichEditorMenuPolicyJsunit_static_0100
     * @tc.level    Level.LEVEL2
     */
    it('RichEditorMenuPolicyJsunit_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[RichEditorMenuPolicyJsunit_0100] START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000)
      let DeButtonCon = await driver.findComponent(ON.id("RichEditorMenuPolicy_DEFAULT"));
      await (DeButtonCon?.click() as Promise<void>);
      await CommonFunc.sleep(500)
      let RichEditorMenuPolicyCon = await driver.findComponent(ON.id("RichEditorMenuPolicyCon"));
      await CommonFunc.sleep(500)
      await (RichEditorMenuPolicyCon?.click() as Promise<void>);
      await CommonFunc.sleep(500)
      await (RichEditorMenuPolicyCon?.longClick() as Promise<void>);
      await CommonFunc.sleep(500)


        let RichEditorPopCon = await driver.findComponent(ON.text("全选", MatchPattern.CONTAINS));
        await CommonFunc.sleep(500)
        expect(RichEditorPopCon == null).assertTrue()

      console.info('[RichEditorMenuPolicyJsunit_0100] END');
      done();
    });

    
    
/**
     * @tc.number   RichEditorMenuPolicyJsunit_static_0200
     * @tc.name     RichEditorMenuPolicyJsunit_static_0200
     * @tc.desc     RichEditorMenuPolicyJsunit_static_0200
     * @tc.level    Level.LEVEL2
     */
    it('RichEditorMenuPolicyJsunit_static_0200', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[RichEditorMenuPolicyJsunit_0200] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500)
      let DeButtonCon = await driver.findComponent(ON.id("RichEditorMenuPolicy_DEFAULT"));
      await CommonFunc.sleep(500)
      await (DeButtonCon?.click() as Promise<void>)
      await CommonFunc.sleep(500)
      let NeButtonCon = await driver.findComponent(ON.id("RichEditorMenuPolicy_HIDE"));
      await CommonFunc.sleep(500)
      await (NeButtonCon?.click() as Promise<void>)
      await CommonFunc.sleep(500)
      let RichEditorMenuPolicyCon = await driver.findComponent(ON.id("RichEditorMenuPolicyCon"));
      await CommonFunc.sleep(500)
      await (RichEditorMenuPolicyCon?.longClick() as Promise<void>)
      await CommonFunc.sleep(500)


        let RichEditorCon = await driver.findComponent(ON.text("剪切", MatchPattern.CONTAINS));
        await CommonFunc.sleep(500)
        expect(RichEditorCon != null).assertTrue()

      console.info('[RichEditorMenuPolicyJsunit_0200] END');
      done();
    });
  })
}