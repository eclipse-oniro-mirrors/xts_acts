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
export default function IfElse003Test() {
  describe('IfElse003Test', () => {
    beforeAll(() => {
      console.info("IfElse003Test beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.StateMangagement.api12.static", "EntryAbility");

    });

    beforeEach(async (): Promise<void> => {
      console.info("IfElse003Test beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/IfElse/IfElse003",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get IfElse003Test state pages:" + JSON.stringify(pages));
        if (!("IfElse003Test" == pages.name)) {
          console.info("get IfElse003Test pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);

        }
      } catch (err) {
        console.error("push IfElse003Test page error:" + err);
      }
      console.info("IfElse003Test beforeEach end");
    });
    
    
    /**
     * @tc.number   IfElse003Test_static_01
     * @tc.name     IfElse003Test_static_01
     * @tc.desc     IfElse003Test_static_01
     * @tc.level    Level.LEVEL0
     */
it('IfElse003Test_static_01', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('IfElse003Test_static_01 START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let text_2 = JSON.parseJsonElement(inspector.getInspectorByKey('text_2'));
      expect(text_2.getElement('$attrs').getString('content')).assertEqual('状态1为假');
      let text_22 = JSON.parseJsonElement(inspector.getInspectorByKey('text_22'));
      expect(text_22.getElement('$attrs').getString('content')).assertEqual('状态1为假，状态2为假');

      let btn_1 = await driver.findComponent(ON.id('btn_1')) ;
      await (btn_1?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let text_1 = JSON.parseJsonElement(inspector.getInspectorByKey('text_1'));
      expect(text_1.getElement('$attrs').getString('content')).assertEqual('状态1为真');
      let text_12 = JSON.parseJsonElement(inspector.getInspectorByKey('text_12'));
      expect(text_12.getElement('$attrs').getString('content')).assertEqual('状态1为真，状态2为假');

      let btn_2 = await driver.findComponent(ON.id('btn_2')) ;
      await (btn_2?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      expect(text_1.getElement('$attrs').getString('content')).assertEqual('状态1为真');
      let text_11 = JSON.parseJsonElement(inspector.getInspectorByKey('text_11'));
      expect(text_11.getElement('$attrs').getString('content')).assertEqual('状态1为真，状态2为真');

      console.info('[IfElse003Test_static_01] END');
      done();
    });
  })
}