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

import router from '@ohos.router';
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '../../../../hypium'
import { Component, Driver, MouseButton, ON, Point } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common'
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest } from '../Util.test';

let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function HapticFeedbackModeTest() {
  describe('HapticFeedbackModeTest', () => {
    beforeAll(() => {
      console.info("HapticFeedbackModeTest beforeEach start");

      await UtilsTest.startAbility("com.arkui.ace.imageText.api18.static", "EntryAbility")

    });

    beforeEach(async (): Promise<void> => {
      console.info("ImageSpanVisibility beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/RichEditor/HapticFeedbackMode",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get ImageSpanVisibility state pages:" + JSON.stringify(pages));
        if (!("HapticFeedbackMode" == pages.name)) {
          console.info("get ImageSpanVisibility pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push ImageSpanVisibility page error:" + err);
      }
      console.info("ImageSpanVisibility beforeEach end");
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("HapticFeedbackModeTest after each called");
    });


    /**
     * @tc.number   HapticFeedbackModeTest_static_0001
     * @tc.name     HapticFeedbackModeTest_static_0001
     * @tc.desc     HapticFeedbackModeTest_static_0001
     * @tc.level    Level.LEVEL0
     */
    it('HapticFeedbackModeTest_static_0001', Level.LEVEL0, async (done: () => void) => {
      try {
        let driver = Driver.create();
        console.info('[HapticFeedbackModeTest0001] START');
        await CommonFunc.sleep(1000);
        let update: Component = await driver.findComponent(ON.id('update_Button')) as Component
        await CommonFunc.sleep(500);
        await (update?.click() as Promise<void>);
        await CommonFunc.sleep(500);
        let richEditor: Component = await driver.findComponent(ON.id('HapticFeedbackMode.ENABLED')) as Component
        await CommonFunc.sleep(500);
        let point = await (richEditor?.getBoundsCenter() as Promise<Point>);
        await CommonFunc.sleep(500);
        await (driver?.mouseClick(point, MouseButton.MOUSE_BUTTON_RIGHT) as Promise<void>);
        await CommonFunc.sleep(500);
        await driver.assertComponentExist(ON.text('HapticFeedbackMode'));
        console.info("[HapticFeedbackModeTest0001] end");
        done();
      } catch (err) {
        expect().assertFail();
      }
    });


    /**
     * @tc.number   HapticFeedbackModeTest_static_0002
     * @tc.name     HapticFeedbackModeTest_static_0002
     * @tc.desc     HapticFeedbackModeTest_static_0002
     * @tc.level    Level.LEVEL0
     */
    it('HapticFeedbackModeTest_static_0002', Level.LEVEL0, async (done: () => void) => {
      try {
        let driver = Driver.create();
        console.info('HapticFeedbackModeTest HapticFeedbackModeTest0002 START');
        await CommonFunc.sleep(1000);
        let update: Component = await driver.findComponent(ON.id('update_Button')) as Component
        await CommonFunc.sleep(500);
        await (update?.click() as Promise<void>);
        await CommonFunc.sleep(500);
        let richEditor: Component = await driver.findComponent(ON.id('HapticFeedbackMode.DISABLED')) as Component
        await CommonFunc.sleep(500);
        await (richEditor?.longClick() as Promise<void>);
        await CommonFunc.sleep(500);
        await driver.assertComponentExist(ON.text('HapticFeedbackMode'));
        console.info("[HapticFeedbackModeTest0002] end");
        done();
      } catch (err) {
        expect().assertFail();
      }
    });


    /**
     * @tc.number   HapticFeedbackModeTest_static_0003
     * @tc.name     HapticFeedbackModeTest_static_0003
     * @tc.desc     HapticFeedbackModeTest_static_0003
     * @tc.level    Level.LEVEL0
     */
    it('HapticFeedbackModeTest_static_0003', Level.LEVEL0, async (done: () => void) => {
      try {
        let driver = Driver.create();
        console.info('[HapticFeedbackModeTest0003] START');
        await CommonFunc.sleep(1000);
        let update: Component = await driver.findComponent(ON.id('update_Button')) as Component
        await CommonFunc.sleep(500);
        await (update?.click() as Promise<void>);
        await CommonFunc.sleep(500);
        let image: Component = await driver.findComponent(ON.id('HapticFeedbackMode.AUTO')) as Component
        await CommonFunc.sleep(500);
        let point = await image.getBoundsCenter();
        await CommonFunc.sleep(500);
        await driver.mouseClick(point, MouseButton.MOUSE_BUTTON_RIGHT);
        await CommonFunc.sleep(500);
        await driver.assertComponentExist(ON.text('HapticFeedbackMode'));
        console.info("[HapticFeedbackModeTest0003] end");
        done();
      } catch (err) {
        expect().assertFail();
      }
    });
  })
}