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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '../../../../../hypium/index'
import router from '@ohos.router';
import {
  Component,
  DisplayRotation,
  Driver,
  MatchPattern,
  ON,
  Point,
  PointerMatrix,
  Rect,
  ResizeDirection,
  UiWindow,
  WindowMode
} from '@ohos.UiTest';
import CommonFunc from '../../../../ets/MainAbility/common/Common';
import { Callback, MessageManager } from '../../../../ets/MainAbility/utils/MessageManager';
import window from '@ohos.window';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import inspector from '@ohos.arkui.inspector'
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement'
import display from '@ohos.display'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import { UtilsTest } from '../../Util.test'

let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function activeTest() {
  describe('activeTest', () => {
    beforeAll(() => {
      console.info("activeTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.commonAttrsDialog.api14.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("activeTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/UIContext/FocusController/activeTest",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get activeTest state pages:" + JSON.stringify(pages));
        if (!("activeTest" == pages.name)) {
          console.info("get activeTest pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push activeTest page error:" + err);
      }
      console.info("activeTest beforeEach end");
    });


    
    
    
/**
     * @tc.number   activeTest_static_0010
     * @tc.name     activeTest_static_0010
     * @tc.desc     activeTest_static_0010
     * @tc.level    Level.LEVEL0
     */
it('activeTest_static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('activeTest_0010 START');
      let driver = Driver.create()
      await CommonFunc.sleep(500);
      let scrollBar: Component = await driver.findComponent(ON.type('Scroll')) as Component;
      let button = await scrollBar.scrollSearch(ON.id('active1'));
      await (button?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let button2 = await scrollBar.scrollSearch(ON.id('active2'));
      await (button2?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('text');
      console.info("[activeTest_0010] attrs is: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[activeTest_0010] getString('content') is: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')).assertEqual('true true');
      await CommonFunc.sleep(1000);
      console.info('[activeTest_0010] END');
      done();
    });
    
    
    
/**
     * @tc.number   activeTest_static_0020
     * @tc.name     activeTest_static_0020
     * @tc.desc     activeTest_static_0020
     * @tc.level    Level.LEVEL0
     */
it('activeTest_static_0020', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('activeTest_0020 START');
      let driver = Driver.create()
      await CommonFunc.sleep(500);
      let scrollBar: Component = await driver.findComponent(ON.type('Scroll')) as Component;
      let button3 = await scrollBar.scrollSearch(ON.id('init'));
      await (button3?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let button = await scrollBar.scrollSearch(ON.id('active1'));
      await (button?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('text');
      console.info("[activeTest_0020] attrs is: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[activeTest_0020] getString('content') is: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')).assertEqual('true false');
      await CommonFunc.sleep(1000);
      console.info('[activeTest_0020] END');
      done();
    });
    
    
    
/**
     * @tc.number   activeTest_static_0030
     * @tc.name     activeTest_static_0030
     * @tc.desc     activeTest_static_0030
     * @tc.level    Level.LEVEL0
     */
it('activeTest_static_0030', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('activeTest_0030 START');
      let driver = Driver.create()
      await CommonFunc.sleep(500);
      let scrollBar: Component = await driver.findComponent(ON.type('Scroll')) as Component;
      let button3 = await scrollBar.scrollSearch(ON.id('init'));
      await (button3?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('text');
      console.info("[activeTest_0030] attrs is: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[activeTest_0030] getString('content') is: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')).assertEqual('false false');
      await CommonFunc.sleep(1000);
      console.info('[activeTest_0030] END');
      done();
    });

    
    
    
/**
     * @tc.number   activeTest_static_0040
     * @tc.name     activeTest_static_0040
     * @tc.desc     activeTest_static_0040
     * @tc.level    Level.LEVEL0
     */
it('activeTest_static_0040', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('activeTest_0040 START');
      let driver = Driver.create()
      await CommonFunc.sleep(500);
      let scrollBar: Component = await driver.findComponent(ON.type('Scroll')) as Component;

      let button3 = await scrollBar.scrollSearch(ON.id('init'));
      await (button3?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let button = await scrollBar.scrollSearch(ON.id('active2'));
      await (button?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('text');
      console.info("[activeTest_0040] attrs is: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[activeTest_0040] getString('content') is: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')).assertEqual('false true');
      await CommonFunc.sleep(1000);
      console.info('[activeTest_0040] END');
      done();
    });

    
    
    
/**
     * @tc.number   activeTest_static_0050
     * @tc.name     activeTest_static_0050
     * @tc.desc     activeTest_static_0050
     * @tc.level    Level.LEVEL0
     */
it('activeTest_static_0050', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('activeTest_0040 START');
      let driver = Driver.create()
      await CommonFunc.sleep(500);
      let scrollBar: Component = await driver.findComponent(ON.type('Scroll')) as Component;
      let button3 = await scrollBar.scrollSearch(ON.id('init'));
      await (button3?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let button = await scrollBar.scrollSearch(ON.id('active3'));
      await (button?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('text');
      console.info("[activeTest_0050] attrs is: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[activeTest_0050] getString('content') is: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')).assertEqual('true false');
      await CommonFunc.sleep(1000);
      console.info('[activeTest_0050] END');
      done();
    });

    
    
    
/**
     * @tc.number   activeTest_static_0060
     * @tc.name     activeTest_static_0060
     * @tc.desc     activeTest_static_0060
     * @tc.level    Level.LEVEL0
     */
it('activeTest_static_0060', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('activeTest_0040 START');
      let driver = Driver.create()
      await CommonFunc.sleep(500);
      let scrollBar: Component = await driver.findComponent(ON.type('Scroll')) as Component;
      let button3 = await scrollBar.scrollSearch(ON.id('init'));
      await (button3?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let button = await scrollBar.scrollSearch(ON.id('active3'));
      await (button?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      await (button?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('text');
      console.info("[activeTest_0050] attrs is: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[activeTest_0050] getString('content') is: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')).assertEqual('false false');
      await CommonFunc.sleep(1000);
      console.info('[activeTest_0050] END');
      done();
    });

  })
}

