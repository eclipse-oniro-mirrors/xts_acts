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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../../hypium/index"
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON,  MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../../../ets/MainAbility/common/MessageManager';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../../Util.test';
import inspector from '@ohos.arkui.inspector';

export default function ReplaceSymbolEffect_APITest() {
  describe('ReplaceSymbolEffect_APITest', () => {
    beforeAll(() => {
      console.info("ReplaceSymbolEffect_APITest beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.information.api12.static", "EntryAbility");
    });
    beforeEach(async (): Promise<void> => {
      console.info("ReplaceSymbolEffect_APITest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/SymbolGlyph/SymbolGlyph_API/ReplaceSymbolEffect",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get ReplaceSymbolEffect_APITest state pages: " + JSON.stringify(pages));
        if (!("ListMainChildren" == pages.name)) {
          console.info("get ReplaceSymbolEffect_APITest state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push ReplaceSymbolEffect_APITest page error: " + err);
        expect().assertFail();
      }
    });
    
    /**
     * @tc.number   ReplaceSymbolEffect_APITest_static_0100
     * @tc.name     ReplaceSymbolEffect_APITest_static_0100
     * @tc.desc     ReplaceSymbolEffect_APITest_static_0100
     * @tc.level    Level.LEVEL2
     */
it('ReplaceSymbolEffect_APITest_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('ReplaceSymbolEffect_APITest_0100 START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let btn = await driver.findComponent(ON.id('btn'));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let ReplaceSymbolEffect = inspector.getInspectorByKey('ReplaceSymbolEffect');
      console.info("[ReplaceSymbolEffect_APITest_0100] Tabs animationMode attrs is: " +
      JSON.stringify(JSON.parseJsonElement(ReplaceSymbolEffect).getElement('$attrs')));
      expect(JSON.parseJsonElement(ReplaceSymbolEffect).getElement('$attrs').getString('content')).assertEqual('1');
      console.info('[ReplaceSymbolEffect_APITest_0100] END');
      done();
    });
  })
}