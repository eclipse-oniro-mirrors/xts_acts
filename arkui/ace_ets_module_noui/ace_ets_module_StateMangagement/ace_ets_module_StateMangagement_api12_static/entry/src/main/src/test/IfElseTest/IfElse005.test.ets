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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level} from "../../../../hypium/index"
import router from '@ohos.router';
import {
  Component,
  Driver,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import {MessageManager,Callback} from '../../../ets/MainAbility/common/MessageManager';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest, startAbility } from '../Util.test';
import { UtilsTest, startAbility } from '../Util.test';
import inspector from '@ohos.arkui.inspector';


import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest, startAbility } from '../Util.test';
import { UtilsTest, startAbility } from '../Util.test';
import { UtilsTest, startAbility } from '../Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
export default function IfElse005Test() {
  describe('IfElse005Test', () => {
    beforeAll(() => {
      console.info("IfElse005Test beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.StateMangagement.api12.static", "EntryAbility");

    });

    beforeEach(async (): Promise<void> => {
      console.info("IfElse005Test beforeEach start");
      let options: router.RouterOptions = {
        url:  "MainAbility/pages/IfElse/IfElse005",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get IfElse005Test state pages:" + JSON.stringify(pages));
        if (!("IfElse005Test" == pages.name)) {
          console.info("get IfElse005Test pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);

        }
      } catch (err) {
        console.error("push IfElse005Test page error:" + err);
      }
      console.info("IfElse005Test beforeEach end");
    });
    
    
    /**
     * @tc.number   IfElse005Test_static_01
     * @tc.name     IfElse005Test_static_01
     * @tc.desc     IfElse005Test_static_01
     * @tc.level    Level.LEVEL0
     */
it('IfElse005Test_static_01', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[IfElse005Test_static_01] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn = await driver.findComponent(ON.id('btn'));
      let text = JSON.parseJsonElement(inspector.getInspectorByKey('text'));
      expect(text.getElement('$attrs').getString('content')).assertEqual('this.flag = false.');
     await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      text = JSON.parseJsonElement(inspector.getInspectorByKey('text'));
      expect(text.getElement('$attrs').getString('content')).assertEqual('this.flag = true.');
     await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      text = JSON.parseJsonElement(inspector.getInspectorByKey('text'));
      expect(text.getElement('$attrs').getString('content')).assertEqual('this.flag = false.');
      console.info('[IfElse005Test_static_01] END');
      done();
    });
  })
}