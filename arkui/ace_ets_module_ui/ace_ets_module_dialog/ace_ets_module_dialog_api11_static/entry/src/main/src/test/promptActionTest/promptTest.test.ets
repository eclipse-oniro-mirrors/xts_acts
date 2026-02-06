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
import window from '@ohos.window';
import emitter from '@ohos.events.emitter';
import {
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  Level,
  TestType,
  Size
} from "../../../../hypium/index"
import {
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
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import { UtilsTest, startAbility, stopApplication } from "../Util.test"
import CommonFunc from '../../../ets/MainAbility/common/Common';
import Utils from '../../../ets/MainAbility/common/Utils';

let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function promptTest() {

  describe('promptTest', () => {
    beforeAll(() => {
      console.info("promptTest beforeAll start")

      await UtilsTest.startAbility("com.arkui.ace.dialog.static", "EntryAbility")

      console.info("promptTest beforeAll end")
    })
    beforeEach(async (): Promise<void> => {
      console.info("promptTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/promptAction/prompt',
      }
      try {


        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages: router.RouterState = routerInstance.getState();
        console.info("get promptTest state pages: " + JSON.stringify(pages));
        if (!("prompt" == pages.name)) {
          console.info("get promptTest state pages.name: " + JSON.stringify(pages.name));
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push promptTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push promptTest page error: " + err);
        expect().assertFail();
      }

    });


    
    
/**
     * @tc.number   promptTest_static_0100
     * @tc.name     promptTest_static_0100
     * @tc.desc     promptTest_static_0100
     * @tc.level    Level.LEVEL2
     */
it('promptTest_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('promptTest_static_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('prompt_3'));
      await (button?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('prompt_2');
      let obj1 = JSON.parseJsonElement(strJson1);
      expect(obj1.getElement('$attrs').getString("label")).assertEqual('确认');
      await CommonFunc.sleep(1000);
      let button1 = await driver.findComponent(ON.id('prompt_2'));
      await (button1?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('prompt_3');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[promptTest_static_0100] component obj is: " + JSON.stringify(obj));
      console.info("[promptTest_static_0100] component obj.$attrs is: " + JSON.stringify(obj.getElement('$attrs')));
      // console.info("[promptTest_static_0100] text: " + JSON.stringify(obj.getElement('$attrs').getString("label")));
      expect(obj.getElement('$attrs').getString("content")).assertEqual('Hello World');
      console.info('[promptTest_static_0100] END');
      done();
    });
  })
}

