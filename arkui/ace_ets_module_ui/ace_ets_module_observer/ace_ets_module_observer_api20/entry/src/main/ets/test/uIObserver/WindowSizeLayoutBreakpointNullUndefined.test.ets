/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

export default function WindowSizeLayoutBreakpointNullUndefinedTest() {
  describe('WindowSizeLayoutBreakpointNullUndefinedTest', () => {
    beforeEach(async (done: Function) => {
      console.info("WindowSizeLayoutBreakpointNullUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/uIObserver/WindowSizeLayoutBreakpointNullUndefinedTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WindowSizeLayoutBreakpointNullUndefinedTest state pages:" + JSON.stringify(pages));
        if (!("gestureEventTest" == pages.name)) {
          console.info("get WindowSizeLayoutBreakpointNullUndefinedTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push WindowSizeLayoutBreakpointNullUndefinedTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WindowSizeLayoutBreakpointNullUndefinedTest page error:" + err);
      }
      console.info("WindowSizeLayoutBreakpointNullUndefinedTest beforeEach end");
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("WindowSizeLayoutBreakpointNullUndefinedTest after each called");
    });

    /**
     * @tc.name   uIObserverWindowSizeLayoutBreakpointChangeOnNull_0100
     * @tc.number SUB_ARKUI_UIOBSERVER_WINDOWSIZELAYOUTBREAKPOINTCHANGE_ON_NULL_0100
     * @tc.desc   Test UIObserver.on with null type for windowSizeLayoutBreakpointChange event
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('uIObserverWindowSizeLayoutBreakpointChangeOnNull_0100', Level.LEVEL2, async (done: Function) => {
      console.info('uIObserverWindowSizeLayoutBreakpointChangeOnNull_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button1 = await driver.findComponent(ON.id('windowSizeBreakpoint_on_null_id'));
      await button1.click();
      await CommonFunc.sleep(1000);
      expect(AppStorage.get('windowSizeBreakpoint_on_null')).assertEqual('success');
      expect(AppStorage.get('windowSizeBreakpoint_on_undefined')).assertEqual('success');
      AppStorage.delete('windowSizeBreakpoint_on_null')
      AppStorage.delete('windowSizeBreakpoint_on_undefined')
      console.info('[uIObserverWindowSizeLayoutBreakpointChangeOnNull_0100] END');
      done();
    });

    /**
     * @tc.name   uIObserverWindowSizeLayoutBreakpointChangeOffNull_0100
     * @tc.number SUB_ARKUI_UIOBSERVER_WINDOWSIZELAYOUTBREAKPOINTCHANGE_OFF_NULL_0100
     * @tc.desc   Test UIObserver.off with null type for windowSizeLayoutBreakpointChange event
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('uIObserverWindowSizeLayoutBreakpointChangeOffNull_0100', Level.LEVEL2, async (done: Function) => {
      console.info('uIObserverWindowSizeLayoutBreakpointChangeOffNull_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button1 = await driver.findComponent(ON.id('windowSizeBreakpoint_off_null_id'));
      await button1.click();
      await CommonFunc.sleep(1000);
      expect(AppStorage.get('windowSizeBreakpoint_off_null')).assertEqual('success');
      expect(AppStorage.get('windowSizeBreakpoint_off_undefined')).assertEqual('success');
      expect(AppStorage.get('windowSizeBreakpoint_off_null_with_callback')).assertEqual('success');
      expect(AppStorage.get('windowSizeBreakpoint_off_undefined_with_callback')).assertEqual('success');
      AppStorage.delete('windowSizeBreakpoint_off_null')
      AppStorage.delete('windowSizeBreakpoint_off_undefined')
      AppStorage.delete('windowSizeBreakpoint_off_null_with_callback')
      AppStorage.delete('windowSizeBreakpoint_off_undefined_with_callback')
      console.info('[uIObserverWindowSizeLayoutBreakpointChangeOffNull_0100] END');
      done();
    });

  })
}
