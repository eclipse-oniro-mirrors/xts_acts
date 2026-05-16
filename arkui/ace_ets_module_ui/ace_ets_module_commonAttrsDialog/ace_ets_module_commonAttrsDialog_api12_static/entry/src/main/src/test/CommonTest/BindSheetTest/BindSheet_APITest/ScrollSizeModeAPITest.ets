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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '../../../../../../hypium/index'
import router from '@ohos.router';
import {
  Component,
  DisplayRotation,
  Driver,
  MatchPattern,
  ON,
  PointerMatrix,
  ResizeDirection,
  UiWindow,
  WindowMode
} from '@ohos.UiTest';
import CommonFunc from '../../../../../ets/MainAbility/common/Common';
import { Callback, MessageManager } from '../../../../../ets/MainAbility/utils/MessageManager';
import window from '@ohos.window';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import inspector from '@ohos.arkui.inspector'
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement'
import common from '@ohos.app.ability.common';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { UtilsTest } from '../../../Util.test'

let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function ScrollSizeMode_APITest() {
  describe('ScrollSizeMode_APITest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("assemblyCallbackTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.commonAttrsDialog.api12.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("ScrollSizeMode_APITest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Common/BindSheet/BindSheet_API/ScrollSizeMode",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get ScrollSizeMode_APITest state pages:" + JSON.stringify(pages));
        if (!("ListMainChildren" == pages.name)) {
          console.info("get ScrollSizeMode_APITest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push ScrollSizeMode_APITest page error:" + err);
      }
      console.info("ScrollSizeMode_APITest beforeEach end");
    });

    
    
    /**
     * @tc.number   ScrollSizeMode_APITest_static_0100
     * @tc.name     ScrollSizeMode_APITest_static_0100
     * @tc.desc     ScrollSizeMode_APITest_static_0100
     * @tc.level    Level.LEVEL0
     */
it('ScrollSizeMode_APITest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ScrollSizeMode_APITest_0100 START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn = await driver.findComponent(ON.id('btn'));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let change1 = await driver.findComponent(ON.id('change1'));
      await (change1?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let close = await driver.findComponent(ON.id('close'));
      await (close?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let ScrollSizeMode_1 = inspector.getInspectorByKey('ScrollSizeMode_1');
      console.info("[ScrollSizeMode_APITest_0100] Tabs animationMode attrs is: " +
      JSON.stringify(JSON.parseJsonElement(ScrollSizeMode_1).getElement('$attrs')));
      expect(JSON.parseJsonElement(ScrollSizeMode_1).getElement('$attrs').getString('content')).assertEqual('0');
      console.info('[ScrollSizeMode_APITest_0100] END');
      done();
    });

    
    
    /**
     * @tc.number   ScrollSizeMode_APITest_static_0200
     * @tc.name     ScrollSizeMode_APITest_static_0200
     * @tc.desc     ScrollSizeMode_APITest_static_0200
     * @tc.level    Level.LEVEL0
     */
it('ScrollSizeMode_APITest_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ScrollSizeMode_APITest_0200 START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn = await driver.findComponent(ON.id('btn'));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let change = await driver.findComponent(ON.id('change'));
      await (change?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let change2 = await driver.findComponent(ON.id('change2'));
      await (change2?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let close = await driver.findComponent(ON.id('close'));
      await (close?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let ScrollSizeMode_1 = inspector.getInspectorByKey('ScrollSizeMode_1');
      console.info("[ScrollSizeMode_APITest_0200] Tabs animationMode attrs is: " +
      JSON.stringify(JSON.parseJsonElement(ScrollSizeMode_1).getElement('$attrs')));
      expect(JSON.parseJsonElement(ScrollSizeMode_1).getElement('$attrs').getString('content')).assertEqual('0');
      console.info('[ScrollSizeMode_APITest_0200] END');
      done();
    });
  })
}