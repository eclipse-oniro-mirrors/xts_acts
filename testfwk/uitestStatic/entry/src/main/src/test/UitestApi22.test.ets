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
import { Component, Driver, ON, On, MatchPattern, MouseButton, WindowMode, UIElementInfo, UiDirection, PointerMatrix, DisplayRotation,
  ComponentEventType, WindowChangeType, UiWindow, ResizeDirection, Point } from '@kit.TestKit'
import  hilog  from '@ohos.hilog'
import display from '@ohos.display';
import { Utils, startAbility, stopApplication, getInputMethodPermission } from './Util.test';
import { BusinessError } from '@ohos.base';
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'uitestTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
const TestTag = 'uitestTag';
const waitUiReadyMs: int = 1000;

export default function uitestDriverTestApi22() {
  describe('uitestTest_Api22', (): void => {
    let driver: Driver | undefined;
    beforeAll(async () : Promise<void> => {
      hilog.info(domain, tag, "uitestDriverTestApi22 loadup start!!!!!");
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      driver = Driver.create();
      await Utils.msSleep(1000);
      await getInputMethodPermission(driver!);
      await stopApplication('com.uitestScene.acts');
      hilog.info(domain, tag, "uitestDriverTestApi22 loadup over!!!!!")
    })

    beforeEach(async () => {
      await stopApplication('com.uitestScene.acts');
    })

    /**
     * @tc.name testComponentEventOccurOptionsClickMonitor_static
     * @tc.number uitestDriverTest_Api22_001
     * @tc.desc monitor component click.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testComponentEventOccurOptionsClickMonitor_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> =>{
      hilog.info(domain, tag, `testComponentEventOccurOptionsClickMonitor_static start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver!.delayMs(waitUiReadyMs)
      let btn = await driver!.findComponent(ON.isBefore(ON.text('next page')).type('Button'))
      expect(btn != null).assertTrue()
      let observer = driver!.createUIEventObserver();
      let isCallBack = false;
      let callback = (elementInfo : UIElementInfo): void => {
        hilog.info(domain, tag, `testComponentEventOccurOptionsClickMonitor_static elementInfo,${JSON.stringify(elementInfo)}`);
        hilog.info(domain, tag, `testComponentEventOccurOptionsClickMonitor_static elementInfo.bundleName,${elementInfo.bundleName}`);
        hilog.info(domain, tag, `testComponentEventOccurOptionsClickMonitor_static elementInfo.text,${elementInfo.text}`);
        hilog.info(domain, tag, `testComponentEventOccurOptionsClickMonitor_static elementInfo.componentEventType,${elementInfo.componentEventType}`);
        hilog.info(domain, tag, `testComponentEventOccurOptionsClickMonitor_static elementInfo.componentId,${elementInfo.componentId}`);
        isCallBack = true;
        try {
          expect(elementInfo.bundleName == 'com.uitestScene.acts').assertTrue()
          expect(elementInfo.text == 'toast').assertTrue()
          expect(elementInfo.type == 'Button').assertTrue()
          expect(elementInfo.componentEventType == ComponentEventType.COMPONENT_CLICKED).assertTrue();
          expect(elementInfo.componentId).assertEqual('toastBtn');
        } catch (err) {
          hilog.info(domain, tag, `testComponentEventOccurOptionsClickMonitor_static callback error ,${JSON.stringify(err)}`);
        }
      }
      try {
        let on1 = ON.text('toast').type('Button');
        observer.onceComponentEventOccur(ComponentEventType.COMPONENT_CLICKED, {
          timeout: 9000,
          on: on1
        } , callback)
      } catch(error) {
        hilog.info(domain, tag, `testComponentEventOccurOptionsClickMonitor_static onceComponentEventOccur error ,${JSON.stringify(error)}`);
        expect((error as BusinessError).code).assertEqual(17000005);
      }
      if (btn) {
        await btn.click()
        await driver!.delayMs(11000)
      }
      await stopApplication('com.uitestScene.acts');
      expect(isCallBack).assertTrue()
      hilog.info(domain, tag, `testComponentEventOccurOptionsClickMonitor_static end`);
    })

    /**
     * @tc.name testComponentEventOccurOptionsClickMonitor_nullOn_static
     * @tc.number uitestDriverTest_Api22_020
     * @tc.desc monitor component click.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testComponentEventOccurOptionsClickMonitor_nullOn_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> =>{
      hilog.info(domain, tag, `testComponentEventOccurOptionsClickMonitor_nullOn_static start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver!.delayMs(waitUiReadyMs)
      let btn = await driver!.findComponent(ON.isBefore(ON.text('next page')).type('Button'))
      expect(btn != null).assertTrue()
      let observer = driver!.createUIEventObserver();
      let isCallBack = false;
      let callback = (elementInfo : UIElementInfo): void => {
        hilog.info(domain, tag, `testComponentEventOccurOptionsClickMonitor_nullOn_static elementInfo,${JSON.stringify(elementInfo)}`);
        hilog.info(domain, tag, `testComponentEventOccurOptionsClickMonitor_nullOn_static elementInfo.bundleName,${elementInfo.bundleName}`);
        hilog.info(domain, tag, `testComponentEventOccurOptionsClickMonitor_nullOn_static elementInfo.text,${elementInfo.text}`);
        hilog.info(domain, tag, `testComponentEventOccurOptionsClickMonitor_nullOn_static elementInfo.text,${elementInfo.type}`);
        hilog.info(domain, tag, `testComponentEventOccurOptionsClickMonitor_nullOn_static elementInfo.componentEventType,${elementInfo.componentEventType}`);
        hilog.info(domain, tag, `testComponentEventOccurOptionsClickMonitor_nullOn_static elementInfo.componentId,${elementInfo.componentId}`);
        isCallBack = true;
        try {
          expect(elementInfo.bundleName == 'com.uitestScene.acts').assertTrue()
          expect(elementInfo.text == 'toast').assertTrue()
          expect(elementInfo.type == 'Button').assertTrue()
          expect(elementInfo.componentEventType == ComponentEventType.COMPONENT_CLICKED).assertTrue();
          expect(elementInfo.componentId).assertEqual('toastBtn');
        } catch (err) {
          hilog.info(domain, tag, `testComponentEventOccurOptionsClickMonitor_nullOn_static callback error ,${JSON.stringify(err)}`);
        }
      }
      try {
        observer.onceComponentEventOccur(ComponentEventType.COMPONENT_CLICKED, {
          timeout: 9000,
        } , callback)
      } catch(error) {
        hilog.info(domain, tag, `testComponentEventOccurOptionsClickMonitor_nullOn_static onceComponentEventOccur error ,${JSON.stringify(error)}`);
        expect((error as BusinessError).code).assertEqual(17000005);
      }
      if (btn) {
        await btn.click()
        await driver!.delayMs(11000)
      }
      await stopApplication('com.uitestScene.acts');
      hilog.info(domain, tag, `testComponentEventOccurOptionsClickMonitor_nullOn_static isCallBack,${JSON.stringify(isCallBack)}`);
      expect(isCallBack).assertTrue()
      hilog.info(domain, tag, `testComponentEventOccurOptionsClickMonitor_nullOn_static end`);
    })

    /**
     * @tc.name testComponentEventOccurOptionsClickMonitor_nullType_static
     * @tc.number uitestDriverTest_Api22_022
     * @tc.desc monitor component click.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testComponentEventOccurOptionsClickMonitor_nullType_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> =>{
      hilog.info(domain, tag, `testComponentEventOccurOptionsClickMonitor_nullType_static start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver!.delayMs(waitUiReadyMs)
      let btn = await driver!.findComponent(ON.isBefore(ON.text('next page')).type('Button'))
      expect(btn != null).assertTrue()
      let observer = driver!.createUIEventObserver();
      let isCallBack = false;
      let callback = (elementInfo : UIElementInfo): void => {
        hilog.info(domain, tag, `testComponentEventOccurOptionsClickMonitor_nullType_static elementInfo,${JSON.stringify(elementInfo)}`);
        hilog.info(domain, tag, `testComponentEventOccurOptionsClickMonitor_nullType_static elementInfo.bundleName,${elementInfo.bundleName}`);
        hilog.info(domain, tag, `testComponentEventOccurOptionsClickMonitor_nullType_static elementInfo.text,${elementInfo.text}`);
        hilog.info(domain, tag, `testComponentEventOccurOptionsClickMonitor_nullType_static elementInfo.type,${elementInfo.type}`);
        hilog.info(domain, tag, `testComponentEventOccurOptionsClickMonitor_nullType_static elementInfo.componentEventType,${elementInfo.componentEventType}`);
        hilog.info(domain, tag, `testComponentEventOccurOptionsClickMonitor_nullType_static elementInfo.componentId,${elementInfo.componentId}`);
        isCallBack = true;
        try {
          expect(elementInfo.bundleName == 'com.uitestScene.acts').assertTrue()
          expect(elementInfo.text == 'toast').assertTrue()
          expect(elementInfo.type == 'Button').assertTrue()
          expect(elementInfo.componentEventType == ComponentEventType.COMPONENT_CLICKED).assertTrue();
          expect(elementInfo.componentId).assertEqual('toastBtn');
        } catch (err) {
          hilog.info(domain, tag, `testComponentEventOccurOptionsClickMonitor_nullType_static callback error ,${JSON.stringify(err)}`);
        }
      }
      try {
        observer.onceComponentEventOccur(ComponentEventType.COMPONENT_CLICKED, { } , callback)
      } catch(error) {
        hilog.info(domain, tag, `testComponentEventOccurOptionsClickMonitor_nullType_static onceComponentEventOccur error ,${JSON.stringify(error)}`);
        expect((error as BusinessError).code).assertEqual(17000005);
      }
      if (btn) {
        await btn.click()
        await driver!.delayMs(11000)
      }
      await stopApplication('com.uitestScene.acts');
      hilog.info(domain, tag, `testComponentEventOccurOptionsClickMonitor_nullType_static isCallBack,${JSON.stringify(isCallBack)}`);
      expect(isCallBack).assertTrue()
      hilog.info(domain, tag, `testComponentEventOccurOptionsClickMonitor_nullType_static end`);
    })

    /**
     * @tc.name testComponentEventOccurOptionsClickMonitor_notOn_static
     * @tc.number uitestDriverTest_Api22_0011
     * @tc.desc monitor component click.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testComponentEventOccurOptionsClickMonitor_notOn_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> =>{
      hilog.info(domain, tag, `testComponentEventOccurOptionsClickMonitor_notOn_static start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver!.delayMs(waitUiReadyMs)
      let btn = await driver!.findComponent(ON.isBefore(ON.text('next page')).type('Button'))
      expect(btn != null).assertTrue()
      let observer = driver!.createUIEventObserver();
      let isCallBack = false;
      let callback = (elementInfo : UIElementInfo): void => {
        hilog.info(domain, tag, `testComponentEventOccurOptionsClickMonitor_notOn_static elementInfo,${JSON.stringify(elementInfo)}`);
        isCallBack = true;
      }
      try {
        let on1 = ON.text('NotToast').type('Button');
        observer.onceComponentEventOccur(ComponentEventType.COMPONENT_CLICKED, {
          timeout: 9000,
          on: on1
        } , callback)
      } catch(error) {
        hilog.info(domain, tag, `testComponentEventOccurOptionsClickMonitor_notOn_static onceComponentEventOccur error ,${JSON.stringify(error)}`);
        expect((error as BusinessError).code).assertEqual(17000005);
      }
      if (btn) {
        await btn.click()
        await driver!.delayMs(11000)
      }
      await stopApplication('com.uitestScene.acts');
      hilog.info(domain, tag, `testComponentEventOccurOptionsClickMonitor_notOn_static isCallBack ,${JSON.stringify(isCallBack)}`);
      expect(isCallBack).assertFalse()
      hilog.info(domain, tag, `testComponentEventOccurOptionsClickMonitor_notOn_static end`);
    })

    /**
     * @tc.name testComponentEventOccurOptionsLongClickMonitor_static
     * @tc.number uitestDriverTest_Api22_002
     * @tc.desc monitor component LongClick.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testComponentEventOccurOptionsLongClickMonitor_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> =>{
      hilog.info(domain, tag, `testComponentEventOccurOptionsLongClickMonitor_static start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver!.delayMs(waitUiReadyMs);
      let btn = await driver!.findComponent(ON.text('next page'));
      expect(btn != null).assertTrue()
      let observer = driver!.createUIEventObserver();
      let isCallBack = false;
      let callback = (elementInfo : UIElementInfo): void => {
        hilog.info(domain, tag, `testComponentEventOccurOptionsLongClickMonitor_static elementInfo,${JSON.stringify(elementInfo)}`);
        hilog.info(domain, tag, `testComponentEventOccurOptionsLongClickMonitor_static elementInfo.bundleName,${elementInfo.bundleName}`);
        hilog.info(domain, tag, `testComponentEventOccurOptionsLongClickMonitor_static elementInfo.text,${elementInfo.text}`);
        hilog.info(domain, tag, `testComponentEventOccurOptionsLongClickMonitor_static elementInfo.type,${elementInfo.type}`);
        hilog.info(domain, tag, `testComponentEventOccurOptionsLongClickMonitor_static elementInfo.componentEventType,${elementInfo.componentEventType}`);
        hilog.info(domain, tag, `testComponentEventOccurOptionsLongClickMonitor_static elementInfo.componentId,${elementInfo.componentId}`);
        isCallBack = true;
        try {
          expect(elementInfo.bundleName == 'com.uitestScene.acts').assertTrue();
          expect(elementInfo.text == '').assertTrue();
          expect(elementInfo.type == 'Button').assertTrue();
          expect(elementInfo.componentEventType == ComponentEventType.COMPONENT_LONG_CLICKED).assertTrue();
          expect(elementInfo.componentId).assertEqual('my-key');
        } catch (err) {
          hilog.info(domain, tag, `testComponentEventOccurOptionsLongClickMonitor_static callback,${JSON.stringify(err)}`);
        }
      }
      try {
        observer.onceComponentEventOccur(ComponentEventType.COMPONENT_LONG_CLICKED,{
          on: ON.type('Button').text('')
        }, callback);
      } catch(error) {
        hilog.info(domain, tag, `testComponentEventOccurOptionsLongClickMonitor_static onceComponentEventOccur,${JSON.stringify(error)}`);
        expect((error as BusinessError).code).assertEqual(17000005);
      }
      if (btn) {
        await btn.longClick();
        await driver!.delayMs(5000);
      }
      await stopApplication('com.uitestScene.acts');
      hilog.info(domain, tag, `testComponentEventOccurOptionsLongClickMonitor_static isCallBack,${JSON.stringify(isCallBack)}`);
      expect(isCallBack).assertTrue()
      hilog.info(domain, tag, `testComponentEventOccurOptionsLongClickMonitor_static end`);
    })

    /**
     * @tc.name testComponentEventOccurOptionsLongClickMonitor_nullOn_static
     * @tc.number uitestDriverTest_Api22_023
     * @tc.desc monitor component LongClick.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testComponentEventOccurOptionsLongClickMonitor_nullOn_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> =>{
      hilog.info(domain, tag, `testComponentEventOccurOptionsLongClickMonitor_nullOn_static start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver!.delayMs(waitUiReadyMs);
      let btn = await driver!.findComponent(ON.text('next page'));
      expect(btn != null).assertTrue()
      let observer = driver!.createUIEventObserver();
      let isCallBack = false;
      let callback = (elementInfo : UIElementInfo): void => {
        hilog.info(domain, tag, `testComponentEventOccurOptionsLongClickMonitor_nullOn_static elementInfo,${JSON.stringify(elementInfo)}`);
        hilog.info(domain, tag, `testComponentEventOccurOptionsLongClickMonitor_nullOn_static elementInfo.bundleName,${elementInfo.bundleName}`);
        hilog.info(domain, tag, `testComponentEventOccurOptionsLongClickMonitor_nullOn_static elementInfo.text,${elementInfo.text}`);
        hilog.info(domain, tag, `testComponentEventOccurOptionsLongClickMonitor_nullOn_static elementInfo.type,${elementInfo.type}`);
        hilog.info(domain, tag, `testComponentEventOccurOptionsLongClickMonitor_nullOn_static elementInfo.componentEventType,${elementInfo.componentEventType}`);
        hilog.info(domain, tag, `testComponentEventOccurOptionsLongClickMonitor_nullOn_static elementInfo.componentId,${elementInfo.componentId}`);
        isCallBack = true;
        try {
          expect(elementInfo.bundleName == 'com.uitestScene.acts').assertTrue();
          expect(elementInfo.text == '').assertTrue();
          expect(elementInfo.type == 'Button').assertTrue();
          expect(elementInfo.componentEventType == ComponentEventType.COMPONENT_LONG_CLICKED).assertTrue();
          expect(elementInfo.componentId).assertEqual('my-key');
        } catch (err) {
          hilog.info(domain, tag, `testComponentEventOccurOptionsLongClickMonitor_nullOn_static callback,${JSON.stringify(err)}`);
        }
      }
      try {
        observer.onceComponentEventOccur(ComponentEventType.COMPONENT_LONG_CLICKED,{
          timeout: 9000
        }, callback);
      } catch(error) {
        hilog.info(domain, tag, `testComponentEventOccurOptionsLongClickMonitor_nullOn_static onceComponentEventOccur,${JSON.stringify(error)}`);
        expect((error as BusinessError).code).assertEqual(17000005);
      }
      if (btn) {
        await btn.longClick();
        await driver!.delayMs(5000);
      }
      await stopApplication('com.uitestScene.acts');
      hilog.info(domain, tag, `testComponentEventOccurOptionsLongClickMonitor_nullOn_static isCallBack,${JSON.stringify(isCallBack)}`);
      expect(isCallBack).assertTrue()
      hilog.info(domain, tag, `testComponentEventOccurOptionsLongClickMonitor_nullOn_static end`);
    })

    /**
     * @tc.name testComponentEventOccurOptionsLongClickMonitor_nullType_static
     * @tc.number uitestDriverTest_Api22_024
     * @tc.desc monitor component LongClick.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testComponentEventOccurOptionsLongClickMonitor_nullType_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> =>{
      hilog.info(domain, tag, `testComponentEventOccurOptionsLongClickMonitor_nullType_static start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver!.delayMs(waitUiReadyMs);
      let btn = await driver!.findComponent(ON.text('next page'));
      expect(btn != null).assertTrue()
      let observer = driver!.createUIEventObserver();
      let isCallBack = false;
      let callback = (elementInfo : UIElementInfo): void => {
        hilog.info(domain, tag, `testComponentEventOccurOptionsLongClickMonitor_nullType_static elementInfo,${JSON.stringify(elementInfo)}`);
        hilog.info(domain, tag, `testComponentEventOccurOptionsLongClickMonitor_nullType_static elementInfo.bundleName,${elementInfo.bundleName}`);
        hilog.info(domain, tag, `testComponentEventOccurOptionsLongClickMonitor_nullType_static elementInfo.text,${elementInfo.text}`);
        hilog.info(domain, tag, `testComponentEventOccurOptionsLongClickMonitor_nullType_static elementInfo.type,${elementInfo.type}`);
        hilog.info(domain, tag, `testComponentEventOccurOptionsLongClickMonitor_nullType_static elementInfo.componentEventType,${elementInfo.componentEventType}`);
        hilog.info(domain, tag, `testComponentEventOccurOptionsLongClickMonitor_nullType_static elementInfo.componentId,${elementInfo.componentId}`);
        isCallBack = true;
        try {
          expect(elementInfo.bundleName == 'com.uitestScene.acts').assertTrue();
          expect(elementInfo.text == '').assertTrue();
          expect(elementInfo.type == 'Button').assertTrue();
          expect(elementInfo.componentEventType == ComponentEventType.COMPONENT_LONG_CLICKED).assertTrue();
          expect(elementInfo.componentId).assertEqual('my-key');
        } catch (err) {
          hilog.info(domain, tag, `testComponentEventOccurOptionsLongClickMonitor_nullType_static callback,${JSON.stringify(err)}`);
        }
      }
      try {
        observer.onceComponentEventOccur(ComponentEventType.COMPONENT_LONG_CLICKED, {}, callback);
      } catch(error) {
        hilog.info(domain, tag, `testComponentEventOccurOptionsLongClickMonitor_nullType_static onceComponentEventOccur,${JSON.stringify(error)}`);
        expect((error as BusinessError).code).assertEqual(17000005);
      }
      if (btn) {
        await btn.longClick();
        await driver!.delayMs(5000);
      }
      await stopApplication('com.uitestScene.acts');
      hilog.info(domain, tag, `testComponentEventOccurOptionsLongClickMonitor_nullType_static isCallBack,${JSON.stringify(isCallBack)}`);
      expect(isCallBack).assertTrue()
      hilog.info(domain, tag, `testComponentEventOccurOptionsLongClickMonitor_nullType_static end`);
    })

    /**
     * @tc.name testComponentEventOccurOptionsLongClickMonitor_notOn_static
     * @tc.number uitestDriverTest_Api22_0021
     * @tc.desc monitor component LongClick.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testComponentEventOccurOptionsLongClickMonitor_notOn_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> =>{
      hilog.info(domain, tag, `testComponentEventOccurOptionsLongClickMonitor_notOn_static start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver!.delayMs(waitUiReadyMs);
      let btn = await driver!.findComponent(ON.text('next page'));
      expect(btn != null).assertTrue()
      let observer = driver!.createUIEventObserver();
      let isCallBack = false;
      let callback = (elementInfo : UIElementInfo): void => {
        hilog.info(domain, tag, `testComponentEventOccurOptionsLongClickMonitor_notOn_static elementInfo,${JSON.stringify(elementInfo)}`);
        isCallBack = true;
      }
      try {
        observer.onceComponentEventOccur(ComponentEventType.COMPONENT_LONG_CLICKED, {
          on: ON.type('Button').text('toast')
        }, callback);
      } catch(error) {
        hilog.info(domain, tag, `testComponentEventOccurOptionsLongClickMonitor_notOn_static onceComponentEventOccur,${JSON.stringify(error)}`);
        expect((error as BusinessError).code).assertEqual(17000005);
      }
      if (btn) {
        await btn.longClick();
        await driver!.delayMs(5000);
      }
      await stopApplication('com.uitestScene.acts');
      hilog.info(domain, tag, `testComponentEventOccurOptionsLongClickMonitor_notOn_static isCallBack,${JSON.stringify(isCallBack)}`);
      expect(isCallBack).assertFalse()
      hilog.info(domain, tag, `testComponentEventOccurOptionsLongClickMonitor_notOn_static end`);
    })

    /**
     * @tc.name testComponentEventOccurOptionsScrollStartMonitor_static
     * @tc.number uitestDriverTest_Api22_004
     * @tc.desc monitor component Scroll start.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testComponentEventOccurOptionsScrollStartMonitor_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> =>{
      hilog.info(domain, tag, `testComponentEventOccurOptionsScrollStartMonitor_static start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver!.delayMs(waitUiReadyMs);
      let scrollBar = await driver!.findComponent(ON.type('Scroll').id('parentScroll'));
      expect(scrollBar != null).assertTrue();
      let observer = driver!.createUIEventObserver();
      let isCallBack = false;
      let callback = async (elementInfo : UIElementInfo): void => {
        hilog.info(domain, tag, `testComponentEventOccurOptionsScrollStartMonitor_static elementInfo,${JSON.stringify(elementInfo)}`);
        hilog.info(domain, tag, `testComponentEventOccurOptionsScrollStartMonitor_static elementInfo.bundleName,${elementInfo.bundleName}`);
        hilog.info(domain, tag, `testComponentEventOccurOptionsScrollStartMonitor_static elementInfo.text,${elementInfo.text}`);
        hilog.info(domain, tag, `testComponentEventOccurOptionsScrollStartMonitor_static elementInfo.type,${elementInfo.type}`);
        hilog.info(domain, tag, `testComponentEventOccurOptionsScrollStartMonitor_static elementInfo.componentEventType,${elementInfo.componentEventType}`);
        hilog.info(domain, tag, `testComponentEventOccurOptionsScrollStartMonitor_static elementInfo.componentId,${elementInfo.componentId}`);
        hilog.info(domain, tag, `testComponentEventOccurOptionsScrollStartMonitor_static elementInfo.componentRect,${elementInfo.componentRect}`);
        isCallBack = true;
        try {
          expect(elementInfo.bundleName == 'com.uitestScene.acts').assertTrue();
          expect(elementInfo.text == '').assertTrue();
          expect(elementInfo.type == 'Scroll').assertTrue();
          expect(elementInfo.componentEventType == ComponentEventType.COMPONENT_SCROLL_START).assertTrue();
          expect(elementInfo.componentId == 'parentScroll').assertTrue();
          expect(elementInfo.componentRect != null).assertTrue();
        } catch (err) {
          hilog.info(domain, tag, `testComponentEventOccurOptionsScrollStartMonitor_static error, ${JSON.stringify(err)}`);
        }
      }
      try {
        observer.onceComponentEventOccur(ComponentEventType.COMPONENT_SCROLL_START, {
          on: ON.type('Scroll').id('parentScroll')
        }, callback);
      } catch(error) {
        hilog.info(domain, tag, `testComponentEventOccurOptionsScrollStartMonitor_static onceComponentEventOccur,${JSON.stringify(error)}`);
        expect((error as BusinessError).code).assertEqual(17000005);
      }
      if(scrollBar) {
        let rect = await scrollBar.getBounds();
        let center = await scrollBar.getBoundsCenter();
        await driver!.swipeBetween({x: center.x, y: Math.floor(center.y + (rect.bottom - rect.top) / 4).toInt()},
          {x: center.x, y: Math.floor(center.y - (rect.bottom - rect.top) / 4).toInt()});
        await driver!.delayMs(5000);
      }
      await stopApplication('com.uitestScene.acts');
      expect(isCallBack).assertTrue();
      hilog.info(domain, tag, `testComponentEventOccurOptionsScrollStartMonitor_static end`);
    })

    /**
     * @tc.name testComponentEventOccurOptionsScrollStartMonitor_nullNo_static
     * @tc.number uitestDriverTest_Api22_025
     * @tc.desc monitor component Scroll start.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testComponentEventOccurOptionsScrollStartMonitor_nullNo_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> =>{
      hilog.info(domain, tag, `testComponentEventOccurOptionsScrollStartMonitor_nullNo_static start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver!.delayMs(waitUiReadyMs);
      let scrollBar = await driver!.findComponent(ON.type('Scroll').id('parentScroll'));
      expect(scrollBar != null).assertTrue();
      let observer = driver!.createUIEventObserver();
      let isCallBack = false;
      let callback = async (elementInfo : UIElementInfo): void => {
        hilog.info(domain, tag, `testComponentEventOccurOptionsScrollStartMonitor_nullNo_static elementInfo,${JSON.stringify(elementInfo)}`);
        hilog.info(domain, tag, `testComponentEventOccurOptionsScrollStartMonitor_nullNo_static elementInfo.bundleName,${elementInfo.bundleName}`);
        hilog.info(domain, tag, `testComponentEventOccurOptionsScrollStartMonitor_nullNo_static elementInfo.text,${elementInfo.text}`);
        hilog.info(domain, tag, `testComponentEventOccurOptionsScrollStartMonitor_nullNo_static elementInfo.type,${elementInfo.type}`);
        hilog.info(domain, tag, `testComponentEventOccurOptionsScrollStartMonitor_nullNo_static elementInfo.componentEventType,${elementInfo.componentEventType}`);
        hilog.info(domain, tag, `testComponentEventOccurOptionsScrollStartMonitor_nullNo_static elementInfo.componentId,${elementInfo.componentId}`);
        hilog.info(domain, tag, `testComponentEventOccurOptionsScrollStartMonitor_nullNo_static elementInfo.componentRect,${elementInfo.componentRect}`);
        isCallBack = true;
        try {
          expect(elementInfo.bundleName == 'com.uitestScene.acts').assertTrue();
          expect(elementInfo.text == '').assertTrue();
          expect(elementInfo.type == 'Scroll').assertTrue();
          expect(elementInfo.componentEventType == ComponentEventType.COMPONENT_SCROLL_START).assertTrue();
          expect(elementInfo.componentId == 'parentScroll').assertTrue();
          expect(elementInfo.componentRect != null).assertTrue();
        } catch (err) {
          hilog.info(domain, tag, `testComponentEventOccurOptionsScrollStartMonitor_nullNo_static error, ${JSON.stringify(err)}`);
        }
      }
      try {
        observer.onceComponentEventOccur(ComponentEventType.COMPONENT_SCROLL_START, {
          timeout: 6000
        }, callback);
      } catch(error) {
        hilog.info(domain, tag, `testComponentEventOccurOptionsScrollStartMonitor_nullNo_static onceComponentEventOccur,${JSON.stringify(error)}`);
        expect((error as BusinessError).code).assertEqual(17000005);
      }
      if(scrollBar) {
        let rect = await scrollBar.getBounds();
        let center = await scrollBar.getBoundsCenter();
        await driver!.swipeBetween({x: center.x, y: Math.floor(center.y + (rect.bottom - rect.top) / 4).toInt()},
          {x: center.x, y: Math.floor(center.y - (rect.bottom - rect.top) / 4).toInt()});
        await driver!.delayMs(5000);
      }
      await stopApplication('com.uitestScene.acts');
      hilog.info(domain, tag, `testComponentEventOccurOptionsScrollStartMonitor_nullNo_static isCallBack,${JSON.stringify(isCallBack)}`);
      expect(isCallBack).assertTrue();
      hilog.info(domain, tag, `testComponentEventOccurOptionsScrollStartMonitor_nullNo_static end`);
    })

    /**
     * @tc.name testComponentEventOccurOptionsScrollStartMonitor_nullType_static
     * @tc.number uitestDriverTest_Api22_026
     * @tc.desc monitor component Scroll start.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testComponentEventOccurOptionsScrollStartMonitor_nullType_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> =>{
      hilog.info(domain, tag, `testComponentEventOccurOptionsScrollStartMonitor_nullType_static start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver!.delayMs(waitUiReadyMs);
      let scrollBar = await driver!.findComponent(ON.type('Scroll').id('parentScroll'));
      expect(scrollBar != null).assertTrue();
      let observer = driver!.createUIEventObserver();
      let isCallBack = false;
      let callback = async (elementInfo : UIElementInfo): void => {
        hilog.info(domain, tag, `testComponentEventOccurOptionsScrollStartMonitor_nullType_static elementInfo,${JSON.stringify(elementInfo)}`);
        hilog.info(domain, tag, `testComponentEventOccurOptionsScrollStartMonitor_nullType_static elementInfo.bundleName,${elementInfo.bundleName}`);
        hilog.info(domain, tag, `testComponentEventOccurOptionsScrollStartMonitor_nullType_static elementInfo.text,${elementInfo.text}`);
        hilog.info(domain, tag, `testComponentEventOccurOptionsScrollStartMonitor_nullType_static elementInfo.type,${elementInfo.type}`);
        hilog.info(domain, tag, `testComponentEventOccurOptionsScrollStartMonitor_nullType_static elementInfo.componentEventType,${elementInfo.componentEventType}`);
        hilog.info(domain, tag, `testComponentEventOccurOptionsScrollStartMonitor_nullType_static elementInfo.componentId,${elementInfo.componentId}`);
        hilog.info(domain, tag, `testComponentEventOccurOptionsScrollStartMonitor_nullType_static elementInfo.componentRect,${elementInfo.componentRect}`);
        isCallBack = true;
        try {
          expect(elementInfo.bundleName == 'com.uitestScene.acts').assertTrue();
          expect(elementInfo.text == '').assertTrue();
          expect(elementInfo.type == 'Scroll').assertTrue();
          expect(elementInfo.componentEventType == ComponentEventType.COMPONENT_SCROLL_START).assertTrue();
          expect(elementInfo.componentId == 'parentScroll').assertTrue();
          expect(elementInfo.componentRect != null).assertTrue();
        } catch (err) {
          hilog.info(domain, tag, `testComponentEventOccurOptionsScrollStartMonitor_nullType_static error, ${JSON.stringify(err)}`);
        }
      }
      try {
        observer.onceComponentEventOccur(ComponentEventType.COMPONENT_SCROLL_START, {}, callback);
      } catch(error) {
        hilog.info(domain, tag, `testComponentEventOccurOptionsScrollStartMonitor_nullType_static onceComponentEventOccur,${JSON.stringify(error)}`);
        expect((error as BusinessError).code).assertEqual(17000005);
      }
      if(scrollBar) {
        let rect = await scrollBar.getBounds();
        let center = await scrollBar.getBoundsCenter();
        await driver!.swipeBetween({x: center.x, y: Math.floor(center.y + (rect.bottom - rect.top) / 4).toInt()},
          {x: center.x, y: Math.floor(center.y - (rect.bottom - rect.top) / 4).toInt()});
        await driver!.delayMs(5000);
      }
      await stopApplication('com.uitestScene.acts');
      hilog.info(domain, tag, `testComponentEventOccurOptionsScrollStartMonitor_nullType_static isCallBack,${JSON.stringify(isCallBack)}`);
      expect(isCallBack).assertTrue();
      hilog.info(domain, tag, `testComponentEventOccurOptionsScrollStartMonitor_nullType_static end`);
    })

    /**
     * @tc.name testComponentEventOccurOptionsScrollStartMonitor_notOn_static
     * @tc.number uitestDriverTest_Api22_0041
     * @tc.desc monitor component Scroll start.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testComponentEventOccurOptionsScrollStartMonitor_notOn_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> =>{
      hilog.info(domain, tag, `testComponentEventOccurOptionsScrollStartMonitor_notOn_static start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver!.delayMs(waitUiReadyMs);
      let scrollBar = await driver!.findComponent(ON.type('Scroll').id('parentScroll'));
      expect(scrollBar != null).assertTrue();
      let observer = driver!.createUIEventObserver();
      let isCallBack = false;
      let callback = async (elementInfo : UIElementInfo): void => {
        hilog.info(domain, tag, `testComponentEventOccurOptionsScrollStartMonitor_notOn_static elementInfo,${JSON.stringify(elementInfo)}`);
        isCallBack = true;
      }
      try {
        observer.onceComponentEventOccur(ComponentEventType.COMPONENT_SCROLL_START, {
          on: ON.type('Scroll').id('NotParentScroll')
        }, callback);
      } catch(error) {
        hilog.info(domain, tag, `testComponentEventOccurOptionsScrollStartMonitor_notOn_static onceComponentEventOccur,${JSON.stringify(error)}`);
        expect((error as BusinessError).code).assertEqual(17000005);
      }
      if(scrollBar) {
        let rect = await scrollBar.getBounds();
        let center = await scrollBar.getBoundsCenter();
        await driver!.swipeBetween({x: center.x, y: Math.floor(center.y + (rect.bottom - rect.top) / 4).toInt()},
          {x: center.x, y: Math.floor(center.y - (rect.bottom - rect.top) / 4).toInt()});
        await driver!.delayMs(5000);
      }
      await stopApplication('com.uitestScene.acts');
      expect(isCallBack).assertFalse();
      hilog.info(domain, tag, `testComponentEventOccurOptionsScrollStartMonitor_notOn_static end`);
    })

    /**
     * @tc.name testComponentEventOccurOptionsScrollEndMonitor_static
     * @tc.number uitestDriverTest_Api22_005
     * @tc.desc monitor component Scroll end.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testComponentEventOccurOptionsScrollEndMonitor_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> =>{
      hilog.info(domain, tag, `testComponentEventOccurOptionsScrollEndMonitor_static start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver!.delayMs(waitUiReadyMs);
      let scrollBar = await driver!.findComponent(ON.type('Scroll').id('parentScroll'));
      expect(scrollBar != null).assertTrue();
      let observer = driver!.createUIEventObserver();
      let isCallBack = false;
      let callback = async (elementInfo : UIElementInfo): void => {
        hilog.info(domain, tag, `testComponentEventOccurOptionsScrollEndMonitor_static elementInfo,${JSON.stringify(elementInfo)}`);
        hilog.info(domain, tag, `testComponentEventOccurOptionsScrollEndMonitor_static elementInfo.bundleName,${elementInfo.bundleName}`);
        hilog.info(domain, tag, `testComponentEventOccurOptionsScrollEndMonitor_static elementInfo.text,${elementInfo.text}`);
        hilog.info(domain, tag, `testComponentEventOccurOptionsScrollEndMonitor_static elementInfo.type,${elementInfo.type}`);
        hilog.info(domain, tag, `testComponentEventOccurOptionsScrollEndMonitor_static elementInfo.componentEventType,${elementInfo.componentEventType}`);
        hilog.info(domain, tag, `testComponentEventOccurOptionsScrollEndMonitor_static elementInfo.componentId,${elementInfo.componentId}`);
        hilog.info(domain, tag, `testComponentEventOccurOptionsScrollEndMonitor_static elementInfo.componentRect,${elementInfo.componentRect}`);
        isCallBack = true;
        try {
          expect(elementInfo.bundleName == 'com.uitestScene.acts').assertTrue()
          expect(elementInfo.text == '').assertTrue()
          expect(elementInfo.type == 'Scroll').assertTrue()
          expect(elementInfo.componentEventType == ComponentEventType.COMPONENT_SCROLL_END).assertTrue();
          expect(elementInfo.componentId == 'parentScroll').assertTrue();
          expect(elementInfo.componentRect != null).assertTrue();
        } catch (err) {
          hilog.info(domain, tag, `testComponentEventOccurOptionsScrollEndMonitor_static callback error, ${JSON.stringify(err)}`);
        }
      }
      try {
        observer.onceComponentEventOccur(ComponentEventType.COMPONENT_SCROLL_END,{
          timeout: 15000,
          on: ON.type('Scroll').id('parentScroll')
        }, callback);
      } catch(error) {
        hilog.info(domain, tag, `testComponentEventOccurOptionsScrollEndMonitor_static onceComponentEventOccur,${JSON.stringify(error)}`);
        expect((error as BusinessError).code).assertEqual(17000005);
      }
      if (scrollBar) {
        let rect = await scrollBar.getBounds();
        let center = await scrollBar.getBoundsCenter();
        await driver!.swipeBetween({x: center.x, y: Math.floor(center.y + (rect.bottom - rect.top) / 4).toInt()},
          {x: center.x, y: Math.floor(center.y - (rect.bottom - rect.top) / 4).toInt()}, 8000);
        await driver!.delayMs(10000);
      }
      await stopApplication('com.uitestScene.acts');
      expect(isCallBack).assertTrue();
      hilog.info(domain, tag, `testComponentEventOccurOptionsScrollEndMonitor_static end`);
    })

    /**
     * @tc.name testComponentEventOccurOptionsScrollEndMonitor_nullOn_static
     * @tc.number uitestDriverTest_Api22_027
     * @tc.desc monitor component Scroll end.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testComponentEventOccurOptionsScrollEndMonitor_nullOn_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> =>{
      hilog.info(domain, tag, `testComponentEventOccurOptionsScrollEndMonitor_nullOn_static start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver!.delayMs(waitUiReadyMs);
      let scrollBar = await driver!.findComponent(ON.type('Scroll').id('parentScroll'));
      expect(scrollBar != null).assertTrue();
      let observer = driver!.createUIEventObserver();
      let isCallBack = false;
      let callback = async (elementInfo : UIElementInfo): void => {
        hilog.info(domain, tag, `testComponentEventOccurOptionsScrollEndMonitor_nullOn_static elementInfo,${JSON.stringify(elementInfo)}`);
        hilog.info(domain, tag, `testComponentEventOccurOptionsScrollEndMonitor_nullOn_static elementInfo.bundleName,${elementInfo.bundleName}`);
        hilog.info(domain, tag, `testComponentEventOccurOptionsScrollEndMonitor_nullOn_static elementInfo.text,${elementInfo.text}`);
        hilog.info(domain, tag, `testComponentEventOccurOptionsScrollEndMonitor_nullOn_static elementInfo.type,${elementInfo.type}`);
        hilog.info(domain, tag, `testComponentEventOccurOptionsScrollEndMonitor_nullOn_static elementInfo.componentEventType,${elementInfo.componentEventType}`);
        hilog.info(domain, tag, `testComponentEventOccurOptionsScrollEndMonitor_nullOn_static elementInfo.componentId,${elementInfo.componentId}`);
        hilog.info(domain, tag, `testComponentEventOccurOptionsScrollEndMonitor_nullOn_static elementInfo.componentRect,${elementInfo.componentRect}`);
        isCallBack = true;
        try {
          expect(elementInfo.bundleName == 'com.uitestScene.acts').assertTrue()
          expect(elementInfo.text == '').assertTrue()
          expect(elementInfo.type == 'Scroll').assertTrue()
          expect(elementInfo.componentEventType == ComponentEventType.COMPONENT_SCROLL_END).assertTrue();
          expect(elementInfo.componentId == 'parentScroll').assertTrue();
          expect(elementInfo.componentRect != null).assertTrue();
        } catch (err) {
          hilog.info(domain, tag, `testComponentEventOccurOptionsScrollEndMonitor_nullOn_static callback error, ${JSON.stringify(err)}`);
        }
      }
      try {
        observer.onceComponentEventOccur(ComponentEventType.COMPONENT_SCROLL_END, {
          timeout: 15000,
        }, callback);
      } catch(error) {
        hilog.info(domain, tag, `testComponentEventOccurOptionsScrollEndMonitor_nullOn_static onceComponentEventOccur,${JSON.stringify(error)}`);
        expect((error as BusinessError).code).assertEqual(17000005);
      }
      if (scrollBar) {
        let rect = await scrollBar.getBounds();
        let center = await scrollBar.getBoundsCenter();
        await driver!.swipeBetween({x: center.x, y: Math.floor(center.y + (rect.bottom - rect.top) / 4).toInt()},
          {x: center.x, y: Math.floor(center.y - (rect.bottom - rect.top) / 4).toInt()}, 8000);
        await driver!.delayMs(10000);
      }
      await stopApplication('com.uitestScene.acts');
      hilog.info(domain, tag, `testComponentEventOccurOptionsScrollEndMonitor_nullOn_static isCallBack,${JSON.stringify(isCallBack)}`);
      expect(isCallBack).assertTrue();
      hilog.info(domain, tag, `testComponentEventOccurOptionsScrollEndMonitor_nullOn_static end`);
    })

    /**
     * @tc.name testComponentEventOccurOptionsScrollEndMonitor_nullType_static
     * @tc.number uitestDriverTest_Api22_028
     * @tc.desc monitor component Scroll end.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testComponentEventOccurOptionsScrollEndMonitor_nullType_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> =>{
      hilog.info(domain, tag, `testComponentEventOccurOptionsScrollEndMonitor_nullType_static start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver!.delayMs(waitUiReadyMs);
      let scrollBar = await driver!.findComponent(ON.type('Scroll').id('parentScroll'));
      expect(scrollBar != null).assertTrue();
      let observer = driver!.createUIEventObserver();
      let isCallBack = false;
      let callback = async (elementInfo : UIElementInfo): void => {
        hilog.info(domain, tag, `testComponentEventOccurOptionsScrollEndMonitor_nullType_static elementInfo,${JSON.stringify(elementInfo)}`);
        hilog.info(domain, tag, `testComponentEventOccurOptionsScrollEndMonitor_nullType_static elementInfo.bundleName,${elementInfo.bundleName}`);
        hilog.info(domain, tag, `testComponentEventOccurOptionsScrollEndMonitor_nullType_static elementInfo.text,${elementInfo.text}`);
        hilog.info(domain, tag, `testComponentEventOccurOptionsScrollEndMonitor_nullType_static elementInfo.type,${elementInfo.type}`);
        hilog.info(domain, tag, `testComponentEventOccurOptionsScrollEndMonitor_nullType_static elementInfo.componentEventType,${elementInfo.componentEventType}`);
        hilog.info(domain, tag, `testComponentEventOccurOptionsScrollEndMonitor_nullType_static elementInfo.componentId,${elementInfo.componentId}`);
        hilog.info(domain, tag, `testComponentEventOccurOptionsScrollEndMonitor_nullType_static elementInfo.componentRect,${elementInfo.componentRect}`);
        isCallBack = true;
        try {
          expect(elementInfo.bundleName == 'com.uitestScene.acts').assertTrue()
          expect(elementInfo.text == '').assertTrue()
          expect(elementInfo.type == 'Scroll').assertTrue()
          expect(elementInfo.componentEventType == ComponentEventType.COMPONENT_SCROLL_END).assertTrue();
          expect(elementInfo.componentId == 'parentScroll').assertTrue();
          expect(elementInfo.componentRect != null).assertTrue();
        } catch (err) {
          hilog.info(domain, tag, `testComponentEventOccurOptionsScrollEndMonitor_nullType_static callback error, ${JSON.stringify(err)}`);
        }
      }
      try {
        observer.onceComponentEventOccur(ComponentEventType.COMPONENT_SCROLL_END, {}, callback);
      } catch(error) {
        hilog.info(domain, tag, `testComponentEventOccurOptionsScrollEndMonitor_nullType_static onceComponentEventOccur,${JSON.stringify(error)}`);
        expect((error as BusinessError).code).assertEqual(17000005);
      }
      if (scrollBar) {
        let rect = await scrollBar.getBounds();
        let center = await scrollBar.getBoundsCenter();
        await driver!.swipeBetween({x: center.x, y: Math.floor(center.y + (rect.bottom - rect.top) / 4).toInt()},
          {x: center.x, y: Math.floor(center.y - (rect.bottom - rect.top) / 4).toInt()}, 8000);
        await driver!.delayMs(10000);
      }
      await stopApplication('com.uitestScene.acts');
      hilog.info(domain, tag, `testComponentEventOccurOptionsScrollEndMonitor_nullType_static isCallBack,${JSON.stringify(isCallBack)}`);
      expect(isCallBack).assertTrue();
      hilog.info(domain, tag, `testComponentEventOccurOptionsScrollEndMonitor_nullType_static end`);
    })

    /**
     * @tc.name testComponentEventOccurOptionsScrollEndMonitor_notOn_static
     * @tc.number uitestDriverTest_Api22_0051
     * @tc.desc monitor component Scroll end.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testComponentEventOccurOptionsScrollEndMonitor_notOn_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> =>{
      hilog.info(domain, tag, `testComponentEventOccurOptionsScrollEndMonitor_notOn_static start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver!.delayMs(waitUiReadyMs);
      let scrollBar = await driver!.findComponent(ON.type('Scroll').id('parentScroll'));
      expect(scrollBar != null).assertTrue();
      let observer = driver!.createUIEventObserver();
      let isCallBack = false;
      let callback = async (elementInfo : UIElementInfo): void => {
        hilog.info(domain, tag, `testComponentEventOccurOptionsScrollEndMonitor_notOn_static elementInfo,${JSON.stringify(elementInfo)}`);
        isCallBack = true;
      }
      try {
        observer.onceComponentEventOccur(ComponentEventType.COMPONENT_SCROLL_END, {
          timeout: 15000,
          on: ON.type('Scroll').id('parentScrollNot')
        }, callback);
      } catch(error) {
        hilog.info(domain, tag, `testComponentEventOccurOptionsScrollEndMonitor_notOn_static onceComponentEventOccur,${JSON.stringify(error)}`);
        expect((error as BusinessError).code).assertEqual(17000005);
      }
      if (scrollBar) {
        let rect = await scrollBar.getBounds();
        let center = await scrollBar.getBoundsCenter();
        await driver!.swipeBetween({x: center.x, y: Math.floor(center.y + (rect.bottom - rect.top) / 4).toInt()},
          {x: center.x, y: Math.floor(center.y - (rect.bottom - rect.top) / 4).toInt()}, 8000);
        await driver!.delayMs(10000);
      }
      await stopApplication('com.uitestScene.acts');
      hilog.info(domain, tag, `testComponentEventOccurOptionsScrollEndMonitor_notOn_static isCallBack,${JSON.stringify(isCallBack)}`);
      expect(isCallBack).assertFalse();
      hilog.info(domain, tag, `testComponentEventOccurOptionsScrollEndMonitor_notOn_static end`);
    })

    /**
     * @tc.name testComponentEventOccurOptionsTextContentMonitor_static
     * @tc.number uitestDriverTest_Api22_006
     * @tc.desc monitor component text changed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testComponentEventOccurOptionsTextContentMonitor_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> =>{
      hilog.info(domain, tag, `testComponentEventOccurOptionsTextContentMonitor_static start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver!.delayMs(waitUiReadyMs);
      let nextPageBtn = await driver!.findComponent(ON.text('next page'));
      await driver!.delayMs(waitUiReadyMs);
      expect(nextPageBtn != null).assertTrue();
      let observer = driver!.createUIEventObserver();
      let isCallBack = false;
      let callback = async (elementInfo : UIElementInfo): void => {
        hilog.info(domain, tag, `testComponentEventOccurOptionsTextContentMonitor_static elementInfo,${JSON.stringify(elementInfo)}`);
        hilog.info(domain, tag, `testComponentEventOccurOptionsTextContentMonitor_static elementInfo.bundleName,${elementInfo.bundleName}`);
        hilog.info(domain, tag, `testComponentEventOccurOptionsTextContentMonitor_static elementInfo.text,${elementInfo.text}`);
        hilog.info(domain, tag, `testComponentEventOccurOptionsTextContentMonitor_static elementInfo.type,${elementInfo.type}`);
        hilog.info(domain, tag, `testComponentEventOccurOptionsTextContentMonitor_static elementInfo.componentEventType,${elementInfo.componentEventType}`);
        hilog.info(domain, tag, `testComponentEventOccurOptionsTextContentMonitor_static elementInfo.componentId,${elementInfo.componentId}`);
        hilog.info(domain, tag, `testComponentEventOccurOptionsTextContentMonitor_static elementInfo.componentRect,${elementInfo.componentRect}`);
        isCallBack = true;
        try {
          expect(elementInfo.bundleName == 'com.uitestScene.acts').assertTrue();
          expect(elementInfo.text == '1').assertTrue();
          expect(elementInfo.type == 'TextInput').assertTrue();
          expect(elementInfo.componentEventType == ComponentEventType.COMPONENT_TEXT_CHANGED).assertTrue();
        } catch (err) {
          hilog.info(domain, tag, `testComponentEventOccurOptionsTextContentMonitor_static callback error, ${JSON.stringify(err)}`);
        }
      }
      if(nextPageBtn) {
        await nextPageBtn.click();
        await driver!.delayMs(waitUiReadyMs);
        try {
          observer.onceComponentEventOccur(ComponentEventType.COMPONENT_TEXT_CHANGED,{
            on: ON.id('changContext')
          }, callback);
        } catch(error) {
          hilog.info(domain, tag, `testComponentEventOccurOptionsTextContentMonitor_static onceComponentEventOccur,${JSON.stringify(error)}`);
          expect((error as BusinessError).code).assertEqual(17000005);
        }

        let changTest = await driver!.findComponent(ON.id('changContext'));
        await driver!.delayMs(1000);
        expect(changTest != null).assertTrue();
        if (changTest != null) {
          await changTest.inputText('123');
          await driver!.delayMs(3000);
        }
      }
      await driver!.delayMs(5000);
      await stopApplication('com.uitestScene.acts');
      expect(isCallBack).assertTrue();
      hilog.info(domain, tag, `testComponentEventOccurOptionsTextContentMonitor_static end`);
    })

    /**
     * @tc.name testComponentEventOccurOptionsTextContentMonitor_nullOn_static
     * @tc.number uitestDriverTest_Api22_029
     * @tc.desc monitor component text changed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testComponentEventOccurOptionsTextContentMonitor_nullOn_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> =>{
      hilog.info(domain, tag, `testComponentEventOccurOptionsTextContentMonitor_nullOn_static start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver!.delayMs(waitUiReadyMs);
      let nextPageBtn = await driver!.findComponent(ON.text('next page'));
      await driver!.delayMs(waitUiReadyMs);
      expect(nextPageBtn != null).assertTrue();
      let observer = driver!.createUIEventObserver();
      let isCallBack = false;
      let callback = async (elementInfo : UIElementInfo): void => {
        hilog.info(domain, tag, `testComponentEventOccurOptionsTextContentMonitor_nullOn_static elementInfo,${JSON.stringify(elementInfo)}`);
        hilog.info(domain, tag, `testComponentEventOccurOptionsTextContentMonitor_nullOn_static elementInfo.bundleName,${elementInfo.bundleName}`);
        hilog.info(domain, tag, `testComponentEventOccurOptionsTextContentMonitor_nullOn_static elementInfo.text,${elementInfo.text}`);
        hilog.info(domain, tag, `testComponentEventOccurOptionsTextContentMonitor_nullOn_static elementInfo.type,${elementInfo.type}`);
        hilog.info(domain, tag, `testComponentEventOccurOptionsTextContentMonitor_nullOn_static elementInfo.componentEventType,${elementInfo.componentEventType}`);
        hilog.info(domain, tag, `testComponentEventOccurOptionsTextContentMonitor_nullOn_static elementInfo.componentId,${elementInfo.componentId}`);
        hilog.info(domain, tag, `testComponentEventOccurOptionsTextContentMonitor_nullOn_static elementInfo.componentRect,${elementInfo.componentRect}`);
        isCallBack = true;
        try {
          expect(elementInfo.bundleName == 'com.uitestScene.acts').assertTrue();
          expect(elementInfo.text == '1').assertTrue();
          expect(elementInfo.type == 'TextInput').assertTrue();
          expect(elementInfo.componentEventType == ComponentEventType.COMPONENT_TEXT_CHANGED).assertTrue();
        } catch (err) {
          hilog.info(domain, tag, `testComponentEventOccurOptionsTextContentMonitor_nullOn_static callback error, ${JSON.stringify(err)}`);
        }
      }
      if(nextPageBtn) {
        await nextPageBtn.click();
        await driver!.delayMs(waitUiReadyMs);
        try {
          observer.onceComponentEventOccur(ComponentEventType.COMPONENT_TEXT_CHANGED, {
            on: ON.id('changContext')
          }, callback);
        } catch(error) {
          hilog.info(domain, tag, `testComponentEventOccurOptionsTextContentMonitor_nullOn_static onceComponentEventOccur,${JSON.stringify(error)}`);
          expect((error as BusinessError).code).assertEqual(17000005);
        }

        let changTest = await driver!.findComponent(ON.id('changContext'));
        await driver!.delayMs(1000);
        expect(changTest != null).assertTrue();
        if (changTest != null) {
          await changTest.inputText('123');
          await driver!.delayMs(3000);
        }
      }
      await driver!.delayMs(5000);
      await stopApplication('com.uitestScene.acts');
      hilog.info(domain, tag, `testComponentEventOccurOptionsTextContentMonitor_nullOn_static isCallBack,${JSON.stringify(isCallBack)}`);
      expect(isCallBack).assertTrue();
      hilog.info(domain, tag, `testComponentEventOccurOptionsTextContentMonitor_nullOn_static end`);
    })

    /**
     * @tc.name testComponentEventOccurOptionsTextContentMonitor_nullType_static
     * @tc.number uitestDriverTest_Api22_030
     * @tc.desc monitor component text changed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testComponentEventOccurOptionsTextContentMonitor_nullType_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> =>{
      hilog.info(domain, tag, `testComponentEventOccurOptionsTextContentMonitor_nullType_static start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver!.delayMs(waitUiReadyMs);
      let nextPageBtn = await driver!.findComponent(ON.text('next page'));
      await driver!.delayMs(waitUiReadyMs);
      expect(nextPageBtn != null).assertTrue();
      let observer = driver!.createUIEventObserver();
      let isCallBack = false;
      let callback = async (elementInfo : UIElementInfo): void => {
        hilog.info(domain, tag, `testComponentEventOccurOptionsTextContentMonitor_nullType_static elementInfo,${JSON.stringify(elementInfo)}`);
        hilog.info(domain, tag, `testComponentEventOccurOptionsTextContentMonitor_nullType_static elementInfo.bundleName,${elementInfo.bundleName}`);
        hilog.info(domain, tag, `testComponentEventOccurOptionsTextContentMonitor_nullType_static elementInfo.text,${elementInfo.text}`);
        hilog.info(domain, tag, `testComponentEventOccurOptionsTextContentMonitor_nullType_static elementInfo.type,${elementInfo.type}`);
        hilog.info(domain, tag, `testComponentEventOccurOptionsTextContentMonitor_nullType_static elementInfo.componentEventType,${elementInfo.componentEventType}`);
        hilog.info(domain, tag, `testComponentEventOccurOptionsTextContentMonitor_nullType_static elementInfo.componentId,${elementInfo.componentId}`);
        hilog.info(domain, tag, `testComponentEventOccurOptionsTextContentMonitor_nullType_static elementInfo.componentRect,${elementInfo.componentRect}`);
        isCallBack = true;
        try {
          expect(elementInfo.bundleName == 'com.uitestScene.acts').assertTrue();
          expect(elementInfo.text == '1').assertTrue();
          expect(elementInfo.type == 'TextInput').assertTrue();
          expect(elementInfo.componentEventType == ComponentEventType.COMPONENT_TEXT_CHANGED).assertTrue();
        } catch (err) {
          hilog.info(domain, tag, `testComponentEventOccurOptionsTextContentMonitor_nullType_static callback error, ${JSON.stringify(err)}`);
        }
      }
      if(nextPageBtn) {
        await nextPageBtn.click();
        await driver!.delayMs(waitUiReadyMs);
        try {
          observer.onceComponentEventOccur(ComponentEventType.COMPONENT_TEXT_CHANGED, {}, callback);
        } catch(error) {
          hilog.info(domain, tag, `testComponentEventOccurOptionsTextContentMonitor_nullType_static onceComponentEventOccur,${JSON.stringify(error)}`);
          expect((error as BusinessError).code).assertEqual(17000005);
        }

        let changTest = await driver!.findComponent(ON.id('changContext'));
        await driver!.delayMs(1000);
        expect(changTest != null).assertTrue();
        if (changTest != null) {
          await changTest.inputText('123');
          await driver!.delayMs(3000);
        }
      }
      await driver!.delayMs(5000);
      await stopApplication('com.uitestScene.acts');
      hilog.info(domain, tag, `testComponentEventOccurOptionsTextContentMonitor_nullType_static isCallBack,${JSON.stringify(isCallBack)}`);
      expect(isCallBack).assertTrue();
      hilog.info(domain, tag, `testComponentEventOccurOptionsTextContentMonitor_nullType_static end`);
    })

    /**
     * @tc.name testComponentEventOccurOptionsTextContentMonitor_notOn_static
     * @tc.number uitestDriverTest_Api22_0061
     * @tc.desc monitor component text changed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testComponentEventOccurOptionsTextContentMonitor_notOn_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> =>{
      hilog.info(domain, tag, `testComponentEventOccurOptionsTextContentMonitor_notOn_static start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver!.delayMs(waitUiReadyMs);
      let nextPageBtn = await driver!.findComponent(ON.text('next page'));
      await driver!.delayMs(waitUiReadyMs);
      expect(nextPageBtn != null).assertTrue();
      let observer = driver!.createUIEventObserver();
      let isCallBack = false;
      let callback = async (elementInfo : UIElementInfo): void => {
        hilog.info(domain, tag, `testComponentEventOccurOptionsTextContentMonitor_notOn_static elementInfo,${JSON.stringify(elementInfo)}`);
        isCallBack = true;
      }
      if(nextPageBtn) {
        await nextPageBtn.click();
        await driver!.delayMs(waitUiReadyMs);
        try {
          observer.onceComponentEventOccur(ComponentEventType.COMPONENT_TEXT_CHANGED, {
            on: ON.id('changContextNot')
          }, callback);
        } catch(error) {
          hilog.info(domain, tag, `testComponentEventOccurOptionsTextContentMonitor_notOn_static onceComponentEventOccur,${JSON.stringify(error)}`);
          expect((error as BusinessError).code).assertEqual(17000005);
        }

        let changTest = await driver!.findComponent(ON.id('changContext'));
        await driver!.delayMs(1000);
        expect(changTest != null).assertTrue();
        if (changTest != null) {
          await changTest.inputText('123');
          await driver!.delayMs(3000);
        }
      }
      await driver!.delayMs(5000);
      await stopApplication('com.uitestScene.acts');
      hilog.info(domain, tag, `testComponentEventOccurOptionsTextContentMonitor_notOn_static isCallBack,${JSON.stringify(isCallBack)}`);
      expect(isCallBack).assertFalse();
      hilog.info(domain, tag, `testComponentEventOccurOptionsTextContentMonitor_notOn_static end`);
    })

    /**
     * @tc.name testComponentEventOccurOptionsTimeOutClickMonitor_static
     * @tc.number uitestDriverTest_Api22_007
     * @tc.desc monitor component click.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testComponentEventOccurOptionsTimeOutClickMonitor_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> =>{
      hilog.info(domain, tag, `testComponentEventOccurOptionsTimeOutClickMonitor_static start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver!.delayMs(waitUiReadyMs)
      let btn = await driver!.findComponent(ON.isBefore(ON.text('next page')).type('Button'))
      expect(btn != null).assertTrue()
      let isCallback = false;
      let observer = driver!.createUIEventObserver()
      let callback = (elementInfo : UIElementInfo): void => {
        try {
          hilog.info(domain, tag, `testComponentEventOccurOptionsTimeOutClickMonitor_static elementInfo,${JSON.stringify(elementInfo)}`);
          hilog.info(domain, tag, `testComponentEventOccurOptionsTimeOutClickMonitor_static elementInfo.bundleName,${elementInfo.bundleName}`);
          hilog.info(domain, tag, `testComponentEventOccurOptionsTimeOutClickMonitor_static elementInfo.text,${elementInfo.text}`);
          hilog.info(domain, tag, `testComponentEventOccurOptionsTimeOutClickMonitor_static elementInfo.type,${elementInfo.type}`);
          hilog.info(domain, tag, `testComponentEventOccurOptionsTimeOutClickMonitor_static elementInfo.componentEventType,${elementInfo.componentEventType}`);
          hilog.info(domain, tag, `testComponentEventOccurOptionsTimeOutClickMonitor_static elementInfo.componentId,${elementInfo.componentId}`);
          hilog.info(domain, tag, `testComponentEventOccurOptionsTimeOutClickMonitor_static elementInfo.componentRect,${elementInfo.componentRect}`);
          isCallback = true;
          expect(elementInfo.bundleName == 'com.uitestScene.acts').assertTrue()
          expect(elementInfo.text == 'toast').assertTrue()
          expect(elementInfo.type == 'Button').assertTrue()
          expect(elementInfo.componentEventType == ComponentEventType.COMPONENT_CLICKED).assertTrue();
        } catch (err) {
          hilog.info(domain, tag, `testComponentEventOccurOptionsTimeOutClickMonitor_static callback error ,${JSON.stringify(err)}`);
        }
      }
      try {
        observer.onceComponentEventOccur(ComponentEventType.COMPONENT_CLICKED, {
          timeout: 3000,
          on: ON.isBefore(ON.text('next page')).type('Button')
        } , callback)
      } catch(error) {
        hilog.info(domain, tag, `testComponentEventOccurOptionsTimeOutClickMonitor_static onceComponentEventOccur,${JSON.stringify(error)}`);
        expect((error as BusinessError).code).assertEqual(17000005);
      }
      if (btn) {
        await driver!.delayMs(5000);
        await btn.click()
        await driver!.delayMs(5000);
      }
      await driver!.delayMs(waitUiReadyMs)
      await stopApplication('com.uitestScene.acts')
      expect(isCallback).assertFalse();
      hilog.info(domain, tag, `testComponentEventOccurOptionsTimeOutClickMonitor_static end`);
    })

    /**
     * @tc.name tesIsComponentPresentWhenLongClickTrue_static
     * @tc.number uitestDriverTest_Api22_008
     * @tc.desc isComponentPresentWhenLongClick test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('tesIsComponentPresentWhenLongClickTrue_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, tesIsComponentPresentWhenLongClickTrue_static start`);
      await driver!.delayMs(waitUiReadyMs);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver!.delayMs(waitUiReadyMs);
      console.log(`${TestTag}, tesIsComponentPresentWhenLongClickTrue_static start driver!.findComponent`);
      let to5Btn = await driver!.findComponent(ON.id('to5'));
      expect(to5Btn != null).assertTrue();
      if(to5Btn != null) {
        await to5Btn.click();
        await driver!.delayMs(waitUiReadyMs);
      }
      let longClickBtn = await driver!.findComponent(ON.id('longClickBtn'));
      await driver!.delayMs(waitUiReadyMs);
      expect(longClickBtn != null).assertTrue();
      if (longClickBtn != null) {
        let center = await longClickBtn.getBoundsCenter();
        await driver!.delayMs(waitUiReadyMs);
        let result = await driver!.isComponentPresentWhenLongClick(ON.text('ShowLongEventText'), center, 6000)
        expect(result).assertTrue();
        await driver!.delayMs(waitUiReadyMs);
        let longClickTextResultBtn = await driver!.findComponent(ON.id('longClickTextResult'));
        expect(longClickTextResultBtn != null).assertTrue();
        if (longClickTextResultBtn != null) {
          let longClickText = await longClickTextResultBtn.getText();
          expect(longClickText == 'longClickEvent').assertTrue();
        }
      }
      await driver!.delayMs(waitUiReadyMs);
      await stopApplication('com.uitestScene.acts')
      console.log(`${TestTag}, tesIsComponentPresentWhenLongClickTrue_static end`);
    })

    /**
     * @tc.name tesIsComponentPresentWhenLongClickFalse_static
     * @tc.number uitestDriverTest_Api22_09
     * @tc.desc isComponentPresentWhenLongClick test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('tesIsComponentPresentWhenLongClickFalse_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, tesIsComponentPresentWhenLongClickNotCom start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver!.delayMs(waitUiReadyMs);
      let to5Btn = await driver!.findComponent(ON.id('to5'));
      expect(to5Btn != null).assertTrue();
      if(to5Btn != null) {
        await to5Btn.click();
        await driver!.delayMs(waitUiReadyMs);
      }
      let longClickBtn = await driver!.findComponent(ON.id('longClickBtn'));
      expect(longClickBtn != null).assertTrue();
      if (longClickBtn != null) {
        await driver!.delayMs(waitUiReadyMs);
        let center = await longClickBtn.getBoundsCenter();
        await driver!.delayMs(waitUiReadyMs);
        let disPlay = display.getDefaultDisplaySync();
        console.log(`${TestTag}, tesIsComponentPresentWhenLongClickNotCom disPlay is: ${JSON.stringify(disPlay)}`);
        let result = await driver!.isComponentPresentWhenLongClick(ON.text('ShowLongEventTextNot'), {
          x: center.x,
          y: center.y,
          displayId: disPlay.id.toInt()
        })
        expect(result).assertFalse();
        await driver!.delayMs(waitUiReadyMs);
        let longClickTextResultBtn = await driver!.findComponent(ON.id('longClickTextResult'));
        expect(longClickTextResultBtn != null).assertTrue();
        if (longClickTextResultBtn != null) {
          let longClickText = await longClickTextResultBtn.getText();
          expect(longClickText == 'longClickEvent').assertTrue();
        }
        await driver!.delayMs(waitUiReadyMs);
      }
      await stopApplication('com.uitestScene.acts')
      console.log(`${TestTag}, tesIsComponentPresentWhenLongClickNotCom end`);
    })

    /**
     * @tc.name tesIsComponentPresentWhenDragTrue_static
     * @tc.number uitestDriverTest_Api22_010
     * @tc.desc isComponentPresentWhenDrag test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('tesIsComponentPresentWhenDragTrue_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, tesIsComponentPresentWhenDragTrue_static start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver!.delayMs(waitUiReadyMs);
      let to5Btn = await driver!.findComponent(ON.id('to5'));
      expect(to5Btn != null).assertTrue();
      if (to5Btn != null) {
        await to5Btn.click();
      }
      await driver!.delayMs(waitUiReadyMs);
      let dragColCom = await driver!.findComponent(ON.id('dragCol'));
      expect(dragColCom != null).assertTrue();
      if (dragColCom != null) {
        await driver!.delayMs(waitUiReadyMs);
        let center1 = await dragColCom.getBoundsCenter();
        let dragResultTextCom = await driver!.findComponent(ON.id('dragResultText'));
        expect(dragResultTextCom != null).assertTrue();
        if (dragResultTextCom != null) {
          await driver!.delayMs(waitUiReadyMs);
          let center2 = await dragResultTextCom.getBoundsCenter();
          let result = await driver!.isComponentPresentWhenDrag(ON.text('ShowDragEventText'), center1, center2)
          console.log(`${TestTag}, tesIsComponentPresentWhenDragTrue_static result, ${JSON.stringify(result)}`);
          expect(result).assertTrue();
        }
      }
      let text = await driver!.findComponent(ON.text('drag end'));
      expect(text != null).assertTrue()
      await stopApplication('com.uitestScene.acts')
      console.log(`${TestTag}, tesIsComponentPresentWhenDragTrue_static end`);
    })

    /**
     * @tc.name tesIsComponentPresentWhenDragTrue_speed_static
     * @tc.number uitestDriverTest_Api22_0101
     * @tc.desc isComponentPresentWhenDrag test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('tesIsComponentPresentWhenDragTrue_speed_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, tesIsComponentPresentWhenDragTrue_speed_static start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver!.delayMs(waitUiReadyMs);
      let to5Btn = await driver!.findComponent(ON.id('to5'));
      expect(to5Btn != null).assertTrue();
      if (to5Btn != null) {
        await to5Btn.click();
      }
      await driver!.delayMs(waitUiReadyMs);
      let dragColCom = await driver!.findComponent(ON.id('dragCol'));
      expect(dragColCom != null).assertTrue();
      if (dragColCom != null) {
        await driver!.delayMs(waitUiReadyMs);
        let center1 = await dragColCom.getBoundsCenter();
        let dragResultTextCom = await driver!.findComponent(ON.id('dragResultText'));
        expect(dragResultTextCom != null).assertTrue();
        if (dragResultTextCom != null) {
          await driver!.delayMs(waitUiReadyMs);
          let center2 = await dragResultTextCom.getBoundsCenter();
          let result = await driver!.isComponentPresentWhenDrag(ON.text('ShowDragEventText'), center1, center2, 600);
          console.log(`${TestTag}, tesIsComponentPresentWhenDragTrue_speed_static result, ${JSON.stringify(result)}`);
          expect(result).assertTrue();
        }
      }
      let text = await driver!.findComponent(ON.text('drag end'));
      expect(text != null).assertTrue()
      await stopApplication('com.uitestScene.acts')
      console.log(`${TestTag}, tesIsComponentPresentWhenDragTrue_speed_static end`);
    })

    /**
     * @tc.name tesIsComponentPresentWhenDragFalse_static
     * @tc.number uitestDriverTest_Api22_011
     * @tc.desc isComponentPresentWhenDrag test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('tesIsComponentPresentWhenDragFalse_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, tesIsComponentPresentWhenDragFalse_static start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver!.delayMs(waitUiReadyMs);
      let to5Btn = await driver!.findComponent(ON.id('to5'));
      expect(to5Btn != null).assertTrue()
      if (to5Btn != null) {
        await to5Btn.click();
      }
      await driver!.delayMs(waitUiReadyMs);
      let dragColCom = await driver!.findComponent(ON.id('dragCol'));
      expect(dragColCom != null).assertTrue()
      if (dragColCom != null) {
        await driver!.delayMs(waitUiReadyMs);
        let center1 = await dragColCom.getBoundsCenter();
        let dragResultTextCom = await driver!.findComponent(ON.id('dragResultText'));
        expect(dragResultTextCom != null).assertTrue()
        if (dragResultTextCom != null) {
          await driver!.delayMs(waitUiReadyMs);
          let center2 = await dragResultTextCom.getBoundsCenter();
          let disPlay = display.getDefaultDisplaySync();
          console.log(`${TestTag}, tesIsComponentPresentWhenDragFalse_static disPlay is: ${JSON.stringify(disPlay)}`);
          let result = await driver!.isComponentPresentWhenDrag(ON.text('ShowDragEventTextNot'), {
            x: center1.x,
            y: center1.y,
            displayId: disPlay.id.toInt()
          }, {
            x: center2.x,
            y: center2.y,
            displayId: disPlay.id.toInt()
          }, 600, 1500)
          console.log(`${TestTag}, tesIsComponentPresentWhenDragFalse_static result, ${JSON.stringify(result)}`);
          expect(result).assertFalse();
        }
      }
      let text = await driver!.findComponent(ON.text('drag end'));
      expect(text != null).assertTrue()
      await stopApplication('com.uitestScene.acts')
      console.log(`${TestTag}, tesIsComponentPresentWhenDragFalse_static end`);
    })

    /**
     * @tc.name tesIsComponentPresentWhenSwipeTrue_static
     * @tc.number uitestDriverTest_Api22_012
     * @tc.desc isComponentPresentWhenSwipe test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('tesIsComponentPresentWhenSwipeTrue_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, tesIsComponentPresentWhenSwipeTrue_static start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver!.delayMs(waitUiReadyMs)
      let scrollBar = await driver!.findComponent(ON.type('Scroll').id('parentScroll'));
      expect(scrollBar != null).assertTrue()
      if (scrollBar != null) {
        let rect = await scrollBar.getBounds()
        let center = await scrollBar.getBoundsCenter()
        let result = await driver!.isComponentPresentWhenSwipe(ON.text('ShowSwipeEventCom'),
          {x: center.x, y: Math.floor(center.y + (rect.bottom - rect.top) / 4).toInt()},
          {x: center.x, y: Math.floor(center.y - (rect.bottom - rect.top) / 4).toInt()}, 9000)
        console.log(`${TestTag}, tesIsComponentPresentWhenSwipeTrue_static result, ${JSON.stringify(result)}`);
        expect(result).assertTrue();
      }
      let text = await driver!.findComponent(ON.text('toast'))
      expect(text == null).assertTrue()
      await stopApplication('com.uitestScene.acts')
      console.log(`${TestTag}, tesIsComponentPresentWhenSwipeTrue_static end`);
    })

    /**
     * @tc.name tesIsComponentPresentWhenSwipeFalse_static
     * @tc.number uitestDriverTest_Api22_013
     * @tc.desc isComponentPresentWhenSwipe test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('tesIsComponentPresentWhenSwipeFalse_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, tesIsComponentPresentWhenSwipeFalse_static start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver!.delayMs(waitUiReadyMs)
      let scrollBar = await driver!.findComponent(ON.type('Scroll').id('parentScroll'));
      expect(scrollBar != null).assertTrue()
      if (scrollBar != null) {
        let rect = await scrollBar.getBounds()
        let center = await scrollBar.getBoundsCenter()
        let disPlay = display.getDefaultDisplaySync();
        console.log(`${TestTag}, tesIsComponentPresentWhenSwipeFalse_static disPlay is: ${JSON.stringify(disPlay)}`);
        let result = await driver!.isComponentPresentWhenSwipe(ON.text('ShowSwipeEventComNot'),
          {x: center.x, y: Math.floor(center.y + (rect.bottom - rect.top) / 4).toInt(), displayId: disPlay.id.toInt()},
          {x: center.x, y: Math.floor(center.y - (rect.bottom - rect.top) / 4).toInt(), displayId: disPlay.id.toInt()})
        console.log(`${TestTag}, tesIsComponentPresentWhenSwipeFalse_static result, ${JSON.stringify(result)}`);
        expect(result).assertFalse();
      }
      let text = await driver!.findComponent(ON.text('toast'))
      expect(text == null).assertTrue()
      await stopApplication('com.uitestScene.acts')
      console.log(`${TestTag}, tesIsComponentPresentWhenSwipeFalse_static end`);
    })

    /**
     * @tc.name tesKnuckleKnockSingle_static
     * @tc.number uitestDriverTest_Api22_014
     * @tc.desc isComponentPresentWhenLongClick test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('tesKnuckleKnockSingle_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, tesKnuckleKnockSingle_static start`);
      try {
        let play = display.getDefaultDisplaySync();
        console.log(`${TestTag}, tesKnuckleKnockSingle_static play, ${JSON.stringify(play)}`);
        let points: Array<Point> = []
        let point: Point = {
          x: (play.width / 2).toInt(),
          y: (play.height / 2).toInt(),
          displayId: play.id.toInt()
        }
        points.push(point)
        await driver!.delayMs(waitUiReadyMs)
        await driver!.knuckleKnock(points, 2)
        await driver!.delayMs(waitUiReadyMs * 2)
        let screenPng = await driver!.findComponent(ON.id('SCREENSHOT_PICTURE_PREVIEWER_IMAGE'));
        expect(screenPng != null).assertTrue();
      } catch (error) {
        console.log(`${TestTag}, tesKnuckleKnockSingle_static error, ${JSON.stringify(error)}`);
        expect((error as BusinessError).code).assertEqual(17000005);
      }
      console.log(`${TestTag}, tesKnuckleKnockSingle_static end`);
    })

    /**
     * @tc.name tesKnuckleKnockDouble_static
     * @tc.number uitestDriverTest_Api22_015
     * @tc.desc isComponentPresentWhenLongClick test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('tesKnuckleKnockDouble_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, tesKnuckleKnockDouble_static start`);
      try {
        let play = display.getDefaultDisplaySync();
        let points: Array<Point> = []
        let point: Point = {
          x: (play.width /2).toInt(),
          y: (play.height / 2).toInt(),
          displayId: play.id.toInt()
        }
        points.push(point)
        points.push(point)
        await driver!.knuckleKnock(points, 2);
        await driver!.delayMs(waitUiReadyMs * 2)
        let screenPng = await driver!.findComponent(ON.id('.hmos.screenrecorder__1000', MatchPattern.ENDS_WITH));
        expect(screenPng != null).assertTrue();
        await driver!.knuckleKnock(points, 2);
        await driver!.delayMs(waitUiReadyMs);
      } catch (error) {
        console.log(`${TestTag}, tesKnuckleKnockDouble_static error, ${JSON.stringify(error)}`);
        expect((error as BusinessError).code).assertEqual(17000005);
      }
      console.log(`${TestTag}, tesKnuckleKnockDouble_static end`);
    })

    /**
     * @tc.name tesKnuckleKnockS_static
     * @tc.number uitestDriverTest_Api22_016
     * @tc.desc isComponentPresentWhenLongClick test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('tesKnuckleKnockS_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, tesKnuckleKnockS_static start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver!.delayMs(waitUiReadyMs)
      let window = await driver!.findWindow({ bundleName: 'com.uitestScene.acts' });
      console.log(`${TestTag}, tesKnuckleKnockS_static window,${JSON.stringify(window)}`);
      if (window != null) {
        try {
          let windowMode = await window.getWindowMode();
          if (windowMode == WindowMode.FULLSCREEN) {
            return;
          }
          await window.maximize();
        } catch (error) {
          console.log(`${TestTag}, tesKnuckleKnockS maximize error,${JSON.stringify(error)}`);
        }
      }
      await driver!.delayMs(3000);
      try {
        let play = display.getDefaultDisplaySync();
        console.log(`${TestTag}, tesKnuckleKnockS_static play, ${JSON.stringify(play)}`);	
        let centerX = (play.width / 2).toInt();
        let centY = (play.height / 2).toInt();
        let fivePoint: Point = {x: centerX - 40, y: centY - 80};
        let sixPoint: Point = {x: centerX - 40, y: centY - 60};
        let sevPoint: Point = {x: centerX - 40, y: centY - 40};
        let eigPoint: Point = {x: centerX -40, y: centY - 20};
        let niePoint: Point = {x: centerX - 40, y: centY };
        let tenPoint: Point = {x: centerX - 20, y: centY};
        let ten1Point: Point = {x: centerX, y: centY};
        let ten2Point: Point = {x: centerX + 20, y: centY };
        let ten3Point: Point = {x: centerX + 40, y: centY };
        let ten4Point: Point = {x: centerX + 40, y: centY + 20};
        let ten5Point: Point = {x: centerX + 40, y: centY + 40};
        let ten6Point: Point = {x: centerX + 40, y: centY + 60};
        let ten7Point: Point = {x: centerX + 40, y: centY + 80};
        let pointers = PointerMatrix.create(1,13);
        pointers.setPoint(0,0, fivePoint);
        pointers.setPoint(0,1, sixPoint);
        pointers.setPoint(0,2, sevPoint);
        pointers.setPoint(0,3, eigPoint);
        pointers.setPoint(0,4, niePoint);
        pointers.setPoint(0,5, tenPoint);
        pointers.setPoint(0,6, ten1Point);
        pointers.setPoint(0,7, ten2Point);
        pointers.setPoint(0,8, ten3Point);
        pointers.setPoint(0,9, ten4Point);
        pointers.setPoint(0,10, ten5Point);
        pointers.setPoint(0,11, ten6Point);
        pointers.setPoint(0,12, ten7Point);
        await driver!.injectKnucklePointerAction(pointers);
        await driver!.delayMs(waitUiReadyMs * 2)
        let screenPng = await driver!.findComponent(ON.id('ScrollHandWriteBoxStack'));
        expect(screenPng != null).assertTrue();
        await driver!.pressBack();
        await Utils.msSleep(2000)
        await stopApplication('com.uitestScene.acts')        
      } catch (error) {
        console.log(`${TestTag}, tesKnuckleKnockS_static error, ${JSON.stringify(error)}`);
        await stopApplication('com.uitestScene.acts')
        expect((error as BusinessError).code).assertEqual(17000005);
      }
      await Utils.msSleep(3000)
      console.log(`${TestTag}, tesKnuckleKnockS_static end`);
    })

    /**
     * @tc.name tesKnuckleKnockRect_static
     * @tc.number uitestDriverTest_Api22_017
     * @tc.desc isComponentPresentWhenLongClick test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('tesKnuckleKnockRect_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, tesKnuckleKnockRect_static start`);
      try {
        let play = display.getDefaultDisplaySync();
        console.log(`${TestTag}, tesKnuckleKnockRect_static play, ${JSON.stringify(play)}`);
        let centerX = (play.width / 2).toInt();
        let centY = (play.height / 2).toInt();
        let onePoint: Point = {x: centerX - 100, y: centY - 100};
        let twoPoint: Point = {x: centerX -100, y: centY};
        let threePoint: Point = {x: centerX - 100, y: centY + 100 };
        let fourPoint: Point = {x: centerX, y: centY + 100};
        let fivePoint: Point = {x: centerX + 100, y: centY + 100};
        let sixPoint: Point = {x: centerX + 100, y: centY};
        let sevPoint: Point = {x: centerX  + 100, y: centY - 100};
        let eigPoint: Point = {x: centerX, y: centY - 100};
        let ninePoint: Point = {x: centerX - 100, y: centY - 100};
        let pointers = PointerMatrix.create(1,9);
        pointers.setPoint(0,0, onePoint);
        pointers.setPoint(0,1, twoPoint);
        pointers.setPoint(0,2, threePoint);
        pointers.setPoint(0,3, fourPoint);
        pointers.setPoint(0,4, fivePoint);
        pointers.setPoint(0,5, sixPoint);
        pointers.setPoint(0,6, sevPoint);
        pointers.setPoint(0,7, eigPoint);
        pointers.setPoint(0,8, ninePoint);
        await driver!.injectKnucklePointerAction(pointers, 3000);
        await driver!.delayMs(waitUiReadyMs * 8)
        let isTantWindow = driver!.findWindow({bundleName: 'com.huawei.hmos.vassistant'});
        await Utils.msSleep(1000);
        console.log(`${TestTag}, tesKnuckleKnockRect_static isTantWindow, ${JSON.stringify(isTantWindow)}`);
        expect(isTantWindow != null).assertTrue();
        await stopApplication('com.huawei.hmos.vassistant');
        await Utils.msSleep(2000)
      } catch (error) {
        console.log(`${TestTag}, tesKnuckleKnockRect_static error, ${JSON.stringify(error)}`);
        await stopApplication('com.huawei.hmos.vassistant');
        expect((error as BusinessError).code).assertEqual(17000005);
      }
      await Utils.msSleep(3000)
      console.log(`${TestTag}, tesKnuckleKnockRect_static end`);
    })


    /**
     * @tc.name teTouchPadTwoFingersScrollVer_Static
     * @tc.number uitestDriverTest_Api22_018
     * @tc.desc isComponentPresentWhenLongClick test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('teTouchPadTwoFingersScrollVer_Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, teTouchPadTwoFingersScrollVer_Static start`);
      try {
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver!.delayMs(waitUiReadyMs);
        let scrollBar = await driver!.findComponent(ON.type('Scroll').id('parentScroll'));
        expect(scrollBar != null).assertTrue()
        if (scrollBar != null) {
          await driver!.delayMs(waitUiReadyMs);
          let center = await scrollBar.getBoundsCenter();
          await driver!.delayMs(waitUiReadyMs);
          await driver!.touchPadTwoFingersScroll({x: center.x, y: center.y}, UiDirection.UP, 300);
          await driver!.delayMs(waitUiReadyMs);
          let text = await driver!.findComponent(ON.text('toast'));
          await driver!.delayMs(waitUiReadyMs);
          expect(text == null).assertTrue()
          await driver!.touchPadTwoFingersScroll({x: center.x, y: center.y}, UiDirection.DOWN, 400, 5000);
          let text1 = await driver!.findComponent(ON.text('toast'));
          await driver!.delayMs(waitUiReadyMs);
          expect(text1 != null).assertTrue()
        }
      } catch (error) {
        console.log(`${TestTag}, teTouchPadTwoFingersScrollVer_Static error, ${JSON.stringify(error)}`);
        expect((error as BusinessError).code).assertEqual(17000005);
      }
      await stopApplication('com.uitestScene.acts')
      console.log(`${TestTag}, teTouchPadTwoFingersScrollVer_Static end`);
    })

    /**
     * @tc.name teTouchPadTwoFingersScrollHor_static
     * @tc.number uitestDriverTest_Api22_019
     * @tc.desc isComponentPresentWhenLongClick test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('teTouchPadTwoFingersScrollHor_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, teTouchPadTwoFingersScrollHor_static start`);
      try {
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver!.delayMs(waitUiReadyMs);
        let scrollBarBtn = await driver!.findComponent(ON.id('to5'));
        expect(scrollBarBtn != null).assertTrue();
        if (scrollBarBtn != null) {
          await driver!.delayMs(waitUiReadyMs);
          await scrollBarBtn.click();
          await driver!.delayMs(waitUiReadyMs);
        }
        let scrollBar = await driver!.findComponent(ON.type('Scroll').id('horizontalScroll'));
        await driver!.delayMs(waitUiReadyMs);
        expect(scrollBar != null).assertTrue();
        if (scrollBar != null) {
          let center = await scrollBar.getBoundsCenter();
          await driver!.delayMs(waitUiReadyMs);
          await driver!.touchPadTwoFingersScroll({x: center.x, y: center.y},
            UiDirection.LEFT, 600, 5000);
          await driver!.delayMs(waitUiReadyMs);
          let scroll11 = await driver!.findComponent(ON.text('1_hor'));
          await driver!.delayMs(waitUiReadyMs);
          expect(scroll11 == null).assertTrue();
          await driver!.delayMs(waitUiReadyMs);
          await driver!.touchPadTwoFingersScroll({x: center.x, y: center.y},
            UiDirection.RIGHT, 800);
          await driver!.delayMs(waitUiReadyMs);
          let scroll111 = await driver!.findComponent(ON.text('1_hor'));
          await driver!.delayMs(waitUiReadyMs);
          expect(scroll111 != null).assertTrue();
        }
      } catch (error) {
        console.log(`${TestTag}, teTouchPadTwoFingersScrollHor_static error, ${JSON.stringify(error)}`);
        expect((error as BusinessError).code).assertEqual(17000005);
      }
      await stopApplication('com.uitestScene.acts')
      console.log(`${TestTag}, teTouchPadTwoFingersScrollHor_static end`);
    })

  })
}