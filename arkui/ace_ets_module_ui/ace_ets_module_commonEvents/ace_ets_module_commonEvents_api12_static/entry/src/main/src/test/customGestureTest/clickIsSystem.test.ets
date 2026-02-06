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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import {
  Component,
  Driver,
  MouseButton,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { Driver, ON } from '@ohos.UiTest';
import {UtilsTest} from '../Util.test'
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
const uiContext = new UIContext();


export default function clickIsSystem() {
  describe('clickIsSystem', () => {
    beforeAll(() => {
      
      await UtilsTest.startAbility("com.arkui.ace.commonEvents.api12.static", "EntryAbility")
      
    });
    beforeEach(async ():Promise<void> => {
      console.info("clickIsSystem beforeEach start");
      try {
        const router = AppStorage.get<Router>('router') as Router
        router.clear();
        let pages = router.getState();
        console.info("get clickIsSystem state pages:" + JSON.stringify(pages));
        if (!("clickIsSystem" == pages.name)) {
          console.info("get  clickIsSystem pages.name:" + JSON.stringify(pages.name));
          router.pushUrl({
            url: "MainAbility/pages/customGestureTest/clickIsSystem"
          })
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push clickIsSystem page error:" + err);
      }
      console.info("clickIsSystem foreEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("clickIsSystem after each called");
    });

    

    
    
/**
     * @tc.number   clickIsSystem_static_001
     * @tc.name     clickIsSystem_static_001
     * @tc.desc     clickIsSystem_static_001
     * @tc.level    Level.LEVEL0
     */
it('clickIsSystem_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[clickIsSystem_001] START');
      await CommonFunc.sleep(200);
      let driver = Driver.create();
      let button1 = await driver.findComponent(ON.id("clickButtonIsSystem"));
      console.info('[clickIsSystem_001] 3');
      await (button1?.click() as Promise<void>);
      console.info('[clickIsSystem_001] 4');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey("clickIsSystemBtn2");
      await CommonFunc.sleep(200);
      console.info("[clickIsSystem_001] component obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')).assertEqual('isSystem is true');
      await CommonFunc.sleep(1000);
      console.info('[clickIsSystem_001] END');
      done();
    });
  })
}
