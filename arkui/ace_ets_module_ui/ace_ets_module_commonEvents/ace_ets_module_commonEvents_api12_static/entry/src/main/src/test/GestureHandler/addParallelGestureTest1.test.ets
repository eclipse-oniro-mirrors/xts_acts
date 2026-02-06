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

import CommonFunc from '../../../ets/MainAbility/common/Common';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
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


export default function addParallelGestureTest1() {
  describe('addParallelGestureTest1', () => {
    beforeAll(() => {
      
      await UtilsTest.startAbility("com.arkui.ace.commonEvents.api12.static", "EntryAbility")
      
    });
    beforeEach(async ():Promise<void> => {
      console.info("addParallelGestureTest1 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/GestureHandler/addParallelGestureTest1',
      }
      try {
        const router = AppStorage.get<Router>('router') as Router
        router.clear();
        let pages = router.getState();
        console.info("get addParallelGestureTest1 state pages:" + JSON.stringify(pages));
        if (!("addParallelGestureTest1" == pages.name)) {
          console.info("get addParallelGestureTest1 pages.name:" + JSON.stringify(pages.name));
          // let result = await router.pushUrl(options);
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push addParallelGestureTest1 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push addParallelGestureTest1 page error:" + err);
      }
      console.info("addParallelGestureTest1 beforeEach end");
      //done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("addParallelGestureTest1 after each called");
    });


    
    
    
/**
     * @tc.number   addParallelGestureTest1_static_0100
     * @tc.name     addParallelGestureTest1_static_0100
     * @tc.desc     addParallelGestureTest1_static_0100
     * @tc.level    Level.LEVEL0
     */
it('addParallelGestureTest1_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('addParallelGestureTest1_0100 START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let text = await driver.findComponent(ON.id('addParallelGestureTest1_text'));
      await (text?.click() as Promise<void>)
      console.info("[addParallelGestureTest1_0100] text");
      await CommonFunc.sleep(2000);

      let btn2 = await driver.findComponent(ON.id('addParallelGestureTest1_get'));
      await (btn2?.click() as Promise<void>)
      console.info("[addParallelGestureTest1_0100] btn2");
      await CommonFunc.sleep(1000);

      let strJson1 = inspector.getInspectorByKey('addParallelGestureTest1_text');
      let obj1 = JSON.parseJsonElement(strJson1);
      await CommonFunc.sleep(1000);
      console.info("[addParallelGestureTest1_0100] obj1 is: " + JSON.stringify(obj1));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('columnTap');

      console.info('addParallelGestureTest1_0100 END');
      done();
    });



  })
}