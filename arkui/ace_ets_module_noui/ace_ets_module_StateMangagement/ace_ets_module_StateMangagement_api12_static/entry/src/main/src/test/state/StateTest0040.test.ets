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
export default function StateTest0040() {
  describe('StateTest0040', () => {
    beforeAll(() => {
      console.info("StateTest0040 beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.StateMangagement.api12.static", "EntryAbility");

    });

    beforeEach(async (): Promise<void> => {
      console.info("StateTest0040 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/state/State0040",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get StateTest0040 state pages:" + JSON.stringify(pages));
        if (!("StateTest0040" == pages.name)) {
          console.info("get StateTest0040 pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);

        }
      } catch (err) {
        console.error("push StateTest0040 page error:" + err);
      }
      console.info("StateTest0040 beforeEach end");
    });
    afterEach(async (): Promise<void>  => {
      await CommonFunc.sleep(1000);
      console.info("StateTest0040 after each called");
    });

    
    
    /**
     * @tc.number   StateTest0040_static_001
     * @tc.name     StateTest0040_static_001
     * @tc.desc     StateTest0040_static_001
     * @tc.level    Level.LEVEL0
     */
it('StateTest0040_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[StateTest0040_static_001] START');
      await CommonFunc.sleep(2000);
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn = await driver.findComponent(ON.id("tvState00401"));
      await CommonFunc.sleep(1000);
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let obj = JSON.parseJsonElement(inspector.getInspectorByKey('tvState00401'));
      console.info("[StateSet0010TestJsunit] component obj content is: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('HelloWorld');
      await CommonFunc.sleep(1000);
      let btn1 = await driver.findComponent(ON.id("tvState00402"));
      await CommonFunc.sleep(1000);
      await (btn1?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let obj1 = JSON.parseJsonElement(inspector.getInspectorByKey('tvState00402'));
      console.info("[StateSet0010TestJsunit] component obj1 content is: " + JSON.stringify(obj1.getElement('$attrs').getString('content')));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('1');
      console.info('[StateTest0040_static_001] END');
      done();
    });
  })
}
