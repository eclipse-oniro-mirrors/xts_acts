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

export default function previewBorderRadius() {
  describe('bindContextMenuPreviewBorderRadius', () => {
    beforeAll(() => {

      
      await UtilsTest.startAbility("com.arkui.ace.dialog.static", "EntryAbility")
      
    })

    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/bindContextMenu/previewBorderRadius',
      }
      try {
        const DialogOptions = AppStorage.get<Router>("router") as Router
        DialogOptions.clear();
        let pages = DialogOptions.getState();
        console.info('get bindContextMenuPreviewBorderRadius state success ' + JSON.stringify(pages));
        if (!('previewBorderRadius' == pages.name)) {
          console.info('get bindContextMenuPreviewBorderRadius state success ' + JSON.stringify(pages.name));
          DialogOptions.pushUrl(options)
          console.info('push bindContextMenuPreviewBorderRadius page success ');
        }
      } catch (err) {
        console.error('push bindContextMenuPreviewBorderRadius page error ' + JSON.stringify(err));
      }
    });

    
    
/**
     * @tc.number   BindContextMenu_previewBorderRadius_static_001
     * @tc.name     BindContextMenu_previewBorderRadius_static_001
     * @tc.desc     BindContextMenu_previewBorderRadius_static_001
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1
     */
it('BindContextMenu_previewBorderRadius_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let tagName = 'BindContextMenu_previewBorderRadius_static_001';
      console.info('[' + tagName + '] START============================');
      await UtilsTest.msSleep(1000);
      let driver = Driver.create();
      let menu_1 = await driver.findComponent(ON.id('menu_1'));
      await (menu_1?.longClick() as Promise<void>);
      await UtilsTest.msSleep(1000);
      let strJson2 = inspector.getInspectorByKey('text1');
      expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content')).assertEqual('20');
      let btn1 = await driver.findComponent(ON.text('菜单选项'));
      await (btn1?.click() as Promise<void>);
      console.info('[' + tagName + '] END============================');
      done();
    });
    
    
/**
     * @tc.number   BindContextMenu_previewBorderRadius_static_002
     * @tc.name     BindContextMenu_previewBorderRadius_static_002
     * @tc.desc     BindContextMenu_previewBorderRadius_static_002
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1
     */
it('BindContextMenu_previewBorderRadius_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let tagName = 'BindContextMenu_previewBorderRadius_static_002';
      console.info('[' + tagName + '] START============================');
      await UtilsTest.msSleep(1000);
      let driver = Driver.create();
      let menu_2 = await driver.findComponent(ON.id('menu_2'));
      await (menu_2?.longClick() as Promise<void>);
      await UtilsTest.msSleep(1000);
      let strJson2 = inspector.getInspectorByKey('text2');
      expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content')).assertEqual('16');
      let btn1 = await driver.findComponent(ON.text('菜单选项'));
      await (btn1?.click() as Promise<void>);
      console.info('[' + tagName + '] END============================');
      done();
    });
    
    
/**
     * @tc.number   BindContextMenu_previewBorderRadius_static_003
     * @tc.name     BindContextMenu_previewBorderRadius_static_003
     * @tc.desc     BindContextMenu_previewBorderRadius_static_003
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1
     */
it('BindContextMenu_previewBorderRadius_static_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let tagName = 'BindContextMenu_previewBorderRadius_static_003';
      console.info('[' + tagName + '] START============================');
      await UtilsTest.msSleep(1000);
      let driver = Driver.create();
      let menu_3 = await driver.findComponent(ON.id('menu_3'));
      await (menu_3?.longClick() as Promise<void>);
      await UtilsTest.msSleep(1000);
      let strJson2 = inspector.getInspectorByKey('text3');
      expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content')).assertEqual('16');
      let btn1 = await driver.findComponent(ON.text('菜单选项'));
      await (btn1?.click() as Promise<void>);
      console.info('[' + tagName + '] END============================');
      done();
    });
  })
}