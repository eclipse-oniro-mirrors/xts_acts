'use static';
/*
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

import { describe, beforeAll, beforeEach, afterEach, it, expect, Level, TestType, Size } from "../../../../hypium/index"
import router from '@ohos.router';
import {
  Component,
  Driver,
  Component,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility, stopApplication } from '../Util.test';

let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function interstitialDialogActionTest() {

  describe('interstitialDialogActionTest', () => {
    beforeAll(() => {
      await UtilsTest.startAbility("com.arkui.ace.dialog.api12.static", "EntryAbility")
    })
    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Dialog/InterstitialDialogAction',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages: router.RouterState = routerInstance.getState();
        console.info("get interstitialDialogActionTest state pages: " + JSON.stringify(pages));
        if (!("InterstitialDialogAction" == pages.name)) {
          console.info("get interstitialDialogActionTest state pages.name: " + JSON.stringify(pages.name));
          routerInstance.replaceUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push interstitialDialogActionTest page error: " + err);
        expect().assertFail();
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("interstitialDialogActionTest after each called");
    });


    /**
     * @tc.number   interstitialDialogActionTest_static_0010
     * @tc.name     interstitialDialogActionTest_static_0010
     * @tc.desc     interstitialDialogActionTest_static_0010
     * @tc.level    Level.LEVEL2
     */
    it('interstitialDialogActionTest_static_0010', Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        console.info('interstitialDialogActionTest_0010 START');
        let driver = Driver.create()
        await CommonFunc.sleep(1000);
        let button: Component = await driver.findComponent(ON.id('interstitialDialogAction_id')) as Component;
        await button.click();
        await CommonFunc.sleep(1000);
        await driver.assertComponentExist(ON.text('Main Title'));
        await CommonFunc.sleep(5000);
        console.info('[interstitialDialogActionTest_0010] END');
      } catch (err) {
        expect().assertFail()
      }
      done();
    });


    /**
     * @tc.number   interstitialDialogActionTest_static_0020
     * @tc.name     interstitialDialogActionTest_static_0020
     * @tc.desc     interstitialDialogActionTest_static_0020
     * @tc.level    Level.LEVEL2
     */
    it('interstitialDialogActionTest_static_0020', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('interstitialDialogActionTest_0020 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button: Component = await driver.findComponent(ON.id('interstitialDialogAction_id')) as Component;
      await button.click();
      await CommonFunc.sleep(1000);
      await driver.assertComponentExist(ON.text('Main Title'));
      await CommonFunc.sleep(5000);
      let strJson = inspector.getInspectorByKey('interstitialDialogAction_id');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[interstitialDialogActionTest_0020] dragPreviewOptions: " + JSON.stringify(obj));
      console.info("[interstitialDialogActionTest_0020] dragPreviewOptions: " +
      JSON.stringify(obj.getString('$attrs')));
      expect(obj.getElement('$attrs').getString('label')).assertEqual('closeDialog succ');
      console.info('[interstitialDialogActionTest_0020] END');
      done();
    });
  })
}
