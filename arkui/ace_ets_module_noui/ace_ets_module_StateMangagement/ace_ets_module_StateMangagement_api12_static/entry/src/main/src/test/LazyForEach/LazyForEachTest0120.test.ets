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
export default function LazyForEachTest0120() {
  describe('LazyForEachTest0120', () => {
    beforeAll(() => {
      console.info("LazyForEachTest0120 beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.StateMangagement.api12.static", "EntryAbility");

    });

    beforeEach(async (): Promise<void> => {
      console.info("LazyForEachTest0120 beforeEach start");
      let options: router.RouterOptions = {
        url:  "MainAbility/pages/LazyForEach/LazyForEach0120",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get LazyForEachTest0120 state pages:" + JSON.stringify(pages));
        if (!("LazyForEachTest0120" == pages.name)) {
          console.info("get LazyForEachTest0120 pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);

        }
      } catch (err) {
        console.error("push LazyForEachTest0120 page error:" + err);
      }
      console.info("LazyForEachTest0120 beforeEach end");
    });
    
    
    /**
     * @tc.number   LazyForEachTest0120_static_0100
     * @tc.name     LazyForEachTest0120_static_0100
     * @tc.desc     LazyForEachTest0120_static_0100
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2
     */
it('LazyForEachTest0120_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('LazyForEachTest0120001 START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn = await driver.findComponent(ON.id("LazyForEach0120_1"));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let text = await driver.findComponent(ON.text('HelloA'))
      expect(text != null).assertTrue()
      await CommonFunc.sleep(1000);
      btn = await driver.findComponent(ON.id("LazyForEach0120_2"));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let obj = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray('$children')[0]
        .getArray('$children')[2]
        .getArray('$children')[1]
        .getArray('$children')[0];
      console.info("[LazyForEachTest0120001] list index 1 is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual("Hello1");
      await CommonFunc.sleep(1000);
      obj = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray('$children')[0]
        .getArray('$children')[2]
        .getArray('$children')[2]
        .getArray('$children')[0];
      console.info("[LazyForEachTest0120001] list index 2 is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual("Hello0");
      console.info('LazyForEachTest0120_static_0100 END');
      done();
    });
  })
}