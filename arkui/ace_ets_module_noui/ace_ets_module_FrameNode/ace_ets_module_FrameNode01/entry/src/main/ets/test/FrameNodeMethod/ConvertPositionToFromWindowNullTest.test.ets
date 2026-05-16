/*
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

export default function ConvertPositionToFromWindowNullTest() {
  describe('ConvertPositionToFromWindowNullTest', () => {
    beforeEach(async (done: Function) => {
      console.info("ConvertPositionToFromWindowNullTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/FrameNodeMethod/ConvertPositionToFromWindowNullTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ConvertPositionToFromWindowNullTest state pages:" + JSON.stringify(pages));
        let result = await router.pushUrl(options);
        if (!("gestureEventTest" == pages.name)) {
          console.info("get ConvertPositionToFromWindowNullTest pages.name:" + JSON.stringify(pages.name));
          await CommonFunc.sleep(2000);
          console.info("push ConvertPositionToFromWindowNullTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ConvertPositionToFromWindowNullTest page error:" + err);
      }
      console.info("ConvertPositionToFromWindowNullTest beforeEach end");
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("ConvertPositionToFromWindowNullTest after each called");
    });

    /**
     * @tc.number    ConvertPositionToFromWindowNullTest_0100
     * @tc.name      ConvertPositionToFromWindowNullTest_0100
     * @tc.desc      convertPosition to window null undefined Test
     * @tc.level     Level2
     * @tc.type
     * @tc.size
     */
    it('ConvertPositionToFromWindowNullTest_0100', Level.LEVEL2, async (done: Function) => {
      console.info('ConvertPositionToFromWindowNullTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button1 = await driver.findComponent(ON.id('btn_convertPositionToWindow_id'));
      await button1.click();
      await CommonFunc.sleep(1000);
      expect(AppStorage.get('ConvertPositionToWindowNull')).assertEqual(401);
      AppStorage.delete('ConvertPositionToWindowNull')
      expect(AppStorage.get('ConvertPositionToWindowUndefined')).assertEqual(401);
      AppStorage.delete('ConvertPositionToWindowUndefined')
      console.info('[ConvertPositionToFromWindowNullTest_0100] END');
      done();
    });

    /**
     * @tc.number    ConvertPositionToFromWindowNullTest_0200
     * @tc.name      ConvertPositionToFromWindowNullTest_0200
     * @tc.desc      convertPosition from window null undefined Test
     * @tc.level     Level2
     * @tc.type
     * @tc.size
     */
    it('ConvertPositionToFromWindowNullTest_0200', Level.LEVEL2, async (done: Function) => {
      console.info('ConvertPositionToFromWindowNullTest_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button1 = await driver.findComponent(ON.id('btn_convertPositionFromWindow_id'));
      await button1.click();
      await CommonFunc.sleep(1000);
      expect(AppStorage.get('ConvertPositionFromWindowNull')).assertEqual(401);
      AppStorage.delete('ConvertPositionFromWindowNull')
      expect(AppStorage.get('ConvertPositionFromWindowUndefined')).assertEqual(401);
      AppStorage.delete('ConvertPositionFromWindowUndefined')
      console.info('[ConvertPositionToFromWindowNullTest_0200] END');
      done();
    });

  })
}