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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import {Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Driver, ON } from '@ohos.UiTest';
import {MessageManager,Callback} from '../../../ets/MainAbility/common/MessageManager';
import inspector from '@ohos.arkui.inspector';
import { Router } from '@ohos.arkui.UIContext';
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
const uiContext = new UIContext();


export default function UIContextDragControllerTest() {

  describe('UIContextDragControllerTest', () => {
    beforeAll(() => {
      
      await UtilsTest.startAbility("com.arkui.ace.commonEvents.api12.static", "EntryAbility")
      
    });
    beforeEach(async ():Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/DragController/UIContextDragController',
      }
      try {
        const router = AppStorage.get<Router>('router') as Router
        router.clear();
        let pages = router.getState();
        console.info("get UIContextDragController state pages: " + JSON.stringify(pages));
        if (!("UIContextDragController" == pages.name)) {
          console.info("get UIContextDragController state pages.name: " + JSON.stringify(pages.name));
          // let result = await router.pushUrl(options);
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push UIContextDragController success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push UIContextDragController page error: " + err);
        expect().assertFail();
      }
      //done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("UIContextDragController after each called");
    });

    
    
    
/**
     * @tc.number   UIContextDragController_static_0010
     * @tc.name     UIContextDragController_static_0010
     * @tc.desc     UIContextDragController_static_0010
     * @tc.level    Level.LEVEL0
     */
it('UIContextDragController_static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('UIContextDragController_0010 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let grid = await driver.findComponent(ON.id('UIContextDragController1'));
      let button = await driver.findComponent(ON.id('UIContextDragController2'));
      await (grid?.dragTo(button!) as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('UIContextDragController2');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[UIContextDragController_0010] dragPreviewOptions: " + JSON.stringify(obj));
      console.info("[UIContextDragController_0010] dragPreviewOptions: " + JSON.stringify(obj.getElement('$attrs')));
      expect(obj.getElement('$attrs').getElement('label')).assertEqual('Drag Success');
      console.info('[UIContextDragController_0010] END');
      done();
    });
  })
}
