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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '../../../../../hypium/index'
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
import CommonFunc from '../../../../ets/MainAbility/common/Common';
import router from '@ohos.router';
import { Callback, MessageManager } from '../../../../ets/MainAbility/utils/MessageManager';
import window from '@ohos.window';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import inspector from '@ohos.arkui.inspector'
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement'
import common from '@ohos.app.ability.common';
import { UtilsTest } from '../../Util.test'

let abilityStage = AppStorage.get<common.BaseContext>("abilityContext")


export default function IsShowFalse() {
  describe('IsShowFalse', () => {
    beforeAll(async (): Promise<void> => {
      console.info("assemblyCallbackTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.commonAttrsDialog.api12.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("IsShowFalse beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/menuControl/bindContextMenu/IsShowFalse',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get IsShowFalse state pages: " + JSON.stringify(pages));
        if (!("IsShowFalse" == pages.name)) {
          console.info("get IsShowFalse state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push IsShowFalse page error: " + err);
      }

    });
    
    
    /**
     * @tc.number   IsShowFalse_static_0100
     * @tc.name     IsShowFalse_static_0100
     * @tc.desc     IsShowFalse_static_0100
     * @tc.level    Level.LEVEL0
     */
it('IsShowFalse_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('IsShowFalse_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('IsShowFalse'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      driver?.click(200, 200);
      await CommonFunc.sleep(1000);

      let windowClass: window.Window | undefined = undefined;
      windowClass = await (window.getLastWindow(AppStorage.get<common.BaseContext>('abilityContext') as common.BaseContext) as Promise<window.Window>);
      let properties: window.WindowProperties = windowClass.getWindowProperties();
      console.info("[IsShowFalse_0100] title: " + JSON.stringify(properties.type));
      expect(properties.type).assertEqual(1)

      console.info('[IsShowFalse_0100] END');
      done();
    });
    
    
    /**
     * @tc.number   IsShowFalse_0200
     * @tc.name     IsShowFalse_0200
     * @tc.desc     IsShowFalse_0200
     * @tc.level    Level.LEVEL0
     */
it('IsShowFalse_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('IsShowFalse_0200 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('IsShowFalse'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let windowClass: window.Window | undefined = undefined;
      windowClass = await (window.getLastWindow(AppStorage.get<common.BaseContext>('abilityContext') as common.BaseContext) as Promise<window.Window>);
      let properties: window.WindowProperties = windowClass.getWindowProperties();
      console.info("[IsShowFalse_0200] title: " + JSON.stringify(properties.type));
      expect(properties.type).assertEqual(1)

      console.info('[IsShowFalse_0100] END');
      done();
    });
    
    
    /**
     * @tc.number   IsShowFalse_0300
     * @tc.name     IsShowFalse_0300
     * @tc.desc     IsShowFalse_0300
     * @tc.level    Level.LEVEL0
     */
it('IsShowFalse_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('IsShowFalse_0300 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('IsShowFalse'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let windowClass: window.Window | undefined = undefined;
      windowClass = await (window.getLastWindow(AppStorage.get<common.BaseContext>('abilityContext') as common.BaseContext) as Promise<window.Window>);
      let properties: window.WindowProperties = windowClass.getWindowProperties();
      console.info("[IsShowFalse_0300] title: " + JSON.stringify(properties.type));
      expect(properties.type).assertEqual(0)
      await CommonFunc.sleep(1000);
      await driver.triggerKey(2070);
      await CommonFunc.sleep(1000);
      console.info('[IsShowFalse_0300] END');
      done();
    });
  })
}

