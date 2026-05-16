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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import {
  Component,
  Driver,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test'
import { UtilsTest, startAbility, stopApplication } from '../Util.test';

let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function TouchTestStrategy() {
  describe('TouchTestStrategy', () => {
    beforeAll(() => {

      
      await UtilsTest.startAbility("com.arkui.ace.scroll.static", "EntryAbility")
      
    });
    beforeEach(async (): Promise<void> => {
      console.info("TouchTestStrategy beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Scroll/TouchTestStrategy',
      }
      try {
        const routerAlp = AppStorage.get<Router>("router") as Router
        routerAlp.clear();
        let pages = routerAlp.getState();
        console.info("get TouchTestStrategy state pages: " + JSON.stringify(pages));
        if (!("TouchTestStrategy" == pages.name)) {
          console.info("get TouchTestStrategy state pages.name: " + JSON.stringify(pages.name));
          // let result = await routerAlp.pushUrl(options);
          routerAlp.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push TouchTestStrategy success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TouchTestStrategy page error: " + err);
        expect().assertFail();
      }
    });


    
    /**
     * @tc.number   TouchTestStrategy_static_0100
     * @tc.name     TouchTestStrategy_static_0100
     * @tc.desc     TouchTestStrategy_static_0100
     * @tc.level    Level.LEVEL0
     */
it('TouchTestStrategy_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('TouchTestStrategy_static_0100 START');
      await CommonFunc.sleep(1000);
      let gridTop = CommonFunc.getComponentRect('border_TouchStrategy');
      let top = gridTop.top
      let gridBottom = CommonFunc.getComponentRect('border_TouchStrategy');
      let bottom = gridBottom.bottom
      let driver = Driver.create()
      const uiContext = AppStorage.get<UIContext>('uiContext')!;
      await driver.swipe((Math.round((AppStorage.get<number>("winLeft") ?? 0) + uiContext.vp2px(100))).toInt(),
        (Math.round((AppStorage.get<number>("winTop") ?? 0) + top + uiContext.vp2px(80))).toInt(),
        (Math.round((AppStorage.get<number>("winLeft") ?? 0) + uiContext.vp2px(100))).toInt(),
        (Math.round((AppStorage.get<number>("winTop") ?? 0) + top + uiContext.vp2px(10))).toInt());
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('listText_TouchStrategy');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[TouchTestStrategy_static_0100] component obj is: " + JSON.stringify(obj));
      console.info("[TouchTestStrategy_static_0100] text: " +
      JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('Test Text is completely invisible');
      console.info('[Touch_static_0100] END');
      done();
    });

  })
}