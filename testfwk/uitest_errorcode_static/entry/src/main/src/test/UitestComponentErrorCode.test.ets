/**
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import { beforeAll, beforeEach, describe, it, expect,TestType, Size, Level } from "../../../hypium/index"
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, UiDirection, MouseButton, WindowMode, PointerMatrix, UIElementInfo, UIEventObserver } from '@kit.TestKit'
import { BusinessError } from '@ohos.base';
import  hilog  from '@ohos.hilog'
import { Utils, startAbility, stopApplication } from './Util.test';

const waitUiReadyMs : int = 1000;
const TestTag = 'UitestComponentErrorTest';
const AsyncErrorCode = 17000002;
const InvisibleErrorCode = 17000004;
const ErrorCode = 401;
const CapabilityCode = 801;
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'uitestTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export default function uitestComponentErrorTest() {
  describe('uitestComponentErrorTest', (): void => {
    beforeAll(async () : Promise<void> => {
      hilog.info(domain, tag, "uitestComponentErrorTest loadup start!!!!!")
      await Utils.msSleep(1000)
      hilog.info(domain, tag, "uitestComponentErrorTest loadup over!!!!!")
    })

    /**
     * @tc.name   test_scrollToTop_17000004_static
     * @tc.number UitestComponentErrorTest_001
     * @tc.desc   scrollToTop 17000004 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_scrollToTop_17000004_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `test_scrollToTop_17000004_static start`);
      try {
        const driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(waitUiReadyMs);
        let scrollBar = await driver.findComponent(ON.type('Scroll'));
        hilog.info(domain, tag, `test_scrollToTop_17000004_static scrollBar is: ${JSON.stringify(scrollBar)}`);
        await stopApplication('com.uitestScene.acts');
        await driver.delayMs(waitUiReadyMs * 2);
        if (scrollBar != null) {
          await scrollBar.scrollToTop();
        }
        expect().assertFail();
      }catch (e) {
        hilog.info(domain, tag, `test_scrollToTop_17000004_static error is: ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(InvisibleErrorCode);
      }
      await Utils.msSleep(1000);
      hilog.info(domain, tag, `test_scrollToTop_17000004_static end`);
    })


    /**
     * @tc.name   test_scrollSearch_17000004_static
     * @tc.number UitestComponentErrorTest_002
     * @tc.desc   scrollSearch 17000004 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_scrollSearch_17000004_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(TestTag, 'test_scrollSearch_17000004_static start');
      try {
        const driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(waitUiReadyMs);
        let button = await driver.findComponent(ON.type('Scroll'));
        await stopApplication('com.uitestScene.acts');
        await driver.delayMs(waitUiReadyMs * 2);
        if (button != null) {
          await button.scrollSearch(ON.text('next page'));
        }
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_scrollSearch_17000004_static error is: ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(InvisibleErrorCode);
      }
      await Utils.msSleep(1000);
      console.log(TestTag, 'test_scrollSearch_17000004_static end');
    })


    /**
     * @tc.name   test_scrollToBottom_17000004_static
     * @tc.number UitestComponentErrorTest_003
     * @tc.desc   scrollToBottom 17000004 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_scrollToBottom_17000004_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(TestTag, 'test_scrollToBottom_17000004_static start');
      const driver = Driver.create();
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver.delayMs(waitUiReadyMs);
      let button = await driver.findComponent(ON.type('Scroll'));
      await driver.delayMs(waitUiReadyMs);
      await stopApplication('com.uitestScene.acts');
      await driver.delayMs(waitUiReadyMs * 2);
      try {
        if (button != null) {
          await button.scrollToBottom();
        }
        console.log(`${TestTag}, test_scrollToBottom_17000004_static scrollToBottom success.`);
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_scrollToBottom_17000004_static error is: ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(InvisibleErrorCode);
      }
      await Utils.msSleep(1000);
      console.log(TestTag, 'test_scrollToBottom_17000004_static end');
    })


    /**
     * @tc.name   test_click_17000004_static
     * @tc.number UitestComponentErrorTest_004
     * @tc.desc   click 17000004 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_click_17000004_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(TestTag, 'test_click_17000004_static start');
      try {
        const driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(waitUiReadyMs);
        let button = await driver.findComponent(ON.text('MainPage'));
        await stopApplication('com.uitestScene.acts');
        await driver.delayMs(waitUiReadyMs);
        if (button != null) {
          await button.click();
        }
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_click_17000004_static error is: ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(InvisibleErrorCode);
      }
      await Utils.msSleep(1000);
      console.log(TestTag, 'test_click_17000004_static end');
    })


    /**
     * @tc.name   test_doubleClick_17000004_static
     * @tc.number UitestComponentErrorTest_05
     * @tc.desc   doubleClick 17000004 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_doubleClick_17000004_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(TestTag, 'test_doubleClick_17000004_static start');
      try {
        const driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(waitUiReadyMs);
        let button = await driver.findComponent(ON.text('MainPage'));
        await stopApplication('com.uitestScene.acts');
        await driver.delayMs(waitUiReadyMs * 2);
        if (button != null) {
          await button.doubleClick();
        }
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_doubleClick_17000004_static error is: ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(InvisibleErrorCode);
      }
      await Utils.msSleep(1000);
      console.log(TestTag, 'test_doubleClick_17000004_static end');
    })

    /**
     * @tc.name   test_longClick_17000004_static
     * @tc.number UitestComponentErrorTest_06
     * @tc.desc   doubleClick 17000004 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_longClick_17000004_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(TestTag, 'test_longClick_17000004_static start');
      try {
        const driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(waitUiReadyMs);
        let button = await driver.findComponent(ON.text('MainPage'));
        await stopApplication('com.uitestScene.acts');
        await driver.delayMs(waitUiReadyMs * 2);
        if (button != null) {
          await button.longClick();
        }
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_longClick_17000004_static error is: ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(InvisibleErrorCode);
      }
      await Utils.msSleep(1000);
      console.log(TestTag, 'test_longClick_17000004_static end');
    })

    /**
     * @tc.name   test_getId_17000004_static
     * @tc.number UitestComponentErrorTest_07
     * @tc.desc   getId 17000004 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_getId_17000004_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(TestTag, 'test_getId_17000004_static start');
      const driver = Driver.create();
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver.delayMs(waitUiReadyMs);
      let button = await driver.findComponent(ON.text('MainPage'));
      await stopApplication('com.uitestScene.acts');
      try {
        await driver.delayMs(waitUiReadyMs * 2);
        if (button != null) {
          await button.getId();
        }
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_getId_17000004_static error is: ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(InvisibleErrorCode);
      }
      await Utils.msSleep(1000);
      console.log(TestTag, 'test_getId_17000004_static end');
    })

    /**
     * @tc.name   test_getText_17000004_static
     * @tc.number UitestComponentErrorTest_08
     * @tc.desc   getText 17000004 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_getText_17000004_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(TestTag, 'test_getText_17000004_static start');
      try {
        const driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(waitUiReadyMs);
        let button = await driver.findComponent(ON.text('MainPage'));
        await stopApplication('com.uitestScene.acts');
        await driver.delayMs(waitUiReadyMs * 2);
        if (button != null) {
          await button.getText();
        }
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_getText_17000004_static error is: ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(InvisibleErrorCode);
      }
      await Utils.msSleep(1000);
      console.log(TestTag, 'test_getText_17000004_static end');
    })

    /**
     * @tc.name   test_getType_17000004_static
     * @tc.number UitestComponentErrorTest_09
     * @tc.desc   getText 17000004 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_getType_17000004_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(TestTag, 'test_getType_17000004_static start');
      try {
        const driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(waitUiReadyMs);
        let button = await driver.findComponent(ON.text('MainPage'));
        await stopApplication('com.uitestScene.acts');
        await driver.delayMs(waitUiReadyMs * 2);
        if (button != null) {
          await button.getType();
        }
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_getType_17000004_static error is: ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(InvisibleErrorCode);
      }
      await Utils.msSleep(1000);
      console.log(TestTag, 'test_getType_17000004_static end');
    })

    /**
     * @tc.name   test_getBounds_17000004_static
     * @tc.number UitestComponentErrorTest_010
     * @tc.desc   getBounds 17000004 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_getBounds_17000004_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(TestTag, 'test_getBounds_17000004_static start');
      try {
        const driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(waitUiReadyMs);
        let button = await driver.findComponent(ON.text('MainPage'));
        await stopApplication('com.uitestScene.acts');
        await driver.delayMs(waitUiReadyMs * 2);
        if (button != null) {
          await button.getBounds();
        }
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_getBounds_17000004_static error is: ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(InvisibleErrorCode);
      }
      await Utils.msSleep(1000);
      console.log(TestTag, 'test_getBounds_17000004_static end');
    })

    /**
     * @tc.name   test_getBoundsCenter_17000004_static
     * @tc.number UitestComponentErrorTest_011
     * @tc.desc   getBoundsCenter 17000004 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_getBoundsCenter_17000004_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(TestTag, 'test_getBoundsCenter_17000004_static start');
      try {
        const driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(waitUiReadyMs);
        let button = await driver.findComponent(ON.text('MainPage'));
        await stopApplication('com.uitestScene.acts');
        await driver.delayMs(waitUiReadyMs * 2);
        if (button != null) {
          await button.getBoundsCenter();
        }
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_getBoundsCenter_17000004_static error is: ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(InvisibleErrorCode);
      }
      console.log(TestTag, 'test_getBoundsCenter_17000004_static end');
    })

    /**
     * @tc.name   test_isClickable_17000004_static
     * @tc.number UitestComponentErrorTest_012
     * @tc.desc   isClickable 17000004 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_isClickable_17000004_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(TestTag, 'test_isClickable_17000004_static start');
      try {
        const driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(waitUiReadyMs);
        let button = await driver.findComponent(ON.text('MainPage'));
        await stopApplication('com.uitestScene.acts');
        await driver.delayMs(waitUiReadyMs * 2);
        if (button != null) {
          await button.isClickable();
        }
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_isClickable_17000004_static error is: ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(InvisibleErrorCode);
      }
      await Utils.msSleep(1000);
      console.log(TestTag, 'test_isClickable_17000004_static end');
    })

    /**
     * @tc.name   test_isLongClickable_17000004_static
     * @tc.number UitestComponentErrorTest_013
     * @tc.desc   isLongClickable 17000004 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_isLongClickable_17000004_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(TestTag, 'test_isLongClickable_17000004_static start');
      try {
        const driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(waitUiReadyMs);
        let button = await driver.findComponent(ON.text('MainPage'));
        await stopApplication('com.uitestScene.acts');
        await driver.delayMs(waitUiReadyMs * 2);
        if (button != null) {
          await button.isLongClickable();
        }
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_isLongClickable_17000004_static error is: ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(InvisibleErrorCode);
      }
      await Utils.msSleep(1000);
      console.log(TestTag, 'test_isLongClickable_17000004_static end');
    })

    /**
     * @tc.name   test_isChecked_17000004_static
     * @tc.number UitestComponentErrorTest_014
     * @tc.desc   isChecked 17000004 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_isChecked_17000004_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(TestTag, 'test_isChecked_17000004_static start');
      try {
        const driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(waitUiReadyMs);
        let button = await driver.findComponent(ON.text('MainPage'));
        await stopApplication('com.uitestScene.acts');
        await driver.delayMs(waitUiReadyMs * 2);
        if (button != null) {
          await button.isChecked();
        }
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_isChecked_17000004_static error is: ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(InvisibleErrorCode);
      }
      await Utils.msSleep(1000);
      console.log(TestTag, 'test_isChecked_17000004_static end');
    })

    /**
     * @tc.name   test_isCheckable_17000004_static
     * @tc.number UitestComponentErrorTest_015
     * @tc.desc   isCheckable 17000004 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_isCheckable_17000004_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(TestTag, 'test_isCheckable_17000004_static start');
      try {
        const driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(waitUiReadyMs);
        let button = await driver.findComponent(ON.text('MainPage'));
        await stopApplication('com.uitestScene.acts');
        await driver.delayMs(waitUiReadyMs * 2);
        if (button != null) {
          await button.isCheckable();
        }
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_isCheckable_17000004_static error is: ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(InvisibleErrorCode);
      }
      await Utils.msSleep(1000);
      console.log(TestTag, 'test_isCheckable_17000004_static end');
    })

    /**
     * @tc.name   test_isScrollable_17000004_static
     * @tc.number UitestComponentErrorTest_026
     * @tc.desc   isScrollable 17000004 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_isScrollable_17000004_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(TestTag, 'test_isScrollable_17000004_static start');
      try {
        const driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(waitUiReadyMs);
        let button = await driver.findComponent(ON.text('MainPage'));
        await stopApplication('com.uitestScene.acts');
        await driver.delayMs(waitUiReadyMs * 2);
        if (button != null) {
          await button.isScrollable();
        }
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_isScrollable_17000004_static error is: ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(InvisibleErrorCode);
      }
      console.log(TestTag, 'test_isScrollable_17000004_static end');
    })

    /**
     * @tc.name   test_isEnabled_17000004_static
     * @tc.number UitestComponentErrorTest_016
     * @tc.desc   isEnabled 17000004 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_isEnabled_17000004_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(TestTag, 'test_isEnabled_17000004_static start');
      try {
        const driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(waitUiReadyMs);
        let button = await driver.findComponent(ON.text('MainPage'));
        await stopApplication('com.uitestScene.acts');
        await driver.delayMs(waitUiReadyMs * 2);
        if (button != null) {
          await button.isEnabled();
        }
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_isEnabled_17000004_static error is: ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(InvisibleErrorCode);
      }
      console.log(TestTag, 'test_isEnabled_17000004_static end');
    })

    /**
     * @tc.name   test_isFocused_17000004_static
     * @tc.number UitestComponentErrorTest_017
     * @tc.desc   isFocused 17000004 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_isFocused_17000004_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(TestTag, 'test_isFocused_17000004_static start');
      try {
        const driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(waitUiReadyMs);
        let button = await driver.findComponent(ON.text('MainPage'));
        await stopApplication('com.uitestScene.acts');
        await driver.delayMs(waitUiReadyMs * 2);
        if (button != null) {
          await button.isFocused();
        }
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_isFocused_17000004_static error is: ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(InvisibleErrorCode);
      }
      console.log(TestTag, 'test_isFocused_17000004_static end');
    })

    /**
     * @tc.name   test_isSelected_17000004_static
     * @tc.number UitestComponentErrorTest_018
     * @tc.desc   isSelected 17000004 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_isSelected_17000004_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(TestTag, 'test_isSelected_17000004_static start');
      try {
        const driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(waitUiReadyMs);
        let button = await driver.findComponent(ON.text('MainPage'));
        await stopApplication('com.uitestScene.acts');
        await driver.delayMs(waitUiReadyMs * 2);
        if (button != null) {
          await button.isSelected();
        }
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_isSelected_17000004_static error is: ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(InvisibleErrorCode);
      }
      console.log(TestTag, 'test_isSelected_17000004_static end');
    })

    /**
     * @tc.name   test_inputText_17000004_static
     * @tc.number UitestComponentErrorTest_019
     * @tc.desc   inputText 17000004 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_inputText_17000004_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(TestTag, 'test_inputText_17000004_static start');
      try {
        const driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(waitUiReadyMs);
        let button = await driver.findComponent(ON.text('MainPage'));
        await stopApplication('com.uitestScene.acts');
        await driver.delayMs(waitUiReadyMs * 2);
        if (button != null) {
          await button.inputText('hello');
        }
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_inputText_17000004_static error is: ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(InvisibleErrorCode);
      }
      console.log(TestTag, 'test_inputText_17000004_static end');
    })

    /**
     * @tc.name   test_clearText_17000004_static
     * @tc.number UitestComponentErrorTest_020
     * @tc.desc   clearText 17000004 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_clearText_17000004_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(TestTag, 'test_clearText_17000004_static start');
      try {
        const driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(waitUiReadyMs);
        let button = await driver.findComponent(ON.text('MainPage'));
        await stopApplication('com.uitestScene.acts');
        await driver.delayMs(waitUiReadyMs * 2);
        if (button != null) {
          await button.clearText();
        }
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_clearText_17000004_static error is: ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(InvisibleErrorCode);
      }
      console.log(TestTag, 'test_clearText_17000004_static end');
    })

    /**
     * @tc.name   test_dragTo_17000004_static
     * @tc.number UitestComponentErrorTest_021
     * @tc.desc   dragTo 17000004 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_dragTo_17000004_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(TestTag, 'test_dragTo_17000004_static start');
      try {
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        let driver = Driver.create();
        await driver.delayMs(waitUiReadyMs);
        let button = await driver.findComponent(ON.text('MainPage'));
        await stopApplication('com.uitestScene.acts');
        await driver.delayMs(waitUiReadyMs * 2);
        if (button != null) {
          await button.dragTo(button);
        }
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_dragTo_17000004_static error is: ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(InvisibleErrorCode);
      }
      console.log(TestTag, 'test_dragTo_17000004_static end');
    })

    /**
     * @tc.name   test_pinchOut_17000004_static
     * @tc.number UitestComponentErrorTest_022
     * @tc.desc   pinchOut 17000004 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_pinchOut_17000004_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, test_pinchOut_17000004_static start`);
      try {
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        let driver = Driver.create();
        await driver.delayMs(waitUiReadyMs);
        let button = await driver.findComponent(ON.text('MainPage'));
        await stopApplication('com.uitestScene.acts');
        await driver.delayMs(waitUiReadyMs * 2);
        if (button != null) {
          await button.pinchOut(1.2);
        }
        await driver.delayMs(waitUiReadyMs)
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_pinchOut_17000004_static error is: ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(InvisibleErrorCode);
      } finally {

      }
      console.log(`${TestTag}, test_pinchOut_17000004_static end`);
    })

    /**
     * @tc.name   test_pinchIn_17000004_static
     * @tc.number UitestComponentErrorTest_023
     * @tc.desc   pinchIn 17000004 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_pinchIn_17000004_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, test_pinchIn_17000004_static start`);
      try {
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        let driver = Driver.create();
        await driver.delayMs(waitUiReadyMs);
        let button = await driver.findComponent(ON.text('MainPage'));
        await stopApplication('com.uitestScene.acts');
        await driver.delayMs(waitUiReadyMs * 2);
        if (button != null) {
          await button.pinchIn(0.5);
        }
        await driver.delayMs(waitUiReadyMs)
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_pinchIn_17000004_static error is: ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(InvisibleErrorCode);
      } finally {

      }
      console.log(`${TestTag}, test_pinchIn_17000004_static end`);
    })

    /**
     * @tc.name   test_getDescription_17000004_static
     * @tc.number UitestComponentErrorTest_024
     * @tc.desc   getDescription 17000004 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_getDescription_17000004_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, test_getDescription_17000004_static start`);
      try {
        let driver: Driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(waitUiReadyMs);
        let button = await driver.findComponent(ON.text('MainPage'));
        await driver.delayMs(waitUiReadyMs);
        await stopApplication('com.uitestScene.acts');
        await driver.delayMs(waitUiReadyMs * 2);
        if (button != null) {
          await button.getDescription();
        }
        await driver.delayMs(waitUiReadyMs);
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_getDescription_17000004_static error is: ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(InvisibleErrorCode);
      } finally {

      }
      console.log(`${TestTag}, test_getDescription_17000004_static end`);
    })

    /**
     * @tc.name   test_getHint_17000004_static
     * @tc.number UitestComponentErrorTest_025
     * @tc.desc   getHint 17000004 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_getHint_17000004_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, test_getHint_17000004_static start`);
      try {
        let driver: Driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(waitUiReadyMs);
        let button = await driver.findComponent(ON.text('MainPage'));
        await driver.delayMs(waitUiReadyMs);
        await stopApplication('com.uitestScene.acts');
        await driver.delayMs(waitUiReadyMs * 2);
        if (button != null) {
          await button.getHint();
        }
        await driver.delayMs(waitUiReadyMs);
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_getHint_17000004_static error is: ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(InvisibleErrorCode);
      }
      console.log(`${TestTag}, test_getHint_17000004_static end`);
    })

    /**
     * @tc.name   test_inputTextMode_801_static
     * @tc.number UitestComponentErrorTest_026
     * @tc.desc   inputText 801 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_inputTextMode_801_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_inputTextMode_801_static start`);
      try {
        const driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(waitUiReadyMs);
        let button = await driver.findComponent(ON.type('TextInput'));
        if (button == null) {
          let scorll = await driver.findComponent(ON.type('Scroll'))
          if (scorll != null) {
            button = await scorll.scrollSearch(ON.type('TextInput'))
          }
        }
        await driver.delayMs(waitUiReadyMs);
        console.log(`${TestTag}, test_inputTextMode_801_static button: ${JSON.stringify(button)}`);
        expect(button != null).assertTrue();
        if (button != null) {
          await button.inputText('123456', {
            paste: true
          });
        }
      }catch (e) {
        console.log(`${TestTag}, test_inputTextMode_801_static error is: ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(CapabilityCode);
      } finally {
        await stopApplication('com.uitestScene.acts');
      }
      console.log(`${TestTag}, test_inputTextMode_801_static end`);
    })

    /**
     * @tc.name   test_inputTextMode_17000004_static
     * @tc.number UitestComponentErrorTest_027
     * @tc.desc   inputText 17000004 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_inputTextMode_17000004_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, test_inputTextMode_17000004_static start`);
      try {
        let driver: Driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(waitUiReadyMs);
        let button = await driver.findComponent(ON.text('MainPage'));
        await driver.delayMs(waitUiReadyMs);
        await stopApplication('com.uitestScene.acts');
        await driver.delayMs(waitUiReadyMs * 2);
        console.log(`${TestTag}, test_inputTextMode_17000004_static button: ${JSON.stringify(button)}`);
        expect(button != null).assertTrue();
        if (button != null) {
          await button.inputText('123456', {
            paste: true
          });
        }
        await driver.delayMs(waitUiReadyMs);
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_inputTextMode_17000004_static error is: ${JSON.stringify(e)}`);
        expect((e as BusinessError).code).assertEqual(InvisibleErrorCode);
      }
      console.log(`${TestTag}, test_inputTextMode_17000004_static end`);
    })
  })
}