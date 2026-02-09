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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import {Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import {MessageManager,Callback} from '../../../ets/MainAbility/common/MessageManager';
import inspector from '@ohos.arkui.inspector';
import { Router } from '@ohos.arkui.UIContext';
import { Driver, ON } from '@ohos.UiTest';
import { AppStorage } from '@ohos.arkui.stateManagement';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import {UtilsTest} from '../Util.test'
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function columnMonopolize() {
  describe('columnMonopolize', () => {
    beforeAll(() => {
      
      await UtilsTest.startAbility("com.arkui.ace.commonEvents.api12.static", "EntryAbility")
      
    });
    beforeEach(async ():Promise<void> => {
      console.log("columnMonopolize beforeEach start");
      try {
        const router = AppStorage.get<Router>('router') as Router
        router.clear();
        let pages = router.getState();
        console.log("get columnMonopolize state pages:" + JSON.stringify(pages));
        if (!("columnMonopolize" == pages.name)) {
          console.log("get  columnMonopolize pages.name:" + JSON.stringify(pages.name));
          router.pushUrl({
            url: "MainAbility/pages/customGestureTest/columnMonopolize"
          })
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push columnMonopolize page error:" + err);
      }
      console.log("columnMonopolize foreEach end");
      //done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.log("columnMonopolize after each called");
    });

    

    
    
/**
     * @tc.number   columnMonopolize_static_001
     * @tc.name     columnMonopolize_static_001
     * @tc.desc     columnMonopolize_static_001
     * @tc.level    Level.LEVEL0
     */
it('columnMonopolize_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.log('[columnMonopolize_001] START');
      // get column left and top on screen
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let column2 = await driver.findComponent(ON.id('column2'));
      let column1 = await driver.findComponent(ON.id('column1'));

      await CommonFunc.sleep(200);
      await (column1?.longClick() as Promise<void>);
      await CommonFunc.sleep(1000);
      await (column2?.click() as Promise<void>);
      let strJson1 = inspector.getInspectorByKey('columnText');
      console.log("[columnMonopolize_001] component obj is: " , JSON.stringify(JSON.parseJsonElement(strJson1)));
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content')).assertEqual('LongPressGesture onAction success;');
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('buttonBoolean'));
      let button_clean = await driver.findComponent(ON.id('button_clean'));

      await (button_clean?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      // change the status of monopolize Attribute
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      await (column1?.longClick() as Promise<void>);
      await CommonFunc.sleep(1000);
      await (column2?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let strJson2 = inspector.getInspectorByKey('columnText');
      console.log("[columnMonopolize_001] component obj is: " , JSON.stringify(JSON.parseJsonElement(strJson2)));
      expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content')).assertEqual('LongPressGesture onAction success;TapGesture success');
      await CommonFunc.sleep(3000);
      await (button_clean?.click() as Promise<void>);
      console.log('[columnMonopolize_001] END');
      done();
    });
  })
}
