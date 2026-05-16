'use static';
/**
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../../hypium/index"
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON,  MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../../../ets/MainAbility/common/MessageManager';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../../Util.test';
import inspector from '@ohos.arkui.inspector';
// import config from '@ohos.accessibility.config';
import accessibility from '@ohos.accessibility';

let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
// const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.arkui.ace.information/MainAbility';

export default function CounterComponentTest() {
  describe('CounterComponentTest', () => {
    beforeAll(() => {
      console.info("CounterComponentTest beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.information.static", "EntryAbility");
    });
    beforeEach(async (): Promise<void> => {
      // config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
      //   console.info(`enable success`);
      // }).catch((err: object) => {
      //   console.error(`failed to enable, ${err}`);
      // })
      console.info("CounterComponentTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Counter/CounterApi/CounterApi",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get CounterComponentTest state pages:" + JSON.stringify(pages));
        if (!("CounterApi" == pages.name)) {
          console.info("get CounterComponentTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options)
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push CounterComponentTest page error:" + err);
      }
      console.info("CounterComponentTest beforeEach end");
    });
    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("CounterComponentTest after each called");
    });

    
    /**
     * @tc.number   CounterComponentTest_static_001
     * @tc.name     CounterComponentTest_static_001
     * @tc.desc     CounterComponentTest_static_001
     * @tc.level    Level.LEVEL0
     */
it('CounterComponentTest_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[CounterComponentTest_001] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let btn = await driver.findComponent(ON.id("btn"));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let type = inspector.getInspectorByKey('type');
      await CommonFunc.sleep(1000);
      expect(JSON.parseJsonElement(type).getElement('$attrs').getString('content')).assertEqual('INLINE_DATE');
      console.info('[CounterComponentTest_001] END');
      done();
    });
  })
}
