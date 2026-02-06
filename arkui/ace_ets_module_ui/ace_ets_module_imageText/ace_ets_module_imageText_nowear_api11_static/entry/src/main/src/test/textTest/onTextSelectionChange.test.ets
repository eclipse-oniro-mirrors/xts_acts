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

import router from '@ohos.router';
import { describe, beforeEach,beforeAll, afterEach, it, expect, Level } from "../../../../hypium/index"
import { Driver, ON, MouseButton } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common'
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
export default function OnTextSelectionChangeTest() {
  describe('OnTextSelectionChangeTest', () : void=> {
    beforeAll(() => {
      console.info("OnTextSelectionChangeTest beforeEach start");

      await UtilsTest.startAbility("com.arkui.ace.imageText.nowear.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("OnTextSelectionChangeTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/text/onTextSelectionChange",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get OnTextSelectionChangeTest state pages:" + "");
        if (!("onTextSelectionChange1" == pages.name)) {
          console.info("get OnTextSelectionChangeTest pages.name:" + "");
          routerInstance.replaceUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push OnTextSelectionChangeTest page error:" + err);
      }
      console.info("OnTextSelectionChangeTest beforeEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("OnTextSelectionChangeTest after each called");
    });

    /**
     * @tc.number   OnTextSelectionChangeTest_static_0010
     * @tc.name     OnTextSelectionChangeTest_static_0010
     * @tc.desc     OnTextSelectionChangeTest_static_0010
     * @tc.level    Level.LEVEL2
     */
it('OnTextSelectionChangeTest_static_0010', Level.LEVEL2, async (done: ()=> void) => {
      console.info('[OnTextSelectionChangeTest_0010] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
        let textRect = CommonFunc.getComponentRectOnScreen('OnTextSelectionChange_text');
        let clickX1 = Math.round(textRect.left + 2) as int
        let clickX2 = Math.round(textRect.right - 2) as int
        let clickX3 = Math.round(textRect.right + 10) as int
        let clickY = Math.round((textRect.bottom + textRect.top)/2) as int
        await driver.mouseDrag({ x: clickX1, y: clickY },{ x: clickX2, y: clickY }, 600);
        await CommonFunc.sleep(1000);
        console.info('[OnTextSelectionChangeTest_0010] get1: ' + AppStorage.get<string>('OnTextSelectionChange'));
        expect(AppStorage.get<string>('OnTextSelectionChange')).assertEqual('start:0,end:11');
        await driver.mouseClick({ x: clickX3, y: clickY }, MouseButton.MOUSE_BUTTON_LEFT);
        await CommonFunc.sleep(1000);
        console.info('[OnTextSelectionChangeTest_0010] get2: ' + AppStorage.get<string>('OnTextSelectionChange'));
        expect(AppStorage.get<string>('OnTextSelectionChange')).assertEqual('start:-1,end:-1');
      console.info("[OnTextSelectionChangeTest_0010] END");
      done();
    });
    /**
     * @tc.number   OnTextSelectionChangeTest_static_0020
     * @tc.name     OnTextSelectionChangeTest_static_0020
     * @tc.desc     OnTextSelectionChangeTest_static_0020
     * @tc.level    Level.LEVEL2
     */
it('OnTextSelectionChangeTest_static_0020', Level.LEVEL2, async (done: ()=> void) => {
      console.info('[OnTextSelectionChangeTest_0020] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      // 点击tab键(2049),Text控件获焦
      await driver.triggerKey(2049);
      await CommonFunc.sleep(500);
      // 点击shift键(2047)+向右方向键(2015)
      await driver.triggerCombineKeys(2047, 2015);
      await driver.triggerCombineKeys(2047, 2015);
      await driver.triggerCombineKeys(2047, 2015);
      await driver.triggerCombineKeys(2047, 2015);
      await CommonFunc.sleep(500);
      console.info('[OnTextSelectionChangeTest_0020] get1: ' + AppStorage.get<string>('OnTextSelectionChange'));

        expect(AppStorage.get<string>('OnTextSelectionChange')).assertEqual('start:3,end:11');
        let textRect = CommonFunc.getComponentRectOnScreen('OnTextSelectionChange_text');
        let clickX = Math.round((textRect.left + textRect.right)/2) as int
        let clickY = Math.round(textRect.bottom - 10) as int
        // 鼠标左键点击文本外，文本取消选中
        await driver.mouseClick({ x: clickX, y: clickY }, MouseButton.MOUSE_BUTTON_LEFT);
        await CommonFunc.sleep(1000);
        console.info('[OnTextSelectionChangeTest_0020] get2: ' + AppStorage.get<string>('OnTextSelectionChange'));
        expect(AppStorage.get<string>('OnTextSelectionChange')).assertEqual('start:-1,end:-1');
      console.info("[OnTextSelectionChangeTest_0020] END");
      done();
    });
    /**
     * @tc.number   OnTextSelectionChangeTest_static_0030
     * @tc.name     OnTextSelectionChangeTest_static_0030
     * @tc.desc     OnTextSelectionChangeTest_static_0030
     * @tc.level    Level.LEVEL2
     */
it('OnTextSelectionChangeTest_static_0030', Level.LEVEL2, async (done: ()=>void) => {
      console.info('[OnTextSelectionChangeTest_0030] START');

        let driver = Driver.create();
        await CommonFunc.sleep(500);
        console.info('[OnTextSelectionChangeTest_0030] get1: ' + AppStorage.get<string>('OnTextSelectionChange'));
        expect(AppStorage.get<string>('OnTextSelectionChange')).assertEqual('start:3,end:8');
        let textRect = CommonFunc.getComponentRectOnScreen('OnTextSelectionChange_text');
        let clickX = Math.round(textRect.right + 10) as int
        let clickY = Math.round((textRect.bottom + textRect.top)/2) as int
        await driver.mouseClick({ x: clickX, y: clickY }, MouseButton.MOUSE_BUTTON_LEFT);
        await CommonFunc.sleep(1000);
        console.info('[OnTextSelectionChangeTest_0030] get2: ' +
        AppStorage.get<string>('OnTextSelectionChange'));
        expect(AppStorage.get<string>('OnTextSelectionChange')).assertEqual('start:-1,end:-1');
      console.info("[OnTextSelectionChangeTest_0030] END");
      done();
    });
  })
}