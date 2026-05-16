'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router,UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import deviceInfo from "@ohos.deviceInfo"
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility, stopApplication } from '../Util.test';
export default function UIUtilsMakeBindingTest() {
  describe('UIUtilsMakeBindingTest', () => {
    beforeAll(async (): Promise<void> => {

      await UtilsTest.startAbility("com.arkui.ace.StateMangagement.api12.static", "EntryAbility")

    })
    beforeEach(async (): Promise<void> => {
      console.info("UIUtilsMakeBindingTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/UIUtils/UIUtilsMakeBindingPage",
      }
      try {
        const UIUtilsMakeBindingTest = AppStorage.get<Router>("router") as Router
        UIUtilsMakeBindingTest.clear();
        let pages:router.RouterState = UIUtilsMakeBindingTest.getState();
        console.info("get UIUtilsMakeBindingTest state pages: " + JSON.stringify(pages));
        if (!("UIUtilsMakeBindingPage" == pages.name)) {
          console.info("get UIUtilsMakeBindingTest state pages.name: " + JSON.stringify(pages.name));
          UIUtilsMakeBindingTest.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push UIUtilsMakeBindingTest page error:" + err);
      }
      console.info("UIUtilsMakeBindingTest beforeEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("UIUtilsMakeBindingTest after each called");
    });

    /**
     * @tc.number   SUB_ARKUI_UIUTILS_MAKEBINDING_PATH_0100
     * @tc.name     SUB_ARKUI_UIUTILS_MAKEBINDING_PATH_0100
     * @tc.desc     UIUtilsMakeBindingTest_static_001
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ARKUI_UIUTILS_MAKEBINDING_PATH_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[UIUtilsMakeBindingTest_001] START');
      let driver = Driver.create();
      await CommonFunc.sleep(2000);

      let strJsonNew0 = inspector.getInspectorByKey('ReadOnlyBindingText');
      console.info(' UIUtilsMakeBindingTest_static_001 text is: ' + JSON.stringify(JSON.parseJsonElement(strJsonNew0)
        .getElement('$attrs')
        .getString('content')));
      expect(JSON.parseJsonElement(strJsonNew0).getElement('$attrs').getString('content')).assertEqual('ReadOnly Binding: 10');

      let strJsonNew1 = inspector.getInspectorByKey('MutableBindingText');
      console.info(' UIUtilsMakeBindingTest_static_001 MutableBindingText is: ' + JSON.stringify(JSON.parseJsonElement(strJsonNew1)
        .getElement('$attrs')
        .getString('content')));
      expect(JSON.parseJsonElement(strJsonNew1).getElement('$attrs').getString('content')).assertEqual('Mutable Binding: 20');

      let btn_true = await driver.findComponent(ON.id('ModifyMutableBindingBtn'));
      await (btn_true?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      strJsonNew1 = inspector.getInspectorByKey('MutableBindingText');
      console.info(' UIUtilsMakeBindingTest_static_001 MutableBindingText is: ' + JSON.stringify(JSON.parseJsonElement(strJsonNew1)
        .getElement('$attrs')
        .getString('content')));
      expect(JSON.parseJsonElement(strJsonNew1).getElement('$attrs').getString('content')).assertEqual('Mutable Binding: 21');


      console.info('[UIUtilsMakeBindingTest_001] END');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_UIUTILS_MAKEBINDING_PATH_0200
     * @tc.name     SUB_ARKUI_UIUTILS_MAKEBINDING_PATH_0200
     * @tc.desc     UIUtilsMakeBindingTest_static_002
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ARKUI_UIUTILS_MAKEBINDING_PATH_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[UIUtilsMakeBindingTest_002] START');
      let driver = Driver.create();
      await CommonFunc.sleep(2000);

      let btn_true = await driver.findComponent(ON.id('MutableVariableButton'));
      await (btn_true?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let strJsonNew1 = inspector.getInspectorByKey('MutableVariableText');
      console.info(' UIUtilsMakeBindingTest_static_002 MutableVariableText is: ' + JSON.stringify(JSON.parseJsonElement(strJsonNew1)
        .getElement('$attrs')
        .getString('content')));
      expect(JSON.parseJsonElement(strJsonNew1).getElement('$attrs').getString('content')).assertEqual('Hello world!');


      console.info('[UIUtilsMakeBindingTest_002] END');
      done();
    });
  })
}
