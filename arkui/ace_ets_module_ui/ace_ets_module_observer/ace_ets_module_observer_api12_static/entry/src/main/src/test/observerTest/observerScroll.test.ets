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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium"
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON,  MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector';

let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
export default function observerScrollTest() {
  describe('observerScrollTest', () => {
    beforeAll(() => {
      console.info("observerScrollTest beforeEach start");
      await UtilsTest.msSleep(4000);
      await UtilsTest.startAbility("com.arkui.ace.observer12.static", "EntryAbility");
      await UtilsTest.msSleep(4000);
    });
    beforeEach(async (): Promise<void> => {
      console.info("observerScrollTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/observer/observerScroll',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get observerScrollTest state pages: " + JSON.stringify(pages));
        if (!("observerScroll" == pages.name)) {
          console.info("get observerScrollTest state pages.name: " + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push observerScrollTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push observerScrollTest page error: " + err);
        expect().assertFail();
      }
    });
    
    
/**
     * @tc.number   observerScrollTest_static_0100
     * @tc.name     observerScrollTest_static_0100
     * @tc.desc     observerScrollTest_static_0100
     * @tc.level    Level.LEVEL0
     */
it('observerScrollTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('observerScrollTest_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let btn = await driver.findComponent(ON.id('scrollEvent_3'));
      await CommonFunc.sleep(500);
      await (btn?.click() as Promise<void>);
      console.log('observerScrollTest_0100 000')
      await CommonFunc.sleep(1000);
      let swiperAnimation = CommonFunc.getComponentRectOnScreen('scrollEvent_4');
      let top = swiperAnimation.top;
      let right = swiperAnimation.right;
      let left = swiperAnimation.left;
      let bottom = swiperAnimation.bottom;
      console.info("observerScrollTest_0100 value is" + left + " --" + right + "--" + top + "--" + bottom);
      let height = bottom -top;
      let width = right - left;
      await CommonFunc.sleep(1000);
      await (driver.swipe(Math.round(left + width*0.2) as int,Math.round(bottom - height/4) as int,Math.round(left + width*0.2) as int,Math.round(bottom - height/2) as int) as Promise<void>);
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('scrollEvent_1');
      let strJson1 = inspector.getInspectorByKey('scrollEvent_2');
      let obj = JSON.parseJsonElement(strJson);
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[observerScrollTest_0100] component obj is: " + JSON.stringify(obj));
      console.info("[observerScrollTest_0100] component obj1 is: " + JSON.stringify(obj1));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('message1:SCROLL_START');
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('message2:SCROLL_STOP');
      let btn1 = await driver.findComponent(ON.id('scrollEvent_5'));
      await CommonFunc.sleep(500);
      await (btn1?.click() as Promise<void>);
      await CommonFunc.sleep(1500);
      console.info('[observerScrollTest_0100] END');
      done();
    });
  })
}

