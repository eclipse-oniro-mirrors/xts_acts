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

export default function UIContextOnIdleTest() {
  describe('UIContextOnIdleTest', () => {
    beforeEach(async (done: Function) => {
      console.info("UIContextOnIdleTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/getUIContext/UIContextOnIdleTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get UIContextOnIdleTest state pages:" + JSON.stringify(pages));
        let result = await router.pushUrl(options);
        if (!("gestureEventTest" == pages.name)) {
          console.info("get UIContextOnIdleTest pages.name:" + JSON.stringify(pages.name));
          await CommonFunc.sleep(2000);
          console.info("push UIContextOnIdleTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push UIContextOnIdleTest page error:" + err);
      }
      console.info("UIContextOnIdleTest beforeEach end");
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("UIContextOnIdleTest after each called");
    });

    /**
     * @tc.name   UIContextOnIdleTest_0100
     * @tc.number UIContextOnIdleTest_0100
     * @tc.desc   getUIContext test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('UIContextOnIdleTest_0100', Level.LEVEL1, async (done: Function) => {
      console.info('UIContextOnIdleTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button1 = await driver.findComponent(ON.id('btn_FrameCallbackOnIdle0'));
      await button1.click();
      await CommonFunc.sleep(1000);
      expect(AppStorage.get('FrameTimeNanosOnIdle')).assertEqual(0);
      AppStorage.delete('FrameTimeNanosOnIdle');
      console.info('[UIContextOnIdleTest_0100] END');
      done();
    });

    /**
     * @tc.name   UIContextOnIdleTest_0200
     * @tc.number UIContextOnIdleTest_0200
     * @tc.desc   getUIContext test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('UIContextOnIdleTest_0200', Level.LEVEL1, async (done: Function) => {
      console.info('UIContextOnIdleTest_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button2 = await driver.findComponent(ON.id('btn_FrameCallbackOnIdle_n1'));
      await button2.click();
      await CommonFunc.sleep(1000);
      expect(AppStorage.get('FrameTimeNanosOnIdle')).assertEqual(-1);
      AppStorage.delete('FrameTimeNanosOnIdle');
      console.info('[UIContextOnIdleTest_0200] END');
      done();
    });

  })
}