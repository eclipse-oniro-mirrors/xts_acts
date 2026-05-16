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

import { describe, beforeAll, beforeEach, afterEach, it, expect, Level, TestType, Size } from "../../../../hypium/index"
import router from '@ohos.router';
import {
  Component,
  Driver,
  Component,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import deviceInfo from "@ohos.deviceInfo"
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility, stopApplication } from '../Util.test';

let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function openDialogTransitionTest() {
  describe('OpenDialogTransitionTest', () => {
    beforeAll(() => {

      
      await UtilsTest.startAbility("com.arkui.ace.dialog.api16.static", "EntryAbility")
      

      console.info("OpenDialogTransitionTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/promptAction/openDialogTransition',
      }
      try {
        const OpenDialogTransitionTest = AppStorage.get<Router>("router") as Router
        OpenDialogTransitionTest.clear();
        let pages: router.RouterState = OpenDialogTransitionTest.getState();
        console.info("get OpenDialogTransitionTest state pages: " + JSON.stringify(pages));
        if (!("openDialogTransition" == pages.name)) {
          console.info("get OpenDialogTransitionTest state pages.name: " + JSON.stringify(pages.name));
          OpenDialogTransitionTest.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push OpenDialogTransitionTest page error: " + err);
        expect().assertFail();
      }
    })

    beforeEach(async () => {
      // console.info('OpenDialogTransitionTest beforeEach called');
      // try {
      //   const OpenDialogTransitionTest = AppStorage.get<Router>("router") as Router
      //   OpenDialogTransitionTest.clear();
      //   let pages:router.RouterState = OpenDialogTransitionTest.getState();
      //   OpenDialogTransitionTest.replaceUrl({ url: 'MainAbility/pages/promptAction/openDialogTransition' });
      //   await CommonFunc.sleep(1000);
      // } catch (err) {
      //   console.error('beforeEach: router.replace error', err);
      // }
    });

    afterEach(async () => {
      console.info('OpenDialogTransitionTest afterEach called');
      let driver: Driver = Driver.create();

      try {
        let resetButtons = ['EnableTransition', 'EnableDialogTransition', 'EnableMaskTransition'];
        for (let btnId of resetButtons) {
          let btn = await driver.findComponent(ON.id(btnId));
          if (btn) {
            await ( btn?.click()  as Promise<void> );
            await CommonFunc.sleep(200);
          }
        }
      } catch (err) {
        console.warn('afterEach: failed to reset state', err);
      }

      try {
        let confirmBtn = await driver.findComponent(ON.id('Confirm'));
        if (confirmBtn) {
          await ( confirmBtn?.click()  as Promise<void> );
          await CommonFunc.sleep(200);
        }
      } catch (e) {
        console.warn('afterEach: no confirm button to click or already closed.');
      }
    });

    
    /**
     * @tc.number   OpenDialogTransitionTest_static_100
     * @tc.name     OpenDialogTransitionTest_static_100
     * @tc.desc     OpenDialogTransitionTest_static_100
     * @tc.level    Level.LEVEL2
     */
it('OpenDialogTransitionTest_static_100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('OpenDialogTransitionTest_static_100 start');
      let driver: Driver = Driver.create();
      let maskTransitionButton = await driver.findComponent(ON.id('EnableMaskTransition'));
      await (maskTransitionButton?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let openDialogButton = await driver.findComponent(ON.id('OpenDialog'));
      await (openDialogButton?.click() as Promise<void>);
      await CommonFunc.sleep(3000);
      let textContent = inspector.getInspectorByKey('TextContent');
      expect(JSON.parseJsonElement(textContent).getElement('$attrs').getString('content')).assertEqual('弹窗');
      let confirmButton = await driver.findComponent(ON.id('Confirm'));
      await (confirmButton?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      await (maskTransitionButton?.click() as Promise<void>);
      console.info('OpenDialogTransitionTest_static_100 end');
      done();
    });

    
    /**
     * @tc.number   OpenDialogTransitionTest_static_200
     * @tc.name     OpenDialogTransitionTest_static_200
     * @tc.desc     OpenDialogTransitionTest_static_200
     * @tc.level    Level.LEVEL2
     */
it('OpenDialogTransitionTest_static_200', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('OpenDialogTransitionTest_static_200 start');
      let driver: Driver = Driver.create();
      let dialogTransitionButton = await driver.findComponent(ON.id('EnableDialogTransition'));
      await (dialogTransitionButton?.click() as Promise<void>);
      let openDialogButton = await driver.findComponent(ON.id('OpenDialog'));
      await (openDialogButton?.click() as Promise<void>);
      await CommonFunc.sleep(3000);
      let textContent = inspector.getInspectorByKey('TextContent');
      console.info('OpenDialogTransitionTest_static_200 ysq textContent is %s',JSON.parseJsonElement(textContent).getElement('$attrs').getString('content'));
      expect(JSON.parseJsonElement(textContent).getElement('$attrs').getString('content')).assertEqual('弹窗');
      let confirmButton = await driver.findComponent(ON.id('Confirm'));
      await (confirmButton?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      await (dialogTransitionButton?.click() as Promise<void>);
      console.info('OpenDialogTransitionTest_static_200 end');
      done();
    });

    
    /**
     * @tc.number   OpenDialogTransitionTest_static_300
     * @tc.name     OpenDialogTransitionTest_static_300
     * @tc.desc     OpenDialogTransitionTest_static_300
     * @tc.level    Level.LEVEL2
     */
it('OpenDialogTransitionTest_static_300', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('OpenDialogTransitionTest_static_300 start');
      let driver: Driver = Driver.create();
      let dialogTransitionButton = await driver.findComponent(ON.id('EnableDialogTransition'));
      await (dialogTransitionButton?.click() as Promise<void>);
      await CommonFunc.sleep(200);
      let defaultTransitionButton = await driver.findComponent(ON.id('EnableTransition'));
      await (defaultTransitionButton?.click() as Promise<void>);
      let openDialogButton = await driver.findComponent(ON.id('OpenDialog'));
      await (openDialogButton?.click() as Promise<void>);
      await CommonFunc.sleep(3000);
      let textContent = inspector.getInspectorByKey('TextContent');
      expect(JSON.parseJsonElement(textContent).getElement('$attrs').getString('content')).assertEqual('弹窗');
      let confirmButton = await driver.findComponent(ON.id('Confirm'));
      await (confirmButton?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      await (dialogTransitionButton?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      await (defaultTransitionButton?.click() as Promise<void>);
      console.info('OpenDialogTransitionTest_static_300 end');
      done();
    });

    
    /**
     * @tc.number   OpenDialogTransitionTest_static_400
     * @tc.name     OpenDialogTransitionTest_static_400
     * @tc.desc     OpenDialogTransitionTest_static_400
     * @tc.level    Level.LEVEL2
     */
it('OpenDialogTransitionTest_static_400', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('OpenDialogTransitionTest_static_400 start');
      let driver: Driver = Driver.create();
      let maskTransitionButton = await driver.findComponent(ON.id('EnableMaskTransition'));
      await (maskTransitionButton?.click() as Promise<void>);
      await CommonFunc.sleep(200);
      let defaultTransitionButton = await driver.findComponent(ON.id('EnableTransition'));
      await (defaultTransitionButton?.click() as Promise<void>);
      let openDialogButton = await driver.findComponent(ON.id('OpenDialog'));
      await (openDialogButton?.click() as Promise<void>);
      await CommonFunc.sleep(3000);
      let textContent = inspector.getInspectorByKey('TextContent');
      expect(JSON.parseJsonElement(textContent).getElement('$attrs').getString('content')).assertEqual('弹窗');
      let confirmButton = await driver.findComponent(ON.id('Confirm'));
      await (confirmButton?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      await (maskTransitionButton?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      await (defaultTransitionButton?.click() as Promise<void>);
      console.info('OpenDialogTransitionTest_static_400 end');
      done();
    });

    
    /**
     * @tc.number   OpenDialogTransitionTest_static_500
     * @tc.name     OpenDialogTransitionTest_static_500
     * @tc.desc     OpenDialogTransitionTest_static_500
     * @tc.level    Level.LEVEL2
     */
it('OpenDialogTransitionTest_static_500', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('OpenDialogTransitionTest_static_500 start');
      let driver: Driver = Driver.create();
      let maskTransitionButton = await driver.findComponent(ON.id('EnableMaskTransition'));
      await (maskTransitionButton?.click() as Promise<void>);
      await CommonFunc.sleep(200);
      let dialogTransitionButton = await driver.findComponent(ON.id('EnableDialogTransition'));
      await (dialogTransitionButton?.click() as Promise<void>);
      let openDialogButton = await driver.findComponent(ON.id('OpenDialog'));
      await (openDialogButton?.click() as Promise<void>);
      await CommonFunc.sleep(3000);
      let textContent = inspector.getInspectorByKey('TextContent');
      expect(JSON.parseJsonElement(textContent).getElement('$attrs').getString('content')).assertEqual('弹窗');
      let confirmButton = await driver.findComponent(ON.id('Confirm'));
      await (confirmButton?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      await (maskTransitionButton?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      await (dialogTransitionButton?.click() as Promise<void>);
      console.info('OpenDialogTransitionTest_static_500 end');
      done();
    });

    
    /**
     * @tc.number   OpenDialogTransitionTest_static_600
     * @tc.name     OpenDialogTransitionTest_static_600
     * @tc.desc     OpenDialogTransitionTest_static_600
     * @tc.level    Level.LEVEL2
     */
it('OpenDialogTransitionTest_static_600', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('OpenDialogTransitionTest_static_600 start');
      let driver: Driver = Driver.create();
      let maskTransitionButton = await driver.findComponent(ON.id('EnableMaskTransition'));
      await (maskTransitionButton?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let dialogTransitionButton = await driver.findComponent(ON.id('EnableDialogTransition'));
      await (dialogTransitionButton?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let defaultTransitionButton = await driver.findComponent(ON.id('EnableTransition'));
      await (defaultTransitionButton?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let openDialogButton = await driver.findComponent(ON.id('OpenDialog'));
      await (openDialogButton?.click() as Promise<void>);
      await CommonFunc.sleep(3000);
      let textContent = inspector.getInspectorByKey('TextContent');
      expect(JSON.parseJsonElement(textContent).getElement('$attrs').getString('content')).assertEqual('弹窗');
      let confirmButton = await driver.findComponent(ON.id('Confirm'));
      await (confirmButton?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      await (maskTransitionButton?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      await (dialogTransitionButton?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      await (defaultTransitionButton?.click() as Promise<void>);
      console.info('OpenDialogTransitionTest_static_600 end');
      done();
    });

  })
}