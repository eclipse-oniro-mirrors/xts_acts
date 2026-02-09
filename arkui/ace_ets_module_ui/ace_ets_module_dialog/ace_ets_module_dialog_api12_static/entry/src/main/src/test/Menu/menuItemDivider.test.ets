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

export default function menuItemDivider() {
  describe('menuItemDivider', () => {
    beforeAll(() => {
      await UtilsTest.startAbility("com.arkui.ace.dialog.api12.static", "EntryAbility")
    })
    beforeEach(async (): Promise<void> => {
      console.log('menuItemDivider beforeEach start');
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info(`get menuItemDivider state pages:${JSON.stringify(pages)}`);
        if ('menuItemDivider' !== pages.name) {
          console.info(`get menuItemDivider state pages:${JSON.stringify(pages.name)}`);
          routerInstance.pushUrl({url:'MainAbility/pages/Menu/menuItemDivider'})
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.info(`push menuItemDivider myPage error:${err}`);
      }
      console.info('menuItemDivider forEach end');
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('menuItemDivider after each called');
    });

    

    
/**
     * @tc.number   menuItemDivider_static_0100
     * @tc.name     menuItemDivider_static_0100
     * @tc.desc     menuItemDivider_static_0100
     * @tc.level    Level.LEVEL2
     */
it('menuItemDivider_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[menuItemDivider_0100] START');

      await CommonFunc.sleep(1000);
      let myJson = inspector.getInspectorByKey('menuItemDividerText');
      console.info(`[menuItemDivider_0100] component obj1 is:${JSON.stringify(myJson)}`);
      await CommonFunc.sleep(200);
      let obj1 = JSON.parseJsonElement(myJson);
      console.info(`[menuItemDivider_0100] component obj1 is:${JSON.stringify(obj1)}`);
      await CommonFunc.sleep(1000);

      expect(obj1.getElement('$attrs').getElement('itemDivider').getString('strokeWidth')).assertEqual('1.50vp');
      console.info('[menuItemDivider_0100] END');
      done();
    });

    

    
/**
     * @tc.number   menuItemDivider_static_0200
     * @tc.name     menuItemDivider_static_0200
     * @tc.desc     menuItemDivider_static_0200
     * @tc.level    Level.LEVEL2
     */
it('menuItemDivider_static_0200', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[menuItemDivider_0200] START');

      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('menuItemDividerText');
      await CommonFunc.sleep(200);
      let obj = JSON.parseJsonElement(strJson);
      console.info(`[menuItemDivider_0200] component obj is:${JSON.stringify(obj)}`);
      await CommonFunc.sleep(1000);

      expect(obj.getElement('$attrs').getElement('itemDivider').getString('color')).assertEqual('#FFFFC0CB');
      console.info('[menuItemDivider_0200] END');
      done();
    });

    

    
/**
     * @tc.number   menuItemDivider_static_0300
     * @tc.name     menuItemDivider_static_0300
     * @tc.desc     menuItemDivider_static_0300
     * @tc.level    Level.LEVEL2
     */
it('menuItemDivider_static_0300', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[menuItemDivider_0300] START');

      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('menuItemDividerText');
      await CommonFunc.sleep(200);
      let obj = JSON.parseJsonElement(strJson);
      console.info(`[menuItemDivider_0300] component obj is:${JSON.stringify(obj)}`);
      await CommonFunc.sleep(1000);

      expect(obj.getElement('$attrs').getElement('itemDivider').getString('startMargin')).assertEqual('1.50vp');
      console.info('[menuItemDivider_0300] END');
      done();
    });

    

    
/**
     * @tc.number   menuItemDivider_static_0400
     * @tc.name     menuItemDivider_static_0400
     * @tc.desc     menuItemDivider_static_0400
     * @tc.level    Level.LEVEL2
     */
it('menuItemDivider_static_0400', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[menuItemDivider_0400] START');

      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('menuItemDividerText');
      await CommonFunc.sleep(200);
      let obj = JSON.parseJsonElement(strJson);
      console.info(`[menuItemDivider_0400] component obj is:${JSON.stringify(obj)}`);
      await CommonFunc.sleep(1000);

      expect(obj.getElement('$attrs').getElement('itemDivider').getString('endMargin')).assertEqual('1.50vp');
      console.info('[menuItemDivider_0400] END');
      done();
    });

  })
}