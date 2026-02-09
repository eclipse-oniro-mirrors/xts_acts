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
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function buttonTypeTest() {
  describe('buttonTypeTest', () => {
    beforeAll(() => {

      
      await UtilsTest.startAbility("com.arkui.ace.dialog.api15.static", "EntryAbility")
      
    })

    beforeEach(async () => {
      console.info("buttonTypeTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/buttonType/buttonTypeTest',
      }
      try {
        const buttonTypeTest = AppStorage.get<Router>("router") as Router
        buttonTypeTest.clear();
        let pages:router.RouterState = buttonTypeTest.getState();
        console.info("get buttonTypeTest state pages: " + JSON.stringify(pages));
        if (!("buttonTypeTest" == pages.name)) {
          console.info("get buttonTypeTest state pages.name: " + JSON.stringify(pages.name));
          // let result = await buttonTypeTest.pushUrl(options);
          buttonTypeTest.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push buttonTypeTest success: " + JSON.stringify(result));
        }
        let driver = Driver.create()
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.error("push buttonTypeTest page error: " + err);
        expect().assertFail();
      }
    });


   
    
    

/**
     * @tc.number   buttonTypeTest_static_0100
     * @tc.name     buttonTypeTest_static_0100
     * @tc.desc     buttonTypeTest_static_0100
     * @tc.level    Level.LEVEL1
     */
it('buttonTypeTest_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('buttonTypeTest_static_0100 START');
      await CommonFunc.sleep(1000);
      let btn = inspector.getInspectorByKey('btn');
      console.info("buttonTypeTest_static_0100 component obj is: " + JSON.stringify(btn));
      console.info("[buttonTypeTest_static_0100] title: " + JSON.stringify(JSON.parseJsonElement(btn).getElement('$attrs').getString('type')));
      expect(JSON.stringify(JSON.parseJsonElement(btn).getElement('$attrs').getString('type'))).assertEqual('"ButtonType.ROUNDED_RECTANGLE"');
      console.info('buttonTypeTest_static_0100 END');
      done();
    });
  
  })
}