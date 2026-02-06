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
export default function IfElse001Test() {
  describe('IfElse001Test', () => {
    beforeAll(() => {
      console.info("IfElse001Test beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.StateMangagement.api12.static", "EntryAbility");

    });

    beforeEach(async (): Promise<void> => {
      console.info("IfElse001Test beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/IfElse/IfElse001",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get IfElse001Test state pages:" + JSON.stringify(pages));
        if (!("IfElse001Test" == pages.name)) {
          console.info("get IfElse001Test pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);

        }
      } catch (err) {
        console.error("push IfElse001Test page error:" + err);
      }
      console.info("IfElse001Test beforeEach end");
    });
    
    
    /**
     * @tc.number   IfElse001Test_static_01
     * @tc.name     IfElse001Test_static_01
     * @tc.desc     IfElse001Test_static_01
     * @tc.level    Level.LEVEL0
     */
it('IfElse001Test_static_01', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('IfElse001Test_static_01 START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let text01 = await driver.findComponent(ON.id('if_else_001_01'));
      expect(await (text01?.getText() as Promise<string>)).assertEqual('value: 10, value小于20');
      let text02 = await driver.findComponent(ON.id('if_else_001_02'));
      expect(await (text02?.getText() as Promise<string>)).assertEqual('value: 100, value大于20');
      let text03 = await driver.findComponent(ON.id('if_else_001_03'));
      expect(await (text03?.getText() as Promise<string>)).assertEqual('value: 100, value大于20，小于1000');

      console.info('[IfElse001Test_static_01] END');
      done();
    });
  })
}