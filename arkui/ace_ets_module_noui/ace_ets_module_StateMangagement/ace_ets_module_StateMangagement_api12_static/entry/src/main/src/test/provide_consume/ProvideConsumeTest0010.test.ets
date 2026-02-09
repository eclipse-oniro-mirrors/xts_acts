'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

export default function ProvideConsumeTest0010() {
  describe('ProvideConsumeTest0010', () => {

    beforeAll(() => {
      console.info("ProvideConsumeTest0010 beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.StateMangagement.api12.static", "EntryAbility");

    });

    beforeEach(async (): Promise<void> => {
      console.info("ProvideConsumeTest0010 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/provide_consume/ProvideConsume0010",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get ProvideConsumeTest0010 state pages:" + JSON.stringify(pages));
        if (!("ProvideConsumeTest0010" == pages.name)) {
          console.info("get ProvideConsumeTest0010 pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);

        }
      } catch (err) {
        console.error("push ProvideConsumeTest0010 page error:" + err);
      }
      console.info("ProvideConsumeTest0010 beforeEach end");
    });


    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("ProvideConsumeTest0010 after each called");
    });

    
    
    /**
     * @tc.number   ProvideConsumeTest0010_static_001
     * @tc.name     ProvideConsumeTest0010_static_001
     * @tc.desc     ProvideConsumeTest0010_static_001
     * @tc.level    Level.LEVEL0
     */
it('ProvideConsumeTest0010_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ProvideConsumeTest0010_static_001] START');
      await CommonFunc.sleep(2000);
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn: Component|null = await driver.findComponent(ON.id("btnProvideAdd"));
      await CommonFunc.sleep(1000);
      let btn1: Component|null = await driver.findComponent(ON.id("btnConsumeAdd"));
      for (let index = 0; index < 10; index++) {
        await CommonFunc.sleep(1000);
        await (btn?.click() as Promise<void>);
        await (btn1?.click() as Promise<void>)
      }
      await CommonFunc.sleep(1000);
      let obj = JSON.parseJsonElement(inspector.getInspectorByKey('tvProvideConsume0010Child'));
      console.info("[StateSet0010TestJsunit] component obj content is: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('20');
      console.info('[ProvideConsumeTest0010_static_001] END');
      done();
    });
  })
}
