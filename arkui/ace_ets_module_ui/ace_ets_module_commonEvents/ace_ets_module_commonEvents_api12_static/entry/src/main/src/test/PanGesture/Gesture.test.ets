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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import {
  Component,
  DisplayRotation,
  Driver,
  MatchPattern,
  ON,
  PointerMatrix,
  ResizeDirection,
  UiWindow,
  WindowMode
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest } from '../Util.test'

let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;
const uiContext = new UIContext();


export default function typeNodeGestureTest() {
  describe('typeNodeGestureTest', () => {
    beforeAll(() => {
      
      await UtilsTest.startAbility("com.arkui.ace.commonEvents.api12.static", "EntryAbility")
      
    });
    beforeEach(async (): Promise<void> => {
      console.info("GestureTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/PanGesture/Gesture",
      }
      try {
        const router = AppStorage.get<Router>('router') as Router
        router.clear();
        let pages = router.getState();
        console.info("get GestureTest state pages: " + JSON.stringify(pages));
        if (!("Gesture" == pages.name)) {
          console.info("get GestureTest state pages.name: " + JSON.stringify(pages.name));
          // let result = await router.pushUrl(options);
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push GestureTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push GestureTest page error: " + err);
        expect().assertFail();
      }
      //done();
    });


    
    
/**
     * @tc.number   GestureTest_static_0100
     * @tc.name     GestureTest_static_0100
     * @tc.desc     GestureTest_static_0100
     * @tc.level    Level.LEVEL0
     */
it('GestureTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('GestureTest_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('gesture1'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('gesture');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[GestureTest_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('2');
      console.info('[GestureTest_0100] END');
      done();
    });
  })
}

