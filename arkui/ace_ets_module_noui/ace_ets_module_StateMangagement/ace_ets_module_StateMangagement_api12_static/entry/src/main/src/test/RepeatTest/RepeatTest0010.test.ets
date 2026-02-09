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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect,TestType,Size,Level} from "../../../../hypium/index"
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
import inspector from '@ohos.arkui.inspector';

import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest, startAbility } from '../Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function RepeatTest0010() {
  describe('RepeatTest0010', () => {

    beforeAll(() => {
      console.info("RepeatTest0010 beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.StateMangagement.api12.static", "EntryAbility");

    });

    beforeEach(async (): Promise<void> => {
      console.info("RepeatTest0010 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Repeat/Repeat0010",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get RepeatTest0010 state pages:" + JSON.stringify(pages));
        if (!("RepeatTest0010" == pages.name)) {
          console.info("get RepeatTest0010 pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);

        }
      } catch (err) {
        console.error("push RepeatTest0010 page error:" + err);
      }
      console.info("RepeatTest0010 beforeEach end");
    });


    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("RepeatTest0010 after each called");
    });

    
    
    /**
     * @tc.number   RepeatTest0010_static_001
     * @tc.name     RepeatTest0010_static_001
     * @tc.desc     RepeatTest0010_static_001
     * @tc.level    Level.LEVEL3
     */
it('RepeatTest0010_static_001', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('[RepeatTest0010_static_001] START');
      await CommonFunc.sleep(2000);
      let driver: Driver = Driver.create();
      let btn: Component|null = await driver.findComponent(ON.id('toIndex[2]'));
      await CommonFunc.sleep(1000);
      console.info('[RepeatTest0010_static_001] findComponent toIndex[2] ');
      await (btn?.click() as Promise<void>);
      console.info('[RepeatTest0010_static_001] toIndex[2] click');
      await CommonFunc.sleep(1000);
      let com1 = await driver.findComponent(ON.id('repeat0010_1'))
      let text_1 = ''
      if (com1) {
        text_1 = await com1.getText();
        console.info('[RepeatTest0010_static_001] toIndex[2] com1.getText()');
      }
      let com2 = await driver.findComponent(ON.id('repeat0010_2'))
      let text_2 = ''
      if (com2) {
        text_2 = await com2.getText()
        console.info('[RepeatTest0010_static_001] toIndex[2] com2.getText()');
      }
      let display_status1 = await driver.findComponent(ON.id('display_status'))
      let display_status = ''
      if (display_status1) {
        display_status = await display_status1.getText()
        console.info('[RepeatTest0010_static_001] toIndex[2] display_status1.getText()');
      }
      console.info("[RepeatTest0010_static_001] component text_1: " + text_1 + "text2:" + text_2 + "display_status: " +
        display_status);
      expect(text_1).assertEqual('img1');
      expect(text_2).assertEqual('img3');
      expect(display_status).assertEqual('Normal display');
      await CommonFunc.sleep(1000);
      console.info('[RepeatTest0010_static_001] END');
      done();
    });

  })
}
