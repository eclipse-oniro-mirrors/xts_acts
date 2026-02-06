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

export default function menuItemGroupDivider() {
  describe('menuItemGroupDivider', () => {
    beforeAll(() => {
      await UtilsTest.startAbility("com.arkui.ace.dialog.api12.static", "EntryAbility")
    })
    beforeEach(async (): Promise<void> => {
      console.info("menuItemGroupDivider beforeEach start");
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get menuItemGroupDivider state pages:" + JSON.stringify(pages));
        if (!("menuItemGroupDivider" == pages.name)) {
          console.info("get  menuItemGroupDivider pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl({url:"MainAbility/pages/Menu/menuItemGroupDivider"})
          await CommonFunc.sleep(2000);
          console.info("push menuItemGroupDivider page success");
        }
      } catch (err) {
        console.error("push menuItemGroupDivider page error:" + err);
      }
      console.info("menuItemGroupDivider foreEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("menuItemGroupDivider after each called");
    });

    

    
/**
     * @tc.number   menuItemGroupDivider_static_001
     * @tc.name     menuItemGroupDivider_static_001
     * @tc.desc     menuItemGroupDivider_static_001
     * @tc.level    Level.LEVEL2
     */
it('menuItemGroupDivider_static_001', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[menuItemGroupDivider_001] START');

      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('menuItemGroupDividerText');
      await CommonFunc.sleep(200);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[menuItemGroupDivider_001] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);

      expect(obj.getElement('$attrs').getElement('itemGroupDivider').getString('strokeWidth')).assertEqual('50.00vp');
      console.info('[menuItemGroupDivider_001] END');
      done();
    });

    

    
/**
     * @tc.number   menuItemGroupDivider_static_002
     * @tc.name     menuItemGroupDivider_static_002
     * @tc.desc     menuItemGroupDivider_static_002
     * @tc.level    Level.LEVEL2
     */
it('menuItemGroupDivider_static_002', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[menuItemGroupDivider_002] START');

      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('menuItemGroupDividerText');
      await CommonFunc.sleep(200);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[menuItemGroupDivider_002] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);

      expect(obj.getElement('$attrs').getString('subMenuExpandingMode')).assertEqual('SubMenuExpandingMode.SIDE');
      console.info('[menuItemGroupDivider_002] END');
      done();
    });




  })
}
