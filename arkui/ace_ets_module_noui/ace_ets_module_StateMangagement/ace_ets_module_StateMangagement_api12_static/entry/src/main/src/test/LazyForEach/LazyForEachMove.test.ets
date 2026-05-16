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
export default function LazyForEachMove() {
  describe('LazyForEachMove', () => {
    beforeAll(() => {
      console.info("LazyForEachMove beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.StateMangagement.api12.static", "EntryAbility");

    });

    beforeEach(async (): Promise<void> => {
      console.info("LazyForEachMove beforeEach start");
      let options: router.RouterOptions = {
        url:  "MainAbility/pages/LazyForEach/LazyForEachMove",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get LazyForEachMove state pages:" + JSON.stringify(pages));
        if (!("LazyForEachMove" == pages.name)) {
          console.info("get LazyForEachMove pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);

        }
      } catch (err) {
        console.error("push LazyForEachMove page error:" + err);
      }
      console.info("LazyForEachMove beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("LazyForEachMove after each called");
    });

    
    
    /**
     * @tc.number   LazyForEachMove_static_001
     * @tc.name     LazyForEachMove_static_001
     * @tc.desc     LazyForEachMove_static_001
     * @tc.level    Level.LEVEL0
     */
it('LazyForEachMove_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[LazyForEachMove_static_001] START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      let btn = await (driver.findComponent(ON.id('moveButton')));
      await CommonFunc.sleep(1000);
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('repeat_move10');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[LazyForEachMove_static_001] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('Item10');
      console.info('[LazyForEachMove_static_001] END');

      let strJson1 = inspector.getInspectorByKey('lazyForeach_move10');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[LazyForEachMove_static_001] component obj1 is: " + JSON.stringify(obj1));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('01move_0_1move');
      console.info('[LazyForEachMove_static_001] END');
      done();
    });
  })
}
