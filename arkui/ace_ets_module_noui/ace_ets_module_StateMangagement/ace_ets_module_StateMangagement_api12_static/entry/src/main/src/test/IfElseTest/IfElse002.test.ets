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
export default function IfElse002Test() {
  describe('IfElse002Test', () => {
    beforeAll(() => {
      console.info("IfElse002Test beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.StateMangagement.api12.static", "EntryAbility");

    });

    beforeEach(async (): Promise<void> => {
      console.info("IfElse002Test beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/IfElse/IfElse002",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get IfElse002Test state pages:" + JSON.stringify(pages));
        if (!("IfElse002Test" == pages.name)) {
          console.info("get IfElse002Test pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);

        }
      } catch (err) {
        console.error("push IfElse002Test page error:" + err);
      }
      console.info("IfElse002Test beforeEach end");
    });
    
    
    /**
     * @tc.number   IfElse002Test_static_01
     * @tc.name     IfElse002Test_static_01
     * @tc.desc     IfElse002Test_static_01
     * @tc.level    Level.LEVEL0
     */
it('IfElse002Test_static_01', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[IfElse002Test_static_01] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let age_btn = await driver.findComponent(ON.id('age_btn'));
      let age_text_1 = await driver.findComponent(ON.id('age_text_1'));
      expect(await (age_text_1?.getText() as Promise<string>)).assertEqual('age: 15, It\'s a boy.');
      await (age_btn?.click() as Promise<void>);
      await (age_btn?.click() as Promise<void>);
      await (age_btn?.click() as Promise<void>);
      await (age_btn?.click() as Promise<void>);
      await (age_btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let age_text_2 = await driver.findComponent(ON.id('age_text_2'));
      expect(await (age_text_2?.getText() as Promise<string>)).assertEqual('age: 20, It\'s a man.');

      console.info('[IfElse002Test_static_01] END');
      done();
    });
    
    /**
     * @tc.number   IfElse002Test_static_02
     * @tc.name     IfElse002Test_static_02
     * @tc.desc     IfElse002Test_static_02
     * @tc.level    Level.LEVEL0
     */
it('IfElse002Test_static_02', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[IfElse002Test_static_02] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let val_btn = await driver.findComponent(ON.id('val_btn'));
      let val_text_1 = JSON.parseJsonElement(inspector.getInspectorByKey('val_text_1'));
      expect(val_text_1.getElement('$attrs').getString('content')).assertEqual('0');
      expect(val_text_1.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF00AAAA');
      await (val_btn?.click() as Promise<void>);
      await (val_btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let val_text_2 = JSON.parseJsonElement(inspector.getInspectorByKey('val_text_2'));
      expect(val_text_2.getElement('$attrs').getString('content')).assertEqual('2');
      expect(val_text_2.getElement('$attrs').getString('backgroundColor')).assertEqual('#FFAAAAFF');
      await (val_btn?.click() as Promise<void>);
      await (val_btn?.click() as Promise<void>);
      await (val_btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let val_text_3 = JSON.parseJsonElement(inspector.getInspectorByKey('val_text_3'));
      expect(val_text_3.getElement('$attrs').getString('content')).assertEqual('5');
      expect(val_text_3.getElement('$attrs').getString('backgroundColor')).assertEqual('#FFFFAAAA');
      await (val_btn?.click() as Promise<void>);
      await (val_btn?.click() as Promise<void>);
      await (val_btn?.click() as Promise<void>);
      await (val_btn?.click() as Promise<void>);
      await (val_btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let val_text_4 = JSON.parseJsonElement(inspector.getInspectorByKey('val_text_4'));
      expect(val_text_4.getElement('$attrs').getString('content')).assertEqual('out of range!');
      await CommonFunc.sleep(1000);

      console.info('[IfElse002Test_static_02] END');
      done();
    });
  })
}