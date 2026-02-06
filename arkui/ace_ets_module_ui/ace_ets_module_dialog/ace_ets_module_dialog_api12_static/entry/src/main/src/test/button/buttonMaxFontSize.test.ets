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
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility, stopApplication } from '../Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function buttonMaxFontSize() {
  describe('buttonMaxFontSize', () => {
    beforeAll(() => {
      await UtilsTest.startAbility("com.arkui.ace.dialog.api12.static", "EntryAbility")
    })
    
    beforeEach(async () => {
      console.info("buttonMaxFontSize beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/button/buttonMaxFontSize',
      }
      try {
        const buttonMaxFontSize = AppStorage.get<Router>("router") as Router
        buttonMaxFontSize.clear();
        let pages:router.RouterState = buttonMaxFontSize.getState();
        console.info("get buttonMaxFontSize state pages: " + JSON.stringify(pages));
        if (!("buttonMaxFontSize" == pages.name)) {
          console.info("get buttonMaxFontSize state pages.name: " + JSON.stringify(pages.name));
          buttonMaxFontSize.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
        let driver = Driver.create()
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.error("push buttonMaxFontSize page error: " + err);
        expect().assertFail();
      }
    });
    
    
/**
     * @tc.number   buttonMaxFontSize_static_0100
     * @tc.name     buttonMaxFontSize_static_0100
     * @tc.desc     buttonMaxFontSize_static_0100
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
it('buttonMaxFontSize_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('buttonMaxFontSize_static_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      
      let strJson = inspector.getInspectorByKey('button1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[buttonMaxFontSize_static_0100] title1: " + JSON.parseJsonElement(obj.getElement('$attrs').getString('labelStyle')));
      expect(JSON.parseJsonElement(obj.getElement('$attrs').getString('labelStyle')).getString('maxFontSize')).assertEqual("12.00fp");
      console.info('[buttonMaxFontSize_static_0100] END');
      done();
    });

    
    
/**
     * @tc.number   buttonMaxFontSize_static_0200
     * @tc.name     buttonMaxFontSize_static_0200
     * @tc.desc     buttonMaxFontSize_static_0200
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
it('buttonMaxFontSize_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('buttonMaxFontSize_static_0200 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      
      let strJson = inspector.getInspectorByKey('button2');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[buttonMaxFontSize_static_0200] title1: " + JSON.parseJsonElement(obj.getElement('$attrs').getString('labelStyle')));
      expect(JSON.parseJsonElement(obj.getElement('$attrs').getString('labelStyle')).getString('maxFontSize')).assertEqual("12.00fp");
      console.info('[buttonMaxFontSize_static_0200] END');
      done();
    });
    
    
/**
     * @tc.number   buttonMaxFontSize_static_0300
     * @tc.name     buttonMaxFontSize_static_0300
     * @tc.desc     buttonMaxFontSize_static_0300
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
it('buttonMaxFontSize_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('buttonMaxFontSize_static_0300 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      
      let strJson = inspector.getInspectorByKey('button3');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[buttonMaxFontSize_static_0300] title1: " + JSON.parseJsonElement(obj.getElement('$attrs').getString('labelStyle')));
      expect(JSON.parseJsonElement(obj.getElement('$attrs').getString('labelStyle')).getString('maxFontSize')).assertEqual("12.00fp");
      console.info('[buttonMaxFontSize_static_0300] END');
      done();
    });
    
  })
}