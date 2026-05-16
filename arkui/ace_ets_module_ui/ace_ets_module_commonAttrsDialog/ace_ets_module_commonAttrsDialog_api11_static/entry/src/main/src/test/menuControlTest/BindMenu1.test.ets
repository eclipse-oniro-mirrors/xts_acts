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
  // UiComponent,
  Driver,
  Component,
  UiWindow,
  ON,
  // BY,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import window from '@ohos.window';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement'
import  common  from '@ohos.app.ability.common';
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

export default function bindMenu() {
  describe('bindMenu', () => {
    beforeAll(() => {
      await UtilsTest.startAbility("com.arkui.ace.commonAttrsDialog.api11.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("bindMenu beforeEach start");
      let options: router.RouterOptions = {
        url:'MainAbility/pages/menuControl/BindMenu1',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get bindMenu state pages:" + JSON.stringify(pages));
        if (!("BindMenu1" == pages.name)) {
          console.info("get bindMenu pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push bindMenu page error:" + err);
      }
      console.info("bindMenu beforeEach end");
    });

        
    
    /**
     * @tc.number   bindMenu_static_0100
     * @tc.name     bindMenu_static_0100
     * @tc.desc     bindMenu_static_0100
     * @tc.level    Level.LEVEL0
     */
it('bindMenu_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('bindMenu_0100 START');
      let abilityStage=AppStorage.get<common.BaseContext>("abilityContext")
      let driver =  Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('bindMenu'));
       await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let windowClass: window.Window | undefined = undefined;
      windowClass = await window.getLastWindow(abilityStage as common.BaseContext);
      let properties: window.WindowProperties = windowClass.getWindowProperties();
      console.info("[bindMenu_0100] title: " + JSON.stringify(properties.type));

      let density = await driver.getDisplayDensity();
      console.log("[bindMenu_0100] density: " + JSON.stringify(density))
      console.log("[bindMenu_0100] density.x: " + JSON.stringify(density.x))
      expect(properties.type == 1 || properties.type == 0).assertTrue()

      await CommonFunc.sleep(1000);
       driver?.click(200, 200);
      await CommonFunc.sleep(1000);
      console.info('[bindMenu_0100] END');
      done();
    });
  })
}

