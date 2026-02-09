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
export default function Prefetcher1() {
  describe('Prefetcher1', () => {
    beforeAll(() => {
      console.info("Prefetcher1 beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.StateMangagement.api12.static", "EntryAbility");

    });

    beforeEach(async (): Promise<void> => {
      console.info("Prefetcher1 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/LazyForEach/Prefetcher1",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get Prefetcher1 state pages:" + JSON.stringify(pages));
        if (!("Prefetcher1" == pages.name)) {
          console.info("get Prefetcher1 pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);

        }
      } catch (err) {
        console.error("push Prefetcher1 page error:" + err);
      }
      console.info("Prefetcher1 beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("Prefetcher1 after each called");
    });

    
    
    /**
     * @tc.number   Prefetcher1_static_0100
     * @tc.name     Prefetcher1_static_0100
     * @tc.desc     Prefetcher1_static_0100
     * @tc.level    Level.LEVEL0
     */
it('Prefetcher1_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('Prefetcher1_static_0100 START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      let text = await driver.findComponent(ON.id('Prefetcher1_add'));
      await (text?.click() as Promise<void>);
      console.info("[Prefetcher1_static_0100] text click");
      await CommonFunc.sleep(1000);

      let strJson: string = inspector.getInspectorByKey('Prefetcher1_add');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[Prefetcher1_static_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('add22');
      console.info('[Prefetcher1_static_0100] END');
      done();
    });

  })
}

