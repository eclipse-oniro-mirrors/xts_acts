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
export default function IfElse004Test() {
  describe('IfElse004Test', () => {
    beforeAll(() => {
      console.info("IfElse004Test beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.StateMangagement.api12.static", "EntryAbility");

    });

    beforeEach(async (): Promise<void> => {
      console.info("IfElse004Test beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/IfElse/IfElse004",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get IfElse004Test state pages:" + JSON.stringify(pages));
        if (!("IfElse004Test" == pages.name)) {
          console.info("get IfElse004Test pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);

        }
      } catch (err) {
        console.error("push IfElse004Test page error:" + err);
      }
      console.info("IfElse004Test beforeEach end");
    });
    
    
    /**
     * @tc.number   IfElse004Test_static_01
     * @tc.name     IfElse004Test_static_01
     * @tc.desc     IfElse004Test_static_01
     * @tc.level    Level.LEVEL0
     */
it('IfElse004Test_static_01', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[IfElse004Test_static_01] START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let text_11 = JSON.parseJsonElement(inspector.getInspectorByKey('text_11'));
      expect(text_11.getElement('$attrs').getString('content')).assertEqual('0');
      expect(text_11.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF00AAAA');
      let btn_1 = await (driver.findComponent(ON.id('btn_1')) as Promise<Component>);

      await (btn_1?.click() as Promise<void>);
      await (btn_1?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let text_12 = JSON.parseJsonElement(inspector.getInspectorByKey('text_12'));
      expect(text_12.getElement('$attrs').getString('content')).assertEqual('2');
      expect(text_12.getElement('$attrs').getString('backgroundColor')).assertEqual('#FFAAAAFF');

      await (btn_1?.click() as Promise<void>);
      await (btn_1?.click() as Promise<void>);
      await (btn_1?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let text_13 = JSON.parseJsonElement(inspector.getInspectorByKey('text_13'));
      expect(text_13.getElement('$attrs').getString('content')).assertEqual('5');
      expect(text_13.getElement('$attrs').getString('backgroundColor')).assertEqual('#FFFFAAAA');

      await (btn_1?.click() as Promise<void>);
      await (btn_1?.click() as Promise<void>);
      await (btn_1?.click() as Promise<void>);
      await (btn_1?.click() as Promise<void>);
      await (btn_1?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let text_14 = JSON.parseJsonElement(inspector.getInspectorByKey('text_14'));
      expect(text_14.getElement('$attrs').getString('content')).assertEqual('out of range!');
      await CommonFunc.sleep(1000);

      console.info('[IfElse004Test_static_01] END');
      done();
    });
    
    /**
     * @tc.number   IfElse004Test_static_02
     * @tc.name     IfElse004Test_static_02
     * @tc.desc     IfElse004Test_static_02
     * @tc.level    Level.LEVEL0
     */
it('IfElse004Test_static_02', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[IfElse004Test_static_02] START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let text_21 = JSON.parseJsonElement(inspector.getInspectorByKey('text_21'));
      expect(text_21.getElement('$attrs').getString('content')).assertEqual('0');
      expect(text_21.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF00AAAA');
      let btn_2 = await (driver.findComponent(ON.id('btn_2')) as Promise<Component>);

      await (btn_2?.click() as Promise<void>);
      await (btn_2?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let text_22 = JSON.parseJsonElement(inspector.getInspectorByKey('text_22'));
      expect(text_22.getElement('$attrs').getString('content')).assertEqual('2');
      expect(text_22.getElement('$attrs').getString('backgroundColor')).assertEqual('#FFAAAAFF');

      await (btn_2?.click() as Promise<void>);
      await (btn_2?.click() as Promise<void>);
      await (btn_2?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let text_23 = JSON.parseJsonElement(inspector.getInspectorByKey('text_23'));
      expect(text_23.getElement('$attrs').getString('content')).assertEqual('5');
      expect(text_23.getElement('$attrs').getString('backgroundColor')).assertEqual('#FFFFAAAA');

      await (btn_2?.click() as Promise<void>);
      await (btn_2?.click() as Promise<void>);
      await (btn_2?.click() as Promise<void>);
      await (btn_2?.click() as Promise<void>);
      await (btn_2?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let text_24 = JSON.parseJsonElement(inspector.getInspectorByKey('text_24'));
      expect(text_24.getElement('$attrs').getString('content')).assertEqual('out of range!');
      await CommonFunc.sleep(1000);

      console.info('[IfElse004Test_static_02] END');
      done();
    });
  })
}