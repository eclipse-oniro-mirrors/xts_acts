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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect,Level } from "../../../../hypium/index"
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import {MessageManager,Callback} from '../../../ets/MainAbility/common/MessageManager';
import router from '@ohos.router';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function GridCallbackJsunit() {
  describe('GridCallbackJsunit', () => {
    beforeAll(() => {
           
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.layout.split05.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("GridCallbackJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Grid/GridCallbackPage',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get GridCallbackJsunit state pages: " + JSON.stringify(pages));
        if (!("GridCallbackPage" == pages.name)) {
          console.info("get GridCallbackJsunit state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push GridCallbackJsunit page error: " + err);
      }
    });
    
    
    

/**
     * @tc.number   GridCallbackJsunit_static_1000
     * @tc.name     GridCallbackJsunit_static_1000
     * @tc.desc     GridCallbackJsunit_static_1000
     * @tc.level    Level.LEVEL0
     */
it('GridCallbackJsunit_static_1000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      
      console.info('[GridCallbackJsunit_static_1000] START');

      let grid2 = CommonFunc.getComponentRectOnScreen('grid2');
      let top = grid2.top
      let bottom = grid2.bottom
      let left = grid2.left
      let right = grid2.right
      let width = right - left
      let height = bottom -top
      console.log('[GridCallbackJsunit_static_1000] grid 2 top:' + top +" bottom:" + bottom + "left: " + left + " right:" + right)
      let driver = Driver.create()
      driver.swipe((Math.round((left + width/2))).toInt(), (Math.round(top + height * 0.6)).toInt(), (Math.round((left + width/2))).toInt(), (Math.round(top + height * 0.1)).toInt());
      await CommonFunc.sleep(2000);
      let onReachStartText = await (driver!.findComponent(ON.id('onReachStartText')) as Promise<Component>);

      let text5 = await (onReachStartText?.getText() as Promise<string>);
      console.info('[GridCallbackJsunit_static_1000] onReachStartText' + text5);
      expect(text5).assertEqual('onReachStart:succ');
      await CommonFunc.sleep(200);

      let onScrollText = await driver.findComponent(ON.id('onScrollText'));
      let text3 = await (onScrollText?.getText() as Promise<string>);
      console.info('[GridCallbackJsunit_static_1000] onScrollText' + text3);
      expect(text3).assertEqual('onScroll:succ');

      let onScrollIndexText = await driver.findComponent(ON.id('onScrollIndexText'));
      let text2 = await (onScrollIndexText?.getText() as Promise<string>);
      console.info('[GridCallbackJsunit_static_1000] onScrollIndexText' + text2);
      expect(text2).assertEqual('onScrollIndex:succ');

      let onScrollStartText = await driver.findComponent(ON.id('onScrollStartText'));
      let text4 = await (onScrollStartText?.getText() as Promise<string>);
      console.info('[GridCallbackJsunit_static_1000] onScrollStartText' + text4);
      expect(text4).assertEqual('onScrollStart:succ');
      await CommonFunc.sleep(200);


      let onScrollStopText = await driver.findComponent(ON.id('onScrollStopText'));
      let text6 = await (onScrollStopText?.getText() as Promise<string>);
      console.info('[GridCallbackJsunit_static_1000] onScrollStopText' + text6);
      expect(text6).assertEqual('onScrollStop:succ');
      await CommonFunc.sleep(200);

      let onScrollFrameBeginText = await driver.findComponent(ON.id('onScrollFrameBeginText'));
      let text7 = await (onScrollFrameBeginText?.getText() as Promise<string>);
      console.info('[GridCallbackJsunit_static_1000] nScrollFrameBeginText ' + text7);
      expect(text7).assertEqual('onScrollFrameBegin:succ');
      await CommonFunc.sleep(200);

      let bottomButton = await driver.findComponent(ON.id('bottom'));
      await (bottomButton?.click() as Promise<void>)
      await CommonFunc.sleep(2000)
      let onReachEndText = await driver.findComponent(ON.id('onReachEndText'));
      let text9 = await (onReachEndText?.getText() as Promise<string>);
      console.info("[GridCallbackJsunit_static_1000] onReachEndText: " + text9);

      expect(text9).assertEqual('onReachEnd:succ');
      await CommonFunc.sleep(1000);

      console.info('[GridCallbackJsunit_static_1000] END');
      done();
    });
  })
}
