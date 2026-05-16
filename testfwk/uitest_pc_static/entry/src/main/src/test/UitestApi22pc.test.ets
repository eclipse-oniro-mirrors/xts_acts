/**
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from "../../../hypium/index"
import {Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, UiDirection, MouseButton, WindowMode, PointerMatrix, UIElementInfo, UIEventObserver, Point, ComponentEventType,
  WindowChangeType } from '@kit.TestKit'
import { Utils, startAbility, stopApplication } from './Util.test';
import { BusinessError } from '@ohos.base';
import display from '@ohos.display';

const waitUiReadyMs: int = 1000;
const TestTag: string = 'uiTest_API22pc';

export default function UiTest() {
  describe('uiTest_API22pc', () => {
    let driver: Driver
    beforeAll(async () => {
      driver = Driver.create();
      await driver.delayMs(1000);
    })

    beforeEach(async () => {
      await stopApplication('com.uitestScene.acts');
    })

    /**
     * @tc.name   testWindowChangeAddOptionsMonitor_static
     * @tc.number uiTest_API22pc_001
     * @tc.desc   monitor window add.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWindowChangeAddOptionsMonitor_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testWindowChangeAddOptionsMonitor_static start`);
      let observer = driver.createUIEventObserver();
      let isCallBack = false;
      let callback = (elementInfo : UIElementInfo) => {
        console.log(`${TestTag}, testWindowChangeAddOptionsMonitor_static elementInfo,${JSON.stringify(elementInfo)}`);
        isCallBack = true;
        try {
          expect(elementInfo.bundleName == 'com.uitestScene.acts').assertTrue()
          expect(elementInfo.windowChangeType == WindowChangeType.WINDOW_ADDED).assertTrue();
          expect(elementInfo.windowId != 0).assertTrue();
        } catch (err) {
          console.log(`${TestTag}, testWindowChangeAddOptionsMonitor_static callback error ,${JSON.stringify(err)}`);
        }
      }
      try {
        observer.onceWindowChange(WindowChangeType.WINDOW_ADDED, {
          bundleName: 'com.uitestScene.acts',
          timeout: 9000
        }, callback);
      } catch (error) {
        console.log(`${TestTag}, testWindowChangeAddOptionsMonitor once error ,${JSON.stringify(error)}`);
        expect().assertFail();
      }
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(4000);
      await stopApplication('com.uitestScene.acts');
      console.log(`${TestTag}, testWindowChangeAddOptionsMonitor_static isCallBack ,${JSON.stringify(isCallBack)}`);
      expect(isCallBack).assertTrue();
      console.log(`${TestTag}, testWindowChangeAddOptionsMonitor_static end`);
    })

    /**
     * @tc.name   testWindowChangeAddOptionsMonitor_defaultBundleName_static
     * @tc.number uiTest_API22pc_002
     * @tc.desc   monitor window add.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWindowChangeAddOptionsMonitor_defaultBundleName_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testWindowChangeAddOptionsMonitor_defaultBundleName_static start`);
      let observer = driver.createUIEventObserver();
      let isCallBack = false;
      let callback = (elementInfo : UIElementInfo) => {
        console.log(`${TestTag}, testWindowChangeAddOptionsMonitor_defaultBundleName_static elementInfo,${JSON.stringify(elementInfo)}`);
        isCallBack = true;
        try {
          expect(elementInfo.bundleName == 'com.uitestScene.acts').assertTrue()
          expect(elementInfo.windowChangeType == WindowChangeType.WINDOW_ADDED).assertTrue();
          expect(elementInfo.windowId != 0).assertTrue();
        } catch (err) {
          console.log(`${TestTag}, testWindowChangeAddOptionsMonitor_defaultBundleName_static callback error ,${JSON.stringify(err)}`);
        }
      }
      try {
        observer.onceWindowChange(WindowChangeType.WINDOW_ADDED, {
          timeout: 9000
        }, callback);
      } catch (error) {
        console.log(`${TestTag}, testWindowChangeAddOptionsMonitor_defaultBundleName_static once error ,${JSON.stringify(error)}`);
        expect().assertFail();
      }
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(4000);
      await stopApplication('com.uitestScene.acts');
      expect(isCallBack).assertTrue();
      console.log(`${TestTag}, testWindowChangeAddOptionsMonitor_defaultBundleName_static end`);
    })

    /**
     * @tc.name   testWindowChangeAddOptionsMonitor_defaultTimeout_static
     * @tc.number uiTest_API22pc_003
     * @tc.desc   monitor window add.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWindowChangeAddOptionsMonitor_defaultTimeout_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testWindowChangeAddOptionsMonitor_defaultTimeout_static start`);
      let observer = driver.createUIEventObserver();
      let isCallBack = false;
      let callback = (elementInfo : UIElementInfo) => {
        console.log(`${TestTag}, testWindowChangeAddOptionsMonitor_defaultTimeout_static elementInfo,${JSON.stringify(elementInfo)}`);
        isCallBack = true;
        try {
          expect(elementInfo.bundleName == 'com.uitestScene.acts').assertTrue()
          expect(elementInfo.windowChangeType == WindowChangeType.WINDOW_ADDED).assertTrue();
          expect(elementInfo.windowId != 0).assertTrue();
        } catch (err) {
          console.log(`${TestTag}, testWindowChangeAddOptionsMonitor_defaultTimeout_static callback error ,${JSON.stringify(err)}`);
        }
      }
      try {
        observer.onceWindowChange(WindowChangeType.WINDOW_ADDED, {
          bundleName: 'com.uitestScene.acts',
        }, callback);
      } catch (error) {
        console.log(`${TestTag}, testWindowChangeAddOptionsMonitor_defaultTimeout_static once error ,${JSON.stringify(error)}`);
        expect().assertFail();
      }
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(4000);
      await stopApplication('com.uitestScene.acts');
      console.log(`${TestTag}, testWindowChangeAddOptionsMonitor_defaultTimeout_static isCallBack ,${JSON.stringify(isCallBack)}`);
      expect(isCallBack).assertTrue();
      console.log(`${TestTag}, testWindowChangeAddOptionsMonitor_defaultTimeout_static end`);
    })

    /**
     * @tc.name   testWindowChangeAddOptionsMonitor_defaultOptions_static
     * @tc.number uiTest_API22pc_004
     * @tc.desc   monitor window add.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWindowChangeAddOptionsMonitor_defaultOptions_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testWindowChangeAddOptionsMonitor_defaultOptions_static start`);
      let observer = driver.createUIEventObserver();
      let isCallBack = false;
      let callback = (elementInfo : UIElementInfo) => {
        console.log(`${TestTag}, testWindowChangeAddOptionsMonitor_defaultOptions_static elementInfo,${JSON.stringify(elementInfo)}`);
        isCallBack = true;
        try {
          expect(elementInfo.bundleName == 'com.uitestScene.acts').assertTrue()
          expect(elementInfo.windowChangeType == WindowChangeType.WINDOW_ADDED).assertTrue();
          expect(elementInfo.windowId != 0).assertTrue();
        } catch (err) {
          console.log(`${TestTag}, testWindowChangeAddOptionsMonitor_defaultOptions_static callback error ,${JSON.stringify(err)}`);
        }
      }
      try {
        observer.onceWindowChange(WindowChangeType.WINDOW_ADDED, {}, callback);
      } catch (error) {
        console.log(`${TestTag}, testWindowChangeAddOptionsMonitor_defaultOptions_static once error ,${JSON.stringify(error)}`);
        expect().assertFail();
      }
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(4000);
      await stopApplication('com.uitestScene.acts');
      console.log(`${TestTag}, testWindowChangeAddOptionsMonitor_defaultOptions_static isCallBack ,${JSON.stringify(isCallBack)}`);
      expect(isCallBack).assertTrue();
      console.log(`${TestTag}, testWindowChangeAddOptionsMonitor_defaultOptions_static end`);
    })

    /**
     * @tc.name   testWindowChangeAddOptionsMonitor_ErrorBundleName_static
     * @tc.number uiTest_API22pc_005
     * @tc.desc   monitor window add.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWindowChangeAddOptionsMonitor_ErrorBundleName_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testWindowChangeAddOptionsMonitor_ErrorBundleName_static start`);
      let observer = driver.createUIEventObserver();
      let isCallBack = false;
      let callback = (elementInfo : UIElementInfo) => {
        console.log(`${TestTag}, testWindowChangeAddOptionsMonitor_ErrorBundleName_static elementInfo,${JSON.stringify(elementInfo)}`);
        isCallBack = true;
      }
      try {
        observer.onceWindowChange(WindowChangeType.WINDOW_ADDED, {
          bundleName: 'com.uitestScene.acts1',
          timeout: 9000
        }, callback);
      } catch (error) {
        console.log(`${TestTag}, testWindowChangeAddOptionsMonitor_ErrorBundleName_static once error ,${JSON.stringify(error)}`);
        expect().assertFail();
      }
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(4000);
      await stopApplication('com.uitestScene.acts');
      console.log(`${TestTag}, testWindowChangeAddOptionsMonitor_ErrorBundleName_static isCallBack ,${JSON.stringify(isCallBack)}`);
      expect(isCallBack).assertFalse();
      console.log(`${TestTag}, testWindowChangeAddOptionsMonitor_ErrorBundleName_static end`);
    })

    /**
     * @tc.name   testWindowChangeAddOptionsMonitor_timeOut_static
     * @tc.number uiTest_API22pc_006
     * @tc.desc   monitor window add.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWindowChangeAddOptionsMonitor_timeOut_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testWindowChangeAddOptionsMonitor_timeOut_static start`);
      let observer = driver.createUIEventObserver();
      let isCallBack = false;
      let callback = (elementInfo : UIElementInfo) => {
        console.log(`${TestTag}, testWindowChangeAddOptionsMonitor_timeOut_static elementInfo,${JSON.stringify(elementInfo)}`);
        isCallBack = true;
      }
      try {
        observer.onceWindowChange(WindowChangeType.WINDOW_ADDED, {
          bundleName: 'com.uitestScene.acts',
          timeout: 2000
        }, callback);
      } catch (error) {
        console.log(`${TestTag}, testWindowChangeAddOptionsMonitor_timeOut_static once error ,${JSON.stringify(error)}`);
        expect().assertFail();
      }
      await driver.delayMs(5000);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(4000);
      await stopApplication('com.uitestScene.acts');
      console.log(`${TestTag}, testWindowChangeAddOptionsMonitor_timeOut_static isCallBack ,${JSON.stringify(isCallBack)}`);
      expect(isCallBack).assertFalse();
      console.log(`${TestTag}, testWindowChangeAddOptionsMonitor_timeOut_static end`);
    })

    /**
     * @tc.name   testWindowChangeRemoveOptionsMonitor_static
     * @tc.number uiTest_API22pc_007
     * @tc.desc   monitor window add.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWindowChangeRemoveOptionsMonitor_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testWindowChangeRemoveOptionsMonitor_static start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(1000);
      let observer = driver.createUIEventObserver();
      let isCallBack = false;
      let callback = (elementInfo : UIElementInfo) => {
        console.log(`${TestTag}, testWindowChangeRemoveOptionsMonitor_static elementInfo,${JSON.stringify(elementInfo)}`);
        isCallBack = true;
        try {
          expect(elementInfo.bundleName == 'com.uitestScene.acts').assertTrue()
          expect(elementInfo.windowChangeType == WindowChangeType.WINDOW_REMOVED).assertTrue();
          expect(elementInfo.windowId != 0).assertTrue();
        } catch (err) {
          console.log(`${TestTag}, testWindowChangeRemoveOptionsMonitor_static callback error ,${JSON.stringify(err)}`);
        }
      }
      try {
        observer.onceWindowChange(WindowChangeType.WINDOW_REMOVED, {
          bundleName: 'com.uitestScene.acts',
          timeout: 9000
        }, callback);
      } catch (error) {
        console.log(`${TestTag}, testWindowChangeRemoveOptionsMonitor_static once error ,${JSON.stringify(error)}`);
        expect().assertFail();
      }
      await stopApplication('com.uitestScene.acts');
      await driver.delayMs(4000);
      console.log(`${TestTag}, testWindowChangeRemoveOptionsMonitor_static isCallBack ,${JSON.stringify(isCallBack)}`);
      expect(isCallBack).assertTrue();
      console.log(`${TestTag}, testWindowChangeRemoveOptionsMonitor_static end`);
    })

    /**
     * @tc.name   testWindowChangeRemoveOptionsMonitor_defaultTimeOut_static
     * @tc.number uiTest_API22pc_009
     * @tc.desc   monitor window add.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWindowChangeRemoveOptionsMonitor_defaultTimeOut_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testWindowChangeRemoveOptionsMonitor_defaultTimeOut_static start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(1000);
      let observer = driver.createUIEventObserver();
      let isCallBack = false;
      let callback = (elementInfo : UIElementInfo) => {
        console.log(`${TestTag}, testWindowChangeRemoveOptionsMonitor_defaultTimeOut_static elementInfo,${JSON.stringify(elementInfo)}`);
        isCallBack = true;
        try {
          expect(elementInfo.bundleName == 'com.uitestScene.acts').assertTrue()
          expect(elementInfo.windowChangeType == WindowChangeType.WINDOW_REMOVED).assertTrue();
          expect(elementInfo.windowId != 0).assertTrue();
        } catch (err) {
          console.log(`${TestTag}, testWindowChangeRemoveOptionsMonitor_defaultTimeOut_static callback error ,${JSON.stringify(err)}`);
        }
      }
      try {
        observer.onceWindowChange(WindowChangeType.WINDOW_REMOVED, {
          bundleName: 'com.uitestScene.acts',
        }, callback);
      } catch (error) {
        console.log(`${TestTag}, testWindowChangeRemoveOptionsMonitor_defaultTimeOut_static once error ,${JSON.stringify(error)}`);
        expect().assertFail();
      }
      await stopApplication('com.uitestScene.acts');
      await driver.delayMs(4000);
      console.log(`${TestTag}, testWindowChangeRemoveOptionsMonitor_defaultTimeOut_static isCallBack ,${JSON.stringify(isCallBack)}`);
      expect(isCallBack).assertTrue();
      console.log(`${TestTag}, testWindowChangeRemoveOptionsMonitor_defaultTimeOut_static end`);
    })

    /**
     * @tc.name   testWindowChangeRemoveOptionsMonitor_ErrorBundleName_static
     * @tc.number uiTest_API22pc_011
     * @tc.desc   monitor window add.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWindowChangeRemoveOptionsMonitor_ErrorBundleName_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testWindowChangeRemoveOptionsMonitor_ErrorBundleName_static start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(1000);
      let observer = driver.createUIEventObserver();
      let isCallBack = false;
      let callback = (elementInfo : UIElementInfo) => {
        console.log(`${TestTag}, testWindowChangeRemoveOptionsMonitor_ErrorBundleName_static elementInfo,${JSON.stringify(elementInfo)}`);
        isCallBack = true;
      }
      try {
        observer.onceWindowChange(WindowChangeType.WINDOW_REMOVED, {
          bundleName: 'com.uitestScene.acts1',
          timeout: 9000
        }, callback);
      } catch (error) {
        console.log(`${TestTag}, testWindowChangeRemoveOptionsMonitor_ErrorBundleName_static once error ,${JSON.stringify(error)}`);
        expect().assertFail();
      }
      await stopApplication('com.uitestScene.acts');
      await driver.delayMs(4000);
      console.log(`${TestTag}, testWindowChangeRemoveOptionsMonitor_ErrorBundleName_static isCallBack ,${JSON.stringify(isCallBack)}`);
      expect(isCallBack).assertFalse();
      console.log(`${TestTag}, testWindowChangeRemoveOptionsMonitor_ErrorBundleName_static end`);
    })

    /**
     * @tc.name   testWindowChangeRemoveOptionsMonitor_timeOut_static
     * @tc.number uiTest_API22pc_012
     * @tc.desc   monitor window add.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWindowChangeRemoveOptionsMonitor_timeOut_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testWindowChangeRemoveOptionsMonitor_timeOut_static start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(1000);
      let observer = driver.createUIEventObserver();
      let isCallBack = false;
      let callback = (elementInfo : UIElementInfo) => {
        console.log(`${TestTag}, testWindowChangeRemoveOptionsMonitor_timeOut_static elementInfo,${JSON.stringify(elementInfo)}`);
        isCallBack = true;
      }
      try {
        observer.onceWindowChange(WindowChangeType.WINDOW_REMOVED, {
          bundleName: 'com.uitestScene.acts',
          timeout: 2000
        }, callback);
      } catch (error) {
        console.log(`${TestTag}, testWindowChangeRemoveOptionsMonitor_timeOut_static once error ,${JSON.stringify(error)}`);
        expect().assertFail();
      }
      await driver.delayMs(4000);
      await stopApplication('com.uitestScene.acts');
      await driver.delayMs(3000);
      console.log(`${TestTag}, testWindowChangeRemoveOptionsMonitor_timeOut_static isCallBack ,${JSON.stringify(isCallBack)}`);
      expect(isCallBack).assertFalse();
      console.log(`${TestTag}, testWindowChangeRemoveOptionsMonitor_timeOut_static end`);
    })

    /**
     * @tc.name   testWindowChangeResizeOptionsMonitor_static
     * @tc.number uiTest_API22pc_013
     * @tc.desc   monitor window resize.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWindowChangeResizeOptionsMonitor_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testWindowChangeResizeOptionsMonitor_static start`);
      let observer = driver.createUIEventObserver();
      let isCallBack = false;
      let callback = (elementInfo : UIElementInfo) => {
        console.log(`${TestTag}, testWindowChangeResizeOptionsMonitor_static elementInfo,${JSON.stringify(elementInfo)}`);
        isCallBack = true;
        try {
          expect(elementInfo.bundleName == 'com.uitestScene.acts').assertTrue()
          expect(elementInfo.windowChangeType == WindowChangeType.WINDOW_BOUNDS_CHANGED).assertTrue();
          expect(elementInfo.windowId != 0).assertTrue();
        } catch (err) {
          console.log(`${TestTag}, testWindowChangeResizeOptionsMonitor_static callback error ,${JSON.stringify(err)}`);
        }
      }
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      try {
        observer.onceWindowChange(WindowChangeType.WINDOW_BOUNDS_CHANGED, {
          bundleName: 'com.uitestScene.acts',
          timeout: 9000
        }, callback)
      } catch (error) {
        console.log(`${TestTag}, testWindowChangeResizeOptionsMonitor_static once error ,${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        let window = await driver.findWindow({bundleName:'com.uitestScene.acts'})
        console.log(`${TestTag}, testWindowChangeResizeOptionsMonitor_static window ,${JSON.stringify(window)}`);
        expect(window != null).assertTrue();
        if (window != null) {
          let wModel: WindowMode = await window.getWindowMode();
          if (wModel != WindowMode.FLOATING) {
            await window.resume();
            await driver.delayMs(1000);
          }
          await window.maximize();
          await driver.delayMs(1000);
        }
      } catch (err) {
        console.log(`${TestTag}, testWindowChangeResizeOptionsMonitor_static resize error ,${JSON.stringify(err)}`);
      }
      await driver.delayMs(4000);
      await stopApplication('com.uitestScene.acts');
      console.log(`${TestTag}, testWindowChangeResizeOptionsMonitor_static resize error ,${JSON.stringify(isCallBack)}`);
      expect(isCallBack).assertTrue();
      console.log(`${TestTag}, testWindowChangeResizeOptionsMonitor_static end`);
    })

    /**
     * @tc.name   testWindowChangeResizeOptionsMonitor_defaultBundleName_static
     * @tc.number uiTest_API22pc_014
     * @tc.desc   monitor window resize.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWindowChangeResizeOptionsMonitor_defaultBundleName_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testWindowChangeResizeOptionsMonitor_defaultBundleName_static start`);
      let observer = driver.createUIEventObserver();
      let isCallBack = false;
      let callback = (elementInfo : UIElementInfo) => {
        console.log(`${TestTag}, testWindowChangeResizeOptionsMonitor_defaultBundleName_static elementInfo,${JSON.stringify(elementInfo)}`);
        isCallBack = true;
        try {
          expect(elementInfo.bundleName == 'com.uitestScene.acts').assertTrue()
          expect(elementInfo.windowChangeType == WindowChangeType.WINDOW_BOUNDS_CHANGED).assertTrue();
          expect(elementInfo.windowId != 0).assertTrue();
        } catch (err) {
          console.log(`${TestTag}, testWindowChangeResizeOptionsMonitor_defaultBundleName_static callback error ,${JSON.stringify(err)}`);
        }
      }
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      try {
        observer.onceWindowChange(WindowChangeType.WINDOW_BOUNDS_CHANGED, {
          timeout: 9000
        }, callback)
      } catch (error) {
        console.log(`${TestTag}, testWindowChangeResizeOptionsMonitor_defaultBundleName_static once error ,${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        let window = await driver.findWindow({bundleName:'com.uitestScene.acts'})
        expect(window != null).assertTrue();
        if (window != null) {
          let wModel: WindowMode = await window.getWindowMode();
          if (wModel != WindowMode.FLOATING) {
            await window.resume();
            await driver.delayMs(1000);
          }
          await window.maximize();
          await driver.delayMs(1000);
        }
      } catch (err) {
        console.log(`${TestTag}, testWindowChangeResizeOptionsMonitor_defaultBundleName_static resize error ,${JSON.stringify(err)}`);
      }
      await driver.delayMs(4000);
      await stopApplication('com.uitestScene.acts');
      console.log(`${TestTag}, testWindowChangeResizeOptionsMonitor_defaultBundleName_static resize error ,${JSON.stringify(isCallBack)}`);
      expect(isCallBack).assertTrue();
      console.log(`${TestTag}, testWindowChangeResizeOptionsMonitor_defaultBundleName_static end`);
    })

    /**
     * @tc.name   testWindowChangeResizeOptionsMonitor_defaultTimeout_static
     * @tc.number uiTest_API22pc_015
     * @tc.desc   monitor window resize.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWindowChangeResizeOptionsMonitor_defaultTimeout_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testWindowChangeResizeOptionsMonitor_defaultTimeout_static start`);
      let observer = driver.createUIEventObserver();
      let isCallBack = false;
      let callback = (elementInfo : UIElementInfo) => {
        console.log(`${TestTag}, testWindowChangeResizeOptionsMonitor_defaultTimeout_static elementInfo,${JSON.stringify(elementInfo)}`);
        isCallBack = true;
        try {
          expect(elementInfo.bundleName == 'com.uitestScene.acts').assertTrue()
          expect(elementInfo.windowChangeType == WindowChangeType.WINDOW_BOUNDS_CHANGED).assertTrue();
          expect(elementInfo.windowId != 0).assertTrue();
        } catch (err) {
          console.log(`${TestTag}, testWindowChangeResizeOptionsMonitor_defaultTimeout_static callback error ,${JSON.stringify(err)}`);
        }
      }
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      try {
        observer.onceWindowChange(WindowChangeType.WINDOW_BOUNDS_CHANGED, {
          bundleName: 'com.uitestScene.acts'
        }, callback)
      } catch (error) {
        console.log(`${TestTag}, testWindowChangeResizeOptionsMonitor_defaultTimeout_static once error ,${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        let window = await driver.findWindow({bundleName:'com.uitestScene.acts'});
        expect(window != null).assertTrue();
        if (window != null) {
          let wModel: WindowMode = await window.getWindowMode();
          if (wModel != WindowMode.FLOATING) {
            await window.resume();
            await driver.delayMs(1000);
          }
          await window.maximize();
          await driver.delayMs(1000);
        }
      } catch (err) {
        console.log(`${TestTag}, testWindowChangeResizeOptionsMonitor_defaultTimeout_static resize error ,${JSON.stringify(err)}`);
      }
      await driver.delayMs(4000);
      await stopApplication('com.uitestScene.acts');
      console.log(`${TestTag}, testWindowChangeResizeOptionsMonitor_defaultTimeout_static resize error ,${JSON.stringify(isCallBack)}`);
      expect(isCallBack).assertTrue();
      console.log(`${TestTag}, testWindowChangeResizeOptionsMonitor_defaultTimeout_static end`);
    })

    /**
     * @tc.name   testWindowChangeResizeOptionsMonitor_defaultOptions_static
     * @tc.number uiTest_API22pc_016
     * @tc.desc   monitor window resize.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWindowChangeResizeOptionsMonitor_defaultOptions_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testWindowChangeResizeOptionsMonitor_defaultOptions_static start`);
      let observer = driver.createUIEventObserver();
      let isCallBack = false;
      let callback = (elementInfo : UIElementInfo) => {
        console.log(`${TestTag}, testWindowChangeResizeOptionsMonitor_defaultOptions_static elementInfo,${JSON.stringify(elementInfo)}`);
        isCallBack = true;
        try {
          expect(elementInfo.bundleName == 'com.uitestScene.acts').assertTrue()
          expect(elementInfo.windowChangeType == WindowChangeType.WINDOW_BOUNDS_CHANGED).assertTrue();
          expect(elementInfo.windowId != 0).assertTrue();
        } catch (err) {
          console.log(`${TestTag}, testWindowChangeResizeOptionsMonitor_defaultOptions_static callback error ,${JSON.stringify(err)}`);
        }
      }
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      try {
        observer.onceWindowChange(WindowChangeType.WINDOW_BOUNDS_CHANGED, {}, callback)
      } catch (error) {
        console.log(`${TestTag}, testWindowChangeResizeOptionsMonitor_defaultOptions_static once error ,${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        let window = await driver.findWindow({bundleName:'com.uitestScene.acts'});
        if (window != null) {
          expect(window != null).assertTrue();
          let wModel: WindowMode = await window.getWindowMode();
          if (wModel != WindowMode.FLOATING) {
            await window.resume();
            await driver.delayMs(1000);
          }
          await window.maximize();
          await driver.delayMs(1000);
        }
      } catch (err) {
        console.log(`${TestTag}, testWindowChangeResizeOptionsMonitor_defaultOptions_static resize error ,${JSON.stringify(err)}`);
      }
      await driver.delayMs(4000);
      await stopApplication('com.uitestScene.acts');
      console.log(`${TestTag}, testWindowChangeResizeOptionsMonitor_defaultOptions_static resize error ,${JSON.stringify(isCallBack)}`);
      expect(isCallBack).assertTrue();
      console.log(`${TestTag}, testWindowChangeResizeOptionsMonitor_defaultOptions_static end`);
    })

    /**
     * @tc.name   testWindowChangeResizeOptionsMonitor_errorBundleName_static
     * @tc.number uiTest_API22pc_017
     * @tc.desc   monitor window resize.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWindowChangeResizeOptionsMonitor_errorBundleName_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testWindowChangeResizeOptionsMonitor_errorBundleName_static start`);
      let observer = driver.createUIEventObserver();
      let isCallBack = false;
      let callback = (elementInfo : UIElementInfo) => {
        console.log(`${TestTag}, testWindowChangeResizeOptionsMonitor_errorBundleName_static elementInfo,${JSON.stringify(elementInfo)}`);
        isCallBack = true;
      }
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      try {
        observer.onceWindowChange(WindowChangeType.WINDOW_BOUNDS_CHANGED, {
          bundleName: 'com.uitestScene.acts1'
        }, callback)
      } catch (error) {
        console.log(`${TestTag}, testWindowChangeResizeOptionsMonitor_errorBundleName_static once error ,${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        let window = await driver.findWindow({bundleName:'com.uitestScene.acts'});
        expect(window != null).assertTrue();
        if (window != null) {
          let wModel: WindowMode = await window.getWindowMode();
          if (wModel != WindowMode.FLOATING) {
            await window.resume();
            await driver.delayMs(1000);
          }
          await window.maximize();
          await driver.delayMs(1000);
        }
      } catch (err) {
        console.log(`${TestTag}, testWindowChangeResizeOptionsMonitor_errorBundleName_static resize error ,${JSON.stringify(err)}`);
      }
      await driver.delayMs(4000);
      await stopApplication('com.uitestScene.acts');
      console.log(`${TestTag}, testWindowChangeResizeOptionsMonitor_errorBundleName_static resize error ,${JSON.stringify(isCallBack)}`);
      expect(isCallBack).assertFalse();
      console.log(`${TestTag}, testWindowChangeResizeOptionsMonitor_errorBundleName_static end`);
    })

    /**
     * @tc.name   testWindowChangeResizeOptionsMonitor_timeout_static
     * @tc.number uiTest_API22pc_018
     * @tc.desc   monitor window resize.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWindowChangeResizeOptionsMonitor_timeout_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, testWindowChangeResizeOptionsMonitor_timeout_static start`);
      let observer = driver.createUIEventObserver();
      let isCallBack = false;
      let callback = (elementInfo : UIElementInfo) => {
        console.log(`${TestTag}, testWindowChangeResizeOptionsMonitor_timeout_static elementInfo,${JSON.stringify(elementInfo)}`);
        isCallBack = true;
      }
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver.delayMs(waitUiReadyMs);
      try {
        observer.onceWindowChange(WindowChangeType.WINDOW_BOUNDS_CHANGED, {
          bundleName: 'com.uitestScene.acts',
          timeout: 2000
        }, callback)
      } catch (error) {
        console.log(`${TestTag}, testWindowChangeResizeOptionsMonitor_timeout_static once error ,${JSON.stringify(error)}`);
        expect().assertFail();
      }
      try {
        await driver.delayMs(4000);
        let window = await driver.findWindow({bundleName:'com.uitestScene.acts'});
        expect(window != null).assertTrue();
        if (window != null) {
          let wModel: WindowMode = await window.getWindowMode();
          if (wModel != WindowMode.FLOATING) {
            await window.resume();
            await driver.delayMs(1000);
          }
          await window.maximize();
          await driver.delayMs(1000);
        }
      } catch (err) {
        console.log(`${TestTag}, testWindowChangeResizeOptionsMonitor_timeout_static resize error ,${JSON.stringify(err)}`);
      }
      await driver.delayMs(4000);
      await stopApplication('com.uitestScene.acts');
      console.log(`${TestTag}, testWindowChangeResizeOptionsMonitor_timeout_static resize error ,${JSON.stringify(isCallBack)}`);
      expect(isCallBack).assertFalse();
      console.log(`${TestTag}, testWindowChangeResizeOptionsMonitor_timeout_static end`);
    })
  })
}
