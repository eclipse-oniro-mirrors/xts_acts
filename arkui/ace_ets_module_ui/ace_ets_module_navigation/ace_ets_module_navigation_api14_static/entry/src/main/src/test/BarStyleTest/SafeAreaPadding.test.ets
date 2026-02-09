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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium';
import router from '@ohos.router';
import {Driver, Component, UiWindow, ON,  MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import {MessageManager,Callback} from '../../../ets/MainAbility/common/MessageManager';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import {UtilsTest, startAbility, stopApplication} from "../Util.test"
// import { vp2px } from '@ohos.arkui.component'
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
export default function SafeAreaPadding() {
  describe('SafeAreaPadding', () => {
    beforeAll(() => {
      console.info("SafeAreaPadding beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.navigation14.static", "EntryAbility");
      await UtilsTest.msSleep(4000);
    });
    beforeEach(async (): Promise<void> => {
      console.info("SafeAreaPadding beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/BarStyle/SafeAreaPadding',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get SafeAreaPadding state pages:" + JSON.stringify(pages));
        if (!("SafeAreaPadding" == pages.name)) {
          console.info("get SafeAreaPadding pages.name:" + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push SafeAreaPadding page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SafeAreaPadding page error:" + err);
      }
      console.info("SafeAreaPadding beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("SafeAreaPadding after each called");
    });


    
    

    /**
     * @tc.number   SafeAreaPadding_static_0100
     * @tc.name     SafeAreaPadding_static_0100
     * @tc.desc     SafeAreaPadding_static_0100
     * @tc.level    Level.LEVEL0
     */
it('SafeAreaPadding_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('SafeAreaPadding_0100 START');
      let uiContext =AppStorage.get<UIContext>('uiContext');
      await CommonFunc.sleep(1000);
      let navRect = CommonFunc.getComponentRect('BarStyle_SafeAreaPadding');
      console.info('navRect.top is' + navRect.top)
      let navContentRect = CommonFunc.getComponentRect('NavigationBarStyle_content2');
      console.info('navContentRect.top is' + navContentRect.top)
      expect(Number(Math.abs(Math.round(navRect.top - navContentRect.top) as int)- uiContext!.vp2px(112)) <= 1).assertTrue();
      console.info('SafeAreaPadding_0100 END');
      done();
    });
  })
}