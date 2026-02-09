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

import { describe,beforeAll, beforeEach, afterEach, it, expect, Level, TestType, Size } from "../../../../hypium/index"
import router from '@ohos.router';
import { Component, Driver, Component, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
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
let emitKey = 'emitUserAgent';

export default function bindContextMenuHapticFeedbackMode() {
  describe('bindContextMenuHapticFeedbackMode', () => {

    beforeAll(() => {

      
      await UtilsTest.startAbility("com.arkui.ace.dialog.static", "EntryAbility")
      
    })

    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/bindContextMenu/bindContextMenuHapticFeedback',
      }
      try {
        const DialogOptions = AppStorage.get<Router>("router") as Router
        DialogOptions.clear();
        let pages = DialogOptions.getState();
        console.info('get bindContextMenuHapticFeedback state success ' + JSON.stringify(pages));
        if (!('bindContextMenuHapticFeedback' == pages.name)) {
          console.info('get bindContextMenuHapticFeedback state success ' + JSON.stringify(pages.name));
          DialogOptions.pushUrl(options)
          console.info('push bindContextMenuHapticFeedback page success ');
        }
      } catch (err) {
        console.error('push bindContextMenuHapticFeedback page error ' + JSON.stringify(err));
      }
    });

    
    
/**
     * @tc.number   bindContextMenuHapticFeedbackModeTest_static_0100
     * @tc.name     bindContextMenuHapticFeedbackModeTest_static_0100
     * @tc.desc     bindContextMenuHapticFeedbackModeTest_static_0100
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1
     */
it('bindContextMenuHapticFeedbackModeTest_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let tagName = 'bindContextMenuHapticFeedbackModeTest_static_0100';
      console.info('[' + tagName + '] START============================');
      let driver = Driver.create();
      let btn01 = await driver.findComponent(ON.id('button01'));
      await (btn01?.longClick() as Promise<void>);
      await UtilsTest.msSleep(1000);
      let menu = await driver.findComponent(ON.id('menu'));
      await (menu?.click() as Promise<void>);
      await UtilsTest.msSleep(1000);
      let strJson1 = inspector.getInspectorByKey('text1');
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content')).assertEqual('0');
      console.info('[' + tagName + '] END============================');
      done();
    });

    
    
/**
     * @tc.number   bindContextMenuHapticFeedbackModeTest_static_0200
     * @tc.name     bindContextMenuHapticFeedbackModeTest_static_0200
     * @tc.desc     bindContextMenuHapticFeedbackModeTest_static_0200
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1
     */
it('bindContextMenuHapticFeedbackModeTest_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let tagName = 'bindContextMenuHapticFeedbackModeTest_static_0200';
      console.info('[' + tagName + '] START============================');
      let driver = Driver.create();
      let btn02 = await driver.findComponent(ON.id('button02'));
      await (btn02?.longClick() as Promise<void>);
      await UtilsTest.msSleep(1000);
      let menu = await driver.findComponent(ON.id('menu'));
      await (menu?.click() as Promise<void>);
      await UtilsTest.msSleep(1000);
      let strJson2 = inspector.getInspectorByKey('text2');
      expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content')).assertEqual('1');
      console.info('[' + tagName + '] END============================');
      done();
    });

    
    
/**
     * @tc.number   bindContextMenuHapticFeedbackModeTest_static_0300
     * @tc.name     bindContextMenuHapticFeedbackModeTest_static_0300
     * @tc.desc     bindContextMenuHapticFeedbackModeTest_static_0300
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1
     */
it('bindContextMenuHapticFeedbackModeTest_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let tagName = 'bindContextMenuHapticFeedbackModeTest_static_0300';
      console.info('[' + tagName + '] START============================');
      let driver = Driver.create();
      let btn03 = await driver.findComponent(ON.id('button03'));
      await (btn03?.longClick() as Promise<void>);
      await UtilsTest.msSleep(1000);
      let menu = await driver.findComponent(ON.id('menu'));
      await (menu?.click() as Promise<void>);
      await UtilsTest.msSleep(1000);
      let strJson3 = inspector.getInspectorByKey('text3');
      expect(JSON.parseJsonElement(strJson3).getElement('$attrs').getString('content')).assertEqual('2');
      console.info('[' + tagName + '] END============================');
      done();
    });

    
    
/**
     * @tc.number   bindContextMenuHapticFeedbackModeTest_static_0400
     * @tc.name     bindContextMenuHapticFeedbackModeTest_static_0400
     * @tc.desc     bindContextMenuHapticFeedbackModeTest_static_0400
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1
     */
it('bindContextMenuHapticFeedbackModeTest_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let tagName = 'bindContextMenuHapticFeedbackModeTest_static_0400';
      console.info('[' + tagName + '] START============================');
      let driver = Driver.create();
      let btn04 = await driver.findComponent(ON.id('button04'));
      await (btn04?.longClick() as Promise<void>);
      await UtilsTest.msSleep(1000);
      let menu = await driver.findComponent(ON.id('menu'));
      await (menu?.click() as Promise<void>);
      await UtilsTest.msSleep(1000);
      let strJson4 = inspector.getInspectorByKey('text4');
      expect(JSON.parseJsonElement(strJson4).getElement('$attrs').getString('content')).assertEqual('');
      console.info('[' + tagName + '] END============================');
      done();
    });

    
    
/**
     * @tc.number   bindContextMenuHapticFeedbackModeTest_static_0500
     * @tc.name     bindContextMenuHapticFeedbackModeTest_static_0500
     * @tc.desc     bindContextMenuHapticFeedbackModeTest_static_0500
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1
     */
it('bindContextMenuHapticFeedbackModeTest_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let tagName = 'bindContextMenuHapticFeedbackModeTest_static_0500';
      console.info('[' + tagName + '] START============================');
      let driver = Driver.create();
      let btn05 = await driver.findComponent(ON.id('button05'));
      await (btn05?.longClick() as Promise<void>);
      await UtilsTest.msSleep(1000);
      let menu = await driver.findComponent(ON.id('menu'));
      await (menu?.click() as Promise<void>);
      await UtilsTest.msSleep(1000);
      let strJson5 = inspector.getInspectorByKey('text5');
      expect(JSON.parseJsonElement(strJson5).getElement('$attrs').getString('content')).assertEqual('null');
      console.info('[' + tagName + '] END============================');
      done();
    });

  })
}
