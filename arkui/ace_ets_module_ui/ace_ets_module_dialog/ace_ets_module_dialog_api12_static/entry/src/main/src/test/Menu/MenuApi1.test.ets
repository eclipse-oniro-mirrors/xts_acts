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
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility, stopApplication } from '../Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function MenuApi1() {
  describe('MenuApi1', () => {
    beforeAll(() => {
      await UtilsTest.startAbility("com.arkui.ace.dialog.api12.static", "EntryAbility")
    })

    beforeEach(async () => {
      console.info("MenuApi1 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Menu/MenuApi1',
      }
      try {
        const MenuApi1 = AppStorage.get<Router>("router") as Router
        MenuApi1.clear();
        let pages:router.RouterState = MenuApi1.getState();
        console.info("get MenuApi1 state pages: " + JSON.stringify(pages));
        if (!("MenuApi1" == pages.name)) {
          console.info("get MenuApi1 state pages.name: " + JSON.stringify(pages.name));
          MenuApi1.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
        let driver = Driver.create()
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.error("push MenuApi1 page error: " + err);
        expect().assertFail();
      }
    });


    afterEach(async () => {
    });

    
    
/**
     * @tc.number   MenuApi1_static_0100
     * @tc.name     MenuApi1_static_0100
     * @tc.desc     MenuApi1_static_0100
     * @tc.level    Level.LEVEL2
     */
it('MenuApi1_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('MenuApi1_static_0100 START');
      await CommonFunc.sleep(1000);

      if (AppStorage.get<number>("winLeft") == 0) {
        inspector.sendEventByKey('MenuApi1_btn1',10,"")
        await CommonFunc.sleep(1000);
        inspector.sendEventByKey('MenuApi1_btn2',10,"")
        await CommonFunc.sleep(1000);
        let text1 = inspector.getInspectorByKey('MenuApi1_text1');
        expect(JSON.parseJsonElement(text1).getElement('$attrs').getString('content')).assertEqual('undefined')
        await CommonFunc.sleep(1000);
      }

      console.info('MenuApi1_static_0100 END');
      done();
    });

  })
}