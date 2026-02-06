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
import { Driver, ON } from '@ohos.UiTest';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import {Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
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


export default function SwiperGestureHandlerTest() {

  describe('SwiperGestureHandlerTest', () => {
    beforeAll(() => {
      
      await UtilsTest.startAbility("com.arkui.ace.commonEvents.api12.static", "EntryAbility")
      
    });
    beforeEach(async ():Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/GestureHandler/SwiperGestureHandler',
      }
      try {
        const router = AppStorage.get<Router>('router') as Router
        router.clear();
        let pages = router.getState();
        console.info("get SwiperGestureHandler state pages: " + JSON.stringify(pages));
        if (!("SwiperGestureHandler" == pages.name)) {
          console.info("get SwiperGestureHandler state pages.name: " + JSON.stringify(pages.name));
          // let result = await router.pushUrl(options);
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push SwiperGestureHandler success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SwiperGestureHandler page error: " + err);
        expect().assertFail();
      }
      //done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("SwiperGestureHandler after each called");
    });

    
    
    
/**
     * @tc.number   SwiperGestureHandler_static_0010
     * @tc.name     SwiperGestureHandler_static_0010
     * @tc.desc     SwiperGestureHandler_static_0010
     * @tc.level    Level.LEVEL0
     */
it('SwiperGestureHandler_static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SwiperGestureHandler_0010 START');
      let driver = Driver.create()
      await CommonFunc.sleep(500);
      let colum = CommonFunc.getComponentRectOnScreen('SwiperGestureHandlerColumn');
      let top = colum.top
      let bottom = colum.bottom
      let left = colum.left
      let right = colum.right
      await ((driver.swipe(Math.round(left + 100) as Int, Math.round((top + bottom) / 2) as Int,
        Math.round(right - 100) as Int, Math.round((top + bottom) / 2) as Int)) as Promise<void>);
      
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('SwiperGestureHandler1');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getElement('label')).assertEqual('swiper succ');
      console.info('[SwiperGestureHandler_0010] END');
      done();
    });
  })
}
