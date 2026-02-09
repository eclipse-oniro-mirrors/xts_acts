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
import { beforeAll, beforeEach, describe, it, expect,TestType, Size, Level } from "../../../hypium/index"
import {Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, UiDirection, MouseButton, WindowMode, PointerMatrix, UIElementInfo, UIEventObserver } from '@kit.TestKit'
import { BusinessError } from '@ohos.base';
import  hilog  from '@ohos.hilog'
import { Utils, startAbility, stopApplication } from './Util.test';
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'uitestTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

const TestTag = 'UitestUiWindowErrorTest';
const DeviceErrorCode = 17000005;
const AsyncErrorCode = 17000002;
const InvisibleErrorCode = 17000004;
const waitUiReadyMs = 1000;

export default function uitestUiWindowErrorTest() {
  describe('UitestUiWindowErrorTest', (): void => {
    beforeAll(async () : Promise<void> => {
      hilog.info(domain, tag, "UitestUiWindowErrorTest loadup start!!!!!")
      await Utils.msSleep(1000)
      hilog.info(domain, tag, "UitestUiWindowErrorTest loadup over!!!!!")
    })

    /**
     * @tc.name test_UiWindow_getBundleName_17000004_static
     * @tc.number uitestUiWindowErrorTest_001
     * @tc.desc setPoint 17000004 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_UiWindow_getBundleName_17000004_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, test_UiWindow_getBundleName_17000004_static start`);
      try {
        let driver: Driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(waitUiReadyMs);
        let window = await driver.findWindow({bundleName: 'com.uitestScene.acts'});
        await driver.delayMs(waitUiReadyMs);
        await stopApplication('com.uitestScene.acts');
        await driver.delayMs(waitUiReadyMs);
        if (window != null) {
          await window.getBundleName();
        }
        await driver.delayMs(waitUiReadyMs);
        expect().assertFail();
      }catch (e: BusinessError) {
        console.log(`${TestTag}, test_UiWindow_getBundleName_17000004_static error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(InvisibleErrorCode);
      }
      await Utils.msSleep(1000)
      console.log(`${TestTag}, test_UiWindow_getBundleName_17000004_static end`);
    })


    /**
     * @tc.name test_UiWindow_getBounds_17000004_static
     * @tc.number uitestUiWindowErrorTest_002
     * @tc.desc getBounds 17000004 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_UiWindow_getBounds_17000004_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, test_UiWindow_getBounds_17000004_static start`);
      try {
        let driver: Driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(waitUiReadyMs);
        let window = await driver.findWindow({bundleName: 'com.uitestScene.acts'});
        await driver.delayMs(waitUiReadyMs);
        await stopApplication('com.uitestScene.acts');
        await driver.delayMs(waitUiReadyMs);
        if (window != null) {
          await window.getBounds();
        }
        await driver.delayMs(waitUiReadyMs);
      }catch (e: BusinessError) {
        console.log(`${TestTag}, test_UiWindow_getBounds_17000004_static error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(InvisibleErrorCode);
      }
      await Utils.msSleep(1000)
      console.log(`${TestTag}, test_UiWindow_getBounds_17000004_static end`);
    })

    /**
     * @tc.name test_UiWindow_getTitle_17000004_static
     * @tc.number uitestUiWindowErrorTest_003
     * @tc.desc getTitle 17000004 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_UiWindow_getTitle_17000004_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, test_UiWindow_getTitle_17000004_static start`);
      try {
        let driver: Driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(waitUiReadyMs);
        let window = await driver.findWindow({bundleName: 'com.uitestScene.acts'});
        await driver.delayMs(waitUiReadyMs);
        await stopApplication('com.uitestScene.acts');
        await driver.delayMs(waitUiReadyMs);
        if (window != null) {
          await window.getTitle();
        }
        await driver.delayMs(waitUiReadyMs);
        expect().assertFail();
      }catch (e: BusinessError) {
        console.log(`${TestTag}, test_UiWindow_getTitle_17000004_static error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(InvisibleErrorCode);
      }
      await Utils.msSleep(1000)
      console.log(`${TestTag}, test_UiWindow_getTitle_17000004_static end`);
    })


    /**
     * @tc.name test_UiWindow_getWindowMode_17000004_static
     * @tc.number uitestUiWindowErrorTest_004
     * @tc.desc getWindowMode 17000004 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_UiWindow_getWindowMode_17000004_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, test_UiWindow_getWindowMode_17000004_static start`);
      try {
        let driver: Driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(waitUiReadyMs);
        let window = await driver.findWindow({bundleName: 'com.uitestScene.acts'});
        await driver.delayMs(waitUiReadyMs);
        await stopApplication('com.uitestScene.acts');
        await driver.delayMs(waitUiReadyMs);
        if (window != null) {
          await window.getWindowMode();
        }
        await driver.delayMs(waitUiReadyMs);
        expect().assertFail();
      }catch (e: BusinessError) {
        console.log(`${TestTag}, test_UiWindow_getWindowMode_17000004_static error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(InvisibleErrorCode);
      }
      await Utils.msSleep(1000)
      console.log(`${TestTag}, test_UiWindow_getWindowMode_17000004_static end`);
    })

    /**
     * @tc.name test_UiWindow_isFocused_17000004_static
     * @tc.number uitestUiWindowErrorTest_005
     * @tc.desc isFocused 17000004 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_UiWindow_isFocused_17000004_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, test_UiWindow_isFocused_17000004_static start`);
      try {
        let driver: Driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(waitUiReadyMs);
        let window = await driver.findWindow({bundleName: 'com.uitestScene.acts'});
        await driver.delayMs(waitUiReadyMs);
        await stopApplication('com.uitestScene.acts');
        await driver.delayMs(waitUiReadyMs);
        if (window != null) {
          await window.isFocused();
        }
        await driver.delayMs(waitUiReadyMs);
        expect().assertFail();
      }catch (e: BusinessError) {
        console.log(`${TestTag}, test_UiWindow_isFocused_17000004_static error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(InvisibleErrorCode);
      }
      await Utils.msSleep(1000)
      console.log(`${TestTag}, test_UiWindow_isFocused_17000004_static end`);
    })

    /**
     * @tc.name test_UiWindow_isActive_17000004_static
     * @tc.number uitestUiWindowErrorTest_006
     * @tc.desc isActive 17000004 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_UiWindow_isActive_17000004_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, test_UiWindow_isActive_17000004_static start`);
      try {
        let driver: Driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(waitUiReadyMs);
        let window = await driver.findWindow({bundleName: 'com.uitestScene.acts'});
        await driver.delayMs(waitUiReadyMs);
        await stopApplication('com.uitestScene.acts');
        await driver.delayMs(waitUiReadyMs);
        if (window != null) {
          await window.isActive();
        }
        await driver.delayMs(waitUiReadyMs);
        expect().assertFail();
      }catch (e: BusinessError) {
        console.log(`${TestTag}, test_UiWindow_isActive_17000004_static error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(InvisibleErrorCode);
      }
      await Utils.msSleep(1000)
      console.log(`${TestTag}, test_UiWindow_isActive_17000004_static end`);
    })


    /**
     * @tc.name test_UiWindow_isactive_17000004_static
     * @tc.number uitestUiWindowErrorTest_0007
     * @tc.desc isactive 17000004 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_UiWindow_isactive_17000004_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, test_UiWindow_isactive_17000004_static start`);
      try {
        let driver: Driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(waitUiReadyMs);
        let window = await driver.findWindow({bundleName: 'com.uitestScene.acts'});
        await driver.delayMs(waitUiReadyMs);
        await stopApplication('com.uitestScene.acts');
        await driver.delayMs(waitUiReadyMs);
        if (window != null) {
          await window.isActive();
        }
        await driver.delayMs(waitUiReadyMs);
        expect().assertFail()
      }catch (e: BusinessError) {
        console.log(`${TestTag}, test_UiWindow_isactive_17000004_static error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(InvisibleErrorCode);
      }
      await Utils.msSleep(1000)
      console.log(`${TestTag}, test_UiWindow_isactive_17000004_static end`);
    })

    /**
     * @tc.name test_UiWindow_focus_17000004_static
     * @tc.number uitestUiWindowErrorTest_0008
     * @tc.desc focus 17000004 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_UiWindow_focus_17000004_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, test_UiWindow_focus_17000004_static start`);
      try {
        let driver: Driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(waitUiReadyMs);
        let window = await driver.findWindow({bundleName: 'com.uitestScene.acts'});
        await driver.delayMs(waitUiReadyMs);
        await stopApplication('com.uitestScene.acts');
        await driver.delayMs(waitUiReadyMs);
        if (window != null) {
          await window.focus();
        }
        await driver.delayMs(waitUiReadyMs);
        expect().assertFail();
      }catch (e: BusinessError) {
        console.log(`${TestTag}, test_UiWindow_focus_17000004_static error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(InvisibleErrorCode);
      }
      await Utils.msSleep(1000)
      console.log(`${TestTag}, test_UiWindow_focus_17000004_static end`);
    })

    /**
     * @tc.name test_UiWindow_moveTo_17000004_static
     * @tc.number uitestUiWindowErrorTest_0009
     * @tc.desc moveTo 17000004 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_UiWindow_moveTo_17000004_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, test_UiWindow_moveTo_17000004_static start`);
      let isSupport = false;
      try {
        let driver = Driver.create();
        let window = await driver.findWindow({active: true});
        if (window != null) {
          await window.moveTo(100, 100);
        }
        isSupport = true;
      }catch (e: BusinessError) {
        console.log(`${TestTag}, test_UiWindow_moveTo_17000004_static isSupport error is: ${JSON.stringify(e)}`);
        isSupport = false;
      }
      console.log(`${TestTag}, test_UiWindow_moveTo_17000004_static isSupport is: ${ isSupport }`);
      if (isSupport) {
        try {
          let driver: Driver = Driver.create();
          await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
          await driver.delayMs(waitUiReadyMs);
          let window = await driver.findWindow({bundleName: 'com.uitestScene.acts'});
          await driver.delayMs(waitUiReadyMs);
          await stopApplication('com.uitestScene.acts');
          await driver.delayMs(waitUiReadyMs);
          if (window != null) {
            await window.moveTo(100, 100);
          }
          await driver.delayMs(waitUiReadyMs);
          expect().assertFail();
        }catch (e: BusinessError) {
          console.log(`${TestTag}, test_UiWindow_moveTo_17000004_static error is: ${JSON.stringify(e)}`);
          expect(e.code).assertEqual(InvisibleErrorCode);
        }
      }
      await Utils.msSleep(1000)
      console.log(`${TestTag}, test_UiWindow_moveTo_17000004_static end`);
    })

    /**
     * @tc.name test_UiWindow_resize_17000004_static
     * @tc.number uitestUiWindowErrorTest_011
     * @tc.desc resize 17000004 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_UiWindow_resize_17000004_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, test_UiWindow_resize_17000004_static start`);
      let isSupportResize = true;
      try {
        let driver: Driver = Driver.create();
        let window = await driver.findWindow({active: true});
        if (window != null) {
          await window.resize(100, 100, ResizeDirection.LEFT);
        }
        isSupportResize = true;
      }catch (e: BusinessError) {
        console.log(`${TestTag}, test_UiWindow_resize_17000004_static isSupportResize error is: ${JSON.stringify(e)}`);
        if (e.code == DeviceErrorCode) {
          isSupportResize = false;
        }
      }
      console.log(`${TestTag}, test_UiWindow_resize_17000004_static isSupportResize is: ${isSupportResize}`);
      if (isSupportResize) {
        try {
          let driver: Driver = Driver.create();
          await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
          await driver.delayMs(waitUiReadyMs);
          let window = await driver.findWindow({bundleName: 'com.uitestScene.acts'});
          await driver.delayMs(waitUiReadyMs);
          await stopApplication('com.uitestScene.acts');
          await driver.delayMs(waitUiReadyMs);
          if (window != null) {
            await window.resize(100, 100, ResizeDirection.LEFT);
          }
          await driver.delayMs(waitUiReadyMs);
          expect().assertFail();
        }catch (e: BusinessError) {
          console.log(`${TestTag}, test_UiWindow_resize_17000004_static error is: ${JSON.stringify(e)}`);
          expect(e.code).assertEqual(InvisibleErrorCode);
        }
      }
      await Utils.msSleep(1000)
      console.log(`${TestTag}, test_UiWindow_resize_17000004_static end`);
    })


    /**
     * @tc.name test_UiWindow_split_17000004_static
     * @tc.number uitestUiWindowErrorTest_013
     * @tc.desc split 17000004 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_UiWindow_split_17000004_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, test_UiWindow_split_17000004_static start`);
      let isSupportSpilt = true;
      try {
        let driver: Driver = Driver.create();
        let window = await driver.findWindow({active: true});
        if (window != null) {
          await window.split();
        }
        isSupportSpilt = true;
      }catch (e: BusinessError) {
        console.log(`${TestTag}, test_UiWindow_split_17000004_static isSupportSpilt error is: ${JSON.stringify(e)}`);
        if (e.code == DeviceErrorCode) {
          isSupportSpilt = false;
        }
      }
      console.log(`${TestTag}, test_UiWindow_split_17000004_static isSupportSpilt is: ${isSupportSpilt}`);
      if (isSupportSpilt) {
        try {
          let driver: Driver = Driver.create();
          await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
          await driver.delayMs(waitUiReadyMs);
          let window = await driver.findWindow({bundleName: 'com.uitestScene.acts'});
          await driver.delayMs(waitUiReadyMs);
          await stopApplication('com.uitestScene.acts');
          await driver.delayMs(waitUiReadyMs);
          if (window != null) {
            await window.split();
          }
          await driver.delayMs(waitUiReadyMs);
          expect().assertFail();
        }catch (e: BusinessError) {
          console.log(`${TestTag}, test_UiWindow_split_17000004_static error is: ${JSON.stringify(e)}`);
          expect(e.code).assertEqual(InvisibleErrorCode);
        }
      }
      await Utils.msSleep(1000)
      console.log(`${TestTag}, test_UiWindow_split_17000004_static end`);
    })


    /**
     * @tc.name test_UiWindow_maximize_17000004_static
     * @tc.number uitestUiWindowErrorTest_015
     * @tc.desc maximize 17000004 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_UiWindow_maximize_17000004_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, test_UiWindow_maximize_17000004_static start`);
      let isSupportMaximize = true;
      try {
        let driver: Driver = Driver.create();
        let window = await driver.findWindow({active: true});
        if (window != null) {
          await window.maximize();
        }
        isSupportMaximize = true;
      }catch (e: BusinessError) {
        console.log(`${TestTag}, test_UiWindow_maximize_17000004_static isSupportMaximize error is: ${JSON.stringify(e)}`);
        if (e.code == DeviceErrorCode) {
          isSupportMaximize = false;
        }
      }
      if (isSupportMaximize) {
        try {
          let driver: Driver = Driver.create();
          await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
          await driver.delayMs(waitUiReadyMs);
          let window = await driver.findWindow({bundleName: 'com.uitestScene.acts'});
          await driver.delayMs(waitUiReadyMs);
          await stopApplication('com.uitestScene.acts');
          await driver.delayMs(waitUiReadyMs);
          if (window != null) {
            await window.maximize();
          }
          await driver.delayMs(waitUiReadyMs);
          expect().assertFail();
        }catch (e: BusinessError) {
          console.log(`${TestTag}, test_UiWindow_maximize_17000004_static error is: ${JSON.stringify(e)}`);
          expect(e.code).assertEqual(InvisibleErrorCode);
        }
      }
      await Utils.msSleep(1000)
      console.log(`${TestTag}, test_UiWindow_maximize_17000004_static end`);
    })


    /**
     * @tc.name test_UiWindow_minimize_17000004_static
     * @tc.number uitestUiWindowErrorTest_017
     * @tc.desc minimize 17000004 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_UiWindow_minimize_17000004_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, test_UiWindow_minimize_17000004_static start`);
      let isSupportMinimize = false;
      try {
        let driver: Driver = Driver.create();
        let window = await driver.findWindow({active: true});
        if (window != null) {
          await window.minimize();
        }
        isSupportMinimize = true;
      }catch (e) {
        console.log(`${TestTag}, test_UiWindow_minimize_17000004_static isSupportMinimize error is: ${JSON.stringify(e)}`);
        isSupportMinimize = false;
      }
      console.log(`${TestTag}, test_UiWindow_minimize_17000004_static isSupportMinimize is: ${ isSupportMinimize }`);
      if (isSupportMinimize) {
        try {
          let driver: Driver = Driver.create();
          await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
          await driver.delayMs(waitUiReadyMs);
          let window = await driver.findWindow({bundleName: 'com.uitestScene.acts'});
          await driver.delayMs(waitUiReadyMs);
          await stopApplication('com.uitestScene.acts');
          await driver.delayMs(waitUiReadyMs);
          if (window != null) {
            await window.minimize();
          }
          await driver.delayMs(waitUiReadyMs);
          expect().assertFail();
        }catch (e: BusinessError) {
          console.log(`${TestTag}, test_UiWindow_minimize_17000004_static error is: ${JSON.stringify(e)}`);
          expect(e.code).assertEqual(InvisibleErrorCode);
        }
      }
      await Utils.msSleep(1000)
      console.log(`${TestTag}, test_UiWindow_minimize_17000004_static end`);
    })

    /**
     * @tc.name test_UiWindow_resume_17000004_static
     * @tc.number uitestUiWindowErrorTest_019
     * @tc.desc resume 17000004 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_UiWindow_resume_17000004_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, test_UiWindow_resume_17000004_static start`);
      let isSupportResume = true;
      try {
        let driver: Driver = Driver.create();
        let window = await driver.findWindow({active: true});
        if (window != null) {
          await window.resume();
        }
        isSupportResume = true;
      }catch (e: BusinessError) {
        console.log(`${TestTag}, test_UiWindow_resume_17000004_static isSupportResume error is: ${JSON.stringify(e)}`);
        if (e.code == DeviceErrorCode) {
          isSupportResume = false;
        }
      }
      if (isSupportResume) {
        try {
          let driver: Driver = Driver.create();
          await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
          await driver.delayMs(waitUiReadyMs);
          let window = await driver.findWindow({bundleName: 'com.uitestScene.acts'});
          await driver.delayMs(waitUiReadyMs);
          await stopApplication('com.uitestScene.acts');
          await driver.delayMs(waitUiReadyMs);
          if (window != null) {
            await window.resume();
          }
          await driver.delayMs(waitUiReadyMs);
          expect().assertFail();
        }catch (e: BusinessError) {
          console.log(`${TestTag}, test_UiWindow_resume_17000004_static error is: ${JSON.stringify(e)}`);
          expect(e.code).assertEqual(InvisibleErrorCode);
        }
      }
      await Utils.msSleep(1000)
      console.log(`${TestTag}, test_UiWindow_resume_17000004_static end`);
    })

    /**
     * @tc.name test_UiWindow_close_17000004_static
     * @tc.number uitestUiWindowErrorTest_021
     * @tc.desc close 17000004 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_UiWindow_close_17000004_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, test_UiWindow_close_17000004_static start`);
      let isSupportClose = true;
      try {
        let driver:Driver = Driver.create();
        let window = await driver.findWindow({active: true});
        if (window != null) {
          await window.close();
        }
      }catch (e: BusinessError) {
        console.log(`${TestTag}, test_UiWindow_close_17000004_static isSupportClose error is: ${JSON.stringify(e)}`);
        if (e.code == DeviceErrorCode) {
          isSupportClose = false;
        }
      }
      console.log(`${TestTag}, test_UiWindow_close_17000004_static isSupportClose is: ${ isSupportClose }`);
      if (isSupportClose) {
        try {
          let driver: Driver = Driver.create();
          await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
          await driver.delayMs(waitUiReadyMs);
          let window = await driver.findWindow({bundleName: 'com.uitestScene.acts'});
          await driver.delayMs(waitUiReadyMs);
          await stopApplication('com.uitestScene.acts');
          await driver.delayMs(waitUiReadyMs);
          if (window != null) {
            await window.close();
          }
          await driver.delayMs(waitUiReadyMs);
          expect().assertFail();
        }catch (e: BusinessError) {
          console.log(`${TestTag}, test_UiWindow_close_17000004_static error is: ${JSON.stringify(e)}`);
          expect(e.code).assertEqual(InvisibleErrorCode);
        }
      }
      await Utils.msSleep(1000)
      console.log(`${TestTag}, test_UiWindow_close_17000004_static end`);
    })
  })
}