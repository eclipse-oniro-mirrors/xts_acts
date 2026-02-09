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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, Level, expect } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import { ResolveStrategy } from '@ohos.arkui.UIContext';

export default function GetUIContextMethodTest() {
  describe('GetUIContextMethodTest', () => {
    beforeEach(async (done: Function) => {
      console.info("GetUIContextTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/getUIContext/GetUIContextMethodTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get GetUIContextMethodTest state pages:" + JSON.stringify(pages));
        let result = await router.pushUrl(options);
        if (!("gestureEventTest" == pages.name)) {
          console.info("get GetUIContextMethodTest pages.name:" + JSON.stringify(pages.name));
          await CommonFunc.sleep(2000);
          console.info("push GetUIContextMethodTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push GetUIContextMethodTest page error:" + err);
      }
      console.info("GetUIContextMethodTest beforeEach end");
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("GetUIContextMethodTest after each called");
    });

    /**
     * @tc.name   GetUIContextMethodTest_0100
     * @tc.number GetUIContextMethodTest_0100
     * @tc.desc   getUIContext test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GetUIContextMethodTest_0100', Level.LEVEL1, async (done: Function) => {
      console.info('GetUIContextMethodTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button1 = await driver.findComponent(ON.id('btn_getCallingScopeUIContext'));
      await button1.click();
      await CommonFunc.sleep(1000);
      let button2 = await driver.findComponent(ON.id('btn_getLastFocusedUIContext'));
      await button2.click();
      await CommonFunc.sleep(1000);
      let button3 = await driver.findComponent(ON.id('btn_getLastForegroundUIContext'));
      await button3.click();
      await CommonFunc.sleep(1000);
      let button4 = await driver.findComponent(ON.id('btn_getAllUIContexts'));
      await button4.click();
      await CommonFunc.sleep(1000);
      console.info('getCallingScopeUIContextTest :' + AppStorage.get('getCallingScopeUIContextTest'));
      console.info('getLastFocusedUIContextTest :' + AppStorage.get('getLastFocusedUIContextTest'));
      console.info('getLastForegroundUIContextTest :' + AppStorage.get('getLastForegroundUIContextTest'));
      expect(AppStorage.get('getCallingScopeUIContextTest')).assertEqual(true);
      expect(AppStorage.get('getLastFocusedUIContextTest')).assertEqual(true);
      expect(AppStorage.get('getLastForegroundUIContextTest')).assertEqual(true);
      expect(AppStorage.get('getAllUIContextsTest')).assertEqual(1);
      AppStorage.delete('getCallingScopeUIContextTest');
      AppStorage.delete('getLastFocusedUIContextTest');
      AppStorage.delete('getLastForegroundUIContextTest');
      AppStorage.delete('getAllUIContextsTest');
      console.info('[GetUIContextMethodTest_0100] END');
      done();
    });

  })
}